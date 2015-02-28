
float posX=0;
  int posY=0;
  

void setup(){
  size(600,600);
  background(255);
}
void draw(){
  background(255);
  smooth();
  fill(255,0,0);
 ellipse(posX,posY,30,30);}
void keyPressed(){
  if (keyCode ==RIGHT){
    posX+=4;
  }
  else if (keyCode ==LEFT){
    posX-=4;
  }
  else if (keyCode ==UP){
    posY-=4;
    
  }
else if (keyCode ==DOWN){
    posY+=4;
  }
  

}



  

