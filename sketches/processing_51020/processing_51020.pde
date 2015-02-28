
float leftEyeCenterX;
float leftEyeCenterY;

float rightEyeCenterX;
float rightEyeCenterY;

boolean isAngry = false;
boolean lastIsAngry = false;
boolean dt = true;

float tearM = 1.0f;
float tearR = 10.0f;

void setup()
{
  size(640, 480);
  smooth();
  rectMode(CENTER);
  
  leftEyeCenterX = width/4;
  leftEyeCenterY = height/2;
  
  rightEyeCenterX = width/2 + width/4;
  rightEyeCenterY = height/2;
}

void draw()
{
  background(255);
  
  fill(0,255,255);
 
  if(dt){
    drawTear();
  }
 
  drawLeftEye();
  drawRightEye();
  
  drawEyeBrowsOrTear();
  


}

void drawEyeBrowsOrTear()
{
  lastIsAngry = isAngry;
  
  //Right eyebrow
  if(mouseX > width/4 && mouseX < width/2 + width/4 && 
     mouseY > height/4 && mouseY < height/2 + height/4)
  {
    isAngry = true;  
  }else{
    isAngry = false;
  }
    
  if(isAngry){
    dt = false;
    
    //Right
    fill(0); stroke(0); strokeWeight(25);  
    line(350,200,550,120); 

    //Right
    fill(0); stroke(0); strokeWeight(25);  
    line(90,120,290,200); 
  }else{
    //Tear
    dt = true;
  }
    
    
  //Angry 
  
}

void drawTear()
{
  pushMatrix();
  translate(450,350);
  rotate(-HALF_PI);

  if(lastIsAngry != isAngry){
    tearM = 1.0f;
    tearR = 10.0f;
  }

  //float m = map(mouseX,0,width,0,7);

  tearM += 0.1f;
  tearR += 0.3f;

  if(tearM > 10.0f){
     tearM = 10.0f;
  }
  if(tearR > 100.0f){
    tearR = 100.0f;
  }

  float m = tearM;
  float r = tearR;
  
  fill(0,255,255,200);
  stroke(0,255,255,200);
  strokeWeight(0);
  

  beginShape();
  for(int i=0; i<360; i+=10)
  {    
    //From Wolfram Math: http://mathworld.wolfram.com/TeardropCurve.html
    float t = radians(i);
    float x = cos(t) * r;
    float y = sin(t) * pow(sin(t/2), m) * r;
  
    vertex(x,y);
  }
  endShape(CLOSE); 
  popMatrix();
}


void drawLeftEye(){  
  //Black eye bg
  fill(0,0,0); stroke(0,0,0); strokeWeight(2);  

  //Vars
  float m = 1.0f;
  float r = 100.0;

  //Left part
  pushMatrix();
  translate(leftEyeCenterX-50, leftEyeCenterY);
  rotate(PI);
  
  beginShape();
  for(int i=0; i<360; i+=10)
  {    
    //From Wolfram Math: http://mathworld.wolfram.com/TeardropCurve.html
    float t = radians(i);
    float x = cos(t) * r;
    float y = sin(t) * pow(sin(t/2), m) * r;
  
    vertex(x,y);
  }
  endShape(CLOSE); 
  popMatrix();
  
  //Right part
  pushMatrix();
  translate(leftEyeCenterX+50, leftEyeCenterY);
  rotate(2*PI);
  
  beginShape();
  for(int i=0; i<360; i+=10)
  {    
    //From Wolfram Math: http://mathworld.wolfram.com/TeardropCurve.html
    float t = radians(i);
    float x = cos(t) * r;
    float y = sin(t) * pow(sin(t/2), m) * r;
  
    vertex(x,y);
  }
  endShape(CLOSE); 
  popMatrix();
  
  
  

  
  
  
  //White part of eye
  fill(255,255,255); stroke(255,255,255); strokeWeight(2);  

  //Vars
  r = 90.0f;

  //Left part
  pushMatrix();
  translate(leftEyeCenterX-50, leftEyeCenterY);
  rotate(PI);
  
  beginShape();
  for(int i=0; i<360; i+=10)
  {    
    //From Wolfram Math: http://mathworld.wolfram.com/TeardropCurve.html
    float t = radians(i);
    float x = cos(t) * r;
    float y = sin(t) * pow(sin(t/2), m) * r;
  
    vertex(x,y);
  }
  endShape(CLOSE); 
  popMatrix();
  
  //Right part
  pushMatrix();
  translate(leftEyeCenterX+50, leftEyeCenterY);
  rotate(2*PI);
  
  beginShape();
  for(int i=0; i<360; i+=10)
  {    
    //From Wolfram Math: http://mathworld.wolfram.com/TeardropCurve.html
    float t = radians(i);
    float x = cos(t) * r;
    float y = sin(t) * pow(sin(t/2), m) * r;
  
    vertex(x,y);
  }
  endShape(CLOSE); 
  popMatrix();
  
  
  
  //White fixer top
  fill(255); stroke(255); strokeWeight(5);  
  line(140,172,180,172);  
  
  //White fixer bottom
  fill(255); stroke(255); strokeWeight(5);  
  line(140,308,180,308);  
  
  
  
  //Moving parts
  pushMatrix();

  float angle = atan2(mouseY-leftEyeCenterY, mouseX-leftEyeCenterX);
  float distance = dist(mouseX, mouseY, leftEyeCenterX, leftEyeCenterY);
  
  translate(leftEyeCenterX, leftEyeCenterY);
  rotate(angle);
    
  //Colored part
  //fill(random(255),random(255),random(255));
  fill(0,255,0); stroke(0,0,0); strokeWeight(2);
  
  ellipse(distance/25.0f, 0.0f, 125.0f, 125.0f);
  
   //Black part of pupil
  fill(0,0,0); stroke(0,0,0); strokeWeight(2);  
  ellipse(distance/10.0f, 0.0f, 50.0f, 50.0f);
  
  popMatrix();
  

  
  //Black fixer top
  fill(0); stroke(0); strokeWeight(5);  
  line(140,167,180,167);
  
  //Black fixer bottom
  fill(0); stroke(0); strokeWeight(5);  
  line(140,313,180,313); 
  
  
}

