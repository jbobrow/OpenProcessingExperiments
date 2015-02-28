

import controlP5.*;

ControlP5 controlP5;
public ListBox objList;
public String[] dataNames;
String path;

void setup() {
  size(300, 200, JAVA2D);//screen size
  rectMode(CENTER);
  rect(width/2,height/2,50,50);
  controlP5 = new ControlP5(this);
  objList = controlP5.addListBox("objList")
                     .setPosition(10, 10)
                     .setSize(150, 140)
                     .setLabel("database matches")
                     .disableCollapse() ;
                     ;
  path = "";
  try{
    URL url = getCodeBase();
    path = url.toString();
  }
  catch (Exception E){
    println("Probably you are not running this as an applet.");
  }
  dataNames = loadStrings("dataNames.txt");
  text (path, 10, 50);
  text (dataNames.length, width-50, height-50);
  text (dataNames[0], 10, 150);
  /**
  if (dataNames.length > 0) {
    for (int i = 0; i <= dataNames.length-1; i++) {
      String[] objects = split(dataNames[i], ",");
      objList.addItem(objects[1],int(objects[0]));
    }
  }
  */
}
void draw() {
  
  
}

