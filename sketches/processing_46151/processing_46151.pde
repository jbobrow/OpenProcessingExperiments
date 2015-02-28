

PImage herp;
PImage derp;

void setup(){
  size (1000,1000);
  herp = loadImage ("x.jpg");
  derp = loadImage ("y.jpg");
}

void draw(){
  tint (255,0,0,150);
  image(herp,random (0-1000),random (0-1000),500,500);
  tint (0,100,100,100);
  image(derp,250,0,500,1000);

}

