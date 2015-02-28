
void setup() {
  background(0);
  size(250,250);
  smooth();
}

void draw() {
  for(
int x=20; x<250; x+=30)
      for(
int y=20; y<250; y+=30)
    {
      float rad = dist (width/2,height/2,mouseX,mouseY);
      float r = dist (0,height,mouseX,mouseY);
      float g = dist (width,height,mouseX,mouseY);
      float b = dist (0,0,mouseX,mouseY);
      fill(r,g,b,10);
      strokeWeight(0.5);
      ellipse(x,y,rad,rad);    
      if (mousePressed) {
        stroke(255);
      }  
      else if (!mousePressed) {
        stroke(0);
      }
    }
}


