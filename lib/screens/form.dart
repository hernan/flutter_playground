import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode _phoneFieldFocusNode;
  FocusNode _firstNameFocusNode;
  FocusNode _lastNameFocusNode;
  FocusNode _street1FocusNode;
  FocusNode _street2FocusNode;
  FocusNode _cityFocusNode;
  FocusNode _stateFocusNode;

  final _formData = {
    'phoneNumber': '',
    'lastName': '',
    'street1': '',
    'firstName': '',
    'street2': '',
    'city': '',
    'state': ''
  };

  InputDecoration _decorateTfield({ @required String text, String hintText }) {
    return InputDecoration(
      labelText: text,
      hintText: hintText,
      border: OutlineInputBorder()
    );
  }

  void _handleForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('Form data: $_formData');
    } else {
      print('Form not valid');
    }
  }


  @override
  void initState() {
    super.initState();
    _phoneFieldFocusNode = FocusNode();
    _firstNameFocusNode = FocusNode();
    _lastNameFocusNode = FocusNode();
    _street1FocusNode = FocusNode();
    _street2FocusNode = FocusNode();
    _cityFocusNode = FocusNode();
    _stateFocusNode = FocusNode();
  }


  @override
  void dispose() {
    _phoneFieldFocusNode.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _street1FocusNode.dispose();
    _street2FocusNode.dispose();
    _cityFocusNode.dispose();
    _stateFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form test"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
//          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              TextFormField(
                focusNode: _phoneFieldFocusNode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (term) => FocusScope.of(context).requestFocus(_firstNameFocusNode),
                decoration: _decorateTfield(text: 'Phone number', hintText: 'Only US phone numbers'),
                onSaved: (value) => _formData['phoneNumber'] = value,
                validator: (value) {
                  return !value.contains(RegExp('[0-9]')) ? 'Invalid phone' : null;
                },
              ),
              SizedBox(height: 30),

            TextFormField(
              focusNode: _firstNameFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (term) => FocusScope.of(context).requestFocus(_lastNameFocusNode),
              decoration: _decorateTfield(text: 'First name'),
              onSaved: (value) => _formData['firstName'] = value
            ),
            SizedBox(height: 30),

            TextFormField(
              focusNode: _lastNameFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (term) => FocusScope.of(context).requestFocus(_street1FocusNode),
              decoration: _decorateTfield(text: 'Last name'),
              onSaved: (value) => _formData['lastName'] = value
            ),
            SizedBox(height: 30),

            TextFormField(
              focusNode: _street1FocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (term) => FocusScope.of(context).requestFocus(_street2FocusNode),
              decoration: _decorateTfield(text: 'Street 1'),
              onSaved: (value) => _formData['street1'] = value
            ),
            SizedBox(height: 30),

            TextFormField(
              focusNode: _street2FocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (term) => FocusScope.of(context).requestFocus(_cityFocusNode),
              decoration: _decorateTfield(text: 'Street 2'),
              onSaved: (value) => _formData['street2'] = value
            ),
            SizedBox(height: 30),

            TextFormField(
              focusNode: _cityFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (term) => FocusScope.of(context).requestFocus(_stateFocusNode),
              decoration: _decorateTfield(text: 'City'),
              onSaved: (value) => _formData['city'] = value
            ),
            SizedBox(height: 30),

            TextFormField(
              focusNode: _stateFocusNode,
              textInputAction: TextInputAction.done,
              decoration: _decorateTfield(text: 'State'),
              onSaved: (value) => _formData['state'] = value
            ),
            SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150.0,
                    height: 45.0,
                    child: RaisedButton(
                      child: Text('Save'),
                      onPressed: _handleForm,
                      // textColor: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
