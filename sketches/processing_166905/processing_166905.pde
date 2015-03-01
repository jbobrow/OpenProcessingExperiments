

PImage img;
PFont f;

float spin;
float r;
float g;
float b;
void setup() {
  size(1200, 800,P3D);
  background(0);
  img = loadImage("wafflez2.png");
  f = loadFont("Tunga-Bold-200.vlw");  
}

void draw() {
  r = (mouseX/2);
  g = (mouseY/3);
  b = (mouseY+mouseX)/2;
  spin = spin + 1;
  pushMatrix();
  if (mousePressed && (mouseButton == LEFT)) {
     translate(width/2,height/3,0);
     rotateY(spin);
     fill(0);
     rectMode(CENTER);
     rect(mouseX-600,mouseY-300,25,25);
     spin = spin + 0.1;
   
  } else if (mousePressed && (mouseButton == RIGHT)) {
    translate(width/2,height/3,0);
    rotateY(spin);
    stroke(0,0,0,0);
    tint(r,g,b);
    rectMode(CENTER);
    image(img,mouseX-600,mouseY-300,100,100);
      
  } else {
    translate(width/2,height/3,0);
    rotateY(spin);
    stroke(0,0,0,0);
    fill(r,g,b);
    rectMode(CENTER);
    rect(mouseX-600,mouseY-300,25,25);
  }
  
  popMatrix();
  textFont(f);       
  fill(r, g, b);
  noStroke();
  textAlign(CENTER);
  if (mousePressed && mouseButton == RIGHT){
    text("WAFFLE",width/2,700); 
}
  float d = dist(700,740, mouseX, mouseY);
}  




