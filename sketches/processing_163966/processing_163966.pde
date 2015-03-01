
float uX = 0, uY=600;
boolean goRight = true;
boolean goLeft = true;
float score = 0;
  
void setup(){
   
  size(600,600);
  strokeWeight(4);
  frameRate(500000000);
  
}

 
void keyPressed(){
 float tVecX = 0;
 float tVecY = 300;
 
 float tVecMag = sqrt(tVecX * tVecX + tVecY * tVecY);
 
 float uVecX = uX - width/2;
 float uVecY = height/2 - 0;
 
 float uVecMag = sqrt(uVecX * uVecX + uVecY * uVecY);
 
 float dot = tVecX * uVecX + tVecY * uVecY;
  
 float cosine = dot / (tVecMag * uVecMag);
  
 score = cosine * 100;
   
}
 

  void blueLine()
  {
    if(uX > width) goRight = false;
    else if (uX < 0) goRight = true;
    if(goRight) uX +=1;
    else uX-=1;
  }
  
  void redLine()
  {
    if(uY > width) goLeft = false;
    else if (uY < 0) goLeft = true;
    if(goRight) uY -=1;
    else uY+=1;
  }
  
  void draw(){
 
  background(0);
  stroke(255,0,0);
  line(width/2, 0, uX, height/2);
  
  stroke(0,0,255);
  line(width/2, height, uY, height/2);
  
  blueLine();
  redLine();
  
  textSize(30);
  fill(255);
  if(score>99.9) text(":) Amazing", width/2, height *1/2);
  else text(":(", width/2, height *1/2);

}

