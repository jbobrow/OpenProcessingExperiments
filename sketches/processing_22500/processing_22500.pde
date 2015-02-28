
// generate multiple circles 



size ( 500, 600); 
background( 255,255,255); 
smooth(); 


// we use the "for" command to create a loop
for ( int i = 0; i < 20; i = i + 1) {

  noStroke(); 
  fill ( 0, random (10), random(40)); 
  ellipse ( random(width),random(height), 200, 200); 


}

// we use the "for" command to create a loop
for ( int i = 0; i < 200; i = i + 1) {

  noStroke(); 
  fill ( 255, random (255), random(100)); 
  ellipse ( random(width),random(height), 40, 40); 
}



 saveFrame("generativeCirces-001.tif"); 


