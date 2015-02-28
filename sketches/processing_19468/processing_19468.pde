
PFont font;
int x= 0;
float x1=0;
float x2=0;
float x3=0;
float x4=0;
float x5=0;
float x6=0;
float x7=0;
float y8=0;
float x9=0;
float x10=0;
float x11=0;

void setup(){
size (250,250);
smooth();
}

void draw (){
  background (0);
  fill(150);
  font = loadFont ("HelveticaNeue-LightItalic-48.vlw");
textFont (font);

textSize (18);
text (" L5R 1M7 ", x1, 50);
x1+=4.0;
if (x1>250){
  x1=-85;
}

textSize(40);
text ("L5R 1M7", x2,100);
x2+= 3.0;
if (x2>250){
  x2=-170;
}

textSize(10);
text ("L5R 1M7", x3,140);
x3+= 5.0;
if (x3>250){
  x3=-60;
}
textSize(24);
text ("L5R 1M7", x4,165);
x4+= -3.5;
if (x4< -85){
  x4=250;
}
fill(150, 100);
textSize(20);
text ("L5R 1M7", x5,120);
x5+= -5.0;
if (x5<-50){
  x5=250;
}

textSize(14);
text ("L5R 1M7", x6,210);
x6+= 4.0;
if (x6>250){
  x6=-60;
}
textSize(9);
text ("L5R 1M7", x7,188);
x7+= -6.0;
if (x7<-50){
  x7=260;
}
fill(150,60);
textSize(50);
text ("L5R 1M7", y8,130);
y8+= 1.0;
if (y8>250){
  y8=-195;
}
fill(150,30);
textSize(150);
text ("L5R 1M7", x9,270);
x9+= -2.0;
if (x9<-500){
  x9=250;
}
fill(150,80);
textSize(50);
text ("L5R 1M7", x10,25);
x10+= 2.0;
if (x10>250){
  x10=-180;
}
fill(150);
textSize(14);
text ("L5R 1M7", x11,30);
x11+= -3.0;
if (x11<-100){
  x11=250;
}
}

