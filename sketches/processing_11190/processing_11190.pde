
/** 
* Ribbon Study 1
* Code Series
* Sarah Greenberg, 2010
*/

// Declaring global variable
int objectCount;
float[] x;
float[] y;
float[] speedX;
float[] speedY;
float[] accel;
color[] cols;
float[] sw;


void setup(){
  size(600, 600);
  background(255);
  smooth();
  
  // initializing variables
  objectCount = 500;
  x = new float[objectCount];
  y = new float[objectCount];
  speedX = new float[objectCount];
  speedY = new float[objectCount];
  accel = new float[objectCount];
  cols = new color[objectCount];
  sw = new float[objectCount];

  // specifying values
  for (int i=0; i<objectCount; i++){
    x[i] = width/2;
    y[i] = height/2;
    speedX[i] = random(-3, 3);
    accel[i] = random(-.07, .07); 
    cols[i] = color(random(255), random(255), random(255), random(5));
    sw[i] = random(.5, 25);
  }

  int t = 0;
  while(t<100){
    for (int i=0; i<objectCount; i++){
      strokeWeight(sw[i]);
      stroke(cols[i]);
      point(x[i], y[i]);
      x[i]+=speedX[i];

      speedY[i]+=accel[i];
      y[i]+=speedY[i];
    }
    t+=1;
  }

}

void draw(){
}

void mousePressed(){
  save(this.args[3]+"_"+year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second());
}






