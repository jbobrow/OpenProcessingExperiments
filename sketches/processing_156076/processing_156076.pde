
PImage greencar;
PImage redcar;
PImage twister;


float tintR;
float tintG;
float tintB;

float angle;
float jitter;
float x, y;
float dim = 50.0;

 





void setup() {
  size(600,600);
  background(255);
  
  greencar = loadImage("greencar.jpg");
  redcar = loadImage("redcar.jpg");
  twister = loadImage ("twister.png");
  
 
  
}

void draw()  {
  
  tintR = map(mouseX, 0, width, 0, 255);
  tintG = map(mouseY, 0, height, 0, 255);
  tintB = map(frameCount, 0, 0, 0, 255);
   
   
   
  float random1 = (random(-30, 30));
   
  float random2 = (random(200));
   
  int intRandom1 = int(random1);
  int intRandom2 = int(random2);

tint(tintR,tintG,tintB);
  
  imageMode(CENTER);
   
  float freq = map(frameCount, 0, 10000, 0.001, 0.1 );
  float scale = map(sin(frameCount * freq), -1, 1, 200, 300);
   
   
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(-frameCount * 0.5));
  image(twister, 0, 0, scale, scale);
  fill(255);
  text("BOOM!!!!", 0,0);

  
 
   
  pushMatrix();
  translate(width/2, height/5 - frameCount/ 10); 
  rotate(radians(-frameCount * 0.9));
  image(greencar,0,0,80,80);

   
  popMatrix();
  popMatrix();
  
 


  // angle
  if (second() % 2 == 0) {  
   jitter = random(-0.5, 0.1);
  }
  angle = angle + jitter;
  float c = cos(angle);
  translate(width/2, height/2);
  rotate(c);
  



  //
  x = x + 0.8;

  if (x > width + dim) {
    x = -dim;
  } 

  translate(x, height/4-dim/4);
  fill(255);
  image(redcar,-dim/2, -dim/2, dim, dim);

  //
  y = y + 0.4;

  if (y > width + dim) {
    y = -dim;
  } 

  
}




