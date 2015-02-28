
/* Joseph Kotay. Practice Computational Methods. Professor Nick Senske. 9.04.2011
Homework 2.2.1 Parametric Forms and Shapes. Lighthouse at Sea.

For this sketch, I named variables that controlled the path of light beams from a lighthouse near the sea coast.
Also, I set the code so that the sea level can be adjusted up and down when the left mouse button is held and dragged
in the Y direction.  This is just a first iteration that I will explore further*/

void setup(){
  size(300,300);
  smooth();
  frameRate(10);
}

/* using Nick's parametris arch code example as a reference model, I start by assigning y values for the
starting top and bottom positions of the two light beam*/

int originBeam_top= 90;
int originBeam_bottom= 120;

int top_lightBeam = 60;
int bottom_lightBeam = 150;


// The water level starts at 20 px above the bottom of the skectch widow.

int seaLevel = 280;

void draw(){
background(220,40);
  
 /*I begin by first drawing just the static elements within my sketch (from top to bottom), which are  basic shapes that
 form a light house*/
 
 noStroke();
 fill(160,115,50);
 triangle(15 + width/3, 60, width/3 - 5, 90, 35 + width/3, 90);
 
 stroke(100,140,150);
 fill(140,170,180,85);
 rect(width/3, 90, 30, 30);
 
 // the main light source.
 
 noStroke();
 fill(240,240,160,97);
 ellipse(15 + width/3, 105, 30, 30);
 
 noStroke();
 fill(240,240,160);
 ellipse(15 + width/3, 105, 15, 15);
 
 fill(255);
 quad(width/3, 120, width/3 - 10, 240, 40 + width/3, 240, 30 + width/3, 120);

//  base of the lighthouse.

 fill(160,115,50);
 rect(width/3 - 10, 240, 50, 40);
 
// this shape represents the sea level.
 
 fill(170,215,230);
 rect(0, seaLevel, width, 3*height); // the distance from the top to the base of the rectangle is three times the height of the sketch.
 
 // this is for the ground plane.
  
 fill(50,70,75);
 beginShape();
 vertex(0, 250);
 vertex(0, height);
 vertex(width, height);
 vertex(width, height-15);
 endShape();

 

// light beams.

  noStroke();
  fill(240,240,160,95);
 
  /* Dragging the mouse in the X direction will increase or decrease the outer width of the light beams, as well as
  their directions.*/
 
 //top_lightBeam= mouseX - height/6 ;
// bottom_lightBeam= mouseX + height/2;
  
  quad(0, top_lightBeam, 0, bottom_lightBeam, width/3, originBeam_bottom, width/3, originBeam_top);
  quad(30+width/3, originBeam_top, 30+width/3, originBeam_bottom, width, bottom_lightBeam, width, top_lightBeam);
  
  //This makes the light beams expand on their own with the mouse.

 top_lightBeam --;
 bottom_lightBeam ++;
 
 // The sea level rises without the user controlling the mouse.
 
 seaLevel--;
    
}

/*void mouseDragged() {
  seaLevel= mouseY; // right click with mouse and hold to raise and lower sea level
  
}*/

