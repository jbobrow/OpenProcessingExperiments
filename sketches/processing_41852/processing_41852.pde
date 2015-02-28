
PImage body;
PImage eye;
PImage larm;
PImage rarm;


void setup () {
  size (800,800);
  frameRate (60);
  smooth();
  body = loadImage ("dalek.png");
  eye = loadImage ("eye.png");
  larm = loadImage ("left.png");
  rarm = loadImage ("right.png");
  
}

void draw (){
  
  background (000);
  int X = 300;
  int Y = 200;
  
  float eyeand =  0.3 * (cos(millis()/260.0) - 1);
  pushMatrix ();
  translate (X+190, Y+20);
  rotate (eyeand);
  pushMatrix ();
  scale (-1.0, 1.0);
  image (eye, 0, 0);
  popMatrix();
  popMatrix();
  
  pushMatrix ();
  translate (X, Y);
  image (body, 0, 0);
  popMatrix();
   
  float armang =  0.1 * (cos(millis()/-180.0) - 1);
  pushMatrix ();
  translate (X+140, Y+170);
  rotate (armang);
  pushMatrix ();
  scale (-1.0, 1.0);
  image (larm, 0, 0);
  popMatrix();
  popMatrix();

  
  float armang2 =  0.1 * (sin(millis()/-180.0) + 1);
  pushMatrix ();
  translate (X+230, Y+230);
  rotate (armang2);
  pushMatrix ();
  scale (-1.0, 1.0);
  image (rarm, 0, 0);
  popMatrix();
  popMatrix();
  
  fill (255,0,0);
  String ext = "EXTERMINATE!";
  
  textAlign(CENTER);
  textSize (72); 
  text (ext, width/2,100);
 
}

