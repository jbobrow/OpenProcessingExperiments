
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];

float angle;
float jitter;

void setup() {
  size(640, 360);
  //stroke(#1BDB4F);
  noStroke();
  //fill(#ffffff, 153);
  rectMode(CENTER);
}

void draw() {
  background(#1BDB4F); 

  // Cycle through the array, using a different entry on each frame. 
  // Using modulo (%) like this is faster than moving all the values over.
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;

  for (int i = 0; i < num; i++) {

    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;

    if (mousePressed) {
      fill(#FAFF15, 200);
      ellipse(mx[index], my[index], i, i);
    } 
    else {
      fill(#ffffff, 153);
      rect(mx[index], my[index], i, i);
    }

    // during even-numbered seconds (0, 2, 4, 6...)
    if (second() % 4 == 0) {
    }
    angle = angle + jitter;
    float c = cos(angle);
    translate(width/4, height/10);
    rotate(c);
    //rect(0, 0, 100, 100);

  }
}
