
float eyeR;
float eyeG;
float eyeB;
float moveX = 100;
float moveY = 100;



void setup() {
  size(500, 500);
  smooth();
  
}
void draw() {
  background(255,0,0);
  translate(200, 200);
  point(moveX+100, moveY+100);
  line(moveX+180, moveY+70, moveX+3, moveY+70);
  rectMode(CENTER);
  fill(0, 0, 255);
  rect(moveX+65, moveY+90, 25, 80);
  fill(0, 255, 0);
  ellipseMode(CENTER);  
  ellipse(moveX+66, moveY+30, 60, 60);
  fill(283, 0, 200);
  //left eye
  //fill(mouseX, 0, mouseY);
  fill(random(0,256), random(0,256),random(0,256));
  ellipseMode(CENTER);
  ellipse(moveX+50, moveY+30, 20, 38);
  //right eye
  //fill(mouseX, 0, mouseY);
   fill(random(0,256), random(0,256),random(0,256));
  ellipseMode(CENTER);
  ellipse(moveX+83, moveY+30, 20, 38);
  line(moveX+58, moveY+125, moveX+1, moveY+190);
  line(moveX+75, moveY+125, moveX+110, moveY+190);
  moveX = moveX -1;
}
void mousePressed() {
  println("Take me to your leader!");
}


