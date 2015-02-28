
color[] chocoberry = (#FFCDC0, #550702, #EF215B);
color[] palette = chocoberry;
float limiter = 0;

void setup(){
 size(600, 200);
 background(palette[0]);
 smooth();
 strokeWeight(10);
 noFill();
 frameRate(10);
}

void draw(){
 while(limiter < 75){
  stroke(palette[int(random(1, 3))]);
  float x = random(width);
  float y = random(height);
  float d = random(0, 200);
  ellipse(x, y, d, d);
  limiter += random(-3, +5);
 }
}
