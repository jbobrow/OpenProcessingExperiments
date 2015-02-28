
/**
 * Random. 
 * 
 * Random numbers create the basis of this image. 
 * Each time the program is loaded the result is different. 
 */
 

 
size(400, 400);



smooth();
colorMode(HSB);
background(255);
strokeWeight(25);

translate (200,200);

for(int i = 0; i < width; i++) {
  stroke  (random(150), random(200), random (255));
  float x = random(300, 300); 
  line(i, 0, x, height);
  rotate (radians (25));
  
}

  

