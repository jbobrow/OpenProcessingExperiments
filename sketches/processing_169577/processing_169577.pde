
void setup(){
  size(700,700);
  background(255,255,255);
  
}
int r=0;
int sq=0;
int sq2=100;
int r2=0;
int h=0;

void draw(){
  pushMatrix();
  translate(width/2, height/2);
  rotate(r);
  noFill();
  rect(sq,100, 50,50);
  r=(r+1);
  sq=(sq+180)%200;
  popMatrix();
 
  
  if(mousePressed) { 
      if (mouseButton==CENTER) {
         save("myoutput#.jpg");
      }
  }  
}


