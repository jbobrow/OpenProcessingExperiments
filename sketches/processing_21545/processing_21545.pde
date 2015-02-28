
float gy;
float gy1;
PImage l;
PImage r;
PImage n;
PImage g;


void setup () {
  size (640, 480);
  
}

void draw () {
  background (0);
  smooth();



  //logo

    n=loadImage ("newyen.PNG");
    gy1=map(mouseY, 240,480,255,50);
    tint(255,gy1);
    image (n,0,0,640,480);
    tint(255,255);
    g=loadImage("nglow.png");
    gy = map (mouseY,240,0,0,255);
    tint (255,gy);
    image (g,0,0,640,480);
    tint(255,255);
    
 
  //leftbrack  
  float lx = map (mouseX, 0,320, 0, -132);
  float lx1 = constrain (lx,-132,50);
  l = loadImage ("leftbracket.PNG");
  image (l, lx1,0,640,480);

  //rightbrack
  float rx = map (mouseX, 0,320, 0, 132);
  float rx1 =constrain (rx,-50,132);
  r = loadImage ("rightbracket.PNG");
  image (r, rx1,0,640,480);


}


