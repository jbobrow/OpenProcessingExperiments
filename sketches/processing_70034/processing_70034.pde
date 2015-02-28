
class light{

  color c;
  float xPos;
  float yPos;
  float ySpeed;
  float acc;
  
  light(float tempYSpeed){
  
  c=color(209,67,15);
  xPos=random(0,width);
  yPos=height/2;
  ySpeed=2;
  acc=random(0.05,0.3);
  
  }
  
  void display(color tempColor){
  noStroke();
  fill(tempColor);
  smooth();
  triangle(xPos,yPos,20,20,0,0);
  fill(255);
  triangle(xPos,yPos,10,10,0,0);
  triangle(xPos,yPos,30,30,0,0);

}

void move(){
  ySpeed += acc;
  yPos+=ySpeed;
  
  if((yPos >= height)||(yPos==0)){
    ySpeed *=-1;
  }

}


}

