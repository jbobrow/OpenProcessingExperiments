
void setup(){
  size(400,400);
  background(255);
  stroke(0);
  fill(0);
  strokeWeight(2);
  smooth();
}
void draw(){
    background(100);
 for (float x=0; x<width; x=x+random(20,50)){
   stroke(random(75));
   strokeWeight(random(5));
   line(x,0,mouseX,mouseY);
   line(mouseX,mouseY,x,height);
  for (float y=0; y<height; y=y+random(20,50))  {
  line(0,y,mouseX,mouseY);
   line(mouseX,mouseY,width,y);
  
  }
}
}

