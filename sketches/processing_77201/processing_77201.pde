
/*
from - RECT/RECT COLLISION DETECTION
Jeff Thompson
Fall 2011

www.jeffreythompson.org
*/


/*
RECT/RECT COLLISION FUNCTION
Takes 6 arguments:
  + x,y position of object 1 - in this case "you"
  + x,y position of object 2 - in this case the static rectangle
  + width and height of object 2
  
*/

boolean pointRect(int x1, int y1, int x2, int y2, int w2, int h2) {
  
  // test for collision
  if (x1>= x2-w2/2 && x1 <= x2+w2/2 && y1 >= y2-h2/2 && y1 <= y2+h2/2) {
    return true;    // if a hit, return true
  }
  else {            // if not, return false
    return false;
  }
}



