
PFont f;
String message = "different";

void setup() {
  size(500, 500);
  f = createFont("MyriadPro-Bold-48",20,true);
}

void draw() { 
  background(random(230,255),random(124,255),124);
  fill(0);
  textFont(f);         
  int x = 150;
  for (int i = 0; i < message.length(); i++) {
    textSize(random(14,100));
    text(message.charAt(i),x,height/2+15);
    // textWidth() spaces the characters out properly.
    x += textWidth(message.charAt(i)); 
  }
  noLoop();

}
void mouseMoved() {
  redraw(); }

