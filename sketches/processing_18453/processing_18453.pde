
float R = 0;

void setup() {
  size(250, 250);
  smooth();
  noStroke();
  rectMode(CENTER);
  frameRate(24);
  background(0);
}

void draw() {
  R+=.1;

  translate(width/2, height/2);
  rotate(R);
  
  translate(20,20);
  rotate(R*-1);

  translate(0,0);
  rotate(R*-.1);
  
    translate(0,0);
  rotate(R*-.1);
  
   translate(0+R,0);
  rotate(R*-.1);

stroke(255,200,0+R,95);
strokeWeight(2);
line(50,50,-50,-50);
}

void keyPressed(){
  if (key=='s'){
    saveFrame("fabric.png");
  }
}



