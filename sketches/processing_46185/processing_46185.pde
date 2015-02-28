

PImage herp;
PImage derp;

void setup(){
  size (1000,1000);
  herp = loadImage ("x.jpg");
  derp = loadImage ("y.jpg");
}

void draw(){
  tint (255,0,0,mouseY);
  image(herp,350,mouseX,300,300);
  tint (0,100,100,100);
  image(derp,50,0,150,1000);
  image(derp,800,0,150,1000); 
  tint (0,75,100,100);
  image(derp,0,0,50,1000);
  image(derp,950,0,50,1000);
  tint (100,0,0,mouseX);
  image(herp,200,mouseY,150,1000);
  image(herp,650,mouseY,150,1000);

}

