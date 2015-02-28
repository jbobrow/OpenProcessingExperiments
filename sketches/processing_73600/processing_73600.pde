
//ROWAN CASSIUS, CP1, B7
float x = -.5;
float y = 2;
float z = 5;
int transX = 400;
int transY = 400;
int transZ = 0;
int ltr = 0;
int ltg = 0;
int ltb = 0;
int bx = 100;
int b = 1;
int bk = 0;
int bk1 = 1;
int sw = 12;
void setup()
{
  size(600,600,P3D);
  //frameRate(1);
}
void draw()
{    
  lights();
  background(bk);
  translate (300,300,-500);
  camera(3*mouseX-300,3*mouseY-300,500,0,0,0,0,1,0);
  rotateY(y);
  rotateZ(z);
  stroke(ltr,ltg,ltb);
  strokeWeight(sw);
  fill(225);
  box(bx);
  //Satellite A
  translate(0,-0,-150);
  noStroke();
  fill(231,232,73);
  rotateX(0);
  rotateZ(0);
  sphere(60); 
  //Satellite B
  translate(0,-0,-150);
  noStroke();
  fill(64,37,227);
  rotateX(0);
  rotateZ(0);
  sphere(60);
  //Satellite C
  translate(0,-0,-150);
  noStroke();
  fill(250,30,60);
  rotateX(0);
  rotateZ(0);
  sphere(60);
  //Satellite 1
  translate(0,-0,450);
  translate(0,0,150);
  noStroke();
  fill(211,49,209);
  rotateX(0);
  rotateZ(0);
  sphere(60);
  //Satellite 2
  translate(0,0,150);
  noStroke();
  fill(255,167,72);
  rotateX(0);
  rotateZ(0);
  sphere(60);
  //Satellite 3
  translate(0,0,150);
  noStroke();
  fill(43,165,76);
  rotateX(0);
  rotateZ(0);
  sphere(60);
  //Other  
  bx = bx + b;
  if(bx>124 || bx < 76)
  {
    b = -b;
  }
   sw = sw + bk1;
   if(bk>30 || bk<13)
   {
     bk1 = -bk1;
   }
  //x=x+.12;
  y=y -.09;
  //z=z-.04;
  ltr = int(random(0,170));
  ltg = int(random(0,170));
  ltb = int(random(0,170));
  
}
