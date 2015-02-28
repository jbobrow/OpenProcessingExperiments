
/* @pjs preload="skin4.png"; 
 */

int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
int radius;
float counter;
PImage img;

void setup() {
  size(400, 400);
  stroke(255);
  smooth();
  
  radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  
  cx = width / 2;
  cy = height / 2;

  img = loadImage("skin4.png");
}

void draw() {
  background(0);

  //Rotate ALL the things. Well, at least the center graphic  
  counter+= 0.1;
  pushMatrix(); 
  translate(cx, cy);
  rotate(-counter*TWO_PI/360); 
  translate(-img.width/2, -img.height/2);
  image(img, 0, 0);
  popMatrix();


  String str = second() + "." +   nf("%03d",  millis());
  float f = float(str);
  
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  // float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float s = map(f, 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  stroke(214,203,157);
  strokeWeight(2);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
  // Draw the ticks
  strokeWeight(2);
  for (int a = 0; a < 360; a+=6) {
    float rad = radians(a);
    if (a==0 || a==90 || a==180 || a==270)
      strokeWeight(6);
    else
      strokeWeight(2);
    line(
        cx + (radius * 0.90 * cos(rad)),
        cy + (radius * 0.90 * sin(rad)),
        cx + radius * 0.80  * cos(rad),
        cy + radius * 0.80 * sin(rad)
        );        
  }
  //save("thumb.png");
}


