
/* @pjs preload="starchild.png"; font="starchild.png"; */
// Stars parameters
int           depth = 8;
int           nbStarsMax = 10000;
Stars[]       tabStars = new Stars[nbStarsMax];
int           maxStarsSpeed = 5;

// Drawing parameters
int           sizeX = 640;
int           sizeY = 480;
boolean       clearScreen = true;
int           taille = 1;
int           transparency = 255;

// Rotation variable
int           rotationMode = 3;
float         angle = 0;
float         delta = radians(0.25);

PImage online;
/*
-----------------------------------------------------------------
  INITIALISATION
-----------------------------------------------------------------
*/
void setup() {
  
  String strX, strY;
  size(sizeX,sizeY,P3D);
  colorMode(RGB,255);
  loop();
  strokeWeight(taille);
  //----------------------------------------------
  // Stars initialisation
  // -----------------------
  for(int nb=0; nb<nbStarsMax; nb++) {
    tabStars[nb] = new Stars(random(-2*width,2*width),random(-2*height,2*height),
                               -random(depth*255),random(1,maxStarsSpeed));
  }  
  String url = "http://i839.photobucket.com/albums/zz313/casscadence/My%20Album/Tumblin/star_children_zps512cd82c.png";
  online = loadImage(url, "png");
}

/*
-----------------------------------------------------------------
  DRAWING
-----------------------------------------------------------------
*/
void draw() {
  // Clear screen
  if(clearScreen == true) {
    background(0);
  }
  translate(width/2+((mouseX-(width/2))*10)/(width/2),
            height/2+((mouseY-(height/2))*10)/(height/2),
            0);
  rotateY(-((mouseX-(width/2))*radians(30))/(width/2));
  rotateX(((mouseY-(height/2))*radians(30))/(width/2));
  if(rotationMode==1) {
    angle += delta;
  }
  if(rotationMode==2) {
    angle -= delta;
  }
  rotateZ(angle);
  for(int nb=0; nb<nbStarsMax; nb++) {
    tabStars[nb].aff();
    tabStars[nb].anim();
  }  


    

    image(online, -285, -340);
}

/*
-----------------------------------------------------------------
  KEY Gesture
-----------------------------------------------------------------
*/
void keyPressed() {
  if (key == 'x') {
    clearScreen = !clearScreen;
  }

  if(key=='/') {
    if(transparency<255)
      transparency += 1;
  }
  if(key=='*') {
    if(transparency>2)
      transparency -= 1;
  }
  if(key==' ') {
    background(0);
  }
}

/*
-----------------------------------------------------------------
  MOUSE Gesture
-----------------------------------------------------------------
*/
void mousePressed() {
  if(mouseButton==LEFT)
    rotationMode = 1;
  if(mouseButton==RIGHT)
    rotationMode = 2;
  if(mouseButton==CENTER)
    rotationMode = 3;
}


/*
-----------------------------------------------------------------
 Stars class
-----------------------------------------------------------------
*/
class Stars {
  float x, y, z;
  float dZ;
  
  Stars(float coordX, float coordY, float coordZ, float speedZ) {
    x  = coordX;  
    y  = coordY;  
    z  = coordZ;  
    dZ = speedZ;
  }
  
  void aff() {
    stroke(250+z/depth,transparency);
    point(x,y,z);
  }
  
  void anim() {
    z = z + dZ;
    if(z>=0)
      z = -1023.0;
  }
}
