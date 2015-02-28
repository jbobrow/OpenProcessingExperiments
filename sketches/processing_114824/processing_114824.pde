
float y=400;
void setup() {
  size(400, 400);
  smooth();
}
void draw() {
  background(29, 170, 179);
  stroke(229, 124, 100);
  strokeWeight(2);
  for (int a = 0; a <= width; a = a + 20) {
    line(a, 0, mouseX, mouseY);
    line(a, height, mouseX, height-mouseY);
      }
      
   for (int i=0; i<=width; i= i+30){
     line(i, 0, mouseX, mouseY);
     line(i,0, i, mouseY);
     
   for (int c = 1; c <=width; c = c + 50) { //bob+=mouseY
   noFill();
   stroke(255);
   strokeWeight(.1);
   ellipse(200, random(width), 10, 10);
   ellipse(45, random(width), 10, 10);
   ellipse(135, random(width), 10, 10);
   ellipse(265, random(width), 10, 10);
   ellipse(355, random(width), 10, 10);

frameRate(20);
    y = y - 1; 
  if (y < 0) { 
    y = height; 
  } 
  line(0, y, height, y);  
   }
   }
}
