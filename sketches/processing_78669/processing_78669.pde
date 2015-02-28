
float a=0.0;
float b=4;
float c=.1;
float ax;
float bx= 4;
float az=0;
float bz=3;
float ac=0;
float bc=4;
PImage a1;
PImage a2;

boolean create=true;



void setup() {
  size(600, 600);

  a1=loadImage("snowflake-icon.png");
  a2=loadImage("snowflake-icon.png");


  //noCursor();
}

void draw() {
  background(55);



  image (a1, mouseX-50, mouseY-50, 100, 100);

  if (mouseButton==LEFT)
  {
    if (create) {
      create=!create;
    }
    else {

      image (a2, 260, ax, 100, 100);
      image (a2, 120, ax, 100, 100);
      image (a2, 330, ax, 100, 100);
      image (a2, 210, ax, 100, 100);
      image (a2, 180, ax, 100, 100);
      ax+=bx;
    }
  }
  if (ax>=500)
  {
    ax=500;
    image (a2, 10, az, 100, 100);
    image (a2, 550, az, 100, 100);
    image (a2, 130, az, 100, 100);
    image (a2, 240, az, 100, 100);
    az+=bz;
  }

  if (az>=500)
  {
    az=500;
    image (a2, 600, ac, 100, 100);
    image (a2, 400, ac, 100, 100);
    image (a2, 60, ac, 100, 100);
    image (a2, 500, ac, 100, 100);
    ac+=bc;
  }
  if (ac>=500)
  {
    ac=500;
  }

 
}

