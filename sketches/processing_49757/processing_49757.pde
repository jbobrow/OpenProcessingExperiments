
// crawl line to mouse location
/* crawler has set limit on motion, draw constantly updates
for the shortest distance to mouseX, mouseY, changes offset
of next vertex

*/
float x = 120;
float y = 60;
int rad = 10;
float easing = 0.05;
color c = color(#53EDED);

void setup(){
  size(900,450);
//  noCursor();
  ellipseMode(RADIUS);
  smooth();
}

void draw() {
  fill(#993129, 60);
  noStroke();
  rect(0, 0, width, height);
  float targetX = mouseX;
  float targetY = mouseY;
      if (targetX > x && x < width - 12 || targetX < x && x > 12) {
        x += (targetX - x) * easing;
      }
      if (targetY < y && y > 12 || targetY > y && y < height - 12) {
      y += (targetY - y) * easing;
      }
  
  fill(#53EDED);
  ellipse(x,y, rad, rad);
  ellipse(x+20,y+20, rad, rad);
  ellipse(x-20,y-20, rad, rad);
}               
