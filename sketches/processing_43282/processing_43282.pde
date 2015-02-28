
PImage img;                              
int num = 80;                           //sets 100 variables
float[] x = new float[num];                    
float[] y = new float[num];
float[] speed = new float[num];          //sets speed

void setup() {  
  img = loadImage("Sky.jpg");            //load image
  size(300, 300);
  smooth();
  for (int i=0; i < num;i++) {            //loops variables
    x[i] = random(5,355);
    y[i] = height/4;
    speed[i] = random(1.0, 2.5);        
  }
}
 
void draw() {
  background(0);
  noStroke();
  image(img,0,0);
  for (int i=0; i < num; i++) {            //draws arc
    fill(25,100,150,40);                   //colour and transparency
    arc(x[i], y[i],7,15,degrees( x[i]),degrees( y[i]+75));
    y[i] = y[i] + speed[i];
  }
}


