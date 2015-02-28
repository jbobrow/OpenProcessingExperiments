
PImage img;
float inc = 0.004;
float seed = 0.0;

void setup() {
  img = loadImage("logo_plain.jpg");
  size(500, 500, P3D);
  noStroke();
}

void draw() {
  background(0);
  beginShape();
  texture(img);
  vertex(noise(seed)* width, noise(seed+5)*width, 0, 0);
  vertex(noise(seed+10)*width, noise(seed+15)*width, img.width, 0);
  vertex(noise(seed+20)*width, noise(seed+25)*width, img.width, img.height);
  vertex(noise(seed+30)*width, noise(seed+35)*width, 0, img.height);
  endShape();
  seed+=inc;
}


