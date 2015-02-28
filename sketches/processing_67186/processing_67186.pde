
//by cubes i mean rain

int numcubes = 150;
float[] cubeX = new float [numcubes];
float [] cubeY = new float [numcubes];
float cubeXvel;
float cubeYvel;

float gravity;


// circle
float xpos;
float xvelocity;
float ypos;
float yvelocity;

PImage b;






void setup() {
  size(400, 400);
  smooth();
  imageMode(CENTER);
  b = loadImage("iceback.jpeg");
  image(b, 200, 200);
  //background (255, 255, 255);

  for (int i = 0; i < numcubes; i++) {
    cubeX[i] = random(200, 380);
    cubeY[i] = random(10, 40);
    cubeXvel= 0;
    cubeYvel = 1;
  }

  xpos=200;
  xvelocity=5;
  ypos=200;
  yvelocity=2;
}


void draw() {
  // background(255,255,255);
  gravity = .3;

  yvelocity = yvelocity+gravity;
  xpos=xpos+xvelocity;
  ypos=ypos+yvelocity;

  cubeYvel = cubeYvel+gravity;
  //cubeY = cubeY+cubeYvel;

  fill(random(50), random(50), 240);
  for (int i = 0; i < numcubes; i++) {
    cubeY[i] = cubeY[i]+cubeYvel;
    rect(cubeX[i], cubeY[i], 5, 5);
  }


  fill(100, random(100), random(120, 150));
  //ellipse(xpos, ypos, 40, 40);
  ellipse(xpos/2, ypos/2, 20, 20);
  //ellipse(xpos/4, ypos/4, 10, 10);

  if (xpos<20==true||xpos>380==true) {
    xvelocity=xvelocity*(-1);
  }
  if (ypos<20==true||ypos>380==true) {
    yvelocity=yvelocity*(-1);
  }
  //changing the background when it reaches X border
  //if (xpos<20==true||xpos>380==true) {
  //background (random(255));
  // }
}


