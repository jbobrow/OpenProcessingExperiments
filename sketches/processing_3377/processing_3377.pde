
PImage casota; 
 
void setup(){ 
  casota = loadImage("casota.JPG");
  size(casota.width, casota.height);
  noStroke(); 
  colorMode(HSB, 80); 
  smooth(); 
  noLoop(); 
} 
void draw(){ 
  int spacer = 2;  
  for(int y = 0; y < height; y += spacer){ 
    for(int x = 0; x < width; x += spacer){ 
      color c = casota.get(x,y); 
      pincelote(x, y, c,spacer); 
    }}} 
 
void pincelote (float x, float y, color c, float bro){ 
  int puntos = round(random(10,20)); 
  for(int i = 0; i <= puntos; i++){
    float h = hue(c) + random(10, -20);
    float s = saturation(c) + random(255);
    float b = brightness(c) + random(5, 30);
    pushMatrix(); 
    translate(x,y); 
    fill(h/1.1,s/1.1,b/1.1);
    float zise = random(2, bro/2); 
    ellipse(random(-bro, bro),random(-bro, bro), zise, zise); 
    popMatrix(); 
  } 
} 
void keyPressed(){ 
  redraw();  
} 

