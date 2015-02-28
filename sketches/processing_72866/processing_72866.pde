
int x;
int dir;

void setup(){
 size(400,500);
 dir=4;
 background(240,245,116);
strokeWeight(3);
}
 void draw(){
  x+=dir;
  
     if (mousePressed){
fill(random(255),random(255),random(255));
     }
 ellipse(x,x,70,100);
  if(x>=width){
    dir=-6;
  }else if(x<=0)
  dir=4;

stroke(random(255),random(255),random(255));
strokeWeight(random(25));
if(mousePressed){
  
  line(mouseX,mouseY,pmouseX,pmouseY);
  }
 
 
 }
