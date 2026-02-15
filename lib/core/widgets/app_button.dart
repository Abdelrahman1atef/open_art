import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

enum AppButtonType { primary, secondary, subtle, text }

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
     this.type = AppButtonType.primary,
    this.onPressed,
    this.text = "Button",
    this.isDisabled = false,
    this.disableGradient = false,
    this.isExpanded = true,
    this.padding = const EdgeInsetsDirectional.symmetric(horizontal: 30, vertical: 15),
    this.margin = const EdgeInsetsDirectional.only(end: 16, start: 16, bottom: 16),
    this.useWhiteText = true,
  });

  final AppButtonType type;
  final VoidCallback? onPressed;
  final String text;
  final bool isDisabled, disableGradient, isExpanded, useWhiteText;
  final EdgeInsetsDirectional padding, margin;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isLoading = false;

  static const _gradient = AppGradients.accent;


  static const _borderRadius = BorderRadius.all(Radius.circular(12));

  void _handleTap() {
    if (widget.isDisabled) return;

    setState(() => _isLoading = !_isLoading);
    widget.onPressed?.call();
  }


  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isDisabled ? 0.5 : 1.0,
      child: AbsorbPointer(
        absorbing: widget.isDisabled,
        child: Container(
          margin: widget.margin,
          child: InkWell(
            onTap: _handleTap,
            borderRadius: _borderRadius,
            child: _buildButtonContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonContent(BuildContext context) {
    switch (widget.type) {
      case AppButtonType.primary:
        return _buildPrimaryButton(context);
      case AppButtonType.secondary:
        return _buildSecondaryButton(context);
      case AppButtonType.subtle:
        return _buildSubtleButton(context);
      case AppButtonType.text:
        return _buildTextButton(context);
    }
  }

  Widget _buildPrimaryButton(BuildContext context) {
    return Container(
      padding: widget.padding,
      alignment: widget.isExpanded ? AlignmentDirectional.center : null,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        gradient: _gradient,
      ),
      child: _buildChild(context, useWhiteText: widget.useWhiteText),
    );
  }

  Widget _buildSecondaryButton(BuildContext context) {
    final theme = Theme.of(context);

    return widget.disableGradient?Container(
      padding: EdgeInsetsDirectional.all(1),
      decoration: BoxDecoration(gradient: _gradient,borderRadius: _borderRadius),
      child: Container(
        padding: widget.padding,
        alignment: widget.isExpanded ? AlignmentDirectional.center : null,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: theme.scaffoldBackgroundColor,
        ),
        child: _buildChild(context, useWhiteText: widget.useWhiteText),
      ),
    ) :ShaderMask(
      shaderCallback: (bounds) => _gradient.createShader(bounds),
      child: Container(
        padding: widget.padding,
        alignment: widget.isExpanded ? AlignmentDirectional.center : null,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.disableGradient ? Colors.grey : Colors.white,
          ),
          borderRadius: _borderRadius,
        ),
        child: _buildChild(context, useWhiteText: widget.useWhiteText),
      ),
    );
  }

  Widget _buildSubtleButton(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => _gradient.createShader(bounds),
      child: Container(
        padding: widget.padding,
        alignment: widget.isExpanded ? AlignmentDirectional.center : null,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.disableGradient ? Colors.grey : AppGrayscale.placeholder,
          ),
          borderRadius: _borderRadius,
        ),
        child: _buildChild(context, useWhiteText: widget.useWhiteText),
      ),
    );
  }

  Widget _buildTextButton(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => _gradient.createShader(bounds),
      child: Container(
        padding: widget.padding,
        child: _buildChild(context, useWhiteText: true, showLoadingText: true),
      ),
    );
  }

  Widget _buildChild(BuildContext context, {required bool useWhiteText, bool showLoadingText = false}) {
    final color = Theme.of(context).colorScheme;

    if (_isLoading) {
      if (showLoadingText) {
        return _buildText(context, "Loading...", useWhiteText);
      }
      return CircularProgressIndicator(
        color: widget.useWhiteText? Colors.white:color.onTertiary,
        constraints: BoxConstraints(minWidth: 32,minHeight: 32),
      );
    }
    return _buildText(context, widget.text, useWhiteText);
  }

  Widget _buildText(BuildContext context, String text, bool useWhiteText) {
    final textTheme = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return Text(
      text,
      textAlign: TextAlign.center,
      style: textTheme.headlineSmall?.copyWith(
        color: useWhiteText ? Colors.white : color.onTertiary,
      ),
    );
  }
}
