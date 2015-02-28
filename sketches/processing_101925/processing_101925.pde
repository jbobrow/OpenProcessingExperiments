
float x=250;
float y=400;

float easing=0.02;

void setup() {
  size (600, 600);
  smooth();
  strokeWeight(2);
  ellipseMode(RADIUS);
}

void draw() {
  int targetX=mouseX;
  int targetY=mouseY;
  x+=(targetX-x)*easing;
  y+=(targetY-y)*easing;
  
  
  background(131);
  if (mousePressed) {
    background(129, 241, 255);
  }
  //Head
  noStroke();
  fill(136, 178, 101);
  if (mousePressed) {
    fill(255, 49, 135);
  }
  ellipse(x,y, 150, 150);
  fill(255);
  rect(x+50, y-50,40, 70);
  if (mousePressed) {
    ellipse(x+70, y-20, 60, 60);
  } 
  fill(0);
  rect(x+50, y-20, 20, 40);
  if (mousePressed) {
    ellipse(x+70, y+5, 35, 35);
  }
  fill(255);
  rect(x-90, y-50,40, 70);
  if (mousePressed) {
    ellipse(x-65, y-20, 60, 60);
  } 
  fill(0);
  rect(x-70, y-20, 20, 40);
  if (mousePressed) {
    ellipse(x-65, y+5, 35, 35);
  }
  stroke(10);
  line(x-30, y+70, x+30, y+70);
  if (mousePressed) {
    strokeWeight(2);
    fill(255, 0, 0);
    arc(x,y+70, 30, 30, 0, PI);
  } 
 if (mousePressed) {
   line(x-170, y-100, x-150, y);
   line(x+170, y-100, x+150, y);
 } else {
   line(x-155, y+100, x-150, y);
   line(x+155, y+100, x+150, y);
 }

 
}

