
void setup () {
  size(450,400);
  background(234,173,234);
  
}
  void draw(){

  fill(255,0,0);
  noStroke();
  ellipse(180,90,150,150);
  ellipse(290,90,150,150);
  triangle( 240, 350, 362, 115, 115, 130);
  
  fill(0,0,0);
  text("I LOVE YOU", 200,100);
  
  if(mousePressed)
  ellipse(mouseX,mouseY, 25,25);
  if(mousePressed);
  fill(255,255,255);
  ellipse(mouseX, mouseY,5,5);
  }
