
int x=10;
int c=50;
int v= 200;
void setup(){
   background(0);
  size(300,300);
}
   
  void draw(){
    if   (mousePressed) {
      float x= mouseY;
    float y= mouseX;
     
     fill(x,0-c,255-v,70);
     ellipse(mouseX,mouseY,30,30); 
 
}


else {
     
   
    float x= mouseY;
    float y= mouseX;
    smooth();
  background(0); 
     
    noStroke();
    fill(255,0,0,100);
    ellipse(mouseX,mouseY,30,30);}


  }             
