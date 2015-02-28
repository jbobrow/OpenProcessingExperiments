
/*
World's population growth by Lydier Han
 This code is composed by Lydier Han.
 Original code source from Pawel Tokarz, Ka Kit Cheong
 Interactive Design 3 
 Instructor - Modified by Michael Kontopoulos
 */

//map
PImage worldMap;

//particle1
int[] px=new int[100];  //declare arrays
int[] py= new int[100];

//particle 2
Particle[] particleArray = new Particle[1000];
//particle3
float posStep = 2.1;
int   nParticles = 10000;
Particle[] particles;

void setup() {
  size(1920, 1080);
  smooth();
  colorMode(HSB, 360, 100, 100);

  worldMap = loadImage(".png");

  //particle2
  particles = new Particle[nParticles];

  for (int i=0; i<nParticles; i++) {
    particles[i] = new Particle();
  }

  for (int n = 0; n < 1000; n ++) {
    particleArray[n] = new Particle ();
  }

  for (int l = 0; l<100; l++) { 
    px[l]=width/2;
    py[l]=height/2;
  }

  noCursor();
}

void draw() {
  image(worldMap, 0, 0, width, height);


  // line particle
  strokeWeight(2);
  for (int l = 0; l<100; l++) {
    stroke(0, 150, 175, 125); //red 
    int npx, npy;
    npx = px[l] + 2*int(random(-5, 5));  // next point
    npy = py[l] + 2*int(random(-5, 5)); 
    line(px[l], py[l], npx, npy);

    px[l]=npx;   
    py[l]=npy;
  }

  //foreground particle
  for (int n = 0; n < 1000; n++) {
    particleArray[n].particleMove();
    particleArray[n].particleDisplay();
  }

  //  background particle;
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  translate(width/2, height/2);

  for (int i=0; i<nParticles; i++) {
    particles[i].update();
    particles[i].show();
  }
}

void mousePressed() {
  redraw();
}

class Particle {
  PVector pos;
  float angle;
  float dRange;
  float dAngle;
  color c;
  //  PVector pos;
  int x;            
  int y;

  Particle() {
    pos = new PVector(0, 0);
    angle  = random(TWO_PI);
    dRange = 0.2;
    dAngle = 0;   
    //c = color(random(255),random(255),random(255));
  }

  void update() {
    float cor = dRange*atan(15*dAngle)/PI;
    float randNum = (random(2)-1)*dRange-cor;  //Random number from (-dRange, dRange)
    dAngle+=randNum;                       //We don't change the angle directly
    //but its differential - source of the smoothness!
    angle+=dAngle;                         //new angle is angle+dAngle
    pos.x+=posStep*cos(angle);            //just move on step
    pos.y+=posStep*sin(angle);
  }



  void particleDisplay() {   //particle2
    noStroke();
    fill(0, 150, 175, 125); //red 
    pushMatrix();
    translate(width/2, height/2);
    ellipse(x, y, 2, 2);
    popMatrix();
  }
  void particleMove() {      //function that moves particle objects
    int choice = int(random(4));

    if (choice == 0) {         //particle objects move according random number generated before
      x = x + 2;
    }
    else if (choice == 1) {
      x = x - 2;
    }
    else if (choice == 2) {
      y = y + 2;
    }
    else {
      y = y - 2;
    }
  }
  
//background particle
  void show() {
    //fill(c);//random color
    fill(0, 150, 175, 125); //red 
    noStroke();
    ellipse(pos.x, pos.y, 2, 2);
    
  }
}



