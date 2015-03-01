
void setup() {
  size(600, 600);
  background(255);
 
}
 
void draw() {
  for (int i = 0; i < width; i = i+ 25) {
  fill(255,0,255);
  line(0, i,600, i);
}
  for (int i = 0; i < height; i = i+40){
  fill(255,0,0);
    rect(0,i,50,600);
  
  }
  
  for (int i = 0; i < width; i = i+ 60){
    fill(random(255),random(255),random(255));
   ellipse(25,i,20,20);
  
  }
  
 
}
