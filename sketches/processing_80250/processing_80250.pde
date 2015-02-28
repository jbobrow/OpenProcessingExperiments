
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65104*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PFont f;
String message = "mixing";
PImage b;
float theta;


void setup() {
  b = loadImage("mixing.jpg");
  size(330,230);
  f= loadFont("Code-Bold-48.vlw");

}

void draw (){
 background (250,15,74);
 b = loadImage("mixing.jpg");
 image(b, 0, 0);
  fill(255);
  textFont(f);
  translate(width/2,height/2);
  rotate(theta);
  textAlign(CENTER);
  text(message,0,0);
  theta += 0.05;
}



