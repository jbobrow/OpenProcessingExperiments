
int d=0;

void setup(){
  size(400,400);
  noStroke();
  smooth();
  d=20;
}

void draw(){
 background(50);
 
 if(keyPressed){
   d--;
 }else{
   d++; 
 }
 ellipse(width/2,height/2,d,d);
}

