
/*
Artistic statement:
During our life journey, we make make impressions whether we intended
that or not, the impression that we make willingly are more outlined
but the unintended ones are a bit transparent, but still both of them
are glowing dust that determine our journey until we all fade away back
to dust.
//technicals of the sketch

pressing the mouse creates circles with strokeweight (which is an intended impressions)
,while moving the mouse creates two transparent circles inside each other (unintended impressions )

resources
http://cs.smith.edu/dftwiki/index.php/Creating_a_trail_of_moving_object_in_Processing
Images
http://pixabay.com/en/michelangelo-abstract-boy-child-71282/
http://pixabay.com/en/bokeh-out-of-focus-black-white-499506/
*/

// Golbal variables 
PImage img;
PImage cir;
color[]cute = {#D9CEB2, #948C75, #D5DED9, #7A6A53, #99B2B7};
color[]ocean = {#00A0B0, #6A4A3C, #CC333F, #EB6841, #EDC951};
float d = random (30,200);

// Setup
void setup (){
  size (1200, 700);
  background(#9B9B9B);
  smooth();
 img = loadImage("hope.jpg");
 cir = loadImage("cir.jpg");
 image (img,0,0);
 // trasnperant image 
 tint(255,127);
 image (cir,0,0);
frameRate(5);
}
// draw circles and adding blur
 void draw () {
   filter( BLUR,1 );
   noStroke();

 // fill with random colors , low opacity; the ellipse in the center 
 // change color of ellipse paint depending on mouse button
      if (mousePressed)  {
                    stroke(cute[int(random(0, 5))]);
                    fill(cute[int(random(0, 5))], 30);
                    strokeWeight(random(1, 3));
                     }
                else { 
                      fill(ocean[int(random(0, 5))],50);
                       noStroke();
                       fill(ocean[int(random(0, 5))], 50);
                      ellipse(mouseX, mouseY, d/2, d/2);
                }
   // draw an ellipse where the mouse is located
     fill(cute[int(random(0, 5))],60 );
     ellipse(mouseX, mouseY,d , d);
   }
   // Random ellipses sizes  
void mousePressed() {
   d = random(50, 100);
   
}

