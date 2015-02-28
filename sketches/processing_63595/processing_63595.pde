
float rot=0;
float d;
int gap=10;
int boom;
int count=0;
int go=1;
int shpsz;
int prim;
int nabro=0;

void setup() {
  size(700, 500);
  smooth();
}

void fstlyr(float posx, float posy) {
  if (nabro == 0) {
    prim=gap+boom;
    shpsz=5;
  }
  ellipse(posx-prim, posy, shpsz, shpsz);
  ellipse(posx, posy-prim, shpsz, shpsz);
  ellipse(posx, posy+prim, shpsz, shpsz);
  ellipse(posx+prim, posy, shpsz, shpsz);
  if (nabro==0) {
    nabro=1;
  }
}
void scdlyr(float posx, float posy) {
  if (nabro == 1) {
    prim=prim+gap+boom;
    shpsz=shpsz+2;
  }
  fstlyr(posx, posy);
  rect(posx-prim, posy-prim, shpsz, shpsz);
  rect(posx+prim, posy-prim, shpsz, shpsz);
  rect(posx-prim, posy+prim, shpsz, shpsz);
  rect(posx+prim, posy+prim, shpsz, shpsz);
  if (nabro==1) {
    nabro=2;
  }
}
void thdlyr(float posx, float posy) {
  if (nabro==2) {
    prim=prim+gap+boom;
    shpsz=shpsz+2;
  }
  scdlyr(posx, posy);
  if (nabro==2) {
    nabro=3;
  }
}
void frhlyr(float posx, float posy) {
  if (nabro==3) {
    prim=prim+gap+boom;
    shpsz=shpsz+2;
  }
  thdlyr( posx, posy);
  if (nabro==3) {
    nabro=4;
  }
}
void fthlyr(float posx, float posy) {
  if (nabro==4) {
    prim=prim+gap+boom;
    shpsz=shpsz+2;
  }
  frhlyr( posx, posy);
  nabro=0;
  prim=0;
}


void snowflake(float posx, float posy) {
  float s = 5;
  float sI=10;
  float sII=15;
  float sIII=20;
  float sIV=25;
  float expld=100;
  d = dist(mouseX, mouseY, pmouseX, pmouseY);


  if (d > s && go==1) {
    translate(posx, posy);
    rotate(rot);
    translate(-posx, -posy);
    rot=rot+0.05;
    fstlyr (posx, posy);
  }
  if (d > sI && go==1) {
    scdlyr (posx, posy);
    rot=rot+0.10;
  }
  if (d > sII && go==1) {
    thdlyr(posx, posy);
    rot=rot+0.15;
  }
  if (d > sIII && go==1) {
    frhlyr(posx, posy);
    rot=rot+0.20;
  }
  if (d > sIV && go==1) {
    fthlyr(posx, posy);
    rot=rot+2.5;
  }
  if (d > expld && go==1) {
    count=count+1;
  }
  if (count > 30) {
    go=2;
  }
  if (go==2) {
    background(d+100, 0, 0);
    fstlyr(posx, posy);
    scdlyr(posx, posy);
    thdlyr(posx, posy);
    frhlyr(posx, posy);
    fthlyr(posx, posy);
    boom=boom+20;
    if (boom > 100) {
      go=1;
    }
  }
}

void draw() {
  background(d+10, d+40, d+100);

  int xP = 75;

  int yP = 100;

  while (xP <= width) {
      pushMatrix();
      snowflake(xP, yP);
      popMatrix();
  
    
 
    xP = xP + 150;
  }
}




