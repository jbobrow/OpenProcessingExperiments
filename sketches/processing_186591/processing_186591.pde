
int moveX=1;
int moveY=1;
  
void setup(){
  size(400,400);
  noStroke();
  noCursor();
  }
  
  
void draw(){

  sun();
earth();
}
  
  void sun(){
   background(0);
  fill(255,240,0,230);
    ellipse(mouseX,mouseY, 100,100);
  
  }
  
 
  void earth(){
     pushMatrix();
  translate(mouseX,mouseY);
  rotate(moveX*radians(millis()/3));
  noStroke();
 fill(20,105,159,255);
 ellipse(moveX+50,moveY+50,25,25);
popMatrix();
 
}
    void mousePressed(){ moveX+=5;moveY+=5; }
  
    
