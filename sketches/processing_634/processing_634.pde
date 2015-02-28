
float r;
float g;
float b;
int nar=1;
int Nar=1;
int azu=1;
int Azu=1;
int roj=1;
int Roj=1;
int ver=1;
int Ver=1;


void setup () {
  size(900,900);
  background(0);
   r = 255;
  g = 255;
  b = 255;
}

void draw() {
 
noStroke();
fill(r,g,b);
triangle(0,height/5,width,height/5,width/2,height);
triangle(0,4*height/5,width,4*height/5,width/2,0);

stroke(255);
line(200,50,200,150);
line(150,100,250,100);

noStroke();

fill(255,170,0);
ellipse(150,100,20,20);
fill(50,255,50);
ellipse(250,100,20,20);
fill(255,50,50);
ellipse(200,50,20,20);
fill(50,50,255);
ellipse(200, 150,20,20);

if (mouseX>140 && mouseX<160){
  nar=2;
}else{
  nar=1;
}
if (mouseY>90 &&mouseY<110){
  Nar=2;
}else{
  Nar=1;
}
if (nar+Nar==4){
r = 255;
  g = 170;
  b = 0;
}


if (mouseX>240 && mouseX<260){
  ver=2;
}else{
  ver=1;
}
if (mouseY>90 &&mouseY<110){
  Ver=2;
}else{
  Ver=1;
}
if (ver+Ver==4){
r = 50;
  g = 255;
  b = 0;
}



if (mouseX>190 && mouseX<210){
  roj=2;
}else{
  roj=1;
}
if (mouseY>40 &&mouseY<60){
  Roj=2;
}else{
  Roj=1;
}
if (roj+Roj==4){
r = 255;
  g = 50;
  b = 50;
}



if (mouseX>190 && mouseX<210){
  azu=2;
}else{
azu=1;
}
if (mouseY>140 &&mouseY<160){
  Azu=2;
}else{
  Azu=1;
}
if (azu+Azu==4){
r = 50;
  g = 50;
  b = 255;
}
}

