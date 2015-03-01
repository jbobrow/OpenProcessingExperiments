

PFont fonte;


void setup(){
  size(720, 480);
  fonte = loadFont("NeutraText-BoldItalicFract-70.vlw");
}

void draw(){
  background(90);
  rectMode(CENTER);
  
  float time = frameCount/150.0 * PI;
  //println("time: " + time);
  /*
  float xPos = cos(time)*amp+width/2;
  float yPos = sin(time)*amp+height/2;
  
  rect(xPos, yPos, 40, 40);
  
  fill(255);
  translate(width/2, height/2);
  rotate(time);
  rect(0, 0, 80, 80);
  */
  
  
  pushMatrix();
  noStroke();
  fill(80);
  translate(width/2, height/2);
  rotate(time*1.5);
  rect(0, 0, 610, 610);
  popMatrix();
  
  pushMatrix();
  noStroke();
  fill(70);
  translate(width/2, height/2);
  rotate(time*1.25);
  rect(0, 0, 377, 377);
  popMatrix();
  
    pushMatrix();
  noStroke();
  fill(60);
  translate(width/2, height/2);
  rotate(time);
  rect(0, 0, 233, 233);
  popMatrix();
  
  pushMatrix();
  noStroke();
  fill(50);
  translate(width/2, height/2);
  rotate(time*0.75);
  rect(0, 0, 144, 144);
  popMatrix();
  
  pushMatrix();
  noStroke();
  fill(40);
  translate(width/2, height/2);
  rotate(time*0.5);
  rect(0, 0, 89, 89);
  popMatrix();
  
  pushMatrix();
  noStroke();
  fill(30);
  translate(width/2, height/2);
  rotate(time*0.25);
  rect(0, 0, 55, 55);
  popMatrix();
  
    pushMatrix();
  noStroke();
  fill(20);
  translate(width/2, height/2);
  rotate(time*0.125);
  rect(0, 0, 34, 34);
  popMatrix();
  
  pushMatrix();
  noStroke();
  fill(10);
  translate(width/2, height/2);
  rotate(time*0.0625);
  rect(0, 0, 21, 21);
  popMatrix();
  
    pushMatrix();
  noStroke();
  fill(0);
  translate(width/2, height/2);
  rotate(time*0.03125);
  rect(0, 0, 13, 13);
  popMatrix();
  
  //fill(144);
  //rect(width/2, height/2, width, 40);
  
  fill(255);
  textAlign(CENTER);
  textFont(fonte);
  text ("Have a Nice Day!", width/2, height/2);
  
  
}


