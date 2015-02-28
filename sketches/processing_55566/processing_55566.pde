
int x= 1;
int y= 200;


void setup(){
  size(460, 200);
  background(50);
  noFill();
  ellipseMode(CENTER);
  smooth();
  stroke(255);
  frameRate(9);
}


void draw(){
 fill(50, 50);
 rect(-50,-50,590,590);
 strokeWeight(x/30);
 stroke(x+20, x-30, x+30);
 ellipse (225, 100, x, 150);
 //ellipse (125, 125, 150, x);
 if(x>0){
   x+=20; 
  }
  if (430<x){
    for(int y=200;y>0;y-=20){
      x=y;
    }
 }
 
 
} 
 

