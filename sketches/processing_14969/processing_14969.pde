
int a;
float i;
float j;
float z;
float y;
int variable;
PImage app;
PImage av;
PImage br;
PImage lem;
PImage lim;
PImage man;
PImage or;
PImage pea;
PImage pe;
PImage straw;
PImage tom;
 
void setup () {
  variable=-29;
  background(255);
  size(810,390);
  app=loadImage ("apple.jpg");
  av= loadImage ("avocado.jpg");
  br=loadImage ("breadfruit.jpg");
  lem=loadImage ("lemon.jpg");
  lim=loadImage ("limes.jpg");
  man=loadImage ("mango7.jpg");
  or=loadImage ("orange.jpg");
  pea=loadImage ("peach.jpg");
  pe=loadImage ("pears.jpg");
  straw=loadImage ("strawberry.jpg");
  tom=loadImage ("tomato.jpg");
}
 
void draw () {
  frameRate(10000);
  a = a+1;
  i=random(2);
    if(i>1) {
    j=250;
  } else {
    j=0;
  }
   
  stroke(j, random (20), random (50), random (200));
  line(a,0,a,348);
  variable=variable+40;
  z=random(9);
  if (z<1) {
   image (br, variable, 350);
  }
  if ((z>1) && (z<2)) {
   image (or, variable, 350);
  }
  if ((z>2) && (z<3)) {
     image (pea, variable, 350);
  }
  if ((z>3) && (z<4)) {
   image (pe, variable, 350);
  }
    if ((z>4) && (z<5)) {
    image (lim, variable, 350);
  }
      if ((z>5) && (z<6)) {
 image (lem, variable, 350);
  }
  if ((z>6) && (z<7)) {
 image (app, variable, 350);
  }   
  if ((z>7) && (z<8)) {
   image (av, variable, 350);
  }   
  if ((z>8) && (z<9)) {
 image (tom, variable, 350);
     }
   
}
 
void mouseClicked () {
    variable=-39;
  a=0;
  background(255);
}


