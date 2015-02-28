
float angle = 0.0;
float offset = 225;
float scalar = 70;
float speed = 0.03;

PImage watercolor;

void setup() {
  ellipseMode(RADIUS);
  size(500,500);
  smooth();
  noStroke();
  watercolor= loadImage("watercolor2.png");

  //background(255);
  image(watercolor, 0, 0);
  filter(INVERT);

  noFill();
  strokeWeight(7);
  stroke(39,30,90);

  beginShape();
  curveVertex(240, 260); 
  curveVertex(240, 260); 
  curveVertex(280, 340);
  curveVertex(250, 500); 
  curveVertex(250, 500); 
  endShape();
  
 beginShape();
  curveVertex(375, 305); 
  curveVertex(375, 305); 
  curveVertex(380, 340);
  curveVertex(370, 500); 
  curveVertex(370, 500); 
  endShape();
  noStroke();
  
  fill(211,19,64,180);
  ellipse(225,225,60,60);
  
  fill(220,240,40,150); 
  ellipse(375,275,50,50);
}

void draw() {
  frameRate(25);
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  noStroke();
  fill(random(150,250),random(120,230),random(50),50);
  ellipse(x, y, random(20,50), random(20,50));
  angle += speed;

  if ((mouseX < 255) && (mouseX >195) &&(mouseY <255) && (mouseY >195)&& (mousePressed)) {
    fill(random(250),random(20),random(170),50);
  ellipse(x+150, y+50, random(10,30), random(10,30));
  
  }
    
}


