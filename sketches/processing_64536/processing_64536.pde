
String message = "fall";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text
float speed =0.5;
void setup() {
  size(200, 200);
  PFont font = loadFont("Agenda-Medium-48.vlw");
  textFont(font);
  textAlign(CENTER);
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  
}

void draw() {
  background(255);
  // instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  if(mouseY > 180){
    pushMatrix();
    background(255);
    translate(width/2,0);
    //float angle =+=speed/5;
    //rotate(angle);
  fill(204);
//  rect(0, 0, width, height);
  fill(0);
  // If the cursor is over the text, change the position
  
    x += random(-1,1);
    y += speed;
  
  text("fall", x, y);
  popMatrix();
  
  }
}


