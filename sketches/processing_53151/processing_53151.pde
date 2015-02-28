
PImage bg;
PImage spl;

///box 
int x=250;
int y=100;
int speedx=2;
int speedy=2;

///cU - upper color, cD - lower color, cL - left color, cR - right color
color[] cU=new color[3];
color[] cD=new color[3];
color[] cL=new color[3];
color[] cR=new color[3];

////sample colors, as it is very hard to name exact color
////that is used in the bg image
color C;

void setup() {

  size(600, 600);
  bg=loadImage("colorpicker.png");
  spl=loadImage("sample.png");

  ////sampling the color from sample image to select exact color
  C=spl.pixels[(spl.width*5)+(15)];

}


void draw() {
  image(bg, 0, 0);

  ////man
  fill(255);
  rect(x, y, 18, 18);
   rect(580-x,580-y,18,18);
   rect(x,580-y,18,18);
   rect(580-x,y,18,18);
  x+=speedx;
  y+=speedy;
  
 // if (x>580 || x<1 || y>580 || y<1) {
   // x=100;
    //y=100;
  //}


  for (int lop=0;lop<3;lop++) {
    ////selecting the color that box touches 
    cU[lop]=bg.pixels[(bg.width*(y))+(x+(6*lop))];
    cD[lop]=bg.pixels[(bg.width*(y+18))+(x+(6*lop))];

    cL[lop]=bg.pixels[(bg.width*(y+(6*lop)))+(x)];
    cR[lop]=bg.pixels[(bg.width*(y+(6*lop)))+(x+18)];

    /////comparing it to the sample color
    if (cD[lop]==C) {
      println("match down");
      speedy=-speedy;
    }
    if (cU[lop]==C) {
      println("match up");
      speedy=-speedy;
    }
    if (cL[lop]==C) {
      println("match left");
      speedx=-speedx;
    }
    if (cR[lop]==C) {
      println("match right");
      speedx=-speedx;
    }
  }
}


