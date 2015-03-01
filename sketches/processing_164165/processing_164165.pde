
int n = 32;

void setup(){
  size(640, 640);
  noStroke();
  fill(0, 150, 255, 100);
}

void draw(){
  background(0);
  for(int x = n/2; x < width; x+=n/2){
    for(int y = n/2; y < height; y+=n/2){
      /* You could of made a variable for the dist() function. But I like compact code so I just put them in. */
      float angle = sin(radians(dist(x, y, width/2, height/2)+frameCount)) * cos(dist(x, y, width/2, height/2))*n;
      ellipse(x, y, angle, angle);
    } 
  }
}


