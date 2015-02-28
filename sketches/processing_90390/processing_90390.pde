
int[] a;
float[] b, velo, round;
final int rain = 1000;
float rainsize = 10;
boolean recording = false;


void setup() {
  size(500, 500);
  fill(150);
  rect(0, 0, 500, 500);
  a = new int[rain];
  b = new float[rain];
  velo = new float[rain];
  round = new float[rain];
  frameRate(60);
  background(200);
  
  //raindrop setup
  for(int k = 0; k < rain; k++){
  velo[k] = random(rainsize)/5;
  round[k] = velo[k];
  a[k] = int(random(0,500));
  b[k] = random(0,500);
  }
}

void draw() {
  //background
  fill(150, 4);
  rect(0, 0, 500, 500);
  //raindrop
  for (int i = 0; i < rain; i++) {
    noStroke();
    fill(230, 50);
    ellipse(a[i], b[i], round[i], round[i]);
    b[i] = b[i] + velo[i];
    if ( b[i] >= 500) {
      a[i] = int(random(0, 500));
      b[i] = 0;
    }
  }
  // If we are recording call saveFrame!
  if (recording) {
    saveFrame("output/frames####.png");
  }
}
 
void keyPressed() {  
  // If we press r, start or stop recording!
  if (key == 'r' || key == 'R') {
    recording = !recording;
}
}



