
public void controlP5functions(){
  controlP5 = new ControlP5(this);
  menuBox = controlP5.addGroup("menuBox")
                        .setPosition(0,0)
                        .setWidth(width)
                        .setBackgroundHeight(200)
                        .activateEvent(true)
                        .setBackgroundColor(color(0,255))
                        ;
  canvas = controlP5.addButton("canvas")
                     .setPosition(0,0)
                     .setSize(50,20)
                     ;
  addItem = controlP5.addButton("addItem")
                     .setCaptionLabel("new item")
                     .setPosition(175
                     ,27)
                     .setSize(50,20)
                     .moveTo(menuBox)
                     //.hide()
                     ;
  if (editOn != true) {
    addItem.hide();
  }
  input = controlP5.addTextfield("input")
                    .setPosition(20, 30)
                    .setSize(145, 17)
                    .setCaptionLabel("input")
                    .setAutoClear(true)
                    .keepFocus(false)
                    .moveTo(menuBox)
                    ;
  objList = controlP5.addListBox("objList")
                     .setPosition(300, 30)
                     .setSize(150, 140)
                     .setLabel("database matches")
                     .moveTo(menuBox)
                     .disableCollapse() ;
                     ;
  inputStatus = controlP5.addTextlabel("inputStatus")
                          .setText("")
                          .setPosition(15,65)
                          .moveTo(menuBox)
                          ;
  properties = controlP5.addTextarea("properties")
                        .setPosition(15,90)
                        .setSize(255,90)
                        .setText("active item : none")
                        .moveTo(menuBox)
                        .showScrollbar()
                        ;
}/////////////////////////////////////////CANVAS BUTTON
public void canvas() {
  menuOpen = !menuOpen;
}
public void addItem() {
  if (controlP5.get(Textfield.class,"input").getText().length() != 0) {
    objectList.add(new item(controlP5.get(Textfield.class,"input").getText(), objectList.size()));
  } else {
    inputStatus.setText("nothing entered");
  }
}//////////////////////////////////////////INPUT
public void input(String theText) {
  boolean match = false;
  if (theText.toLowerCase().contains("save") == true) {
    saveData();
    inputStatus.setText("saving");
  } else if (theText.contains("editon") == true) {
    addItem.show();
    editOn = true;
    objList.clear();
  } else if (theText.contains("editoff") == true) {
    addItem.hide();
    editOn = false;
    objList.clear();
  } else if (theText.contains("layer") == true) {
    String layerNo = theText.substring(theText.lastIndexOf("layer")+5);
    layers = int(layerNo);
    inputStatus.setText("now set to display "+layers+" layers");
  } else {
    checkInput();
  }
}/////////////////////////////////////////////DATABASE MATCH LIST
public void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    if (theEvent.group().name()=="objList") {
      ListBoxItem currentItem = objList.getItem(int(theEvent.group().value()));
      item thisItem = (item) objectList.get(currentItem.getId());////////////ITEM SELECTED FROM DATABASE LIST
      ////////////////////////////////ADDING/REMOVING ITEM FROM VISUALISE
      if (editOn != true || activeItem == null) {
        int check = (int) visualise.indexOf(thisItem);//////////////////check display list for item
        if (check != -1) {                            //if item exists
          visualise.remove(check);                    //remove this item from display list
          thisItem.active = false;                    //tell the item it is not on the display list so the database knows whether to list it
          thisItem.constant = 0;                      //tell item it no longer has a constant variable (only applies when it is visible)
          currentItem.setColorBackground(color(74,119,122));//change background colour to show item is not active
        } else {                                      //if item does not exist
          visualise.add(thisItem);                    //add item to display list
          thisItem.updateProperty();                  //update display for the item
          thisItem.active = true;                     //tell the item it is on the display list so the database knows whether to list it
          currentItem.setColorBackground(color(153,24,44));//change background colour to show item is active
        }
      } else if (thisItem != activeItem && activeItem != null) {///////////////editOn = true
        int check = (int) activeItem.connections.indexOf(thisItem);//check if active item contains listed item
        if (check != -1)  {                                        //if check is YES
          activeItem.connections.remove(check);                    //remove index of listed item from connections of active item
          currentItem.setColorBackground(color(74,119,122));       //set the bg of list to default
          activeItem.updateProperty();                             //update the property display for the active item (should have listed item removed from children)
          thisItem.parents.remove(thisItem.parents.indexOf(activeItem));//the listed item should now remove the active item from it's list of parents.
          thisItem.constant = 0;
        } else {//if check is NO
          if (visualise.indexOf(thisItem) != -1 && thisItem.parents.indexOf(activeItem) == -1) {//if listed item is already displayed
            thisItem.parents.add(activeItem);//add active item as listed item's parent. (because top layers have no parents by default)
          }
          activeItem.connections.add(thisItem);
          currentItem.setColorBackground(color(153,24,44));
          activeItem.updateProperty();
        }
      }
    }
  }
}

