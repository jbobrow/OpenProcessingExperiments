
void setup () {
size(800,500);
background (59, 248, 252); 
}
void draw () {
  stroke (255, frameCount % 255);
  stroke (174, 221, 60);
    line(random(width), random(height),
   random(width),random(height));
   strokeWeight (18);
     stroke (255, frameCount % 255);
  stroke (245, 252, 59);
    line(random(width), random(height),
   random(width),random(height));
   strokeWeight (18);
   stroke (240, 140, 235);
    line(random(width), random(height),
   random(width),random(height));
   strokeWeight (18);
     stroke (59, 248, 252);
    line(random(width), random(height),
   random(width),random(height));
   strokeWeight (18);
 }
 


