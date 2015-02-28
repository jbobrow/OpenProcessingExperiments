
boolean whiteBGColour;
float r;
float g;
float b;
int angle = 0;
void setup(){
size(500,500);
background(255);
smooth();
}
 
void draw () {
  angle += 5;
    float val = cos(radians(angle)) * 12.0;
    for (int a = 0; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
   }
   stroke(random(0,255),random(0,255),random(0,255));
  strokeWeight(abs(mouseX-pmouseX));
    fill(255);
    ellipse(mouseX, mouseY, 2, 2);
}

 
void mousePressed()
{
r=random(255);
g=random(255);
b=random(255);
background(r,g,b);
}



