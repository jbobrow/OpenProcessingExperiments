
void setup(){
  size(300,300);
  smooth();
  background(0);
  frameRate(30);
}

float circleX = 150;
float circleY = 150;
float r;
float g;
float b;

void draw(){


  //circle
  fill(255,g,b,127);
  strokeWeight(0);
  ellipseMode(CENTER);
  ellipse(circleX,circleY,20,20);
  //line 1
  fill(r,255,b,127);
  ellipseMode(CENTER);
  ellipse(circleX,circleY+30,5,5);
  stroke(0,25);
  line(circleX,circleY+30,circleX+10,circleY+60);
  line(circleX+10,circleY+60,random(230,270),random(260,300));

  //line 2
  fill(r,g,255,127);
  ellipseMode(CENTER);
  ellipse(circleX+30,circleY,5,5);
  line(circleX+30,circleY,circleX+70,circleY-10);
  line(circleX+70,circleY-10,random(160,200),random(0,40));
  
  //line 3
  fill(255,g,b,127);
  ellipseMode(CENTER);
  ellipse(circleX-30,circleY,5,5);
  line(circleX-30,circleY,circleX-40,circleY+40);
  line(circleX-40,circleY+40,random(0,40),random(160,200));
  
  circleX +=  random(-20,20);
  circleY +=  random(-20,20);
  
  circleX = constrain(circleX,0,300);
  circleY = constrain(circleY,0,300);
  
  r = random(255);
  g = random(255);
  b = random(255);
}

void mousePressed(){
  background(0);
}

void keyPressed(){
  saveFrame();
}

