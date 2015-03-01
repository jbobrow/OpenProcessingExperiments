
float aX=0, aY=0, uX=0, rad =0, tX1=300, tY1=300, tX2=300, tY2=600;
boolean isPressed = false;
float score=0;
 
void setup()
{
  size(600,600);
}
 
void keyPressed()
{
  tX1=width/2;
  tY1=0;
  tX2=random(0,width);
  tY2=height/2;
}
 
void mousePressed()
{
  float tVecX = tX2-tX1;
  float tVecY = tY2-tY1;
  
  float tVecMag = sqrt(tVecX * tVecX + tVecY * tVecY);
  
  float uVecX = aX - 300;
  float uVecY = aY - 300;
  
  float uVecMag = sqrt(uVecX * uVecX + uVecY * uVecY);
  
  float dot = tVecX * uVecX + tVecY * uVecY;
  
  float cosine= dot / (tVecMag * uVecMag);

  score = 100-cosine * 100;
  println(score);
}
 
void draw()
{
  background(0);
   textSize(30);
  fill(#F0F79D);
  text("Let's make 90 degrees!", width/4, height/6);
  
  stroke(#19CBCA);
  strokeWeight(10);
  line(tX1, tY1, tX2, tY2);

  rad+=0.01;
  aX = 300*cos(rad)+300;
  aY = 300*sin(rad)+300;
  stroke(#F24C91);
  line(width/2, height/2, aX, aY);
  
  if(mousePressed){
    isPressed = true;
  }
  else
    isPressed = false;
  
  textSize(30);
  fill(#F0F79D);
  if (score>90 & score < 110){
    text(" So Adorable<3", width/2, height*2/3);
  }
  else if(isPressed) text ("   Try One More!", width/2, height*2/3);
  

}
