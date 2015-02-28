
PFont font;
void setup(){
  size(480,120);
  smooth();
  font=loadFont("Arial-Black-48.vlw");
  

}
void draw(){
  background(102);
  textSize (36);
  text("That's one small step for man...",25,60);
  textSize(18);
  text("That's one giant leap for mankind...",27,90);
}
