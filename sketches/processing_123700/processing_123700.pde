
void setup(){
  size(400,150);
}
int i=0;
void draw(){
  background(200);
  line(i%400,0,i%400,150);
  i++;
  stroke(random(200),random(200),random(200));
  strokeWeight(5);
}



