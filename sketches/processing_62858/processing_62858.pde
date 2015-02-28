
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/4614*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

// use mouse to move over the field
// type any key as often as you like
// type "0" to reset the drawing

int  fsz= 45, wth=7, n=0;
float r, t;
squares[]   squair;

void setup() {
  size(500, 500);
  background( 0 );
  smooth();
  InitSquare();
}

void draw() {
  smooth();
  drawSquare();
  relocate  ();
}

void InitSquare() {
  squair = new squares [fsz*fsz];
  for (int i=0;i<fsz;i++)
    for (int j=0;j<fsz;j++) {   
      float PosX = (width /2)-(fsz*wth/2)+i*wth;
      float PosY = (height/2)-(fsz*wth/2)+j*wth;
      squair[n] = new squares(wth, PosX, PosY);
      rect(squair[n].posx, squair[n].posy, 2, 2);
      squair[n].mycel = i+1;
      squair[n].myrow = j+1;
      n = n+1;
    }
}

void drawSquare() {
  background(0);
  for (int i=0;i<squair.length;i++) {
    fill(255, 188, 99);

    PVector mypos = new PVector (squair[i].posx, squair[i].posy);
    PVector mspos = new PVector (mouseX, mouseY);
    r = 10/PVector.dist(mypos, mspos)+10;
    squair[i].relx =squair[i].posx+r*cos(t=atan2(squair[i].posy-mouseY, squair[i].posx-mouseX));
    squair[i].rely = squair[i].posy+r*sin(t);
    rect(squair[i].relx, squair[i].rely, wth, wth);
  }
}

void keyTyped() {
  if (key == '0') {
   int n = 0;
    for (int i=0;i<fsz;i++)
      for (int j=0;j<fsz;j++) {   
        float Sise = wth;
        float PosX = (width /2)-(fsz*wth/2)+i*wth;
        float PosY = (height/2)-(fsz*wth/2)+j*wth;
        squair[n].posx=PosX; 
        squair[n].posy=PosY;
        rect(squair[n].posx, squair[n].posy, 2, 2);
        n = n+1;
      }
  }
  else {
    for (int i=0;i<n;i++) {
      squair[i].posx =squair[i].relx;
      squair[i].posy =squair[i].rely;
    }
  }
}

void relocate() {
 
  float[] xl = new float [fsz];
  float[] xr = new float [fsz];
  float[] yo = new float [fsz];
  float[] yu = new float [fsz];
  for (int i=0;i<fsz;i++) {
    xl[i] = squair[i].posx;
    xr[i] = squair[i+fsz*(fsz-1)].posx;
    yo[i] = squair[i*fsz].posy;
    yu[i] = squair[i*fsz+(fsz-1)].posy;
  }

  float xlave = (min(xl)+max(xl))/2;
  float xrave = (min(xr)+max(xr))/2;
  float yoave = (min(yo)+max(yo))/2;
  float yuave = (min(yu)+max(yu))/2;
  //  println(squair[1220].posx+"   "+xrave+"   "+xrcor+"   "+squair[1220].mycel+"   "+squair.length);
  for (int n=0; n<squair.length; n++) {

    squair[n].posx = map(squair[n].posx, xlave, xrave, width /2-(fsz*wth)/2, width /2+(fsz*wth)/2);
    squair[n].posy = map(squair[n].posy, yoave, yuave, height/2-(fsz*wth)/2, height/2+(fsz*wth)/2);
  }
}

class squares {
  int   mycel, myrow;
  float s;
  float posx, posy, relx, rely;    

  squares(float tempSise, float tempX, float tempY) {

    s = tempSise;
    posx = tempX;
    posy = tempY;
    mycel = 0;
    myrow = 0;
  }
}


