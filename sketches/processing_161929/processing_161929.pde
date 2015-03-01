
float angle = 0.0;
float offset = 250;
float scalar = 2;
float speed = 0.02;


float Noiseeee = 0.0;

void setup() {
  size(500, 500);
  smooth();
    background(255);
    noStroke();
    frameRate(60);
}

void draw() {
  
  //speed process by delete slash slash
  for (int i=0;  i<1000; i++)
   {
 
    Noiseeee = Noiseeee + .01;
    float n = noise(Noiseeee) * 255;
  
    fill(n);
    float x = offset +cos(angle) * scalar;
    float y = offset + sin(angle) * scalar;
    ellipse(x, y, 60, 60);
    angle += speed;
    scalar += speed; //scale the movement diameter
 
  }
 
 
 
//    saveFrame("output/frames#################.tif");
}
