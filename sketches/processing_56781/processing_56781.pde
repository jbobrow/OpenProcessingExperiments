
/*
simple pattern
 */
float R, G, B;                           //  ----- I create 3 variables. primitive data type : float.
float cOff = 0.0;
float wOff = 0.0;                        //  ----- Two more float than I create and I initialize.
int w = 60;                              //  ----- another primitive value for the rectangle size. An integer type.

void setup() {

  size(800, 800);                        //  ----- change the size of your screen
  smooth();                              //  ----- anti aliazing for the graphics
  rectMode(CENTER);                      //  ----- x and y, are now in the center of each rectangle
  noStroke();                            //  ----- no outline for the shapes
  background(#B3B47F);                       //  ----- I paint my background in ... white
  rectMode(CENTER);
  R = 250;                                 //  ----- Initialization of my R variable
  G = 246;                                 //  ----- Initialization of my G variable
  B = 139;                                 //  ----- Initialization of my B variable


  for (int i = w/2; i < width; i = i + 60) {
    for (int j = w/2; j < height; j = j + 60) {
      //  ----- Double loop to draw a lot of shapes with a few lines of code.

      cOff += 0.1;                       //  ----- this value increases by 0.1 for each sequence into the loop
      wOff += 0.02;                      //  ----- this one increases by 0.02 for each sequence into the loop

      float n = noise(cOff) * 255;       //  ----- calculation of the noise parameter for each sequence into the loop. I multiply by 255 because noise gives number between 0 and 1, and I need to map this value from 0 to 255, for the colors. 
      //float n_w = noise(wOff) * w;
      R = 400;
      G = 246;
      B = n;
      fill(R, G, B);                     //  ----- my color is changing for each sequence into the loop, so for each rectangle  
      //rotate(TWO_PI * j);
      pushMatrix();
      translate(i, j);
      ellipse(0, 0, w, w); 
            //  ----- I draw a rectangle for each sequence into the loop.
      fill (137, 133, 14);
      ellipse(0, 0, 40, 40); 
      fill (214, 212, 168);
      rect(0, 0, w/2, w/2);
      rotate (PI/3);
      fill (255, 253, 196);
      rect(0, 0, w/3, w/3);
      
      
      popMatrix();
    }
  }
  //saveFrame("cadre"+timestamp()+".png"); //  ----- I save my screen into a png file
}

//String timestamp() {                     //  ----- A method with return (here a String) to catch the time and the date a which you save your file
//  Calendar now = Calendar.getInstance();
//  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
//}


