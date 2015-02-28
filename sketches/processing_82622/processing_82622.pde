

PVector elpsPlace, cl, dElpsPlace, dCl;
int maxShift = 50;

void setup() {
  size(500, 500);
  elpsPlace = new PVector(width/2, height/2);
  dElpsPlace = new PVector(0, 0);
  cl = new PVector(150, 150, 150);
  dCl = new PVector(0, 0, 0);
  smooth();
  rectMode(CENTER);
  background(0);
}


void draw() {
  noStroke();

  for (int li=0; li<50; li++) { //this speeds up drawing - 50 shapes per one draw()
    dElpsPlace.x=random(2*maxShift)-maxShift;
    dElpsPlace.y=random(2*maxShift)-maxShift;

    elpsPlace.add(dElpsPlace);
    elpsPlace.x = elpsPlace.x>0? elpsPlace.x : width-1;
    elpsPlace.y = elpsPlace.y>0? elpsPlace.y : height-1;
    elpsPlace.x%=width;
    elpsPlace.y%=height;


    dCl.x=random(20)-10;
    dCl.y=random(20)-10;
    dCl.z=random(20)-10;

    cl.add(dCl);
    cl.x = cl.x>0? cl.x : 255;
    cl.y = cl.y>0? cl.y : 255;
    cl.z = cl.z>0? cl.z : 255;
    cl.x%=255;
    cl.y%=255;
    cl.z%=255;

    fill(cl.x, cl.y, cl.z, 20);

    rect(elpsPlace.x, elpsPlace.y, 50, 50);
  }
}


