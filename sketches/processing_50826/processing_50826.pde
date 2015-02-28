
void setup(){
  size(300,300);

}

void draw(){
  background(0);
  smooth();
  
//body
  fill(255,0,0);
  ellipseMode(CORNERS);
  ellipse(57,60,180,180);
  noStroke();
  rectMode(CORNERS);
  rect(58,120,180,216);

//eyes
  fill(255);
  ellipse(84,84,108,135);
  ellipse(132,84,156,135);
  fill(0);
  ellipseMode(CENTER);
  float mx = constrain(mouseX,90,102);
  float my = constrain(mouseY,100,120);
  ellipse(mx,my,12,15);
  //ellipse(mouseX,mouseY-50,12,15);
  //ellipse(102,112.5,12,15);
  float mxx = constrain(mouseX,138,150);
  float myy = constrain(mouseY,100,120);
  ellipse(mxx,myy,12,15);
  //ellipse(mouseX+48,mouseY-50,12,15);
  //ellipse(150,112.5,12,15);

//bottom edge
  fill(0);
  triangle(58,216,72,192,84,216);
  triangle(84,216,96,192,108,216);
  triangle(108,216,120,192,132,216);
  triangle(132,216,144,192,156,216);
  triangle(156,216,168,192,180,216);
}

