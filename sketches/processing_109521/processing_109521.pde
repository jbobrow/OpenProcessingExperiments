
PImage img;
PFont font;

float mx;
float my;
int grad;

void setup(){
  size(480,480);
  img = loadImage("avatar copy.png");
  font = loadFont("8BITWONDERNominal.vlw");
  textFont(font, 16);
  colorMode(HSB);
  grad = 10;
}

void draw(){

  image(img,0,0);
  strokeWeight(2);
  stroke(255);
  line(0, 20, width, 20);
  line(0, 460, width, 460);
  line(20, 0, 20, height);
  line(460, 0, 460, height);
  
  fill(255);
  beginShape();
  vertex(190, 380);
  vertex(153,  373);
  vertex(153, 387);
  endShape();
  noStroke();
  smooth();
  rect(45,360, 110, 40);
  
  
  if(grad > 255) grad = 10;
  fill(grad,100,250);
  text("mkim2", 57,386);
  
  mx = constrain(mouseX, 170, 200);
  my = constrain(mouseY,250, 260);
  
  ellipse(mx, my, 15, 15);
  grad+=10;
}


