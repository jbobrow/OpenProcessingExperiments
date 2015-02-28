
int r= 25;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
background(0);

if (mousePressed) {
  background(random(255));
}

 PImage c = loadImage("cookie.png");
  cursor(c);

  float mx = constrain(mouseX, 280, 320);
  float my = constrain(mouseY, 260, 330);
 
  
  
  
  stroke(255);
  PImage img;
  img = loadImage("sphere.png");
  image(img,185,185);
  

  noStroke();
  fill(255);
  ellipse(mx,my, 80,80);
  
  fill(0);
  ellipse(mx,my,25,60);
  if (mousePressed) {
    fill(#7E1414);
  ellipse(mx,my,25,60);
  }
  
  
     if (mousePressed) {
     strokeWeight(3);
     stroke(#B20000);
    line(mx,my, mouseX, mouseY); 
    line(mx,my, mouseY, mouseX);
    line(mx, my, mouseX, my);
    line(mx,my, mouseY, mx);
   }
  
}


