
import processing.video.*;

float range, speed, col;
int timer;

Movie myMovie;

float v; 
float easing = 0.2;  // Between 0 and 1
float volumeScalar = 500;
boolean noMic;

int minV = 1;
int maxV = 300;

void setup() {
  size(640, 480);
  smooth();
  setupVolume();
  //  startFace();
  myMovie = new Movie(this, "final1.mov");
  myMovie.loop();
  myMovie.read();
}

//void movieEvent(Movie myMovie) {
// myMovie.read();
//}

void draw() {
  background(255);

  getVolume();

  if (noMic == true) {
    v = map(mouseX, 0, width, 0, 1000);
  }
  tint(255, col, col, v*3);
  image(myMovie, 0, 0);
  
  col = map(v, minV, maxV, maxV, minV);
  range = map(v, minV, maxV, 1, myMovie.duration());
  speed = map(v, minV, maxV, -1, 4);
  timer++;
  if (timer > 60) {
    myMovie.jump(range);
    myMovie.speed(speed);
    timer = 0;
  }

//  println(v);

  //  testFace();

  //  float time = mouseX/float(width);
  //  opencv.jump( time );
}


