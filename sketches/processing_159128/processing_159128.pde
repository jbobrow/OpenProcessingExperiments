
void setup() {
size(1000, 800);
}
void draw() {
  background(108);
  for (int x = 0; x<1000; x=x+10) {
for (int y = 0; y<800; y=y+10) {
 fill(x,y,204);
  float distancia =dist(mouseX,mouseY,x,y);
   if(distancia<100){
     ellipse(x, y, 5, 5);
  }
  }
}
}