void drawRightEye(){
  //Black eye bg
  fill(0,0,0); stroke(0,0,0); strokeWeight(2);  

  //Vars
  float m = 1.0f;
  float r = 100.0;

  //Left part
  pushMatrix();
  translate(rightEyeCenterX-50, rightEyeCenterY);
  rotate(PI);
  
  beginShape();
  for(int i=0; i<360; i+=10)
  {    
    //From Wolfram Math: http://mathworld.wolfram.com/TeardropCurve.html
    float t = radians(i);
    float x = cos(t) * r;
    float y = sin(t) * pow(sin(t/2), m) * r;
  
    vertex(x,y);
  }
  endShape(CLOSE); 
  popMatrix();
  
  //Right part
  pushMatrix();
  translate(rightEyeCenterX+50, rightEyeCenterY);
  rotate(2*PI);
  
  beginShape();
  for(int i=0; i<360; i+=10)
  {    
    //From Wolfram Math: http://mathworld.wolfram.com/TeardropCurve.html
    float t = radians(i);
    float x = cos(t) * r;
    float y = sin(t) * pow(sin(t/2), m) * r;
  
    vertex(x,y);
  }
  endShape(CLOSE); 
  popMatrix();
  
  
  

  
  
  
  //White part of eye
  fill(255,255,255); stroke(255,255,255); strokeWeight(2);  

  //Vars
  r = 90.0f;

  //Left part
  pushMatrix();
  translate(rightEyeCenterX-50, rightEyeCenterY);
  rotate(PI);
  
  beginShape();
  for(int i=0; i<360; i+=10)
  {    
    //From Wolfram Math: http://mathworld.wolfram.com/TeardropCurve.html
    float t = radians(i);
    float x = cos(t) * r;
    float y = sin(t) * pow(sin(t/2), m) * r;
  
    vertex(x,y);
  }
  endShape(CLOSE); 
  popMatrix();
  
  //Right part
  pushMatrix();
  translate(rightEyeCenterX+50, rightEyeCenterY);
  rotate(2*PI);
  
  beginShape();
  for(int i=0; i<360; i+=10)
  {    
    //From Wolfram Math: http://mathworld.wolfram.com/TeardropCurve.html
    float t = radians(i);
    float x = cos(t) * r;
    float y = sin(t) * pow(sin(t/2), m) * r;
  
    vertex(x,y);
  }
  endShape(CLOSE); 
  popMatrix();
  
  
  
  //White fixer top
  fill(255); stroke(255); strokeWeight(5);  
  line(460,172,500,172);  
  
  //White fixer bottom
  fill(255); stroke(255); strokeWeight(5);  
  line(460,308,500,308);  
  
  
  
  //Moving parts
  pushMatrix();

  float angle = atan2(mouseY-rightEyeCenterY, mouseX-rightEyeCenterX);
  float distance = dist(mouseX, mouseY, rightEyeCenterX, rightEyeCenterY);
  
  translate(rightEyeCenterX, rightEyeCenterY);
  rotate(angle);
    
  //Colored part
  //fill(random(255),random(255),random(255));
  fill(0,255,0); stroke(0,0,0); strokeWeight(2);
  
  ellipse(distance/25.0f, 0.0f, 125.0f, 125.0f);
  
   //Black part of pupil
  fill(0,0,0); stroke(0,0,0); strokeWeight(2);  
  ellipse(distance/10.0f, 0.0f, 50.0f, 50.0f);
  
  popMatrix();
  

  
  //Black fixer top
  fill(0); stroke(0); strokeWeight(5);  
  line(460,167,500,167);
  
  //Black fixer bottom
  fill(0); stroke(0); strokeWeight(5);  
  line(460,313,500,313);
}

