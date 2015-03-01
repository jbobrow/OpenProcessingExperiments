
/* EXERCISE 4 - POKE, RUB, TICKLE

Create a sketch that responds to one or more of the following kinds of user input:
"poke": short, sharp press
"rub":  sustained press with continuous motion
"tickle": rapid, repeated rubbing

Your sketch should:
- encourage exploration and interaction
- respond in an engaging, surprising, and/or delightful manner. 
Use image and sound to effectively indicate affordances, provide feedback, 
and communicate state. Explicit or written instructions are not to be used. 
The most successful sketches will create a satisfying experience that invites 
sustained and/or repeated interaction.

*/

/* -- SET UP GLOBAL INTEGERS -- */

float h = 0;  //set hue
float s = 0;  //set saturation
float b = 255;  //set brightness
float a = 0;  //set alpha/transparency

float bdiam = 50; //default  diameter of blue circle
float bscalar = bdiam; //defines scale of size variation
float lbdiam = 75; //default diameter of light blue circle
float lbscalar = 40; //defines scale of size variation
float cdiam = 60; //default diameter of chartreuse circle
float cscalar = cdiam; //defines scale of size variation

//VARIABLES FOR CLICK AREAS
int diam = 75;

boolean blue = false;
float bclickXL = (640/4) - (diam/2);
float bclickXR = (640/4) + (diam/2);
float bclickYT = ((360/3) * 2) + (diam/2);
float bclickYB = ((360/3) * 2) - (diam/2);

boolean lightblue = false;
float lbclickXL = ((640/4) * 2)  - (diam/2);
float lbclickXR = ((640/4) * 2) + (diam/2);
float lbclickYT = ((360/3) * 2) + (diam/2);
float lbclickYB = ((360/3) * 2) - (diam/2);

boolean chartruese = false; //chartreuse is actually purple...
float cclickXL = ((640/4) * 3)  - (diam/2);
float cclickXR = ((640/4) * 3) + (diam/2);
float cclickYT = ((360/3) * 2) + (diam/2);
float cclickYB = ((360/3) * 2) - (diam/2);

//VARIABLES FOR NOISE CIRCLES
int space = 15; //spacing for lines of circles
int n = 50;
int x ;
float y = .05;
float noiseY;


void setup() {
  frameRate(10);  
  size(640, 360); //define the canvas/window size
  smooth();
  noStroke();
  colorMode(HSB);
}


