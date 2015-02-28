
PImage tranquis;
PImage pira;

void setup(){
  size(500,500);
  background(255);
  smooth();
  tranquis = loadImage("tranquilo.png");
  pira = loadImage("pira.jpeg");
  photoFilter();
}
  
  void draw(){
    for( int i = 0; i < 1000; i++){
    int x = int(random(width));
    int y = int(random(height));
    color cp = tranquis.get(x,y);
    float b = brightness(cp);
    // stroke(random(255), random(255), random(255), 15);
    
    if(b == 0){
      stroke(0, 0, 0, 5); // dots
      rect(x, y, 1.5, 1.5);
     stroke(255,56,67,5); // red lines
      line(500, 500, x, y);
       stroke(70,130,180, 5); // blue lines
      line(0, 0, x, y);
       stroke(46,139,87, 5); // green lines
      line(500, 0, x, y);
       stroke(255,215,0, 5); // yellow lines
      line(0, 500, x, y);
       /* stroke(255,56,67, 1); // red
      line(500, 250, x, y);
      stroke(70,130,180, 1); // blue
      line(0, 250, x, y);
      stroke(255,215,0, 1); // yellow
      line(250, 0, x, y);
      stroke(46,139,87, 1); //green
      line(250, 500, x, y);*/
      
      fill(0,0,0,1.5);
   noStroke();
  rect(0, 0, 500, 86);
  
  fill(0,0,0,1.5);
   noStroke();
  rect(0, 408, 500, 500);
    }
}
}

void photoFilter(){
  
   pira. loadPixels(); // without pira, will load screen
  int piraSize = pira.width * pira.height; // # of pixels

    for(int j = 0; j < piraSize; j++){
  color cp = pira.pixels[j];
  float h = hue(cp);
  float s = saturation(cp);
  float b = brightness(cp);
  pira.pixels[j] = color(120, s+70, 20);
  pira.pixels[j] = color(h+70, 30, b+50);
} 
  

 
 // I wanted the image to change filter when the mouse was positioned in the upper or upper rectangle but I just couldn't 
/*if(mouseX > 0 && mouseX < 500 && mouseY > 0 && mouseY < 86) {
  for(int j = 0; j < piraSize; j++){
  color cp = pira.pixels[j];
  float h = hue(cp);
  float s = saturation(cp);
  float b = brightness(cp);
  pira.pixels[j] = color(100, s+30, b+50);
  pira.pixels[j] = color(100, 100, b+40);
}
} else {
  if(mouseX > 0 && mouseX < 500 && mouseY > 408 && mouseY < 500) {
  for(int j = 0; j < piraSize; j++){
  color cp = pira.pixels[j];
  float h = hue(cp);
  float s = saturation(cp);
  float b = brightness(cp);
  pira.pixels[j] = color(100, 78, b+50);
  pira.pixels[j] = color(100, 100, b+40);
  }
}
*/
pira.updatePixels();
image(pira, 0, 86);
}  

 
/*this doesnt work as well
if(mousePressed){
    image(pira, 0, 86);
    photoFilter();
  }
*/

