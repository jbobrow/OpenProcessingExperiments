
// http://www.lagers.org.uk/g4p/distribution/web/index.html


void handleTextFieldEvents(GTextField tfield){
  String event = "";
  //if(tfield != txfEvents){
    event = tfield.tag;
    switch (tfield.getEventType()){
    case GTextField.CHANGED:
      event += "CHANGED";
      break;
    case GTextField.SET:
      event += "SET";
      break;
    case GTextField.ENTERED:
      event += "ENTERED";
      lblSL2.setText(txfSL1.getText());
      txfSL1.setText("");
      break;
    }
    //addEvent(event);
  //}
}


public void createCombos() {

  String[] carNumTxt;
  if (selectedLayout == 1) {
    carNumTxt= new String[] { "5 Cars", "6 Cars", "7 Cars", "8 Cars", "9 Cars" };
  }
  else if (selectedLayout == 2) {
    carNumTxt= new String[] { "5:3:3", "4:2:2", "3:2:2" };  
  }  
  else {
    carNumTxt= new String[] { "2 Cars", "4 Cars", "6 Cars" };  
  }
  if (selectedLayout == 1) {
    cboCarNum = new GCombo(this, carNumTxt, 5, width/2 + 110, 2, 75);
    cboCarNum.setSelected(selectedCars);
    carNum = selectedCars + 5;
    //cboCarNum.setSelected(carNum - 5);
  }
  else {
    cboCarNum = new GCombo(this, carNumTxt, 4, width/2 + 110, 2, 75); // hide?
    if (selectedCars > 2) { selectedCars = 2; }
    if (selectedLayout == 2) {
      if (selectedCars == 2) { carNum = 5; } // 3:2:2
      else if (selectedCars == 1) { carNum = 6; } // 4:22
      else {carNum = 8;} // 5:3:3
    }
    else {
      carNum = selectedCars * 2 + 2; 
    }
    cboCarNum.setSelected(selectedCars);
    //carNum = selectedCars * 2 + 2;
    //cboCarNum.setSelected(carNum/2 - 1);
  }
  
  String[] choices = new String[] {
    "Passing with a Spur", 
    "John Allen's TimeSaver",
    "Alan Wright's Inglenook",
    "New Castle Industrial Railroad",
    "Test Circle"
    };
  if (selectedLayout < 3){
    cboSelect = new GCombo(this, choices, 4, width/2 - 110, 2, 220);
  }
  else {
    cboSelect = new GCombo(this, choices, 4, width/2 - 110, 2, 295);
  }
  cboSelect.setSelected(selectedLayout);
  //pnlControls.add(cboSelect);
}


public void handleComboEvents(GCombo combo){
  if(cboCarNum == combo){
    selectedCars = cboCarNum.selectedIndex();
    if (selectedLayout == 1) {
      carNum = selectedCars + 5;
    }
    else if (selectedLayout == 2) {
      if (selectedCars == 2) { carNum = 8; } // 5:33
      else if (selectedCars == 1) { carNum = 6; } // 4:22
      else {carNum = 5;} // 3:2:2
    }
    else {
      carNum = selectedCars * 2 + 2; 
    }
    setup();
  }
  if(cboSelect == combo){
    selectedLayout =  cboSelect.selectedIndex();
    setup();
    //lblSL2.setText("Choice changed to " + cboSelect.selectedText());
  }
}

