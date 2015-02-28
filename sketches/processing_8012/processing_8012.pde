
void setup() {
  size(200, 400);
  stroke(50);
  smooth();
background(20,150,180);
int x=1;
}
float a=second();
float b=second();
float c=second();
float d=second();
float e=second();
float f=second();
float g=second();
float h=second();
float j=minute();
void draw(){
background(10,155,200);


a=a+0.5;
fill(30,50,80,45);
ellipse(mouseX+15, mouseY+15, a, a);
if (a>50){
  a=0;
}

  b=b+0.9;
fill(30,50,80,15);
ellipse(mouseX+5, mouseY+30, b, b);

if (b>100){
  b=0;}


c=c+2.9;
fill(30,50,80,15);
ellipse(mouseX-15, mouseY+60, c, c);

if (c>200){
  c=0;}

d=d+0.6;
fill(30,20,40,45);
ellipse(mouseX-45, mouseY+6, d, d);

if (d>150){
  d=0;}

e=e+0.9;
fill(50,50,125,68);
ellipse(mouseX+35, mouseY, e, e);

if (e>80){
  e=0;}
  
  f=f+1.7;
fill(30,50,80,15);
ellipse(mouseX-20, mouseY+50, f, f);

if (f>80){
  f=0;}

g=g+1.1;
fill(30,54,15,65);
ellipse(mouseX+75, mouseY+90, g, g);

if (g>160){
  g=0;}
  
  h=h+1.5;
fill(30,35,52,15);
ellipse(mouseX+15, mouseY+60, h, h);

if (h>260){
  h=0;}
  
  
}


