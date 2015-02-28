
//doodles

color strokecolor = color(1,10);
float dist = 40, radius = dist/2, alpha = 0, speed = 400;
float px, py, x, y, k;

void setup(){
  size (750, 750);
  colorMode(HSB, width, height, 100);
  smooth();
  background(random (1,100));
  
}

void draw(){
  if(mousePressed){
  strokeWeight(random(1,7));
float r = random(5);
stroke(mouseX, mouseY, random(100));
fill(mouseX, mouseY, random(100));
  k = speed/radius;
  alpha += k;
  radius += dist/(360/k);
  x = radius*cos(radians(alpha));
  y = -radius*sin(radians(alpha));
  translate(width/2, height/2);
  line(px, py, x, y);
  px = x;
  py = y;
}
}

void keyPressed(){
  if (key ==DELETE ||key == BACKSPACE) background(random (1,100));
  if(key == 'S' || key == 's') saveFrame("screenshot.png");
}

