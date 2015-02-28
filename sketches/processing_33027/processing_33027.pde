
int vel = 1;
int letterY = 75;
int letterX = 0;
PImage sgrass;
PImage igrass;
PImage dgrass;
PImage egrass;
 
 
void setup(){
  size(700, 400);
  background(255);
  egrass = loadImage("egrass-lawn.jpg");
  dgrass = loadImage("dgrass-lawn.jpg");
  igrass = loadImage("igrass-lawn.jpg");
  sgrass = loadImage("sgrass-lawn.jpg");
 
 
 frameRate(50);
  }
  
  void draw(){
  background(255); 
   
  image(sgrass, letterX-600, letterY);
  letterX = letterX + vel;
   
  image(igrass, letterX-800, letterY);
  letterX = letterX + vel;
   
  image(dgrass, letterX-1000, letterY);
  letterX = letterX + vel;
   
  image(egrass, letterX-1200, letterY);
  letterX = letterX + vel;
}



