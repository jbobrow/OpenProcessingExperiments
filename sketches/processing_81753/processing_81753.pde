
float r;
float g;
float b;

void setup() {
  size(960,150, OPENGL);
 background(255);
  frameRate(5);
}
void draw() {
  fill(random(5, 255), random(255), random(255));
  text("MACROMEDIA", random(-50, width), random(-50, height), random(1000));
  text("GEOCITIES", random(-50, width), random(-50, height), random(1000));
  text("ANGELFIRE", random(-50, width), random(-50, height), random(1000));
  text("NETSCAPE", random(-50, width), random(-50, height), random(1000));
  text("DIAL-UP", random(-50, width), random(-50, height), random(1000));
  text("AMERICA ONLINE", random(-50, width), random(-50, height), random(1000));
  text("YOU'VE GOT MAIL", random(-50, width), random(-50, height), random(1000));

}



