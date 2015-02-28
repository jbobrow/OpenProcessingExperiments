
/*
 *  Untitled, Hommage to Zdeňek Sýkora (1920 - 2011)
 *  
 *  Kof / Kryštof Pešek 2012
 *
 */

float theta[];
PImage prazdny,plny;
int [] moznosti = {0,90,180,270};
float [] rot = {1,2,4};
float  r;

void setup(){
  size(576,704,P2D);
  imageMode(CENTER);

  plny = loadImage("plny.png");

  theta = new float[3000];
  for (int i = 0 ; i < theta.length ; i ++){
    theta[i] = moznosti[(int)random(4)];
  }
}

void draw(){
  background(0);

  r = plny.width;

  int idx = 0;
  for(int y = 0;y <= height/plny.height;y++){
    for(int x = 0;x <= width/plny.width;x++){
      pushMatrix();
      translate(x*r+plny.width/2,y*r+plny.height/2);
      rotate(radians(theta[idx]));
      theta[idx] += 0.004*degrees(frameCount/200.0*atan2(mouseY-y*r,mouseX-x*r));
      image (plny,0,0);
      popMatrix();

      idx += 1;
    }
  }
}

