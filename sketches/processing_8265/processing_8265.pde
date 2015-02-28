
void setup(){
  size(600,450);
  frameRate(30);
  colorMode(RGB,255,255,255,100);
  smooth();
}

void draw(){
  //background
  background(152,183,193);
  
  //set the center of the body
  float centerX = mouseX;
  float centerY = mouseY;
  
  //set CENTER mode
  rectMode(CENTER);
  ellipseMode(CENTER);
  
   //set body property
  noFill();
  stroke(52,29,7);
  strokeWeight(1);
  
   //draw the wave arm
  //find center position for the left most unit
  float A=-PI; //set the variable initial
  //loop to draw the arm wave
  for (int i=0; i<61; i++){
    float armX=centerX+40*A;
    float armY=centerY-40*sin(A);
    rect(armX,armY,1,1);
    //point(armX,armY);
    A=A+PI/30;
  }

   //body & legs
  fill(52,29,7);
  noStroke();
  rect(centerX,centerY+40, 4, 200);
  
  stroke(25,29,7);
  line(centerX+2, centerY+140, pmouseX+62, pmouseY+200);
  line(centerX-2, centerY+140, pmouseX-62, pmouseY+200);
  
  // head
  // define head center
  float headX= centerX;
  float headY= centerY-130;
  //face
  noStroke();
  fill(179, 225, 227); //light blue
  rect(headX, headY, 200, 160);
  fill(255); //white
  rect(headX, headY, 170, 130);
  fill(245,173,198); //pale pink
  rect(headX, headY, 160, 120);
  fill(210,241,242); //pale blue
  rect(headX, headY, 145, 105);
  
  // eyes
  stroke(0);
  line(headX+40, headY-10, headX+60, headY-20);
  line(headX-40, headY-10, headX-60, headY-20);
  
  fill(255);
  stroke(0);
  ellipse(headX+40, headY-10, 35,35);
  ellipse(headX-40, headY-10, 35,35);
  
  fill(0);
  noStroke();
  ellipse(headX+40, headY-10, 15,15);
  ellipse(headX-40, headY-10, 15,15);
  
  //mouth
  fill(52,29,7);
  stroke(222,92,111);
  strokeWeight(3);
  rect(headX, headY+45, 80, 50);
}



