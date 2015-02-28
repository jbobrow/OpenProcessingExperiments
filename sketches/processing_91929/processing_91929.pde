
int num = int(random(10,30));
int arrNum[] = new int [num];
int x[] = new int [num];
int y[] = new int [num];
int targetX[] = new int [num];
int dx[] = new int [num];
int dy[] = new int [num];
float easing[] = new float [num];
 
void setup() {
size(300,600);
background(0,0,0);

}
 
void draw() {
 fill(255,0,164);
 
  for (int i= 0; i < arrNum.length; i++) {
  stroke(0,0,0);
  rect(x[i],y[i],10,10);
   
  targetX[i] = mouseX;
  dx[i] = targetX[i] - x[i];
  if (abs(dx[i]) > 1) {
  x[i] += dx[i] *easing[i];
  }
  
 
 if (abs(dy[i]) > 1) {
  y[i] += dy[i] *easing[i];
   
  }
   
}
}
 
void mousePressed(){
if (mouseButton == LEFT){
noLoop();
}
 
if (mouseButton == LEFT) {
  for (int i= 0; i < arrNum.length; i++) {
  x[i] = int(random(4,width));
  y[i] = int(random(4,height));
  easing[i] = .03;
  num = int(random(10,20));
   
  loop();
  }
   
  }
}
