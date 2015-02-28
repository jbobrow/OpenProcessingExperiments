
float gray = 0.0;
           //the arrays MUST have the same amount of spaces
//x value
int[] x = { 50, 61, 83, 69, 71, 50, 29, 31, 17, 39 };  //OR YOU CAN HAVE THIS EMPTY AND ASSIGN VALUES LATER.  With the values you assigned, it knows how big to make it.
//y value
int[] y = { 18, 37, 43, 60, 82, 73, 82, 60, 43, 37 };

int [] x2 = new int[5]; //declares an empty array with 5 SPACES
int [] y2 = new int[5];

void setup() {
 size(400, 400); 
 background(255); //PUT THIS TO CLEAR THE SCREEN AND STOP CONSTANTLY DRAWING STUFF IN THE DRAW
 
 //this makes a polygon with random vertices.  Why is it in the setup?  Because you only want this shape to draw once.  Also won't screw up with the random vertices
 //not using this thing at all unless you make another shape that uses these arrays
 for (int i = 0; i < 5; i++)
 {
  x2[i] = (int)random(1, 50);  //typecasting into an int because the numbers were floats.  when converting from float to int, it always rounds DOWN.
  y2[i] = (int)random(40, 100);
 }
 
 
}



void draw() {
  //NOTE in the for loops the line are being drawn vertically.  That's why x is 0 and there's an i in place of the y
  for (int i = 0; i < 400; i++)
  {
   // make a gradient background.  It really just draws lines a bunch of times except that the color is gradually changing
   float percent = (float)i / 400;  // using (insert type here such as int) casts things into another type.  Doint this because i was declared as an in the loop and you're trying to turn it into a percent, which is a float
   stroke(0, 0, 255 * percent); // stroke(255 * percent, 0, 0); turns it red.  Can experiement with colors.  BUT the 255 * percent has to be in place of the color value you want to be dominant.
   line(0, i, 400, i);   //a line is being drawn 400 times.  it's starting at the start of the screen and going down as i increase for y in the loop.  Because i is being incremented.  
  }
  
  //make a grid
  for(int i = 0; i < 400; i += 40) //the 40 means you want to do this every 40 pixels.  Means i = i + 40.  So draw a line every 40 pixels
  {
    stroke(255);
    line(0, i, 400, i);  //draws lines left to right cuz the y is always changing
    //line(i, 0, 400, i);   //makes a cool curve
    //line(i, 400, 0, i); //completes that curve
    line(i, 0, i, 400); //draws lines up to down cuz the x is always changing
  
  }
 
 // if you don't use the matrix stuff, the values that you're using to translate will be added to the previous ones
 // separating them using the matrix stuff makes the translate start out from 0
 pushMatrix();
 pushStyle();
 stroke(255, 0, 0);
 translate(200, 50);  //translate() expects an X AND a Y
 //scale(2);  // do scale in floats if it doesn't do anything
 rotate(radians(25)); //for rotating this shape.  We're using radians() because it'll convert to degrees (WHICH IS MUCH EASIER
 drawStarShape(-50, -50);
 popStyle();
 popMatrix();
 
 
 
  /*pushMatrix();
 pushStyle();
 stroke(255, 0, 0);
 translate(350, 350);  //translate() expects an X AND a Y
 //scale(0.3);
 rotate(radians(180)); //for rotating this shape.  We're using radians() because it'll convert to degrees (WHICH IS MUCH EASIER
 drawStarShape(-50, -50);
 popStyle();
 popMatrix();
 
 /*
 -50, -50 is NOT the magic number for the center of the shape.  when you draw the star w/o any translates/rotates
 etc, the center origin is about 50, 50 if you use the println to check.  You have to draw the star at -50, -50
 to compensate for that.  It would have been different if the shape had been drawn originally drawn at 0,0. 
 The reason why it's not being drawn at 0, 0 is because of how the vertices from the array are.
 
 also, the order in which to do the modifications is translate, scale, rotate (from up to down). Processing
 runs them in the opposite order for some reason.
 */
 

  
}


void drawStarShape(float xOffset, float yOffset) {  //these were created manually so the function would know what parameters to expect. That way you can enter in values when the function is called in draw
  
  beginShape(); //begins the star shape in the upper right
                   //x.length means how big the array x was (can look up at global vars to see)
 for (int i = 0; i < x.length; i++)  // substitute x.length for x2.length to get random vaules.  Remember? that other array you made up in setup?
 {
   //looping through "all of the elements"
  vertex(x[i] + xOffset, y[i] + yOffset); 
 }
 endShape(CLOSE);  // ends the star shape in the upper right 
  
}
