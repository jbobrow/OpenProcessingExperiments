
int originX, originY;
PFont f;

void setup(){
  size( 400, 400 );
  originX = width/2;
  originY = height/2;
  ellipseMode( CENTER );
  f = loadFont("Serif-16.vlw");
  textFont(f,12);
}

void draw(){
  background(255);
  stroke(255,0,0);
  line( originX , originY , mouseX, mouseY); 
  stroke(225);
  line( mouseX, mouseY , mouseX , originY );  
  line( mouseX, mouseY , originX , mouseY );   
  stroke(205);
  line( originX, originY , mouseX , originY  );  
  line( originX, originY , originX , mouseY );  
 // println( "ECO: " + dist( originX , originY , mouseX, mouseY) );
  noStroke();
  fill(255,0,0);
  ellipse( originX,originY,10,10);
  ellipse( mouseX, mouseY,10,10); 
  fill(0);
  text("Distancia: "+ dist( originX , originY , mouseX, mouseY) , 
  mouseX > originX ? originX+(dist( originX , originY , mouseX, originY) /2) : originX-(dist( originX , originY , mouseX, originY) /2),
  mouseY > originY ? originY+(dist( originX , originY , originX, mouseY) /2) : originY-(dist( originX , originY , originX, mouseY) /2) 
  );
}
