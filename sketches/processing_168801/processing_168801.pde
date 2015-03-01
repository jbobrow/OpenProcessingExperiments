
// CyclingColors.pde
/** Press mouse button to change step size. */
float a,b, c=0.0333, d=0.051234;
void setup() 
{
 background(255);
 colorMode(HSB,100);
 size(600,600);
 smooth();
 strokeWeight(3);
}
void draw() 
{
  fill(0,0,100,4);
  if (frameCount % 64 == 0)
    rect(0,0,width,height);
  a+=c; b+=d;
  stroke(frameCount % 100, 180,80,20);
  line (map(sin(a),-1,1,20,width-20),
        map(cos(a), -1,1,20, height-20),
        map(sin(b),-1,1,20,width-20),
        map(cos(b), -1,1,20, height-20));
}
void mousePressed()
{
  c=map(mouseX,0,width,0,0.1);
  d=map(mouseY,0,height,0,0.1);
}



