
//size (1280,720); // 16:9 = 1.77777778
size (900,227); // set up window size
background (255);  // define background color
smooth(); // define the render to be smooth (anti-alias)

noStroke();
for ( int i = 0; i < 100000; i = i +1)
{
strokeWeight(random(5));
stroke(0);
point ( random(width), random(height) );
} 

                
                                
