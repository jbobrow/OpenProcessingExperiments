
size(800, 800);
//size(1440, 900);
background(255);
randomSeed(234);
noiseSeed(50);
noFill();
smooth();
strokeWeight(1);

for (int i = 0; i<height; i+=1) {
  beginShape();
  for (int x = 0; x<width; x+=1) {
    stroke(50+i, 200-(2*i), 150);
    vertex(x, i*20*noise(x/100.0));
  }
  endShape();
}



