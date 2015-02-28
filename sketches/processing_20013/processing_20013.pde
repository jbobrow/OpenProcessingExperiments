
void setup (){
  size(600, 600);
  smooth();
  rectMode(CENTER);
  colorMode(RGB, 100,100,100);
  background(100);
}
 
 void CDC (int x, int y){
   noStroke();
  fill(random (0,100),random (0,50),random(0,25),random (0,40));
  rect(x += random(-125,125), y += random(-125,125), random(10,50), random(10,50));
  strokeWeight(1);  
  stroke(random (0,20),random (0,60),random (0,100));
    line(x += random(-80,80), y += random(-80,80),x += random(-80,80), y += random(-80,80));
 }

 
void draw (){
  
  for (int x = 150; x < width; x += 300){
    for ( int y = 150; y < height; y += 300){
    CDC ( x, y );
  }
 }
} 

