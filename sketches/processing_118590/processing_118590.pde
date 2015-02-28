
/* @pjs font="Archer-Semibold-Pro.otf"; */

PImage clouds;
PImage mountians;
PImage flag;
PImage man;

PFont f;

int x = 5;
int x1 = 0;

void setup() {
  size(1400, 600);
  background(121,183,248);
  clouds = loadImage("Clouds.png");
  mountians = loadImage("Mountians.png");
  flag = loadImage("Flag.png");
  man = loadImage("Man.png");
  f = createFont("Archer-Semibold-Pro.otf",136,true);
}

void draw() {
  background(121,183,248);
  image(clouds,x,20);{
    x = x - 1;
  }
  image(mountians,0,206);
  image(flag,1265,208);
  textFont(f,136);
  fill(70,0,0);
  text("MOUNTAIN MAN JOE",9,585);
  image(man,x1+30,530);{
    x1 = x1 + 1;
  }
}



