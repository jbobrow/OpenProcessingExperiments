
void setup(){
  size (500, 500);
  background (0);
}


void draw(){
  strokeWeight(2);
  stroke(29, 194, 222);
  for (int a= 10; a<height; a+=30){
  line(width, 0, -a,height);
  }
  stroke(4);
  stroke(55, 150, 155, 60);
  for (int a= 10; a<height; a+=30){
  line(0, 0, a, width);
}
}


