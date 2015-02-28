
void setup(){
  size(800,600);
  frameRate(32);
}

void draw(){
  float n = cheapNoise(frameCount);
  color from = color(204, 102, 0);
  color to = color(0, 102, 153);
  color c = lerpColor(from, to, n);
  fill(c);
  strokeWeight(mouseX/20);
  stroke(c);
  line(mouseX, mouseY, mouseX+n*100, mouseY+n*100); 
}

//Thanks Carl Emil
float cheapNoise( float t ){
  return sin( ( t + sin( t * 1.2342 + sin( t*0.2142 ) ) ) * 4.2334 ) * 0.5 + 0.5;
}

