
float pelota = 1;
void setup() {
background(20,150,180);
  size(600,600);
}
void draw() {
 
  line(width,height,width/2,height/2);
  pelota = pelota +1;
  ellipse(pelota, 100, 10, 10);
}
