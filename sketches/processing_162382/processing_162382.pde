
float balleY=100;
float balleX=100;
int ecartY=8;
int ecartX=6;
 
void setup() {
 background(0);
 noStroke();
 size(400,400);
 smooth();
}
  
void draw() {
  float r=random(400);

  fill(0,10);
  rect(0, 0, 400, 400);

  if(mousePressed){ 
  fill(balleX,255,balleY);
  ellipse(balleX,balleY,100,100);
  }
  
  balleY=balleY+ecartY;
  balleX=balleX+ecartX;

  if((balleY>=350)||(balleY<=50)){
    fill(balleX,255,balleY);
    ellipse(balleX,balleY,r,r);
  }
  
  if((balleX>=350)||(balleX<=50)){
    fill(balleX,255,balleY);
    ellipse(balleX,balleY,r,r);
  }
  
  if((balleY>350)||(balleY<50)){
    ecartY=-ecartY;
  }
   
  if((balleX>350)||(balleX<50)){
    ecartX=-ecartX;
  
  }
}
