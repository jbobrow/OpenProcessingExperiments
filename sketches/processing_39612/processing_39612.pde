
int num = 35; // number of snowflakes

float[] y = new float[num];  //vertical axis
float[] x = new float [num]; //horizontal axis
color[] sc = new color[num];


void setup() {
  size(300, 300);
  smooth();

  for (int i = 0; i < num; i++) { //assign
    y[i] = random(height);
    x[i] = random(-width/2,width/2); 
    sc[i] = color(random(100, 150), random(100, 200), random(200, 255));
  }
}

void draw() {
  background(50);

  for (int i = 0; i < num; i++) {

    snowflake (x[i], y[i]);
    stroke(sc[i]);
    y[i] = y[i]+1.5; //control speed of falling snowflakes
    if (y[i] > height) {
      y[i] = 0;
    }
  }
}



void snowflake (float xx, float yy) { //create snowflake tool
  
  translate (xx, 0); //variable origin to keep snowflake elements together & proportional
  strokeWeight(2.5);
  line(xx, yy-(yy/2), xx, yy+(yy/2));
  line(xx-(xx/2), yy, xx+(xx/2), yy);
  strokeWeight(2);
  line(xx-(xx/3), yy+(yy/3), xx+(xx/3), yy-(yy/3));
  line(xx+(xx/3), yy+(yy/3), xx-(xx/3), yy-(yy/3));
}


