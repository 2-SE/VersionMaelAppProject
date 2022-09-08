import 'package:AllUni/Providers/CustomTagProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTagFieldPopUp extends StatefulWidget {
  final String? nameTag;
  const CustomTagFieldPopUp({
    Key? key,
    this.nameTag,
  }) : super(key: key);

  @override
  State<CustomTagFieldPopUp> createState() => _CustomTagFieldPopUpState();
}

class _CustomTagFieldPopUpState extends State<CustomTagFieldPopUp> {
  final nameTagController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameTagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future saveTagForm() async {
      (nameTagController.text.isNotEmpty)
          ? Provider.of<CustomTagProvider>(context, listen: false).addTagValue(
              CustomTag(label: nameTagController.text),
            ) //context.read()<CustomTagProvider>().addTagValue(CustomTag(label: nameTagController.text))
          : Provider.of<CustomTagProvider>(context, listen: false)
              .deleteTagValue(); //context.read()<CustomTagProvider>().deleteTagValue();
      Navigator.pop(
        context,
        (nameTagController.text.isNotEmpty) ? nameTagController.text : null,
      );
    }

    if (widget.nameTag != null) {
      nameTagController.text = widget.nameTag!;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Hero(
          tag: "",
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width / 24)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Nommez le tag que vous voulez mettre :",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  Form(
                    key: formKey,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "Nom du tag",
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      controller: nameTagController,
                      maxLength: 20,
                      maxLines: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            Provider.of<CustomTagProvider>(context,
                                    listen: false)
                                .deleteTagValue();
                            Navigator.of(context).pop();
                          }),
                      TextButton(
                        onPressed: () {
                          saveTagForm();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Enregistrer ce tag",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.indigo,
                                ),
                              ),
                              SizedBox(width: 20),
                              Icon(
                                Icons.save,
                                color: Color(0xFF4C75A0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}