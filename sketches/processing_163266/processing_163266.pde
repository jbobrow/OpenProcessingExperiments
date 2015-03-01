
//Load Images
PImage cool;
PImage tada;

//Rotation
float r = 0;

void setup() {
  size (900, 600);
  noStroke();
  tada = loadImage("tada.png");

  imageMode(CENTER);
  cool = loadImage("cool.png");
}


void draw() {
  background(255);

  //Background Vertical Four Loop
  for (int k = 0; k<18; k++) {
    //Background Horizontal Four Loop
    for (int j = 0; j<28; j++) {
      image(tada, 30 + j*60, 50+k*30, 50, 50);
    }
  }
  //Rotating 
  /* CREDIT: John Park: https://www.youtube.com/watch?v=ugYuWAQ25kA */
  r = r + .5;
  translate(width/2, height/2);
  rotate(radians(r));

  //Rotating Four Loop
  for (int i=0; i<10; i++) {
    image(cool, 50 + i*25, 0, 50, 50);
  }
}



