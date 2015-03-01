
void setup() {
  setupAudio();
  size(500, 400); //sets the size for the window
  background(0, 200, 100);
}

void draw()
{
  getVolume();
  float colorShift = map(volume, 0, 255, 0, 100);
  background(0, 200-colorShift, 100+colorShift);
  rect(150, 300, 200, 100); //shoulders
  fill(125+125, 125, colorShift);
  ellipse(250, 200, 200, 200); //face
  fill(225);
  float eyesize = map(volume, 0, 255, 20, 100);
  fill(125+125, 0, colorShift);
  ellipse(300, 200, eyesize, eyesize); //eye
  ellipse(200, 200, eyesize,eyesize); //eye
  ellipse(250, 230, 20, 40); //nose
  float mouthMove = map(volume, 0, 255, 0, 25);
  ellipse (250, 255, 100, 100);
  line(200, 260+mouthMove, 250, 255);//mouth part 1
  line(250, 255, 300, 260+mouthMove);//mouth part 2
}
