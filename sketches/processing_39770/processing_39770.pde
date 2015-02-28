
//the number of circles
int num = 200;
//the arrays
float[] x = new float[num];//x coordinate
float[] y = new float[num];//y coordinate
color[] c = new color[num];//color

void setup(){
  size(300,300);
  colorMode(RGB, width);

for (int i=0; i < num;i++) {
    x[i] = random(width);
    y[i] = random(height);
    c[i] = color(int(random(height)), 100, 200, 80);
  }
}

void draw() {
  background(0);
  
  for (int i=0; i < num; i++) {
    
    // circles
    fill(c[i]);
    noStroke();
    smooth();
    ellipse(x[i], y[i], 30, 30);
  }
}






