
void setup(){
  size(550,600);
}
void draw(){
  strokeWeight(10);
  background (255);
  int x=0;
  while(x<height){
  line(0,x,150,x);
  x=x+20;
  }
  strokeWeight(1);
  fill(0);
 //rect(150,0,15,600);
 x=10;
  while(x<height){
    strokeWeight(4);
    line(165,x,315,x);
    x=x+20;
  }
  strokeWeight(1);
//rect(315,0,15,600);
  x=0;
  while(x<height){
    strokeWeight(8);
    line(330,x,600,x);
    x=x+20;
    
  }
  x=0;
  while(x<width){
    strokeWeight(1);
    line(x,0,x,600);
    x=x+3;
  }
 int y = 10;
 x=0;
 while(x<600){
 strokeWeight(5);
 line(150,x,163,y);
 x=x+20;
 y=y+20;
 }
  y=10;
 x=0;
 while(x<600){
 line(330,x,317,y); 
 x=x+20;
 y=y+20;
 }
}


