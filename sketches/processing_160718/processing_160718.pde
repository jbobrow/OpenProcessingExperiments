
void setup(){
  size(600,400);
}
void draw(){
  background(255);
  stickfigure(mouseX, mouseY);
    frameRate(10);
}
void stickfigure(int x, int y){
  int z=100;
  float w=random(255);
  float h=random(255);
  float g=random(255);
  stroke(g,h,w);
  strokeWeight(5);
  fill(255);
  ellipse(x+150,y-130,300,40);
  ellipse(x,y-115, 30,30);
  line(x,y,x,y-100);
  line(x,y-80,x+40,y-100);
  line(x,y-80,x-40,y-100);
  line(x,y,x+40,y+30);
  line(x,y,x-40,y+30);
   textSize(16);
  fill(w,g,h);
  text("Yo Paul, www.seaperch.org", x+35,y-125); 
  
  //how can I have the frame rate for the color change be different than the rate for movement?
  
  // Cool rov competition - http://www.seaperch.org/index
  
  
}
  
  
