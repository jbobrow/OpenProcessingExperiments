
//bee keeper

void setup(){
  size(400,400);
  smooth();
  noStroke();

}
 int b=0;int speed=4;
void draw(){
  frameRate(10);
    for(int x=0;x<810;x=x+20){
    for(int y=0;y<600;y=y+20){
      float a=random(400);
      ;b=b+speed;
      fill(255,x,0,20);ellipse(b,a,20,20);
    }
      if(b>800){
        b=0;
      }
    }
 }


 

