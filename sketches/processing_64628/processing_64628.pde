
float w = mouseX;
float h = mouseY;  
boolean first_click = false;
int r = int(random(255));
int g = int(random(255));
int b = int(random(255));
  
void setup() {
  size(400, 600);
  smooth();
  colorMode(RGB, 255, 255, 255, 500);
  strokeWeight(1);
  background(255);
}

void draw() {
  //background(400, 600, 600);
  for (int y = 0; y <= height+0; y= y+100) {
    for (int x = 0; x <= width+0; x = x +100) {
      stroke(
        r+(millis()/100)%255,
        g+(millis()/30)%255,
        b+ millis()%255
          );
      if (mousePressed) {
        first_click = true;
        background(255);
        r = int(random(255));
        g = int(random(255));
        b = int(random(255));
      }
      
      else if(first_click) {
        /*y = y + int(random(-12, 2));
        x = x + int(random(-2, 2));*/
        line(x, y, mouseX, mouseY);
      }
    }
  }
}

/*void mousePressed() {
 w = w + 10;
 h = h + 10;
 }
 */

