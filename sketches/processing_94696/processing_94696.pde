
int s = 20;
color c = color(255, 255, 255);
PVector[] array = new PVector[s];
void setup() {
  size(600, 600);
  for(int i = 0; i < s; i++) {
    array[i] = new PVector(mouseX, mouseY);
  }
  noCursor();
}
void draw() {
  background(0);
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, s, s);
  fill(c);
  array[0] = new PVector(mouseX, mouseY);
  for(int i = 1; i < s; i++) {
   if(dist(array[i].x, array[i].y, array[i-1].x, array[i-1].y)>s) {
    array[i].x +=sin(atan2(array[i-1].x-array[i].x, array[i-1].y-array[i].y))*4-i/5;
    array[i].y +=cos(atan2(array[i-1].x-array[i].x, array[i-1].y-array[i].y))*4-i/5;
   }
   if(i < 5) {
     fill(255, 0, 0);
   }
   else{
     if(i < 10) {
       fill(0, 255, 0);
     }
     else {
       fill(0, 0, 255);
     }
   }
    ellipse(array[i].x, array[i].y, s, s);
  }
}
