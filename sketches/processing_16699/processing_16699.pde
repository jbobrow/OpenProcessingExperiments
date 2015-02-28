
/*
 especially made for Cedric Nganso Njomou
 
 sometimes, it just need to let the people be happy by themselves
 
 derivated from my MaySmile sketch,
 http://www.openprocessing.org/visuals/?visualID=4701
 itself built onto Michael Winkler's Smiley
 http://www.openprocessing.org/visuals/?visualID=4700
 */
int numX = 3;
int numY = 3;
int oldXY;
int move = 30;
MichaelWS[] mws;
color BG = color(random(200,255),random(200,255),random(200,255));

void setup() {
  frameRate(20);
  size(768, 768);//size(256*numX, 256*numY);
  mws = new MichaelWS[numX*numY];
  for (int i = 0; i < numX; i++) {
    for (int j = 0; j < numY; j++) {
      mws[i+j*numX]= new MichaelWS(i,j);
    }
  }
}

void draw() {
  background(BG);
  for (int i = 0; i < numX*numY; i++) {
    mws[i].drawit();
  }
  if (mouseX+mouseY == oldXY) {
    move = max(0,move-1);
    if (move == 0) {
      noCursor();
    }
  } 
  else {
    move = 30;
    cursor();
  }
  oldXY = mouseX+mouseY;
}

class MichaelWS {
  int ofset;
  int ofsetY;
  float anim = 100;
  int maxSmile = int(random(90,120));
  int minSmile = int(random(0,30));
  MichaelWS(int temp_i,int temp_j) {
    ofset = temp_i*256;
    ofsetY = temp_j*256;
  }
  void drawit() {

    if (abs(ofset-mouseX+128)<128 && abs(ofsetY-mouseY+128)<128 && move != 0) {
      anim = (maxSmile+anim*5)/6;//(100+anim*100)/101;
    } 
    else {
      anim = (minSmile+anim*20)/21;//anim*0.997;
    }

    pushMatrix();
    translate(0, ofsetY);

    fill(255, 255-anim*2.55, 0); 
    smooth(); 
    strokeWeight(4); 
    ellipse(256*0.5+ofset, 256*0.5, 256*0.7, 256*0.7); 
    noFill(); 
    bezier(
    64+ofset,
    134+anim/3,
    64+ofset,
    212-anim,
    192+ofset,
    212-anim,
    192+ofset,
    134+anim/3);
    fill(0);
    if (random(1)< anim*.001) {
      line(88+ofset, 96, 100+ofset, 96);
      line(256-88+ofset, 96, 256-100+ofset, 96);
    } 
    else {
      ellipse(94+ofset,96,9,18); 
      ellipse(256-94+ofset,96,9,18);
    }
    popMatrix();
  }
}


