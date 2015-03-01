
void setup(){
  size(400,800);
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
      fill(255,x,0,15);ellipse(y,x,a,a);
    }
      
      //background(255);
      fill(0);rect(300,b,50,100);
      if(b>800){
        b=0;
      }
    }
 }


 

