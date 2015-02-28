
int num = 20; // 20 variables

// create the arrays
float[] x = new float[num]; // x-coordinate
float[] y = new float[num]; // y-coordinate
float[] speed = new float[num]; // speed

void setup() {
  size(300, 300);

  // seed the array
  for (int i=0; i < num;i++) {
    x[i] = random(width);
    y[i] = random(height);
    speed[i] = random(.5, 2);
  }
}

void draw() {
  background(100);
  
  for (int i=0; i < num; i++) {
    
    //set origin at middle of sketch
    pushMatrix();
    translate(0, height/2);
    
    // draw rising rectangles
    noStroke();    
    fill(55,150,160);
    rect(x[i], y[i], 20, 20); 
    
    // draw falling rectangles
    fill(240,30,60);
    rect(x[i],-y[i],20,20);
    
    popMatrix();
    
    // set variables speed
    y[i] = y[i] + speed[i];
    if (y[i] > height) {
      y[i] = 0; 
    } 
  } 
}



