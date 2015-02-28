
PFont font;
float x = 30;
PFont bold;
float angle=1;
void setup(){
  size(250,250);
  smooth();
}
void draw(){
    background(#BC264C);
font=loadFont("PortagoITCTT-160.vlw");
textFont(font,40);
text("2G4",30,-250+x);
text("M5G",30,0+x);
textFont(font,160);
  translate(50,125);
  text("M",5,40);
  translate(73 ,125);
  fill(250,120);
text("5",0,35);
  rotate(80);
  font=loadFont("Baskerville-Bold-200.vlw");
textFont(font);
  text("g",60,70);
rotate(70);
font=loadFont("PortagoITCTT-160.vlw");
textFont(font,40);
text("2G4",30,-x);
x+=2;
if (x>250){
  x=0;
}
}

