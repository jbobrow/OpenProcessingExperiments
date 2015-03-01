
PImage background;    //Stage Background
PImage batman;
PImage groot;
PFont font;
color yellow = color(255, 204, 0);
color red = color(255,0,0);


/* @pjs preload="sf-stage.gif"; */  
//Assignment 2a: Picture/Text Event by Vincent Ong

void setup () {
  size(673,224);
  background = loadImage("sf-stage.gif");
  image (background, 0, 0, 673, 224);
  batman = loadImage("batman.png");
  groot = loadImage("groot.png");
  font = loadFont("Gotham-Bold-48.vlw");
  //Shadow Text
  fill (0);
  textFont (font, 40);
  text("BATMAN",161,141);
  text("GROOT",361,141);
  textFont (font, 20);
  text("VS",331,141);
  textFont (font, 12);
  fill (0);
  text("COMING SOON TO A THEATER NEAR YOU",216,181);
  //Main Text
  fill (255);
  textFont (font, 40);
  text("BATMAN",160,140);
  text("GROOT",360,140);
  textFont (font, 20);
  text("VS",330,140);
  textFont (font, 12);
  fill (255);
  text("COMING SOON TO A THEATER NEAR YOU",215,180);
  textFont (font, 30);
  text("KO",315,35);
  
  
 
}

void draw() {
  stroke(255);
  //Health Meters
  fill(yellow);
  rect(30,10,270,20);
  rect(370,10,270,20);
  fill(red);
  rect(240,10,60,20);
  rect(600,10,40,20);
  image(batman,50,65,110,156);
  image(groot,500,50,120,170);
}




