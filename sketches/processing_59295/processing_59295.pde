
//library
import simpleML.*;

//variables
float theta;
float negtheta;
float xpos;
float ypos;
boolean loaded = false;

//fonts
PFont ariel;

//objects
XMLRequest xmlRequest;

//text
String[] headlines;

void setup() {
  size(500,600);
  background(250);
  textAlign(CENTER);
  theta = 45;
  negtheta = 45;
  xpos = 0;
  ypos = 0;
  ariel = loadFont("Arial-BoldMT-48.vlw");
  textFont(ariel,20);
  XMLRequest xreq = new XMLRequest(this,"http://politicalwire.com/headlines.xml");
  xreq.makeRequest();
}

void draw() {
  if (loaded == true) {
 //text animation
  background(250);
  translate(width/2,height/2);
  println("loaded");
  theta = theta + .5;
  negtheta = negtheta - .5;
  
  pushMatrix();
  rotate(radians(theta));
  fill(222,16,43);
  for (int i = 0; i < (headlines.length/2); i++) text(headlines[i],(xpos + i*15),(ypos + i*15));
  popMatrix();   
  
  pushMatrix();
  rotate(radians(negtheta));
  fill(63,49,232);
  for (int i = (headlines.length/2); i < (headlines.length); i++) text(headlines[i],(xpos + i),(ypos + ((i-5)*15)));
  popMatrix(); 
 } 
 //draw stars at random
}

void netEvent(XMLRequest m1) {
  headlines = m1.getElementArray("title");
  for (int i = 0; i < headlines.length; i++) println(headlines[i]);
  loaded = true; 
}

