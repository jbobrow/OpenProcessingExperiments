
import processing.opengl.*;

int mode=1;
void setup(){
  size(600,600);
  
}
void draw(){

  for( int lop=0; lop<300; lop++){
    stroke(random(0,255),random(0,255),random(0,255),50);
    line(random(height),random(width),random(height),random(width));
    
  }
  
  if(mousePressed==true){
    background(255);
    mode=1;
  }
  if(mode==1){
    textSize(350);
    fill(0,90);
    text("HI",mouseX,mouseY);
  mode=2;
  }
}
                
