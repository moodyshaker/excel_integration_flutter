import 'package:flutter/material.dart';


class ActionDialog extends StatelessWidget {
  final String title;
  final String content;
  final String approveAction;
  final ShapeBorder shape;
  final String cancelAction;
  final VoidCallback onApproveClick;
  final VoidCallback onCancelClick;

  const ActionDialog({
    this.title,
    this.content,
    this.shape,
    this.approveAction,
    this.cancelAction,
    this.onApproveClick,
    this.onCancelClick,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Dialog(
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                title != null
                    ? Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.start,
                )
                    : Container(),
                title != null
                    ? const SizedBox(
                  height: 10.0,
                )
                    : Container(),
                content != null
                    ? Text(
                  content,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                )
                    : Container(),
                content != null
                    ? const SizedBox(
                  height: 10.0,
                )
                    : Container(),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  onApproveClick != null || approveAction != null
                      ? ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                          ),
                        ),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: onApproveClick,
                    child: Text(
                      approveAction ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                    ),
                  )
                      : Container(),
                  ((onApproveClick != null || approveAction != null) &&
                      (onCancelClick != null || cancelAction != null))
                      ? const SizedBox(
                    width: 10.0,
                  )
                      : Container(),
                  onCancelClick != null || cancelAction != null
                      ? ElevatedButton(
                    onPressed: onCancelClick,
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                          ),
                        ),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                    child: Text(
                      cancelAction ?? '',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0),
                    ),
                  )
                      : Container()
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}