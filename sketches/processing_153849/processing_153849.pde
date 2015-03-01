
import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class clickyGame extends PApplet {

XMLElement xml;
int id ;
int yesScreen ;
int noScreen ;
int yesPoints ;
int noPoints ;
String question ;
int whichScreen ;
int gameScore = 0 ;
int numScreens ;
PImage back;
PImage street;
PImage start ;
PImage crowd ;
PImage room ;
PImage prison ;
PImage night ;
PImage popo ;
PImage stalk ;
int yesLocX = 180 ;
int yesLocY = 190 ;
int noLocX = 300 ;
int noLocY = 190 ;

public void setup() {
  size(500,500);
  xml = new XMLElement(this,"states.xml");
  numScreens = xml.getChildCount() ;
  
 // println(xml) ;
  background(0xff304c9c);
  whichScreen = PApplet.parseInt(15) ;
  getAQuestion(whichScreen) ;
  smooth();
  
  
 
}

public void draw() {

}




public void getAQuestion(int w) {
  back = loadImage("desert.jpg");
  street = loadImage("town.png");
  night = loadImage("desertnight.jpg");
  crowd = loadImage("crowd.png");
  room = loadImage("room.png");
  prison = loadImage("prison.png");
  start = loadImage("open.jpg");
  popo = loadImage("police.png");
  stalk = loadImage("stalk.png");
  
   XMLElement kid = xml.getChild(w) ;
  
  id = kid.getIntAttribute("id") ;
  println(id);
  
  yesScreen = kid.getIntAttribute("yes") ;
  noScreen = kid.getIntAttribute("no") ;
  question = kid.getContent() ;
  
  println(id + " : " + yesScreen + " : " + noScreen + " : " + question) ;
  
   image(back, 0, 0);
  fill(0xff66aaee);
 
 
  if (id == 15 ) {
    image(start, 0, 0);
     fill(0xffffffff);
     text(question, 20 , 100, 400, height);
     text("Next", yesLocX, yesLocY);
  }
  if (id == 0) {
     fill(0xffffffff);
     text(question, 20 ,50, 450, height);
     text("Yes", yesLocX, yesLocY);
     text("No", noLocX, noLocY);
  }
  if (id == 1) {
     fill(0xffffffff);
     image(room, 0,0);
     text(question, 20 ,50, 450, height);
     text("Yes", yesLocX, yesLocY);
     text("No", noLocX, noLocY);

  }
  if (id == 2 || id == 3) {
     fill(0xffffffff);
     image(night, 0,0);
     image(room, 0,0);
     text(question, 20 ,50, 450, height);
     text("Next", yesLocX, yesLocY);

  }
  if (id == 4) {
     fill(0xffffffff);
     image(street, 0,0);
     image(crowd, 0,0);
     text(question, 20 ,50, 450, height);
     text("Yes", yesLocX, yesLocY);
     text("No", noLocX, noLocY);

  }
  if (id == 5) {
     fill(0xffffffff);
     image(street, 0,0);
     image(crowd, 0,0);
     image(popo, 0, 10);
     text(question, 20 ,50, 400, height);
     text("Yes", yesLocX, yesLocY);
     text("No", noLocX, noLocY);

  }
  if (id == 6 || id == 12) {
     fill(0xffffffff);
     image(street, 0,0);
     image(crowd, 0,0);
     image(popo, 0, 10);
     text(question, 20 ,50, 400, height);
     text("Yes", yesLocX, yesLocY);
     text("No", noLocX, noLocY);

  }
  if (id == 7) {
     fill(0xffffffff);
     image(street, 0,0);
     image(crowd, 0,0);
     image(stalk, 0,0);
     text(question, 20 ,50, 450, height);
     text("Next", yesLocX, yesLocY);

  }
  if (id == 8 ) {
   fill(0xffffffff);
     image(street, 0,0);
     image(crowd, 0,0);
     image(popo, 0, 10);
     text(question, 20 ,50, 400, height);
     text("Next", yesLocX, yesLocY);

  }
   if (id == 9 ) {
   fill(0xffffffff);
     image(prison, 0,0);
     text(question, 20 ,50, 400, height);
     text("Next", yesLocX, yesLocY);

  }
  if (id == 10 ) {
   fill(0xffffffff);
     image(street, 0,0);
     image(crowd, 0,0);
     image(stalk, 0,0);
     image(popo, 10, 300, 200,200);
     text(question, 20 ,50, 450, height);
     text("Yes", yesLocX, yesLocY);
     text("No", noLocX, noLocY);

  }
  if (id == 11) {
     fill(0xffffffff);
     image(night, 0,0);
     text(question, 20 ,50, 400, height);
     text("Next", yesLocX, yesLocY);
  }
  if (id == 12) {
     fill(0xffffffff);
     image(back, 0,0);
     image(street, 0,0);
     image(crowd, 0,0);
     image(popo, 0, 10);
     text(question, 20 ,50, 400, height);
     text("Next", yesLocX, yesLocY);
  }
  if (id == 13) {
     fill(0xffffffff);
     image(night, 0,0);
     text(question, 20 ,50, 400, height);
     text("Next", yesLocX, yesLocY);
  }
  if (id == 14) {
     fill(0xffffffff);
     image(night, 0,0);
     text(question, 150 ,80, 400, height);
     text("Yes", yesLocX, yesLocY);
     text("No", noLocX, noLocY);
  }

}

public void mousePressed() {
  if ((mouseX < (yesLocX + 30) && (mouseX > (yesLocX - 30))) &&  (mouseY < (yesLocY + 30) && (mouseY > (yesLocY - 30)))) {
    println("we are in the yes box!") ;
    getAQuestion(yesScreen) ;
  }
  if ((mouseX < (noLocX + 30) && (mouseX > (noLocX - 30))) &&  (mouseY < (noLocY + 30) && (mouseY > (noLocY - 30)))) {
    getAQuestion(noScreen) ;
  }

}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "clickyGame" });
  }
}

