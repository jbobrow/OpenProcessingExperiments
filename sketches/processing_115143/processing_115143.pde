
void setup() {
  size(300,300);
}
void draw() {
  background (0);
  if (mouseX>width/2)
  for (int a=0; a<=height; a+=30){
      fill (1*a);
      ellipse (a,a+mouseY,30,30);
  }
  if (mouseY<height/2)
    for (int b=0; b<=width; b+=30){
      fill (1*b);
      ellipse (b,b+mouseY,30,30);
    }
}
