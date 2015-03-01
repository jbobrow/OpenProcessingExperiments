
// A simple animated countryside landscape (a little bit a la Mario).
// The assignment focuses on abstract and random images, so I wanted to try and take the opposing view by doing 
// a "figurative" piece.
// It is a landscape with a glaring sun. The dynamic flashing is intentional, and can easily be stopped by the noLoop() function if you find it annoying.
// I based my work on the example given, as recommended.
// I had to fiddle to get one part stop looping while the other one would go on, it's probably not very elegant coding but anyway it works for this simple purpose.
// I also considered drawing some more stylized flowers and making them oscillate in the wind, but I rapidly understood that I did not have time enough to manage
// to do this.


// Define Color Palettes
color[] hotcolors = {#E39E00, #ED8E00, #D6680B, #ED4A00, #E32600};
color[] greens = {#185E12, #BCFFBA, #39DE2B, #325E2F, #2CAB21};
color[] varied = {#8CC247, #B617FF, #E80C95, #EF0DFF};

color[] palette_grass = greens;
color[] palette_sun = hotcolors;
color[] palette_flower = varied;

// Initialize the counter for grass leaves
float counter_grass = 0;

// Create setup code block
void setup(){
 // Window size for this assignment
 size(800, 600);
 // Background : blue sky
 background(#5B86FF);

 
     // A CLOUD : two ellipses
     // No need to fill or color anything, can be improved playing with other ellipses and arcs
   int x1 = 197; 
   int y1 = 116;
   int a1 = 278;
   int b1 = 99;
   ellipse(x1, y1, a1, b1);
   
   int x2 = 222; 
   int y2 = 103;
   int a2 = 159;
   int b2 = 75;
   ellipse(x2, y2, a2, b2);
   
   
     // A FLOWER : a line and three quadrangles
     // Definition of coordinates for easier tweaking :
     // AB is the stem
     // BC and BD are the base of the upper part  of the flower
     // E, F and G are three vertexes that drive the petals
   int xa = 500;
   int ya = 600;
   
   int xb = 523;
   int yb = 462;
   
   int xc = 499;
   int yc = 449;
   
   int xd = 548;
   int yd = 421;
   
   int xe = xc - int(random (25));
   int ye = yc - int(random (25));
   
   int xf = xb + int(random (-25, 25));
   int yf = yb - int(random (88));
   
   int xg = xd + int(random (25));
   int yg = yd - int(random (25));
   
     // Draw the stem
   strokeWeight(4);   
   stroke(palette_flower[0]);
   line (xa, ya, xb, yb);
   
     // Draw the three petals with quadrangles 
   strokeWeight(2);  
      // I don't want the petals and their edges to be the same color, but the stroke and the fill are taken randomly from the same color palette
      // so this test is needed beforehand
      int rand1 = int(random(1, 4));
      int rand2 = int(random(1, 4));
      while (rand2 == rand1){
        rand2 = int(random(1, 4));
      }   
   stroke(palette_flower[rand1]);
   fill(palette_flower[rand2]);
      // Petal 1 : CBDE
      quad(xc, yc, xb, yb, xd, yd, xe, ye);
      // Petal 2 : CBDF
      quad(xc, yc, xb, yb, xd, yd, xf, yf);
      // Petal 3 : CBDG
      quad(xc, yc, xb, yb, xd, yd, xg, yg);
} // End of setup / static mode


//Create the draw code block
void draw(){
        // THE GRASS : mutliple vertical green lines
 // Setup while loop counting up to 1000 (grass leaves)
 while(counter_grass < 1000){
   // Set stroke color to random green palette color
   stroke(palette_grass[int(random(0, 5))]);
   // Set stroke weight randomly
   strokeWeight(int(random(1, 4)));
   
   // Set line origin location to random of screen width
   float x1 = random(width);
   // Set line origin location to bottom of screen
   float y1 = 600;
   // There is no wind, the grass leaves are vertical
   float x2 = x1;
   // The leaves are of random length
   float y2 = y1 - random (2, 100);
   
   // Draw a line as a grass leaf
   line(x1, y1, x2, y2);

   // Change limiter count randomly between -1 and +2
   counter_grass += random(-1, +2);  
 }

         // THE SUN : a circle constantly regenerated and superimposed on itself
   // Resetting the counter IN the draw function that loops on itself :
   // allows for displaying a new object each time the max (900) is reached and loop indefinitely
   // (not 100% sure of my understanding of how it behaves though)
   // --> Initialization of the counter for sun flashes
   float counter_sun = 0; 
 // Setup while loop counting up to 900
 // Modifying this parameter will change the rate at which the sun "flashes" ; increase value for less eye stress (you could also choose more similar colors)
 // (I found out that it does nothing until that max is reached)
 while(counter_sun < 900){
   // Set stroke color to random orange palette color
   stroke(palette_sun[int(random(0, 5))]);
   // Set stroke weight randomly
   strokeWeight(int(random(1, 100)));   
   // Set fill color randomly from orange palette / Here I don't care if the stroke and the fill are chosen the same, because they change quickly
   fill(palette_sun[int(random(0, 5))]);
   
   // Draw the circle
   ellipse (750, 50, 200, 200);   
   
   // Change limiter count randomly between -1 and +2
   counter_sun += random(-1, +2);   
 }
}

