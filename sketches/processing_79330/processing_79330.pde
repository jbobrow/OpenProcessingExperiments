
int rectR;
int rectB;
int counter1;
int counter2;

void setup(){
 size(500, 500); 
 rectR = 3*height/4-20;
 rectB = 3*height/4-20;
 frameRate(7);
 counter1=0;
 counter2=0;
}


void draw(){
  smooth();
  noStroke();
  rectMode(CENTER);
  fill(255, 0, 0);
  ellipse(width/4, 3*height/4+40, 50, 50);
  rect(width/4, rectR, 50, 50);
  fill(0, 0, 255);
  ellipse(3*width/4, 3*height/4+40, 50, 50);
  rect(3*width/4, rectB, 50, 50);
  
  float r =25;
  float distanceEllipseR = dist(width/4, 3*height/4+40, mouseX, mouseY);
  float distanceEllipseB = dist(3*width/4, 3*height/4+40, mouseX, mouseY);
  
  if (mousePressed == true && distanceEllipseR <= r){
  rectR -= 50;
  counter1++;
  }
  if (mousePressed == true && distanceEllipseB <= r){
  rectB -= 50;
  counter2++;
  }
  
  if (counter1 == 5){
    rectR = 3*height/4-20;
    counter1=0;
    fill(255, 255, 0);
    rect(width/4, 100, 50, 50);
  }
  
  if (counter2 == 5){
    rectB = 3*height/4-20;
    counter2=0;
    fill(255, 255, 0);
    rect(3*width/4, 100, 50, 50);
  }
  
}

