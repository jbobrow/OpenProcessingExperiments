
void setup() {
  size(650, 650);
  background(5);
  smooth();
}

void draw(){
  fill(125,30);
  noStroke();
  rect(0,0,width,height);
  
  for (int x=0; x<=width; x+=65) {
    for (int y=0; y<=height; y+=65) {
      
   if ((x % 10) == 0 &&(y % 10) == 0) {
     line(x,y,mouseX,mouseY);
      stroke(255,80);
      fill(mouseX,mouseY,random(1,225),30);
      ellipse(x,y,55,random(20,60));
   }
      else{
      stroke(255,80);
      fill(mouseX,mouseY,random(1,225),30);
      ellipse(x,y,75,75);
   }
  }
 }
}
