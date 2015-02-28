
int num = 0;
int P = 5;
float[] x = new float[num]; 
float[] y = new float[num];


void setup() {
   colorMode(HSB);
 // float xxxx = random (255);
  background (0);
  size(800, 800);
  frameRate(50);
  stroke(255);
  smooth();
  fill(255, 50);
  //loop through array, assigning initial values
  for (int i=0; i<num; i++){
    x[i]= random(800);
    y[i]= random(800);
  }
} 
void draw() {
  


  //loop through array
  for (int i=0; i<num; i++){
    //move ellipses back on screen if they go off edge
    if (x[i] > width+50) {
      x[i] = -50;
    }
    //add one to x location
    x[i]++; 
    //draw shape
    float zp= random (255);
    strokeWeight(5);
    
    float xxx = random (255);
    stroke(xxx, xxx, xxx);
    ellipse(x[i], y[i], 20,20);
  }
  float zz= random (255);
// int P = 5;
  for (int i=0; P<num; P++){
    fill(zz, zz, zz);
  ellipse(400,400, P, P);
  }
}


void mousePressed() {
  //if mouse is pressed add a new element to array
  num++;
  x = append(x,mouseX);
  y = append(y,mouseY);
}

