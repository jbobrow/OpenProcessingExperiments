
size (510, 510);
background (255);
rectMode(CENTER);
 
float space =  5;
 
background(255);
smooth();
 
for (float x = 0; x < width; x = x + random(0,4)) {
  for (float y = 0; y < height; y = y + random(0,100)) {
      noStroke();
  fill(0);
  rect(x, y, 3,20 );
  
  }
}
 

