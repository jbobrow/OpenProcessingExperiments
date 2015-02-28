
  String s = "Edward";
PFont f;

void setup() {
  size (800, 800);
  background (149, 29, 29);
  f=loadFont("Consolas-BoldItalic-48.vlw");
}

void draw() {
  textFont (f);
  textSize (100);
  text(s, 20, 200);
  for(int i=0; i<500;i++){
  line(0, 0, mouseX, mouseY);
  hue(255);
}}
     
                
