
float x, y, ang;
void setup(){
  size(640, 480);
  background(255);
  frameRate(60);
  textFont(font);
}

void draw(){
  ang += 15.5;
  stroke(color(random(256),random(256),random(256)));
  x = width/2 + cos(radians(ang))*frameCount;
  y = height/2 + sin(radians(ang))*frameCount;
  line(width/2, height/2, x, y);
  if(frameCount >= 214) noLoop();
  fill(#000000);
}


