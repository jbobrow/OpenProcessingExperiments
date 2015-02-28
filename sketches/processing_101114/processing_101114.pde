
class Player {
  int x,y;
  int r = 3;
  float speed = 3;
  boolean pressingLeft,pressingRight,pressingUp,pressingDown;
  
  
  Player(int _x, int _y ) {
    x = _x;
    y = _y;
  }
  
  
  void update() {
    if(pressingLeft && x >= 0) {
      x -= speed;
    }
    if(pressingRight && x <= width) {
      x += speed;
    }
    if(pressingUp && y >= 0) {
      y -= speed;
    }
    if(pressingDown && y <= height) {
      y += speed;
    }
  }
  
  
  void display() {
     stroke(255);
     if( zoomIn ){
       //draw nearby points
       //legacy app processing 1.5x, points will not render with transparency. we are rendering with rects to simulate points
       stroke(255, 100);
       rect(x+1, y, 1, 0);
       rect(x-1, y, 1, 0);
       rect(x, y+1, 1, 0);
       rect(x, y-1, 1, 0);
       //draw further-out points
       stroke(255, 35);
       rect(x,y-r, 1, 0);
       rect(x,y+r, 1, 0);
       rect(x-r,y, 1, 0);
       rect(x+r,y, 1, 0);
     } else {
       //draw player center point
       point(x,y);
       //draw frame around the zoom area
       noFill();
       stroke(255,30);
       rectMode(CENTER);
       rect(x,y,g_zoomAreaWidth-1,g_zoomAreaHeight-1);
     }
   }
} //end class Player


