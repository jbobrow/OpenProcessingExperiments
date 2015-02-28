
color newPixels[];
int numPixels;

void setup(){
  size(640, 480, P2D);
  background(0);
  numPixels = width * height;
  newPixels = new color[numPixels];
  println(numPixels);
  noStroke();
  colorMode(HSB, 100);
}

void draw(){
  int total, samples, i, x, y;
  ellipse(mouseX, mouseY, 5, 5);
  loadPixels();
  for(i=0; i<numPixels; i++){
    total = 0;
    samples = 0;
    for(x=max(i%width-1, 0); x < min(i%width+2, width); x++){
     for(y=max(i/width-1, 0); y < min(i/width+2, height); y++){
       total += pixels[y*width + x];
       samples += 1;
     }
    }

    newPixels[i] = total / samples;
  }
  arrayCopy(newPixels, pixels);
  updatePixels();
}


