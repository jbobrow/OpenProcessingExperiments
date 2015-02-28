
/* On the test, I was really having trouble with a particular 
 concept.  I knew how to use a loop to generate multiple instances
 of a particular object, but I was having trouble organizing my 
 code in a way in which all of these objects moved at the same time
 */

float x = 300;
float y = 50;
float w = 24;
float h = 24;
int ellipseNumber = 0;
int spacing = 50;
float xspeed = 2;

void setup() {
  size(600, 400);
  smooth();
}

void draw() {

  x = x + xspeed;                        //I need to tell stuff 
                                         //to move first
  if ((x > width - w/2) || (x < w/2)) {  
    xspeed = xspeed * -1;                //use conditions to 
  }                                      //change the movement up

  background(0);
  ellipseMode(CENTER);

  while (ellipseNumber < 7) {            //THEN I use a loop to 
    fill(255, 120, 120, 255);            //instatiate the objects
    ellipse(x, y, w, h);
    y = y + spacing;
    ellipseNumber++;
    }

y = 50;                                  //finally, I reset vars
ellipseNumber = 0;                       //to run loop again

}



