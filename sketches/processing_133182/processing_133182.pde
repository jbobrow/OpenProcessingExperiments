
void setup(){
size (800,800);
background (#FF4B63);
frameRate(5);
stroke(#837A7B);}
void draw()
{
for (int x = 0; x<width; x=x+5) {

for (int y = 0; y<height; y=y+5) { 
    float myAngle = random(x,y);
    rotate(radians(myAngle));
    float ellipseSize = map (x, 0, 2, 2, 2);
    ellipse(x,y,5,5);
    }
  }
}











