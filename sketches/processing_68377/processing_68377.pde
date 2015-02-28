
/*
cogsworth
Melissa Alleyne
EMS II Fall 2012
*/

float beginX = 300.0;  // Initial x-coordinate
float endX = 700.0;   // Final x-coordinate
float x = beginX;        // Current x-coordinate
float y = 600;        // Current y-coordinate
float step = -5;    // Size of each step along the path
int count = 0; 
int countStepper = -1;
float pct = 0.0;      // Percentage traveled (0.0 to 1.0)


void setup() 
{
  size(1000, 1000);
  strokeWeight(5);
  smooth();
}

void draw() 
{
  fill(0);
  rect(0, 0, width, height);

  if(x <= beginX || x >= endX) {
    step =  step * (-1);
    countStepper = countStepper * (-1);
  }
  
  /*pendulum*/
  
  strokeWeight(30);
  stroke(255, 215, 0);
  
  x = x + step; 
  count = count + countStepper; 
  y = 600 + 100 * sin(PI - radians(2.25 * count));
  
  fill(255, 215, 0);
  line(500, 250, x, y);
  ellipse(x, y, 200, 200); 
  
  strokeWeight(5);
  stroke(0);  

  rect(475, 5, 50, 50);
  fill(204, 102, 0); //brown  
  ellipse(500, 250, 450, 450); //outer face
  fill(253, 245, 230);
  ellipse(500, 250, 400, 400); //inner face
  
  fill(255); //white
  ellipse(540, 150, 75, 120); //white of right eye
  ellipse(460, 150, 75, 120); //white of left eye
  
  fill(0); //black
  ellipse(530, 180, 25, 41); //white of right eye
  ellipse(470, 180, 25, 41); //white of left eye
  
  noFill(); //top of mouth
  beginShape(); 
  curveVertex(350,  300);
  curveVertex(350,  300);
  curveVertex(450,  360);
  curveVertex(550,  360);
  curveVertex(650,  300);
  curveVertex(650, 300);
  endShape();
  
  fill(0); //bottom of mouth
  beginShape(); 
  curveVertex(425, 350); 
  curveVertex(425, 350);
  curveVertex(490, 400);
  curveVertex(580, 350);
  curveVertex(580, 350);
  curveVertex(520, 370);
  curveVertex(425, 350);
  curveVertex(425, 350);
  endShape();  
  
  strokeWeight(15); 
  line(500, 250, 580, 330); //hour hand
  triangle(580, 320, 590, 340, 570, 330);
  line(500, 250, 380, 345); //minute hand
  triangle(374, 342, 382, 355, 363, 358);
  
  strokeWeight(5);
  fill(255, 255, 0);  //nose
  ellipse(495, 250, 55, 50);
  ellipse(500, 250, 45, 45);
  
  fill(255, 0, 0);   //tongue
  ellipse(480, 380, 27, 33);
  strokeWeight(3);
  line(480, 365, 480, 400); 
  
  strokeWeight(5);
  //clock ticks
  line(500, 50, 500, 80); //12 o'clock tick
  line(500, 420, 500, 450); //6 o'clock tick
  line(670, 250, 700, 250); //3 o'clock tick
  line(300, 250, 330, 250); //9 o'clock tick
  
}

