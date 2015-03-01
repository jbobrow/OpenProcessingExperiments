

  int ballSize=20;
  int x=250;
  int y=50;
  int xSpeed=3;
  int ySpeed=3;
  
   
void setup(){
  size(400,400, P3D);
 
}
 
void draw(){
  
  background(255);
  fill(20,244,200);
  ellipse(x,y,ballSize,ballSize);
  x+=xSpeed;
  y+=ySpeed;
  //collision logic and it also makes a ball in the center appear
  if (x>=400-ballSize/2 || x<=ballSize/2){
    xSpeed*=-1;
    int ballSize=100;
pushMatrix();
translate(30, 20); 
fill(random(255), random(255), random(255));
    ellipse(height/2, width/2, ballSize*2, ballSize*2);
popMatrix();
    
  }
  if(y>=400-ballSize/2 || y<=ballSize/2){
   ySpeed*=-1;
   int ballSize=100;
   pushMatrix();
translate(20, 30); 
   fill(random(255), random(255), random(255));
    ellipse(height/2, width/2, ballSize*2, ballSize*2);
 popMatrix();
  } 
  if(mousePressed== true){
     ballSize=90;
  }else{
    ballSize=20;
  }
  

 }
 
  



