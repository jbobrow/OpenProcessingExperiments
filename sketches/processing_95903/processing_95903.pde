
public void dropEvent(DropEvent theDropEvent) {
 
  // si le drop est une image jpg
  // on charge l'adresse dans  mUrl.
  // if dropped file is an image, its url is stored in mUrl
  if (theDropEvent.isFile()) {
    mUrl = theDropEvent.filePath();
  }
  if (theDropEvent.isURL()==true) {
    if (theDropEvent.isImage()) {
      mUrl = theDropEvent.url().trim();
    }
  }
}
void rangeController(ControlEvent theControlEvent) {
  if (theControlEvent.isFrom("rangeController")) {
    // min and max values are stored in an array.
    // access this array with controller().arrayValue().
    // min is at index 0, max is at index 1.
    seuilBrillanceMini = int(theControlEvent.getController().getArrayValue(0));
    seuilBrillanceMaxi = int(theControlEvent.getController().getArrayValue(1));
  }
}
 
void Restart() {
  initialiser();
}
 
// color information from ColorPicker 'picker' are forwarded to the picker(int) function
void picker(int col) {
  macouleur=col;
}
 
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(radio)) {
    modeCouleur = int(theEvent.group().value());   
  }
  if (theEvent.isFrom(shapeRadio)) {
    forme = int(theEvent.group().value());
    if(forme==2){
      strokeButton.setOn();
      fillButton.setOff();
      cp.setColorValue(color(100,1,1, 100));
    }
  }
  if(theEvent.isFrom(saveButton)){
    dessine=false;
    if(savePath==""){savePath=selectFolder("Choose a folder to save this applet captures:");}
    if(savePath!=null){saveFrame(savePath+"/worms-####.jpg");}
    dessine=true;
  }
}
