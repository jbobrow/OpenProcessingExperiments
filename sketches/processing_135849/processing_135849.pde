
void setup(){ 
  size(400,400);
  background(0);
  stroke(125,130,10);
  strokeWeight(5);
  for (int i=100; i<10000; i=i+50){
    noFill();
    ellipse(400,0,i,i);
   }
   float r=random(255);
   float s=random(255);
   float t=random(255);
   for (int i=100; i<1000; i=i+50){
     stroke(r,s,t);
     ellipse(200,200,i,i);
   }
 }
 
void draw(){
if (mousePressed==true){ 
   float u=random(255);
   float v=random(255);
   float w=random(255);
   float x=random(400);
   float y=random(400);
   noStroke();
   fill(u,v,w,50);
   triangle(mouseX,mouseY,0,0,x,y);
   triangle(mouseX,mouseY,400,400,y,x);
  } 
  else {
  noStroke();
  }
}
