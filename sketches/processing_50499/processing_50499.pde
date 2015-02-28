
// Tint City
// Steve Tiffany, 2011

PImage[] e = new PImage[11];
int elnum,xover,ydown,titleflag;
float xmultlow,xmulthigh,ymultlow,ymulthigh,fps;

void setup() {
  size(640, 480); 
  smooth();
  background(0);
  for (int i = 0; i<11; i++) {
    e[i] = loadImage("e" + nf(i,3) + ".png");
  }
  imageMode(CENTER);
  loop();
  titleflag=0;
}

void draw() {
  if (titleflag==0) {
    fill(222, 222, 222);
    textSize(96); text("Tint City", 140, 240);
    textSize(28); text("Steve Tiffany, 2011", 188,290);
    titleLayout();
    titleflag++;
    frameRate(0.5);
  } else if (titleflag==1) {
    titleLayout();
    titleflag++;   
    fps = 0.33; frameRate(fps);
  }
  else {
    frameRate(fps);
    background(random(200),random(200),random(200));
    int e1,e2,e3,whicha3,xwide,yhigh;
    float xwidemult,yhighmult;
    e1 = int(random(11));
    e2 = int(random(11));
    while(e2==e1) {
      e2 = int(random(11));
    }
    e3 = int(random(11));
    int numloops = int(random(120,200));
    xmultlow = random(0.08,0.16); xmulthigh = random(0.6,1);
    ymultlow = random(0.08,0.16); ymulthigh = random(0.6,1);
    for (int j = 0; j < numloops; j++) {
      xover = int(random(width));  
      ydown = int(random(height));
      whicha3 = int(random(4));
      switch(whicha3) {
      case 0:
        elnum = e1; break;
      case 1:
        elnum = e2; break;
      case 2:
        elnum = e3; break;
      }
      xwidemult = random(xmultlow,xmulthigh);
      if (elnum<9) {
        yhighmult = random(ymultlow,ymulthigh);
      } else { // keep figures' proportions the same
        yhighmult = xwidemult;
      }
      xwide = int(e[elnum].width * xwidemult); 
      yhigh = int(e[elnum].height * yhighmult);
      setTint();
      image(e[elnum],xover,ydown,xwide,yhigh);   
    }
  }
}

void titleLayout() {
  if (titleflag==1) {setTint();} image(e[0],72,63,117,85);
  if (titleflag==1) {setTint();} image(e[1],201,66,110,102);
  if (titleflag==1) {setTint();} image(e[2],400,375,86,114);
  if (titleflag==1) {setTint();} image(e[3],321,67,87,107); 
  if (titleflag==1) {setTint();} image(e[4],243,386,147,98); 
  if (titleflag==1) {setTint();} image(e[5],435,62,87,106);
  if (titleflag==1) {setTint();} image(e[6],559,374,129,119);
  if (titleflag==1) {setTint();} image(e[7],568,71,97,124); 
  if (titleflag==1) {setTint();} image(e[8],83,388,142,88); 
  if (titleflag==1) {setTint();} image(e[9],70,222,92,160);
  if (titleflag==1) {setTint();} image(e[10],574,217,75,151); 
}

void setTint() {
  tint(random(50,255),random(50,255),random(50,255));
}

void keyPressed() {
  int keynum = key;
  switch(keynum) {
    // keys 0-9 = number of seconds each image is displayed
    // default is 3 seconds.  Doesn't take effect right away.
    case 48:
      fps = 30.0; break;
    case 49:
      fps = 1.0; break;
    case 50:
      fps = 0.5; break;
    case 51:
      fps = 0.33; break;
    case 52:
      fps = 0.25; break;
    case 53:
      fps = 0.2; break;
    case 54:
      fps = 0.166; break;
    case 55:
      fps = 0.143; break;
    case 56:
      fps = 0.125; break;
    case 57:
      fps = 0.111; break;
  }
}


