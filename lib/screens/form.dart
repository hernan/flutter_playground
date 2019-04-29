import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final _formData = {
    'phoneNumber': '',
    'lastName': '',
    'street1': '',
    'firstName': '',
    'street2': '',
    'city': '',
    'state': ''
  };

  InputDecoration _decorateTfield(String text) {
    return InputDecoration(
      labelText: text,
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form test"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () => {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: _decorateTfield('Phone number'),
                onSaved: (value) => _formData['phoneNumber'] = value,
                validator: (value) {
                  return !value.contains(RegExp('[0-9]')) ? 'Invalid phone' : null;
                },
              ),
              SizedBox(height: 20),

              TextFormField(
                decoration: _decorateTfield('First name'),
                onSaved: (value) => _formData['firstName'] = value
              ),
              SizedBox(height: 20),

              TextFormField(
                decoration: _decorateTfield('Last name'),
                onSaved: (value) => _formData['lastName'] = value
              ),
              SizedBox(height: 20),

              TextFormField(
                decoration: _decorateTfield('Street 1'),
                onSaved: (value) => _formData['street1'] = value
              ),
              SizedBox(height: 20),

              TextFormField(
                decoration: _decorateTfield('Street 2'),
                onSaved: (value) => _formData['street2'] = value
              ),
              SizedBox(height: 20),

              TextFormField(
                decoration: _decorateTfield('City'),
                onSaved: (value) => _formData['city'] = value
              ),
              SizedBox(height: 20),

              TextFormField(
                decoration: _decorateTfield('State'),
                onSaved: (value) => _formData['state'] = value
              ),
              SizedBox(height: 20),

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
