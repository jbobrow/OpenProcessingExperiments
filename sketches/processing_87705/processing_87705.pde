

void setup(){
size(800, 800);
background(0);
smooth();
colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(0);
  for(float i = 30; i<height; i+=2) {
    for ( int j = 0; j <=width; j += 25) {
    noFill();
    stroke(255);
    strokeWeight(1);
    point(i, j);
    point(j, i/2);
    rotate(random(2, 30));
  }
}

for(float k = 1; k<=900; k+=60) {
    for ( int l = 0; l <= width/2; l += 27) {
    noFill();
    stroke(random(0, 360));
    strokeWeight(random(.5, 5));
    point(k, l);
    point(l, k);
    line(mouseX, mouseY, k, l);
    rotate(2);

  }
}
 
}
 


