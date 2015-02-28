
float [] x = new float[300];
float [] y = new float[300];
float [] xv = new float[300];
float [] yv = new float[300];
float speed;
float d;
float vel;
int k;
vel=1;


 
void setup() {
  size(500, 500);
  smooth();
  
   for (int i=0; i<300; i++){
      x[i]=250;
      y[i]=250;
      speed=random(4-2);
      d=random(2*PI);
      xv[i]=cos(d)*speed;
      yv[i]=sin(d)*speed;
     
    }
    stroke(255);
    strokeWeight(5);
    }
    
void draw() {
  background(0);
  strokeWeight(2);

    
  for (int i = 0; i < 300; i++) {
    point(x[i],y[i]);
    x[i]+=xv[i]*vel;
    y[i]+=yv[i]*vel;
    if (x[i]>500) {xv[i]=-xv[i];}
    if (x[i]<0) {xv[i]=-xv[i];}
    if (y[i]>500) {yv[i]=-yv[i];}
    if (y[i]<0) {yv[i]=-yv[i];}

  }
  strokeWeight(1);
 noFill();
  stroke(100);
   arc(50, 50, 50, 50, PI, 2*PI);
   line(50,50,50,25);
   line(25,50,75,50);
  stroke(255);
  float p;
  p=((vel+3)/6)*PI;
  
  line(50,50,50-(cos(p)*25),50-(sin(p)*25));
  fill(120);
  text ("\"[\" to slow down\n \"]\" to speed up", 25, 65);
  
  
}


void keyPressed() {
   if (key == ']') {vel=constrain(vel+.1,-3,3)}
   if (key == '[') {vel=constrain(vel-.1,-3,3)}
 }
