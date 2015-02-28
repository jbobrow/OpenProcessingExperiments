
PImage b;// declare an image variable
float noiseScale=0.01;

void setup(){ // this runs once, at the beginning 
size(500,341); // size - must go first in setup
 //background(0);

b = loadImage("hurricane.jpg");// load an image form the data
background(b);
 smooth(); // smooths lines and edges, but draws more slowly

}
void draw() {
  //translate(0,0);
  //background(0);

  for(int y=0; y < 200; y++) {
      fill(50+y);
    float noiseVal = noise((mouseY+y)*noiseScale, 
                            mouseX*noiseScale); // noise is a random sequence
    stroke(noiseVal*255);// noise value states the value
    ellipse(100+noiseVal*80,height-(y*4.5), y*3, height);
    //ellipse(x,mouseY+noiseVal*80, x, height);
  }
}

