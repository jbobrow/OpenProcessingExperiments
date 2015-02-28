
String message = "excited";
String mesage = "multiply";
String masage = "multiply";
String masege = "multiply";
float x, y;
float h, v;

void setup() {
  size (800,800);
  PFont font = loadFont("Helvetica-Bold-48.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  h = textWidth(message) / 2;
  v = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;
}

void draw(){
  background(0);
  if (abs(mouseX - x) > h && abs(mouseY - y) > v){
    x += random(-15, 15);
    y += random(-15, 15);
    text("excited", x, y);
  }
  else{
    text("calm", x, y);
}
}

