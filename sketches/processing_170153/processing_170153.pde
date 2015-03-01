
PImage pt;

void setup () {
  size (300,300);
  pt = loadImage ("PT.png");
  pt. loadPixels ();
}
void draw() {
  background (204);
  int md= constrain (mouseX, 0, 299);
  for (int i=0;  i< 300; i++) {
    color p= pt.pixels [md*width/100+i];
    float b= blue (p);
    float r= red (p);
    float g= green (p);
    stroke (r, g, b);
    line (i* random (.5, 3), random(0, 300*frameCount*.001), i*random (0.5, 3), noise(0,pt. height/9+b*frameCount*.0002));
    }
}
    
  
  


