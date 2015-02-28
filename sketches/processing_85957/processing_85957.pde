
PFont f;
String message = "Strange! Each character is of different size!";

void setup() {
  size(400, 150);
  f = createFont("Arial",20,true);
}

void draw() { 
  background(255);
  fill(0);
  textFont(f);         
  int x = 10;
  for (int i = 0; i < message.length(); i++) {
    textSize(random(12,36));
    text(message.charAt(i),x,height/2);
    // textWidth() spaces the characters out properly.
    x += textWidth(message.charAt(i)); 
  }
  noLoop();
}
