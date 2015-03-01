
/** PI by means of Monte Carlo; hit mouse to end animation...
*/

UserClass _myClass;

void setup() {
  
  size(500,500);
  
  background(0);
  noFill();
  
  _myClass = new UserClass();
}

void draw() {
  
  _myClass.run();
}

void mousePressed() {
  
  _myClass.done = true;
}





class UserClass {
  
  int maxflies = 500000;

  int i;
  int in;

  float u;

  float xfly;
  float yfly;

  boolean done;

  UserClass() {

    i  = 0;
    in = 0;
    u  = float(height);              // our radius unit...
  
    stroke(#ffffff);
    rect(0,0,u-1,u-1);               //  grid enclosing a quarter circle...
    arc(0,0,2*u-1,2*u-1,0,PI/2);     //  arc draws the full radius of our grid
    noStroke();
  
    done = false;                      // we run each fly on the draw; when true, we fly the rest... toggled by mouse or keyboard...
  }
  
  void run() {
    
    if (done) {
      
      for (int j = i; j < maxflies; j++) {
    
        doFly();                       // this fly won't draw yet, for it is not visible inside the for construct...
      }
      i = maxflies+1;                  // all flies are drawn...
    }
    else {
      doFly();                         // this fly will draw, for it is visible inside the draw loop...
      i++;                             // next flie is drawn...
    }
    testEnd();
  }
  
  void doFly() {
  
    xfly = random(3,u)-2;                   // generates x nmbrs [1..unit-2]
    yfly = random(3,u)-2;                   // so we stay inside the grid...
  
    if (sqrt(sq(xfly)+sq(yfly)) <= u-1) {   // are we inside our radius?
      in++;                                 // count the fly in...
      fill(#00ff00);                        // green...
    }
    else fill(#ff0000);                     // red, which seems to eat our radius arc...
  
    ellipse(xfly,yfly,2,2);
  }
  
  void testEnd() {
    
    if (i == maxflies+1) {
      
      float pie = 4.0*in/float(maxflies);
    
      fill(0);
      text(maxflies + " flies can't be wrong", width/2-100, height/2-50);
      text("Your pie, is " + pie, width/2-100,height/2-30);

      noLoop();
    }
  }

}


