
float x = 1;
float y = 20;

void setup(){
 size(250,250);
 background(#94DED8);
 smooth();
 fill(255,0);
 //background circle rings
 for(int y=10; y<600; y+=10){
 ellipse(55,55,y,y);
 fill(#94DED8,0);
 stroke(12,12,y,y);}}
 //increasing stroke value of the rings

void draw(){
 fill(255,0);
  stroke(x,12,32,x/13);
  strokeWeight(0.75);
  //circular rings emerging from the center of the smallest circle
  ellipse(55,55,x,x);
  x+=3;
  if (x>600){
    x=0;}
  }

