
 int xpos = 0;
  int ypos = 0;

void setup()

{
  size(400, 400);
  background(255);
    frameRate(10);
}
  void draw(){
for (int j=0; j<400; j = j+10) {
    ypos = j;
for (int i=0; i<400; i= i+50) {
  xpos = i;

  strokeWeight(2);
  stroke(0,0,0);
  fill(random(255),random(155),random(255), 85);
  rect(xpos,ypos,50,50);
  
    fill(random(155),random(155),random(255), 65);
  rect(xpos,ypos,20,20);
  
  fill(255,255,255,50);
  rect(xpos,ypos,10,10);
  

}
}
}
                
                
