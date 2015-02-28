
PFont font;
float x = -100;
PFont bold;
float angle=0.5;
void setup(){
  size(250,250);
  smooth();
}
void draw(){
    background(#FFF1D3);
font=loadFont("ChaparralPro-Regular-48.vlw");
bold=loadFont("ChaparralPro-Bold-60.vlw");
textFont(font,60);
angle=angle+0.02;
  translate(125,125);
  rotate(angle);
  fill(#7DCB19,120);
text("M5G",20,40);
textFont(font,40);
text("M5G",30,50-x);
fill(255,170);
//white 2g4
  translate(20,20);
  rotate(angle);
textFont(bold,50);
text("2G4",20,20);
//large characters
textFont(font,15);
fill(#FF8D00);
text("M",x,x);
text("5",2*x,2*x);
text("G",2*x,x);
text("2",x,2*x);
  translate(-100,-100);
  text("2",x,2*x);
    text("G",2*x,2*x);
    textFont(font,20);
        text("4",x/2,x);
        //small lettershapes
rotate(angle);
x+=1.0;
if (x>150){
  x=0;
}
}

