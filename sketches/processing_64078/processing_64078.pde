
PImage logo;
 
void setup() {
   
  size(300,200);
  smooth();
  background(250);
   
  logo = loadImage("logo.jpg");
}
 
void draw() {
   
  float xpos =  random( width);
  float ypos = random( height);
   
  color temp = logo.get(int(xpos), int(ypos));
if(blue(temp) <250)
  {
    float s = random(2,15);
    noStroke();
    fill(temp,150);
    ellipse(xpos, ypos, s, s);
   
  }
   
}


