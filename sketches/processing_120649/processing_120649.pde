
Ball balls[] = new Ball[1];
int timer;
float s;
PImage imgMac;

void setup() {
  size(500,400);
  smooth();
  imgMac = loadImage("Screen.jpg");
  frameRate(100);
  s = s + .001;
  balls[0] = new Ball(250, s, 250);
  timer = 0;
 
}

void draw() {
  background(0);
  image(imgMac,0,0);
  
  if ( timer % 100 == 0) {
    for (int i=0;i<balls.length;i++) {
      balls[i].throb();
      println("YOOOO");
    } 
}
for (int j=0;j<balls.length;j++) {
  balls[j].display();
  println("phase 1");
}
}




class Ball { 
  float time = 0.0;
  float increment = 0.01;
  float n;
  float amount[] = new float[3];
  float throb;
  float speed = 0;
  float R;
  float G;
  float B;
  float C;

Ball(float _n, float tempSpeed, float _0) {
n = _n;
speed = tempSpeed;
amount[0] = _0;

}
  
void display() {
    float n = noise(time)*width/2;
    time += increment + speed;
    C++;
   // R = random(150,150);
   // G = random(150,150);
   // B = random(150,150);
    fill(color(0,0,C));
    ellipse(250,200,n,n);
    print("CIRCLE");
}

void throb() {  
  if ( increment > .010){
    increment = .50;
    time = 0;
    print("throb");
    }

}
} 



