
float r = 0;
float g = 0;
float b = 0;

void setup() {
  size(500,500);
  background(100);
  smooth();
  rectMode(CENTER);
}

void draw() {
  if(key == 'r') {
  stroke(255);
  fill(r,0,0);
  rect(width/2,height/2,mouseX+10,mouseY+10);
}
if(key == 'g') {
 stroke(255);
  fill(0,g,0);
  rect(width/2,height/2,mouseX+10,mouseY+10);
}
if(key == 'b') {
  stroke(255);
  fill(0,0,b);
  rect(width/2,height/2,mouseX+10,mouseY+10);
}
if(r<255) {
    r = r+1; 
  } else {
    r = 0;
  }
if(g<255) {
    g = g+1; 
  } else {
    g = 0;
  }
if(b<255) {
    b = b+1; 
  } else {
    b = 0;
  }
}

void keyPressed(){
if (key == 'i'){
  filter(INVERT);
}
if (key == 'o'){
  filter(BLUR);
}
if (key == 's'){
   saveImage();
}
}

