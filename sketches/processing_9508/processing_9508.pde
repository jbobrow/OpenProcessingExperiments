
/**
 * Width and Height (processing examples) modified by kh.  
 */
 
size(400, 400);
background(127);
noStroke();
smooth();
for(int i=0; i<height; i+=20) {
  
  fill(0);                                      //schwarz, spitze rechts oben
  triangle(0, i, 0, i+10, width, 10);
  fill(255);                                       //weiß, spitze rechts oben
  triangle(i, height, i+10, height, width, 0);
  
  fill(255);                                      //weiß, spitze links unten
  triangle(i, 0, i+10, 0, 10, height);
  fill(0);                                        //schwarz, spitze links unten
  triangle(width, i, width, i+10, 0, height);  
 
  fill(255);                                      //weiß, spitze rechts unten
  triangle(height, width, 0, i, 0, i+10);
  fill(0);                                      //schwarz, spitze rechts unten
  triangle(width, height, i, 0, i+10, 0);
  
  fill(255);                                        //weiß, spitze links oben
  triangle(width, i, width, i+10, 0, 10);
  fill(0);                                        //schwarz, spitze links oben
  triangle(i, height, i+10, height, 10, 0);
  
}

