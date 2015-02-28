
void setup() {
  
  size(400,400);
  loadPixels();
  
}


 void draw() {
   
   for (int i = 0; i < pixels.length; i++) {
//   
//     float r = random(255);
//     float g = random(255);
//     float b = random(255);
//   
   
  
     pixels[i] = color(random(255), random(255), random(255));
     
   }
   
   updatePixels();
   
 }
