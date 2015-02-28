
// building on my first project of simply drawing a bird,
// I have converted the bird coordinates to become dependent on a variable,
// in this case, cursor position.
// Also, just for funsies, the background also changes
// according to the (easing affected) cursor position.


  float x;
  float y;
  float rightTip = 0;
  float easing = 0.02;
  int direction = 1;

void setup () {

 size (700, 700);
 background (0, 40, 60);
 smooth();
 
}

void draw () {

  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x) * easing;
  y += ((targetY - y) * easing) - 0.5*direction;
  rightTip += 2*direction;
  
  if (rightTip > 140 || rightTip < -50) {
    direction = -direction;
  }
  
  background (x-y, y, x);
  
  triangle (x-30, y+rightTip-5,  x+50, y+50,   x-50, y+50);  // up wing
  triangle (x-80, y-30,          x-70, y-15,   x-120, y-20);  // head
  triangle (x-50, y+50,          x-20, y+40,   x-80, y-30);  // neck
  triangle (x, y,                x+50, y+50,   x-50, y+50);  // body
  triangle (x+50, y+50,          x+30, y+30,   x+100, y-20);  // tail
  triangle (x+40, y+rightTip,    x+50, y+50,   x-50, y+50);  // down wing
 
}

//       /   /
//      \   \
//       /  /
//       \ \
//       / /
//      //
//     //
//    /      TCB 

