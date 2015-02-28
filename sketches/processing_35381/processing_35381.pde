



// homework 1

// copyright Carl Bajandas 2011 Pittsburgh, PA

size      (400, 400);
background(100);

                 // this is the F 
smooth();
beginShape();
strokeWeight(10.0);
strokeJoin(ROUND);
fill(50);
vertex(160, 125);
vertex(160, 270);
vertex(200, 270); 
vertex(200, 225);
vertex(235, 225);
vertex(235, 195);
vertex(200, 195);
vertex(200, 165);
vertex(260, 165);
vertex(260, 125);
vertex(160, 125);
endShape();


                // this is the B
noStroke();
fill(204, 102, 0);
arc   (325, 150, 80, 59, TWO_PI-PI/2, TWO_PI);
arc   (325, 150, 80, 60, 0, PI/2);
arc   (325, 230, 110, 110, TWO_PI-PI/2, TWO_PI);
arc   (325, 230, 110, 90, 0, PI/2);
rect  (275, 120.5, 50, 154.5);
fill  (100);
arc   (310, 150, 40, 25, TWO_PI-PI/2, TWO_PI);
arc   (310, 150, 40, 30, 0, PI/2);
arc   (310, 227, 60, 45, TWO_PI-PI/2, TWO_PI);
arc   (310, 227, 60, 40, 0, PI/2);


               // this is the C
fill(130, 40, 27);
smooth();
noStroke();
rect    (50, 119.5, 75, 55);
ellipse (120, 147, 55, 55);
rect    (50, 219.5, 75, 55);
ellipse (120, 247, 55, 55);
              // this is the back part of the C
ellipse (50, 197, 95, 156);
              // center of C (empty space)
fill    (100);
ellipse (80, 197, 60, 60); 
                
                
