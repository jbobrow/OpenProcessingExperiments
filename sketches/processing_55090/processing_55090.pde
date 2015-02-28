
float y=9.9;

void setup (){
  size (450,450);
}

void draw () {
  background(0);
  if (mousePressed){
  background(255)
  strokeWeight(5);
  stroke(255,0,0);
  line(width/2,height/2,width/2,height);
  strokeWeight(1);
  stroke(0,0,0);
  line(mouseX,mouseY,width/2,height/2);
  noStroke();
  fill(0,0,255);
  ellipse(mouseX,mouseY,50,50);
  fill(255,55,222);
  ellipse (mouseX-15,mouseY+15,30,30);
  fill(255);
  ellipse (mouseX-14,mouseY+14,10,10);
  fill(255);
  ellipse (mouseX-6,mouseY+6,10,10);
  }
  strokeWeight(5);
  stroke(255,244,255);
  line(width/2,height/2,width/2,height);
  strokeWeight(1);
  stroke(0,200,200);
  line(mouseX,mouseY,width/2,height/2);
  noStroke();
  fill(255,55,222);
  ellipse(mouseX,mouseY,50,50);
  fill(0,0,255);
  ellipse (mouseX-15,mouseY+15,30,30);
  fill(0,0,0);
  ellipse (mouseX-14,mouseY+14,10,10);
  fill(0,0,0);
  ellipse (mouseX-6,mouseY+6,10,10);
  fill(255);
  ellipse(y/2, y/2, 10, 10);
  if (y <= height-10){
  y -= 2
  }
  
  y += 2;
}

/*
float x;
float dx;
float y;
float dy;
float c;
//float t;

void setup() {
  size(900, 450);
  smooth();
  noStroke();
  x = 0;
  dx = 1;
  y = 0;
  dy = 1;
  c = 1;
  //t = 99;
}

void draw() {
  fill(255,x-10,y-c);
  ellipse(x, y, 50, 50);
  x += 5*dx;
  y += 9*dy;
  c += 20;
  if (x >=width-25) {
    dx = -1;
  }
  if (x <= 25) {
    dx = +1;
  }
  if (y >= height-25) {
    dy = -1;
  }
  if (y <= 25) {
    dy = +1;
  }
  if (mousePressed == true){
  stroke (random(255),random(255),random(255));
  line (mouseX, mouseY, width, height);
  line (mouseX, mouseY, 0,0);
  line (mouseX, mouseY, 0, height);
  line (mouseX, mouseY, width, 0);
  noStroke ();
  }
}
*/
