

import net.nexttext.renderer.util.*;
import net.nexttext.behaviour.dform.*;
import net.nexttext.behaviour.*;
import net.nexttext.behaviour.control.*;
import net.nexttext.behaviour.physics.*;
import net.nexttext.renderer.*;
import net.nexttext.*;
import net.nexttext.property.*;
import net.nexttext.behaviour.standard.*;
import net.nexttext.input.*;

//global
Book book;
PFont font;
PImage mouth,soup,michael;
String words = new String();
AbstractAction follow,pull, followOrPullBack,randomMotion,movement; 
Multiplexer followSinkAndReform;
//PhysicsAction stayinside = new StayInside(ellipse(200,400,300,300),2);

  Behaviour followOrPullBackBehaviour,movementBehaviour;
    AbstractAction reform = new Reform();

  PhysicsAction gravity = new Gravity(10);

void setup() {
  size(400,400);
  smooth();
  imageMode(CENTER);
  frameRate(20);

  //creating book
  book=new Book(this);

  mouth = loadImage("mouth.png");
  soup = loadImage("soup.png");
  michael =loadImage("michael.png");

  //loading and setting font
  font = loadFont("de.vlw");
  textFont(font);
  textAlign(CENTER);
  fill(242,197,130);
  stroke(193,109,20);
  strokeWeight(5);

  //keeps letters in window
  AbstractAction stayInWindow = new StayInWindow(this);
  Behaviour stayInWindowBehaviour = stayInWindow.makeBehaviour();
  book.addGlyphBehaviour(stayInWindowBehaviour);
}

void draw() {
  background(0);
  drawFace();
  book.stepAndDraw();
  changeText();
  fixWords();
  println (words);
}

void fixWords() {
  if(keyPressed){
    words+=key;
  }
  else{
    words=" ";
  }

}


void drawFace() {
  image(mouth,width/2,height/6,mouth.width*2,mouth.height*2);
  image(michael,width/2,height/20);
  image(soup,width/2,height*.8);
}

void changeText() {


randomMotion = new RandomMotion(2);
  pull = new Pull(width*.55,height*.36);


  for(int i=0; i<words.length(); i++) {

    follow = new Repeat (new MoveTo(Book.mouse,i+1),0);
    followSinkAndReform = new Multiplexer();
    followSinkAndReform.add(follow);
    followSinkAndReform.add(reform);
    followSinkAndReform.add(gravity);
    followSinkAndReform.add(randomMotion);
    

    followOrPullBack = new OnMouseOverApplet(this,followSinkAndReform,pull);
    movement = new OnMouseOutApplet(this,randomMotion);
    movementBehaviour = movement.makeBehaviour();
    followOrPullBackBehaviour = followOrPullBack.makeBehaviour();
 
    book.addGlyphBehaviour(followOrPullBackBehaviour);
    book.addGlyphBehaviour(movementBehaviour);

    book.addText(words.substring(i,i+1),width/2,height/2);

    book.removeGlyphBehaviour(followOrPullBackBehaviour);
    book.removeGlyphBehaviour(movementBehaviour);
  }
}


