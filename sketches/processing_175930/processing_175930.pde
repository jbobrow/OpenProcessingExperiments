
float R = 20; // variable
float G = 245; // variable
float B = 89; // variable
float Rb = 219; // variable
float Gb = 240; // variable 
float Bb = 70; // variable
float Rc = 219; // variable
float Gc = 240; // variable
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
  
  line(20,0,20,150); // one of the lines on the sun 
  line(30,0,60,145); // another sun line
  line(40,0,100,140); // another sun line
  line(0,0,140,105); // another sun line
  line(0,0,160,60); // last sun line
  
  fill(Rb,Gb,Bb); // color yellow ( circle )
  ellipseMode(CORNER); // sun in the corner
  ellipse(-25,-25,150,150); // this moves the sun into the corner. 
  

  
  if (Tick = true) { // conditional ( if Tick = true then the color will be random )
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
