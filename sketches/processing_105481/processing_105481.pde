
PImage img;
float offset = 0;
float easing = 0.05; 
float h=15;
void setup() {
  size(589,900);
  colorMode(HSB);
  size(589, 900);
  img = loadImage("coolsketch.jpg");  // Load an image into the program 
}
void draw() {
  if(!mousePressed){
  int dis = 30;
  for  (int i=0; i<589; i+=dis) {
    for  (int m=0; m<900; m+=dis) {
    noStroke();
      float distance = abs(mouseX-i);
      
      fill (distance);
      fill(random(0,222),225,225);
     ellipse(i, m, h, h);
     }
   }
  }
   else{
     int dis = 30;
  for  (int i=0; i<589; i+=dis) {
    for  (int m=0; m<900; m+=dis) {
    noStroke();
      float distance = abs(mouseX-i);
      
      fill (distance);
      fill(random(0,222),225,225);
       rect(i,m,h,h);
      }
    }
  }
 image(img, 0, 0);  // Display at full opacity
  float dx = (mouseX-img.width/2) - offset;
  offset += dx * easing; 
  tint(255, 126);  // Display at half opacity
  image(img, offset, 0);
}




