
float R = 20;
float G = 245;
float B = 89;
float Rb = 219;
float Gb = 240;
float Bb = 70;
float Rc = 219;
float Gc = 240;
float Bc = 70;
boolean Tick = false;

void setup() {
  size(500,500); // canvas size
  
} 
void draw() { 
  background(Rc,Gc,Bc); // light blue background
  fill(R,G,B); // color green ( rectangle )
  rectMode(CORNER); // rectangle in the corner
  rect(0,375,600,600); // the size of the green rectangle (green) 
  
  fill(Rb,Gb,Bb); // color yellow ( circle )
  ellipseMode(CORNER); // sun in the corner
  ellipse(-25,-25,150,150); // this moves the sun into the corner. 
  
  line(150,150,104,104); // one of the lines on the sun 
  line(100,10,200,100); // one of the lines on the sun 
  
  if (Tick = true) {
    R = random (0,255);
    G = random (0,255);
    B = random (0,255);
    Rb = random (0,255);
    Gb = random (0,255);
    Bb = random (0,255);  
    Rc = random (0,255);
    Gc = random (0,255);
    Bc = random (0,255); 
    
}
}
  // have to used mouse pressed to make it flash back and forth
  void mousePressed () {
    if (Tick = false) {
    Tick = true;
    } else {
      Tick = false;
    }
  }
    
