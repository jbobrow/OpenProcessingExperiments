
int num = 100; //number of required variables

//create the arrays
float[] x = new float[num]; // x-coordinate
float[] y = new float[num]; // y-coordinate
float[] rot = new float[num]; // rotating
float[] speed = new float[num]; // rotating speed
color[] c = new color[num]; // planet color


void setup() {
  size(300,300);
  colorMode(RGB, width);
  smooth();
  
  //seeding the array
  
  for (int i=0; i < num; i++) {
    x[i] = random(width);
    y[i] = random(height);
    rot[i] = random(radians(360)); // 0-360 converted to radians
    speed[i] = random(0.1, 0.5);
    c[i] = color(int(random(100)), 20, 100);
  }
}


void draw() {
  background(17);
  int count = 100;
  

  translate(150, 150);
  
  for (int i=0; i < num; i++) {
    
    rotate(rot[i]);
    rot[i] = rot[i] + radians(speed[i]);
    i++;
    
    //draw the planets
    stroke(0);
    fill(c[i]);
    ellipseMode(CORNER);
    ellipse (x[i], y[i], x[i], x[i]);
    
    
    x[i] = x[i] + speed[i];
    if (x[i] > width + 1) {
      x[i] = -5;

      translate(150,150);
      
    }
  }
}

  

