
void setup(){
  size(600, 600);
}
void draw(){
  //do this 10 times
 for (int i = 1; i <=500; i++) {
   noStroke();
   smooth();
   fill(100, mouseX, mouseX, 75);
   ellipse(random(height), i+mouseY, 15, 300);
 }
 
 for(int j = 1; j <=400; j++) {
   noStroke();
   smooth();
   fill(mouseX, mouseY, 20, 30);
   ellipse(random(width), j+mouseX, 200, 20);
 }
 
  
}
