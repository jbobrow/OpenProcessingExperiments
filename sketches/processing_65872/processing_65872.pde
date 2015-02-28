
//dmb project 1 FACE OFF

float v;
float mouthX;
float mouthY;
float mouthSize;
float lineFirstX;
float lineFirstY;
float lineSecondX;
float lineSecondY;
float lineThirdX;
float lineThirdY;
float eyesRightX;
float eyesRightY;
float eyesLeftX;
float eyesLeftY;


void setup()
{
  size(500,500);

  smooth();
  noFill();
}

void draw() {
  background(250,100,30);
  
  v = mouseX;
  println(v);
  
  mouthX = map(v, 0, 500, 190, 210);
  mouthY = 150;//map(v, 0, 500, 130, 160);
  mouthSize = map(v, 0, 500, 10, 60);
  
  lineFirstX = map(v, 0, 500, 500, 130);
  lineFirstY = map(v, 0, 500, 400, 600);
  
  lineSecondX = map(v, 0, 500, 50, 10);
  lineSecondY = map(v, 0, 500, 350, 80);
  
  lineThirdX = map(v, 0, 500, 300,10);
  lineThirdY = map(v, 0, 500, 20,30);
  
  eyesRightX = map(v, 0, 500, 210, 40);
  eyesRightY = map(v, 0, 500, 450, 130);
  
  eyesLeftX = map(v, 0, 500, 120, 90);
  eyesLeftY = map(v, 0, 500, 10, 500);
  //from bottom left   first line
  beginShape();
  curveVertex(lineFirstX,lineFirstY); // the first control point
  curveVertex(80,500); // is also the start point of curve
  curveVertex(150,350);
  curveVertex(50,150); // the last point of curve
  curveVertex(lineFirstX,lineFirstY); // is also the last control point
  endShape();  
  
  
//second line


  beginShape();
  curveVertex(lineSecondX,lineSecondY); // the first control point
  curveVertex(50,150); // is also the start point of curve
  curveVertex(180,50); // the last point of curve
  curveVertex(lineSecondX,lineSecondY); // is also the last control point
  endShape();  
  
  
//third line
  
  
  beginShape();
  curveVertex(lineThirdX,lineThirdY); // the first control point
  curveVertex(180,50); // is also the start point of curve
  curveVertex(400,500); // the last point of curve
  curveVertex(lineThirdX,lineThirdY); // is also the last control point
  endShape(); 

//eyes right

  beginShape();
  curveVertex(eyesRightX,eyesRightY); // the first control point
  curveVertex(150,150); // is also the start point of curve
  curveVertex(180,120); // the last point of curve
  curveVertex(eyesRightX,eyesRightY); // is also the last control point
  endShape(); 

//eyes left

  beginShape();
  curveVertex(eyesLeftX,eyesLeftY); // the first control point
  curveVertex(200,120); // is also the start point of curve
  curveVertex(180,100); // the last point of curve
  curveVertex(eyesLeftX,eyesLeftY); // is also the last control point
  endShape(); 
  
  ellipse(mouthX,mouthY,mouthSize,mouthSize);
  
  line(240, 110, 400, 10);
  line(250, 140, 450, 80);
  
  
}


