
PImage earth, mars, bkg, mercury, venus, jupiter, saturn, uranus, neptune;

int mode = 0;

float anglee = 0;
float anglem = 0;
float anglemer = 0;
float anglev = 0;
float anglej = 0;
float angles = 0;
float angleu = 0;
float anglen = 0;

float xearth = 380;
float yearth = 380;
float xmars = 440;
float ymars = 440;
float xmercury = 250;
float ymercury = 250;
float xvenus = 300;
float yvenus = 300;
float xjupiter = 570;
float yjupiter = 570;
float xsaturn = 800;
float ysaturn = 800;
float xuranus = 930;
float yuranus = 930;
float xneptune = 1030;
float yneptune = 1030;

void setup() {
  size(1000, 1000);

  bkg = loadImage("background.jpg");
  earth = loadImage("earth.jpg");
  mars = loadImage("mars.jpg");
  mercury = loadImage("mercury.png");
  venus = loadImage("venus.png");  
  jupiter = loadImage("jupiter.jpg");
  saturn = loadImage("saturn.jpg");
  uranus = loadImage("uranus.jpg");
  neptune = loadImage("neptune.jpg");

  noStroke();
}

void draw() {

  if (mode == 0) {
    myModeZero(); //function
  } 
  else {
    myModeOne();
  }
}

void myModeZero() {
  background(0); 

  textSize(32);
  text("Click and observe the Solar System", 250, 400);
}

void myModeOne() {

  image(bkg, 0, 0);


  float xpose = xearth * cos(radians(anglee))+500;
  float ypose = yearth * sin(radians(anglee));

  float xposm = xmars * cos(radians(anglem))+500;
  float yposm = ymars * sin(radians(anglem));

  float xposmer = xmercury * cos(radians(anglemer))+500;
  float yposmer = ymercury * sin(radians(anglemer));

  float xposv = xvenus * cos(radians(anglev))+500;
  float yposv = yvenus * sin(radians(anglev));

  float xposj = xjupiter * cos(radians(anglej))+500;
  float yposj = yjupiter * sin(radians(anglej));

  float xposs = xsaturn * cos(radians(angles))+500;
  float yposs = ysaturn * sin(radians(angles));

  float xposu = xuranus * cos(radians(angleu))+500;
  float yposu = yuranus * sin(radians(angleu));

  float xposn = xneptune * cos(radians(anglen))+500;
  float yposn = yneptune * sin(radians(anglen));


  image(earth, xpose, ypose);
  image(mars, xposm, yposm);
  image(mercury, xposmer, yposmer);
  image(venus, xposv, yposv);
  image(jupiter, xposj, yposj);
  image(saturn, xposs, yposs);
  image(uranus, xposu, yposu);
  image(neptune, xposn, yposn);

  fill(255);
  textSize(12);
  text("days elapsed: " + anglee, 10, 20);
  
  

  anglee+=.5;    
  anglem+=.25;
  anglemer+=2.5;    
  anglev+=0.83;
  anglej+=.04;    
  angles+=.01;
  angleu+=.005;    
  anglen+=.003;
}

void mouseReleased() {
  mode++;
}



