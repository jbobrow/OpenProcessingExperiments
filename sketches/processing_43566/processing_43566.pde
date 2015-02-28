
//this system is based upon the 3D l-system code from http://garethspor.com/lsystems/
//MUTATION STUDY
//this system is an attempt to model organism growth in nature
//a mutant spiral fern is created via altering how a "perfect" fern is supposed to grow
//it still has the "ingredients" of a fern, but a mutation in itS growth instructions produces a radically different organism
//we can track how this mutant organism "grows" and watch as it reaches its upper growth limit


Lsystem spiral;
PImage pic;

// --------------------------------------------------- SETUP ----------------------------------------------------------


void setup() {
  size(500, 500); 
  background(0);
  smooth();

  //load the image
  pic = loadImage("spring.jpg");

  // slow down the framerate so that we can see the wheat "growing"
  frameRate(2); 


  //this number affects the angle of each additional segment 
  //but this is also related to angle below in "drawForward"
  //the number 3 creates the spiral form
  spiral = new Lsystem("fd", 3);  

  // specifies which segment of the form to grow; 
  //the larger the number, the longer the segments
  //gets a bit odd when number exceeds 1)
  spiral.addRule('d', "c+@.9fd");  

  // allows the stem and branching to occur
  spiral.addRule('c', "b"); 

  //these add more branches to either side of the main stem; 
  //the larger the number, the bigger/bushier the form. 
  //keep these equal to have a balanced shape
  spiral.addRule('b', "[++++++++@.25fd][--------@.25fd]");
}


// ------------------------------------------------------ DRAW ---------------------------------------------------------------


// here is where the spiral actually gets drawn
void draw() {


  //this is how the spiral grows, it is changed "iterated" each time it draws
  //if the number is changed, it will "grow" faster because it will skip itterative steps and draw all at once
  spiral.iterate(1); 

  //spiral.draw(x,y,xx,yy); 
  //x and y control the start point; 
  //xx controls the angle of the first segment(which therefore controls the angle/orientation of the whole fern)
  //yy controls how large the fern is; 
  spiral.draw(width-180, height+25, -300, 180);
}


// ------------------------------------------------------ PEN CLASS ----------------------------------------------------------------------




// set up a class to stipulate how a "pen" would draw the form
class pen {  
  float x, y, dir, len, ang;

  // "prevState" is the previous state
  //start new segment where "previous state" left off
  pen prevState; 

  //basically taking the former "previous state" doing the pen drawing action, and then where that leaves off becomes the new previous state, and so on
  pen(float xx, float yy, float ddir, float llen, float aang, pen pprevState) {  
    x = xx; //new x coordinate
    y = yy; // new y coordinate
    dir=ddir; //new direction
    len=llen; // new length
    ang=aang; //new angle
    prevState = pprevState;  //"prevState" keeps updating to new previous state after each pen segment
  }

  void drawForward() {
    float x0 = x;
    float y0 = y;
    //x coordinate of endpoint is a function of the "length" and specified angle to the previous segments direction
    // changing the angle number will create different/new forms
    x = x + len*cos(PI*dir/720);
    y = y + len*sin(PI*dir/720); // y coordinate has same conditions as x coord.


    //choose colors from image; x and y are "floats" so need to round to "int" in order to work
    color picColor = pic.get(round(x), round(y));  
    stroke(picColor);

    //draw a line starting at the x,y coordinates at the end of the last segment 
    //and draw to the new 0x and 0y coordinates achieved above
    line(x0, y0, x, y);
  }


  void turnLeft() {
    dir = dir + 360/ang; // creating the "left" curving branches
  }

  void turnRight() {
    dir = dir - 360/ang;  //creating the right curving branches
  }

  void resizeLength(float factor) {  // this makes the lenght of segments shorter as sketch adds segments
    len = len*factor;
  }

  void reverseAng() {  //make mirrored branches on either side of segment
    ang = 0-ang;
  }

  void saveState() {  //this is saving the previous state as the "new" previous state each time sketch runs
    pen ps;
    ps = new pen(x, y, dir, len, ang, prevState);
    prevState = ps;
  }

  void recallState() {
    pen ps = prevState;  //now prevous state can be remembered and used by sketch
    x = ps.x;
    y = ps.y;
    dir = ps.dir;
    len = ps.len;
    ang = ps.ang;
    prevState = ps.prevState;
  }
}


//------------------------------------------- Lsystem Class ----------------------------------------------------

class Lsystem {   //lets set up the "Lsystem" class
  String Lstr;  // set up a sequence of characters as seen in begining of code
  lsysRules rules;
  float ang;

  Lsystem(String rootStr, float aang) { 
    Lstr = rootStr;  //updating Lstring
    ang = aang; // updating angle
  }

  void addRule(char x, String y) {  //add x data, and y coordinate data
    lsysRules p;
    p = new lsysRules(x, y);
    p.next = rules;
    rules = p;
  }

  void iterate(int n) {  //now defining how to "iterate" which was called up in the begining of sketch
    String Rstr = "";
    char l;
    boolean replaced;
    lsysRules rule;


    for (int i = 0;i < n;i++) {  //now we are seeding
      Rstr = "";
      for (int stri = 0;stri < Lstr.length();stri++) {
        l = Lstr.charAt(stri);  // returns the character at "stri"
        rule = rules;
        replaced = false;
        while (rule!=null) {
          if (l==rule.x) {
            Rstr = Rstr.concat(rule.y);  //"concatenates" two arrays...i take this to mean that this "combines" the two arrays
            replaced = true;
          }
          rule = rule.next;
        }
        if (!replaced) {
          Rstr = Rstr.concat(String.valueOf(l));
        }
      }
      Lstr = Rstr;
    }
  }

  void draw(float x, float y, float dir, float len) {  
    pen drawPen;
    drawPen = new pen(x, y, dir, len, ang, null);  //new version of pen class

    for (int lstri=0; lstri<Lstr.length(); lstri++) {  //seeding again
      char l = Lstr.charAt(lstri);  //returns the character at "lstri"

      switch (l) {  //switch to character "l" like from above unless redirected by "break" command
      case 'f':  // move forward
        drawPen.drawForward();
        break;  //ends the "switch" structure and start a new one
      case '+':  //turn right
        drawPen.turnRight();
        break; // ends the "switch" structure and start a new one
      case '-':  //turn left
        drawPen.turnLeft();
        break;
      case '@':  //resize line length
        int numin = lstri+1;
        float lengthfactor;


        do {
          numin++;
          l = Lstr.charAt(numin);
          //println(l);
        } 
        while (l=='.'|l=='0'|l=='1'|l=='2'|l=='3'|l=='4'|l=='5'|l=='6'|l=='7'|l=='8'|l=='9');
        //println(lstr.substring(lstri+1,numin));
        lengthfactor = Float.valueOf(Lstr.substring(lstri+1, numin)).floatValue();  //set up factor to shorten each new segment by
        drawPen.resizeLength(lengthfactor);
        lstri=numin-1;
        break;
      case '[':  //push vars
        drawPen.saveState();
        break;
      case ']':  //pop vars
        drawPen.recallState();
        break;
      case '!':  //reverse l/r directions
        drawPen.reverseAng();
      }
    }
  }
}

//---------------------------------------------------------lsysRules Class ----------------------------------------------

class lsysRules {  // set up "L system rules" class
  char x;
  String y;
  lsysRules next;

  lsysRules(char xx, String yy) {
    x = xx;
    y = yy;
  }
}





