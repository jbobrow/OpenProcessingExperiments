
void setup() {
  setupAudio();
  size(500, 400); //sets the size for the window
  background(0, 200, 100);
}

void draw()
{
  getVolume();
  float colorshift = map(volume, 0, 255, 0, 100);
  background(0, 200-colorshift, 100+colorshift);
  rect(150, 300, 200, 100); //shoulders
  fill(125,125,125);
  ellipse(250, 200, 150, 200); //face
  fill(255,255-colorshift,255-colorshift);
  float eyesize=map(volume,0,255,20,50);
  ellipse(300, 200, eyesize, eyesize); //eye
  ellipse(200, 200, eyesize, eyesize); //eye
  fill(255);
  ellipse(250, 230, 20, 40); //nose
  float mouthmove =map(volume,0,255,0,10);
  line(200, 260+mouthmove, 250, 255);//mouth part 1
  line(250, 255, 300, 260+mouthmove);//mouth part 2
}
