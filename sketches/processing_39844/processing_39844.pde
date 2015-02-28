
int num = 100;                           //sets 100 variables
float[] x = new float[num];                     
float[] y = new float[num];
float[] speed = new float[num];          //sets speed

void setup() {                       
  size(300, 300);
  smooth();
  stroke(255);
  for (int i=0; i < num;i++) {            //loops variables
    x[i] = random(0,300);
    y[i] = height/2;
    speed[i] = random(0.5, 1);              
  }
}

void draw() {
  background(0);
  for (int i=0; i < num; i++) {            //draws arc
    fill(17,150,150,15);
    arc(x[i], y[i],250,150,radians( x[i]),radians( y[i]+75)); 
    y[i] = y[i] + speed[i];
  }
}


