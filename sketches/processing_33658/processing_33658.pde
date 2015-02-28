
int redlevel = 0;
int greenlevel = 0;
int bluelevel = 0;
float x = 50;
float y = 50;
void setup(){
  size (700,400);
   

}
void draw(){
  noStroke();
  ellipse(x, y, 50, 50);
    fill(redlevel,greenlevel,bluelevel,10);
  
          if (mousePressed && (mouseButton == LEFT)) {
    x = x + (mouseX - x)/25.0;
  y = y + (mouseY - y)/25.0;
          }
               if(keyPressed) {
  if(key == 'r' || key == 'r') {
      redlevel = 250;
      greenlevel = 0;
      bluelevel = 0;
    } }
                      if(keyPressed) {
  if(key == 'g' || key == 'g') {
      greenlevel = 250;
      redlevel = 0;
      bluelevel = 0;
  }}
  if(keyPressed) {
  if(key == 'b' || key == 'b') {
      greenlevel = 0;
      redlevel = 0;
      bluelevel = 250;
  }}
}

void mousePressed() {

}
void mouseMoved(){

}

