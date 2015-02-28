
boolean mouseIsDown = false;
String done = "DONE! CLICK TO RESET";

void setup()
{
  size(300, 300);
  background(0);
  smooth();
}

int nums = millis();
void draw()
{
  textAlign(CENTER);
  text(done, 150, 150);
  
  for (int i = 0; i < 200; i++)
  {
    
  
  if(mouseIsDown == true)
  {
    noStroke();
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    float val = 100;
    float m = map(val, 0, 100, 0, 100);
    text("LOADING" + frameCount +"%", 100, 100);
    stroke(255);
    strokeWeight(1);
    noFill();
    rect(50, 120, 200, 20);
    fill(255);
    rect(50, 120, frameCount, 20);
  }
  
//  if (frameCount > 100)
 // {
    
  }
  
//  
//  if(frameCount % 300 == 0)
//  {
//    fill(255);
//    rect(50, 120, 200, 20);
//  }
}


void mousePressed() {
  mouseIsDown = true;
}
 
void mouseReleased() {
  mouseIsDown = false;
}

