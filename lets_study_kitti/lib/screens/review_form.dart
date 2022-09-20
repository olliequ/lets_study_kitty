import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

const outlineColor = Color.fromARGB(100, 0, 0, 0);
const boxColor = Color.fromARGB(255, 254, 244, 225);
const boundarySize = 100.0;
const hOffset = 60.0;
const boxWidth = 250.0;
const boxHeight = 50.0;
const sectionFont = TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
const labelFont = TextStyle(fontSize: 16);

class ReviewForm extends StatefulWidget {
  const ReviewForm({Key? key}) : super(key: key);

  @override
  State<ReviewForm> createState() {
    return _ReviewFormState();
  }
}

class _ReviewFormState extends State<ReviewForm> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.fromLTRB(boundarySize, 25, 0, 25),
          child: const Text("Add a Review",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ),
      ),
      Center(
          child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width - 2 * boundarySize,
              child: Card(
                elevation: 5,
                child: ReviewElements(),
              )))
    ]);
  }
}

class ReviewElements extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  ReviewElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilder(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(hOffset, 25, 0, 10),
                        child: const Text('Subject Information',
                            style: sectionFont))),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: hOffset, vertical: 20),
                  alignment: Alignment.centerLeft,
                  child: Container(
                      width: boxWidth,
                      height: boxHeight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: boxColor,
                          border: Border.all(color: outlineColor)),
                      child: FormBuilderTextField(
                          cursorColor: Colors.black,
                          name: 'Subject Code',
                          decoration: const InputDecoration(
                            hintText: "Subject Code",
                            hintStyle: labelFont,
                            contentPadding:
                                EdgeInsets.only(top: 5.0, bottom: 5.0),
                            border: InputBorder.none,
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(9,
                                errorText: 'Should be 9 characters long'),
                            FormBuilderValidators.maxLength(9,
                                errorText: 'Should be 9 characters long'),
                          ]))),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: hOffset),
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: boxWidth,
                    height: boxHeight,
                    //padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: const BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: FormBuilderDropdown(
                      validator: FormBuilderValidators.required(),
                      name: 'Year Taken',
                      decoration: InputDecoration(
                        labelText: "Year Taken",
                        labelStyle: labelFont,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        suffix: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _formKey.currentState?.fields['Year Taken']
                                ?.reset();
                          },
                        ),
                      ),
                      items: [
                        '2021',
                        '2020',
                        '2019',
                        '2018',
                        '2017',
                        '2016',
                        '2015',
                        '2014'
                      ]
                          .map((year) => DropdownMenuItem(
                                alignment: AlignmentDirectional.centerStart,
                                value: year,
                                child: Text(year),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: hOffset, vertical: 20),
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: boxWidth,
                    height: boxHeight,
                    decoration: const BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: FormBuilderDropdown(
                      validator: FormBuilderValidators.required(),
                      name: 'Semester Taken',
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        labelText: 'Semester Taken',
                        labelStyle: labelFont,
                        suffix: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _formKey.currentState?.fields['Semester Taken']
                                ?.reset();
                          },
                        ),
                        hintText: 'What semester was the subject taken',
                      ),
                      items: ['Semester 1', 'Semester 2']
                          .map((sem) => DropdownMenuItem(
                                alignment: AlignmentDirectional.centerStart,
                                value: sem,
                                child: Text(sem),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: hOffset, bottom: 20),
                  alignment: Alignment.centerLeft,
                  child: Container(
                      width: boxWidth,
                      height: boxHeight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: boxColor,
                          border: Border.all(color: outlineColor)),
                      child: FormBuilderTextField(
                        validator: FormBuilderValidators.required(),
                        cursorColor: Colors.black,
                        name: 'Lecturer',
                        decoration: const InputDecoration(
                          hintText: "Lecturer",
                          hintStyle: labelFont,
                          contentPadding:
                              EdgeInsets.only(top: 5.0, bottom: 5.0),
                          border: InputBorder.none,
                        ),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: hOffset),
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: boxWidth,
                    height: boxHeight,
                    decoration: const BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: FormBuilderDropdown(
                      validator: FormBuilderValidators.required(),
                      name: 'Stream',
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        labelText: 'Stream',
                        labelStyle: labelFont,
                        suffix: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _formKey.currentState?.fields['Stream']?.reset();
                          },
                        ),
                        hintText: 'What Stream Was This Subject',
                      ),
                      items: ['Core', 'Elective', 'Breadth']
                          .map((stream) => DropdownMenuItem(
                                alignment: AlignmentDirectional.centerStart,
                                value: stream,
                                child: Text(stream),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(hOffset, 25, 0, 25),
                        child:
                            const Text('Subject Scores', style: sectionFont))),
                Container(
                    padding: const EdgeInsets.only(left: hOffset, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Row(children: [
                      const SizedBox(
                          width: boxWidth,
                          child: Text("Difficulty", style: labelFont)),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            width: boxHeight,
                            height: boxHeight,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: boxColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color: outlineColor)),
                            child: FormBuilderTextField(
                                cursorColor: Colors.black,
                                name: 'Difficulty',
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  border: InputBorder.none,
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: '0-10'),
                                  FormBuilderValidators.numeric(
                                      errorText: '0-10'),
                                  FormBuilderValidators.max(10,
                                      errorText: '0-10'),
                                  FormBuilderValidators.min(0,
                                      errorText: '0-10'),
                                ]))),
                      ),
                    ])),
                Container(
                    padding: const EdgeInsets.only(left: hOffset, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Row(children: [
                      const SizedBox(
                          width: boxWidth,
                          child: Text(
                            "How fun/interesting you found it",
                            style: labelFont,
                          )),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            width: boxHeight,
                            height: boxHeight,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: boxColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color: outlineColor)),
                            child: FormBuilderTextField(
                                cursorColor: Colors.black,
                                name: 'Interest',
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  border: InputBorder.none,
                                ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: '0-10'),
                                  FormBuilderValidators.numeric(
                                      errorText: '0-10'),
                                  FormBuilderValidators.max(10,
                                      errorText: '0-10'),
                                  FormBuilderValidators.min(0,
                                      errorText: '0-10'),
                                ]))),
                      ),
                    ])),
                Container(
                    padding: const EdgeInsets.only(left: hOffset, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Row(children: [
                      const SizedBox(
                          width: boxWidth,
                          child: Text(
                            "Teaching Quality",
                            style: labelFont,
                          )),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            width: boxHeight,
                            height: boxHeight,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: boxColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color: outlineColor)),
                            child: FormBuilderTextField(
                                cursorColor: Colors.black,
                                name: 'Teaching',
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  border: InputBorder.none,
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: '0-10'),
                                  FormBuilderValidators.numeric(
                                      errorText: '0-10'),
                                  FormBuilderValidators.max(10,
                                      errorText: '0-10'),
                                  FormBuilderValidators.min(0,
                                      errorText: '0-10'),
                                ]))),
                      ),
                    ])),
                Container(
                    padding: const EdgeInsets.only(
                        left: hOffset, top: 10, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Row(children: [
                      const SizedBox(
                          width: boxWidth / 2,
                          child: Text(
                            "Recommend",
                            style: labelFont,
                          )),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: boxWidth / 2,
                          height: boxHeight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: boxColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              border: Border.all(color: outlineColor)),
                          child: FormBuilderDropdown(
                            validator: FormBuilderValidators.required(
                                errorText: "required"),
                            name: 'Recommended',
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: boxColor)),
                            ),
                            items: ['Yes', 'No']
                                .map((recommend) => DropdownMenuItem(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      value: recommend,
                                      child: Text(recommend),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ])),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(hOffset, 25, 0, 20),
                        child:
                            const Text('Subject Review', style: sectionFont))),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: hOffset),
                  child: Container(
                      height: 360,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: boxColor,
                          border: Border.all(color: outlineColor)),
                      child: FormBuilderTextField(
                        validator: FormBuilderValidators.required(),
                        cursorColor: Colors.black,
                        name: 'Review',
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 5.0, bottom: 5.0),
                          border: InputBorder.none,
                        ),
                      )),
                )
              ],
            )),
        const SizedBox(height: 30),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              width: boxWidth,
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 250, 172, 26),
                      border: Border.all(color: outlineColor)),
                  child: MaterialButton(
                      child: const Text("SUBMIT",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {
                        final validationSuccess =
                            _formKey.currentState!.validate();
                        if (validationSuccess == true) {
                          _formKey.currentState?.save();
                          debugPrint(_formKey.currentState?.value.toString());
                          //uploadToDatabase('MAST30027', '2017', 'Semester 1', 'Mr John', 3, 4, 5, 'Yes', 'great', 10, 'core');

                          uploadToDatabase(
                            subjectCode: _formKey
                                .currentState!.fields['Subject Code']!.value
                                .toString(),
                            yearTaken: _formKey
                                .currentState!.fields['Year Taken']!.value
                                .toString(),
                            semTaken: _formKey
                                .currentState!.fields['Semester Taken']!.value
                                .toString(),
                            lecturer: _formKey
                                .currentState!.fields['Lecturer']!.value
                                .toString(),
                            difficulty: double.parse(_formKey
                                .currentState!.fields['Difficulty']!.value),
                            interest: double.parse(_formKey
                                .currentState!.fields['Interest']!.value),
                            teachingQuality: double.parse(_formKey
                                .currentState!.fields['Teaching']!.value),
                            recommend: _formKey
                                .currentState!.fields['Recommended']!.value
                                .toString(),
                            reviewText: _formKey
                                .currentState!.fields['Review']!.value
                                .toString(),
                            subjectType: _formKey
                                .currentState!.fields['Stream']!.value
                                .toString(),
                          );
                        } else {
                          debugPrint(_formKey.currentState?.value.toString());
                          debugPrint('validation failed');
                        }
                      })))
        ])
      ],
    );
  }

  // Database methods to implement

  Future uploadToDatabase(
      {required String subjectCode,
      required String yearTaken,
      required String semTaken,
      required String lecturer,
      required double difficulty,
      required double interest,
      required double teachingQuality,
      required String recommend,
      required String reviewText,
      required String subjectType}) async {
    final docUser = FirebaseFirestore.instance.collection('reviews').doc();
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User user = auth.currentUser!;
    final uid = user.uid;

    debugPrint(uid);

    final json = {
      'subjectCode': subjectCode,
      'userID': uid,
      'lecturer': lecturer,
      'subjectType': subjectType,
      'semesterTaken': semTaken,
      'year': yearTaken,
      'teachingQuality': teachingQuality,
      'difficulty': difficulty,
      'interesting': interest,
      'reviewText': reviewText,
      'recommended': recommend
    };

    await docUser.set(json);
  }
}
