
/*@pjs preload="apple3.png;*/

PImage img;


void setup() {
  size(450, 450);
  background(255);
  colorMode(RGB);
  noStroke();
  frameRate(8);
  smooth();
  img = loadImage("apple3.png");
  image(img, 50, 20);
}
void draw() {
  fade();
//rondom,en,ookisa
  float x=(random(width));
  float y=(random(height));
  float z=(random(250));

  noStroke();
  fill (randomColor()); 
  ellipse(x, y, z, z);

  for (int a=0; a<100; a++) {     
    ellipse(a*450,10,40, 40);
  
  }
  for (int b=0; b<100; b++) {     
    ellipse(b*450,440,40, 40);
  
  }
  
}
//en,kaku
void mouseDragged(){
  fill(50, 200, 50);
  ellipse(mouseX, mouseY, 100, 100);
}



void mousePressed() {
 
  image(img, 0, 0);
}

//randomColor
color randomColor() {
  color c=color(random(255), random(255), random(255),150);
  return c;
}
//fadeout
void fade() {
  noStroke ();
  fill(255, 30);
  rectMode(CORNER);
  rect(0, 0, width, height);
}


