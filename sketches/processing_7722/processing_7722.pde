
                      //  Graveyard_Layers by Eric Perrenoud


      /*  The main idea behind this sketch is to illustrate Processing's layering 
          in a 2D environment.  By placing different parts of the sketch at 
          specific places in the code, a layering effect is created with a 
          movable stick figure able to "run" in front of some objects, yet still
          behind others creating an even deeper sense of depth in the 2D space.
      
          Digital Clock: This is added in the upper right corner of the sketch
          to help keep the user's mentallity in "real time" as opposed to viewing
          this as merely a back and forth stagnant image. The digital clock is also intended as a simple 
          metaphor/reminder to the viewer that time is constant, but more so that time is relative to all living 
          things in different ways. 
     
          
         Concept idea inspired by; and mouseX variable code borrowed/understood from 
         Greg Graham's sketch "Forest Walk" posted on Openprocessing.org
         Available on-line: http://www.openprocessing.org/visuals/?visualID=4828
     
         Everything else is original code based off of trial and error 
       */

 PImage FullMoon;
   //sets variable for the Full Moon vector that will be loaded

 void setup() { 
  size(600, 400);
 // sets size of sketch canvas to 600w X 400h 
 smooth();
 // sets all future strokes,lines,shapes,points, etc. to have smooth edges
  noCursor(); 
  FullMoon = loadImage ("FullMoon.png");
  //establshes "FullMoon" as the variable for the imported image 
  frameRate (17);
  //sets sketch frame rate to "17" down from the default of "30"
    /*This is only so the stick man's legs aren't going to fly all over the screen when the user
    drags the mouse button back and forth.  It's a bit chaotic when @ 30fps
    */
} 
  
  
  // FIRST we will set up all the "background" objects  
  void draw () {

   background (25,25,60);
  // sets background color to hazy "midnight blue"
  noStroke ();
  // sets future stroke value to empty
  image (FullMoon, 110,-25);
  // imports FollMoon.png file that is saved in this sketches data folder
  /* location is near the center, and part of the full image will be overlapped by the 
      hilltop, creating depth
  */
   fill (100,67,38);
   //sets fill base layer trees to "cafe brown"
   rectMode (CORNER);
   rect (50,0,20,200);
   rect (500,0,15, 200);
   //draws 2 trees "behind" the grass hilltop
   stroke (18,18,18);
   //sets color for crooked cross to "gray 7"
   strokeWeight (7);
   //creates a thicker stroke for the base of the cross
   line (260,200,200,75);
    //draws base of the cross
   strokeWeight (6);
   //creates slightly thinner stroke than base for the cross section of the cross
   line (190,100,225,80);
   noStroke ();
   //sets future stroke value to empty
  
  fill (0,65,0);
  // sets fill to "grass green"  
  bezier (-25, 250,250,0,500,200,650,250);
  // sets data points for the bezier curve which will become the ground
    /* "-25  &  650" put point values outside of the canvas
        area making a continued effect so that the endpoints won't 
        end @ the exact edge of the canvas
    */
   rectMode (CORNER);
   rect (-25,250, 650, 250);
   //draws a rectangle from bottom of the canvas --> overlapping the bezier/ground shape
   fill (107, 66,38);
   // sets color to slightly darker shade of brown then used previously. 
   rectMode (CORNER);
   rect (155,0, 25,250);
   rect (375,0,20,210);
   //draws 2 trees "on top" of the hillside
   noStroke ();
   //sets future stroke value to empty
   fill (99,99,99);
   //sets tombstone color to gray
   ellipse (450, 210, 52,60);
  // draws an ellipse which acts as the rounded top of the tombstone
   rectMode (CORNER);
   rect (425,218,50,75);
   //draws rectabgle that overlaps the ellipse bottom creating a tombstone shape
  
  
   
   PFont tombstoneFont;
   //establishes font variable
   tombstoneFont = loadFont ("Cracked-36.vlw");
   //loads font to be used on tombstone
   textFont (tombstoneFont);
   fill (41,36,33,100);
   //sets fill color for RIP text; uses "Alpha" RGB value for transparency effect
   text ("R.I.P.", 428,230);
   //displays text "on top" of the tombstone
   
 
   
   
   PFont digitalFont;
  digitalFont = loadFont ("Digital-7Italic-24.vlw");
   textFont (digitalFont);
  fill (255,0,0);
  int s = second();
  int m = minute();
  int h = hour();
  
  String t = nf(h,2) + ":" + nf(m,2) + ":" + nf (s,2);
  textSize (18);
  text (t,545,20);
   
   //SECOND we will create the "middle layer" for our stick man to run across
   noStroke ();
   //sets future stroke value to empty
   fill(0);
   //sets fill to black
   ellipse (mouseX, 190, 30,30); 
   // stickman' head
   stroke (0);
   //sets stroke to black
   strokeWeight (4);
   //sets stroke thickness to 4; default is 1
   line (mouseX, 190, mouseX, 260); // draws stick figure body
   line (mouseX, 210, mouseX - 25, 230 ); //draws stick figure left arm
   line (mouseX, 210, mouseX + 25, 230); //draws stick figure right arm
   line(mouseX, 260, pmouseX - 10, 300); //draws "movable" leg
   line(mouseX, 260, pmouseX + 10, 300);//draws "movable" leg


    
   /* This is the code format borrowed from Greg Graham; my own variables are used 
    to plot the figure's body 
   */
   /* mouseX sets the value of the variable to be in conjunction with the users mouse.
    this way the mouse point will move the stick figure throughout the sketch in one solid piece
   */
  
  // LAST we will create the "foreground" objects of the sketch
  fill (92, 51, 23);
   // sets fill color to darkest brown color used for "forground" tree
  noStroke ();
  //sets future stroke value to empty
  rectMode (CENTER);
  rect (120,0,30,650);
  // draws final tree in the "foreground"
 
  stroke (58);
  //sets stroke color to a dark gray
  strokeWeight (7);
  line (0,285, 225, 285);
  line (290,285,600,285);
  line (0,350, 225, 350);
  line (290,350, 600,350);
  //draws the 4 horizontal lines that make up the fence
    // gap is left to help reiterate the layering
    
  strokeWeight (5);
  // lowers stroke thickness for the vertical lines that make the fence posts
  line (15,250,15,600);
  line (65,250,65,600);
  line (115,250,115,600);
  line (165,250,165,600);
  line (215,250,215,600);
  // draws 5 vertical fence posts on the left 
  
  line (305,250,305,600);
  line (355,250,355,600);
  line (405,250,405,600);
  line (455,250,455,600);
  line (505,250,505,600);
  line (555,250,555,600);
  line (599,250,599,600);
  //draws 7 vertical fence posts on the right
  
  triangle (15,245,10,255,20,255); 
  triangle (65,245,60,255,70,255);
  triangle (115,245,110,255,120,255);
  triangle (165,245,160,255,170,255);
  triangle (215,245,210,255,220,255);
  
  //draws 5 overlapping triangles to act as "spikes" on the vertical posts
  
  triangle (305,245,300,255,310,255);
  triangle (355,245,350,255,360,255);
  triangle (405,245,400,255,410,255);
  triangle (455,245,450,255,460,255);
  triangle (505,245,500,255,510,255);
  triangle (555,245,550,255,560,255);
  triangle (600,245,595,255,605,255);
  
  //draws 7 remaining overlapping triangles for "spikes" on the right vertical posts


 
 }
   
   
    
    


