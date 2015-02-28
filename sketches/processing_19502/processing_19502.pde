
PFont font;
float angle = 0.;
float x=40;
void setup(){
  size(250,250);
  smooth();

}
void draw(){
    background(#7C4DAD);
    fill(255,100);
      text("M5G",mouseX,120);
text("2G4",100,5*x);
text("2G4",100,mouseY);
angle=angle+0.1;
  font=loadFont("AmericanTypewriter-Bold-150.vlw");
  textFont(font);
  rotate(angle);
text("M",10,x);
  textFont(font,100);
  //font made smaller
rotate(angle);
text("5",-10,x);
rotate(2*angle);
text("G2",-10,x);
rotate(1.5*angle);
text("G4",-5,x);
rotate(angle);
x-=1.0;
if (angle>40){
  angle=0;
  x=40;
}
if (x>45){
  x=40;
}
}