void draw() {
  background(0, 0, 255, 0); //set background to white
    
  /* BLUE CIRCLES ------------------------------ */
    
    //blue line of circles
    if( blue == true ) { //if mouse is pressed in the blue circle area
      
      //draw pulsing blue line of circles
      for( int i = x; i <= width; i = i + space) {
         h = 145;
         s = 255;
         b = 255;
         a = 50;
         fill (145, s, b, a); //define color
         y = y + .04; //control noise variation
         noiseY = noise(y) * bdiam; //add Perlin Noise variation for organic-ness
         ellipse( i, height/3, noiseY, noiseY); //draw circle
       }
       
       //draw outlined static blue circle
       h = 145;
       s = 255;
       b = 255;
       a = 255;
       stroke(h, s, b, a); //define stroke color
       noFill();
       ellipse(width/4, (height/3) * 2, bdiam, bdiam); //draw circle
       noStroke(); //remove stroke
       
       //draw solid static light blue circle
       h = 135;
       s = 255;
       b = 255;
       a = 255;
       fill(h, s, b, a); //define fill color
       ellipse((width/4) * 2, (height/3) * 2, bdiam, bdiam); //draw circle
       
       //draw outlined static purple circle
       h = 200;
       s = 255;
       b = 255;
       a = 255;
       fill(h, s, b, a); //define fill color
       ellipse((width/4) * 3, (height/3) * 2, cdiam, cdiam); //draw circle
    } 
    
   /* LIGHT BLUE CIRCLES ------------------------------ */
    
    //light blue line of circles
    else if( lightblue == true ) { //if the light blue circle area is pressed do this
      
      //draw pulsing light blue line of circles
      for( int i = x; i <= width; i = i + space) {
           h = 135;
           s = 255;
           b = 255;
           a = 50;
           fill (135, s, b, a); //define color
           y = y + .04; //control noise variation
           noiseY = noise(y) * bdiam; //add Perlin Noise variation for organic-ness
           ellipse( i, height/3, noiseY, noiseY); //draw circle
       }
       
       //draw outlined static light blue circle
       h = 135;
       s = 255;
       b = 255;
       a = 255;
       stroke(h, s, b, a); //define stroke color
       noFill();
      ellipse((width/4) * 2, (height/3) * 2, bdiam, bdiam); //draw circle
       noStroke(); //remove stroke
       
       //draw solid static blue circle
       h = 145;
       s = 255;
       b = 255;
       a = 255;
       fill(h, s, b, a); //define fill color
      ellipse(width/4, (height/3) * 2, bdiam, bdiam); //draw circle
       
       //draw solid static purple circle
       h = 200;
       s = 255;
       b = 255;
       a = 255;
       fill(h, s, b, a); //deine fill color
      ellipse((width/4) * 3, (height/3) * 2, cdiam, cdiam); //draw circle
    } 
   
   /* PURPLE CIRCLES ------------------------------ */
    
    //Purple line of circles
    else if( chartruese == true ) { //if the chartruese (purple) circle area is clicked
      
      //draw pulsing purple line of circles
      for( int i = x; i <= width; i = i + space) {
         h = 200;
         s = 255;
         b = 255;
         a = 50;
         fill (200, s, b, a); //define fill color
         y = y + .04; //control noise variation
         noiseY = noise(y) * bdiam; //add Perlin Noise variation for organic-ness
         ellipse( i, height/3, noiseY, noiseY); //draw circles
       }
       
       //draw outlined static purple circle
       h = 200;
       s = 255;
       b = 255;
       a = 255;
       stroke(h, s, b, a); // define stroke color
       noFill(); //remove fill
       ellipse((width/4) * 3, (height/3) * 2, cdiam, cdiam); //draw circle
       noStroke(); //remove stroke
    
       //draw solid static light blue circle
       h = 135;
       s = 255;
       b = 255;
       a = 255;
       fill(h, s, b, a); //remove fill
       ellipse((width/4) * 2, (height/3) * 2, bdiam, bdiam); //draw circle
       
       //draw solid static blue circle
       h = 145;
       s = 255;
       b = 255;
       a = 255;
       fill(h, s, b, a); //deine fill color
       ellipse(width/4, (height/3) * 2, bdiam, bdiam); //draw circle
    } 
    
    /* STATIC STATE ---------------------------------- */
    
    else { //if none of the areas have been clicked on, draw this
      
      //draw static gray line of circles
      for( int i = x; i <= width; i = i + space) {
         h = 0;
         s = 0;
         b = 60;
         a = 100;
         fill (145, s, b, a); //define fill color
         ellipse( i, height/3, 5, 5); //draw circles
       }
       
       //draw pulsing blue circle
       h = 145;
       s = 255;
       b = 255;
       a = 255;
       fill (h, s, b, a); //define fill color
       ellipse(width/4, (height/3) * 2, bdiam, bdiam); //draw ellipse
       bdiam = (sin(bdiam) * bscalar); //reassigns diameter variation
       
       //draw pulsing light blue circle
       h = 135;
       s = 255;
       b = 255;
       a = 255;
       fill (h, s, b, a); //define fill color
       ellipse((width/4) * 2, (height/3) * 2, lbdiam, lbdiam); //draw ellipse
       lbdiam = (sin(lbdiam) * lbscalar); //reassigns diameter variation
       
       //draw pulsing purple circle
       h = 200;
       s = 255;
       b = 255;
       a = 255;
       fill (h, s, b, a); //define fill color
       ellipse((width/4) * 3, (height/3) * 2, cdiam, cdiam); //draw ellipse
       cdiam = (sin(cdiam) * cscalar); //reassigns diameter variation
    }

     
    /* FRAME BORDER ----------------------------- */
     h = 0;
     s = 0;
     b = 60;
     a = 100;
     noFill(); //remove fill
     stroke (145, s, b, a); //define color (gray)
     strokeWeight(1); //add stroke
     rect( 20, 20, width-40, height-40); //draw rectangle
     noStroke(); //remove stroke when done

    
    /* CURSOR ----------------------------------- */
    noCursor(); //remove cursor
    fill(0, 0, 100, 100); //set color to gray
    ellipse(mouseX, mouseY, 5, 5); //draw small circle to act as cursor
}

void mousePressed() { //whever the mouse is pressed, check these things...
  
  //Check if Blue Button is Pressed
  if (mouseX >= bclickXL && mouseX <= bclickXR &&
      mouseY >= bclickYB && mouseY <= bclickYT) {
      blue = true;
      } else { blue = false; }
      
  //Check if Light Blue Button is Pressed
  if (mouseX >= lbclickXL && mouseX <= lbclickXR &&
      mouseY >= lbclickYB && mouseY <= lbclickYT) {
      lightblue = true;
      } else { lightblue = false; }
      
  //Check if Light Blue Button is Pressed
  if (mouseX >= cclickXL && mouseX <= cclickXR &&
      mouseY >= cclickYB && mouseY <= cclickYT) {
      chartruese = true;
      } else { chartruese = false; }

}


