
PFont font;


void setup() {
  size(600, 300);
  textSize(90);
  //textAlign(CENTER);
   frameRate(1);
   font = loadFont("AmericanTypewriter-CondensedBold-95.vlw");
}
 
void draw() {
  background(0);
  int s = second();
  int m = minute();
  int h = hour();
  String t = h + ":" + nf(m, 2) + ":" + nf(s, 2);
  //println(t);
  textFont(font, 95);
  text (t, 100, 180);

}



