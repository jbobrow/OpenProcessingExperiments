
// a tweak based on: P_3_0_01.pde
//
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
 
 
PFont font;
String letter = "S";
float theta, sz;
 
 
void setup(){
  size(400, 400);
  background(255);
  fill(0);
 
  font = createFont("Arial", 60);
  textFont(font);
  textAlign(CENTER, CENTER);
}
 
void draw(){
  fill(255, 10);
  noStroke();
  rect(0,0,width, height);
  //background(255);
  fill(20);
  translate(width/2,height/2);
  pushMatrix();
  rotate(theta);
  sz = map(sin(theta),-1,1,20,1000);
  textSize(sz);
    text(letter,0,0);
  popMatrix();
  theta += 0.0523;
  
  //if (frameCount%3==0 && frameCount>100 && frameCount<100+121) saveFrame("image-###.gif");
  
}

 

