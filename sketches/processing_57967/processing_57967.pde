
void setup(){
    background(255);
  size(800,800);
  smooth();
  colorMode(HSB,360,100,100);
  
  stroke(0,120);
 
}
void draw(){
  float d = random(50);
  fill(random(360),random(160),random(60),random(30));
   strokeWeight(0);
    noStroke();
 triangle(400,0,400,400,random(800),random(800));
  triangle(random(800),random(800),400,400,400,800);
   triangle(0,400,random(800),random(800),400,400);
  triangle(800,400,random(800),random(800),400,400);
 
}

