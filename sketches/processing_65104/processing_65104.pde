
PFont f;
String message = "SPINNING";

float theta;

void setup() {
  size(300,300);
  f= loadFont("Code-Bold-48.vlw");
}

void draw (){
  background (250,15,74);
  fill(0);
  textFont(f);
  translate(width/2,height/2);
  rotate(theta);
  textAlign(CENTER);
  text(message,0,0);
  theta += 0.05;
}


