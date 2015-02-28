
class creature {
  
  
  float x,y;
  // contructor (called once to instantiate this)
  // _x is inital x, _y is initial y  
   creature(int _x, int _y){
     reposition( _x, _y);
   }
  
  // reposition to update position of the instance
  void reposition(int _x, int _y){
    x = _x;
    y = _y;
  }
  
  
  
  void Draw_Creature(int x, int y){//, int counter){
  
    //set size of the head to draw
    //scale(drawSize);
    //counter scale()'s change in position by multiplying its location by the counter. Counter = i in the loop
    //translate(x*counter, y*counter);
  
    // headshape
    fill(66,116,65);

    triangle(x-200,y+100,x+200,y-75,x+175,y+75);
  
    //cheeks
    fill(79,116,140);
    rect(x+100, y+0, 150, 50);
    rect(x+50, y+50, 150, 50);  
  
    //eye
    fill(x, y, 255);
    ellipse(x+75, y+25, 40,40);
    //pupil
    fill(0);
    ellipse(x+67, y+25, 20,30);
  
    //Whisker 1
    line(x -112,y  +74,x  -125,y  +110);
    //whisker 2
    line(x -130,y  +80,x  -157,y  +99);
  
  
    fill(110,45,45);
    //top plate
    quad(x-175, y+80,x+75-(recoilOffset/2),y-75,x+140-(recoilOffset/2),y-25, x-175, y+90);
    //back plate (counter-clockwise)
    quad(x+100 - (recoilOffset/2), y-75, x+160- (recoilOffset/2), y-10, x+260, y-10, x+200, y-90);
  
  
  
    // moving fins
  
    fill(52,173,151);
   // quad(x - TopFinX1, y - TopFinY1 - 25, x - TopFinX2 - 150, y - TopFinY2 - 50);
  }




}


