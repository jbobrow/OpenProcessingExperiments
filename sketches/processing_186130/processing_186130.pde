
int moveX=0;
int moveY=0;
  
void setup(){
  size(400,400);
  noStroke();
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
  rotate(radians(millis()/3));
  noStroke();
 fill(10,105,148,250);
 ellipse(moveX+50,moveY+50,25,25);
popMatrix();
 
}
    void mousePressed(){ moveX+=10;moveY+=10; }
  
    
