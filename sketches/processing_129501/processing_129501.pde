
int width = 640;
int height = 480;
//float mean, med, mode, rng, hmean, gmean, sdev;
//^^Part of the data processing thing I might get around to sometime^^
float y = width/2;
float[] n = new float[width/10];
String out;
color c;
boolean shift = true;

void setup() {
  size(width,height);
  background(0);  
  c = color(random(255),random(255),random(255));
  stroke(255);
  fill(255);
  createArray();
}

void createArray() {
  for (int i = 0; i < n.length; i++) {
    n[i] = int(random(0,height));
  }

} 

void mousePressed() {
  if (mouseButton == LEFT) {
    shift = false;
  }
  if (mouseButton == RIGHT) {
    shift = true;
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    setup();
  }
}

void shift(float[] arr)
{
    float tmp = arr[0];
    for (int i = 1; i < arr.length; i++)
        arr[i - 1] = arr[i];
    arr[arr.length - 1] = tmp;
}

void draw() {
  if (shift == true) {
    shift(n); 
  } 
  background(0);
  noSmooth();
  stroke(c);
  strokeWeight(1);
  for (int j = 0; j < n.length; j++) {    
    point(j*10,n[j]);
  }
  for (int k = 0; k < n.length-1; k++) {
    line(k*10,n[k],(k+1)*10,n[k+1]);
  }
}

/*
Coming soon to theatres near you...
I plan to add some data processing methods
when I feel good and ready to do so.
Perhaps in the next few days or millenia.

void processData() {
//Mean, median, mode, range
//standard deviation, geometric mean, harmonic mean
//Mean
  int n = 1;
  float[] arrayMode = new float[n.length];
  float[] arrayMode2 = new float[n.length];
  while (n < max(n)+1) {
    arrayMode.append(
  }
}
*/
