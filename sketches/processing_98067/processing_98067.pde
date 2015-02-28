

String message = "move me";
float x, y;
float hr, vr;  

void setup() {
  size(600, 300);
  
  
  textFont(createFont("Calibri", 24));
  textAlign(CENTER, CENTER);
  
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) /2;
  noStroke();
  x = width / 2;
  y = height / 2;
}

void draw() {
  fill(#2554C7);
  rect(0, 0, width, height);
  
 
 
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    x += random(-6, 5);
    y += random(-6, 5);
    x +=(x-mouseX)/10;
    y +=(y-mouseY)/10;    
    if (x<hr) x=hr;
    if (y<vr) y=vr;
    if (x>(width-hr)) x=width-hr;
    if (y>(height-vr)) y=height-vr;
      }
  
  fill(0);
  text("move me", x, y);
}
 /*borrowed from processing.org 
*/

