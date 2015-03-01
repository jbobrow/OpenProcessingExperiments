

// ch. 6
PFont f;
String message = "Embrace the Randomness of Life";

void setup() {
  size(500,500);
  f = createFont("Arial",13,true);
}

void draw() { 
  background(46,173,229);
  fill(91,82,198); //color of text
  textFont(f);         
  int x = 30;//position of text
  for (int i = 0; i < message.length(); i++) {
    textSize(random(12,36));
    text(message.charAt(i),x,height/2);
    // textWidth() spaces the characters out properly.
    x += textWidth(message.charAt(i)); 
  }
 
}




