
float[] x = new float[100];
float[] y = new float[100];
float[] speed = new float[100];
float[] missle = new float[100];

void setup(){
  size(500, 400); //size of program
  background(0); //black screen
  stroke(255); //color of the points
  noCursor();
  
  int i = 0; 
  while(i < 100){
    x[i] = random(0, width);
    y[i] = random(0, height);
    speed[i] = random(1, 5);
    i++;
  }
}

void draw(){
  background(0);
  
 beginShape();
 stroke(1);
 triangle(mouseX, mouseY-12, mouseX, mouseY+12, mouseX+24, mouseY);
 fill(255, 0, 0);
 ellipse(mouseX, mouseY, 10, 10);

  int i = 0;
  while(i < 100){
    float co = map(speed[i], 1, 5, 100, 255);
    stroke(co);
    strokeWeight(speed[i]);
    point(x[i], y[i]);
  
    x[i] = x[i] - speed[i] / 1.5;
    if(x[i] < 0){
      x[i] = width;
    }
    i = i + 1;
  } 
}

void mouseClicked(){
  fill(255);
  int m = 0;
  point(mouseX[m], mouseY[m]); 
  
  missle = x[m] + speed[m] / 1.5;   
}

