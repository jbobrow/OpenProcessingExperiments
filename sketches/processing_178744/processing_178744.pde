
void setup () {
  size(640, 480);
  background(0);
  rectMode(CENTER);
}



void draw () {
  background(0);
  translate(width/2, height/2);
  float zoom = map(mouseX, 0, width, 0.8, 4.5);
  scale(zoom);
  
  fill(169,220,230);
  rect(0,-140,1200,340); // sky
  
  fill(24,136,67);
  rect(0,140,1200,340); // grass
  
  
  fill(198,195,181);
  rect(0,6,50,40);  // house (walls)
  
  fill(70,66,42); 
  rect(0,15,10,20); // door
  
  fill(145,204,208);
  rect(-15,8,10,13); // window
  rect(15,8,10,13);  // window
  
  stroke(25,15,87,70);
  fill(196,48,48);
  triangle(0,-50,-30,-10,30,-10);  // roof
  
}background(0-12)


