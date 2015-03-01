
void setup (){
  print(50);
  size(600,400);
}


void draw() {
  background(255); 
 for(int i = 0; i<10000; i++){
  point(random(width), random(height));
 
}
}
