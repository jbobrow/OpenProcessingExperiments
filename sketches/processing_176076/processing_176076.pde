
PGraphics pg;
float circle_x[] = {};
float circle_y[] = {};
float move_x[] = {};
float move_y[] = {};
float y;
float r;
float g;
float b;
float a;
float diam;
float s;
float h;

void setup() {
  //size of screen
  size(400, 400);
  //whenever you play it, there is a different colour.
  background(random(10,255), random(20,255), random(30,255));
  frameRate(1);
  textSize(28);  
  size(640, 360);
  pg = createGraphics(400, 200);
    size(400, 200);
  stroke(#D60DFF);
  smooth(225);
}
void draw() {
   background(#FFFFFF);
// The date, including the year
  String message = "Date: " + day() + "." + month() + "." + year(); 
  text(message, 100, 100); 
  // The time, including the number of seconds
  message = "Time: " + nf(hour(), 2) + ":" + nf(minute(), 2) + ":" + nf(second(), 2); 
  text(message, 100, 130);
    fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  noStroke();
  ellipse(mouseX, mouseY, 60, 60);
  
  pg.beginDraw();
  pg.background(random(#0AFF28, #055A0F), 0, 0);
  pg.noFill();
  pg.stroke(225);
  pg.ellipse(mouseX-120, mouseY-60, 60, 60);
  pg.endDraw();
  
   r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(20);
  s = random(width);
  h = random(height);
  
  // Use values to draw an ellipse
  noStroke();
  fill(r,g,b,a);
  ellipse(s,h,diam,diam);
 
}
