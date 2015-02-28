
PShape s;

PImage a;

void setup() {
  size(500,500); 
  
  s = loadShape("cristobal.svg");
  a = loadImage("cris.jpg");
  image(a,0,0,500,500);
  
  smooth();
  
  noStroke();
  fill(255,255,0);
  ellipse(75,75,60,60);
  shape(s,40,50,60,60);
  
  strokeWeight(5);
  stroke(255,255,0);
  line(25,25,50,50);
  line(100,100,125,125);
  line(125,25,100,50);
  line(25,125,50,100);
  line(25,75,35,75);
  line(120,75,130,75);
  line(75,25,75,35);
  line(75,120,75,130);
  
}

void draw() {
  if (mousePressed) {
    strokeWeight(5);
    stroke(0,0,0,255);
  } else {
    noStroke();
  }
    line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed() {
  save("cristobal4.tiff");
}


