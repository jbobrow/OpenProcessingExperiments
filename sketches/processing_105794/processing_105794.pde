
float speedX;
float speedY;
int px;
int py;
int nx, ny;



void setup() {
  size(1024, 576); 
}

void draw() {
 
speedX = nx-mouseX;
speedY = ny-mouseY; 

px = nx;
py = ny; 

int threshold = 100;

if(swiped){
if (speedX>threshold) {
  println("Swipe Right "+frameCount);

}
if (speedX<-threshold) {
  println("Swipe Left "+frameCount);

}
if (speedY>threshold) {
  println("Swipe Down "+frameCount);

}
if (speedY<-threshold) {
  println("Swipe Up "+frameCount);

}

}
}
