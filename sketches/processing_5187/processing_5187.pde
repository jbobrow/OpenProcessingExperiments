
//Define class
class Person{

  //variables
  int xpos;
  int ypos; 
  int xspeed;
  int yspeed;
  int pheight;
  int pwidth;

  //Constructor
  Person(int tx, int ty, int _xspeed, int _yspeed){
    xpos=tx;
    ypos=ty; 
    xspeed=_xspeed;
    yspeed=_yspeed;

  } 

  //Function
  void drawPerson(){
    noStroke();
    fill(150,150,150,220);
    rect(xpos,ypos,50,100);
    fill(64,62,62,100);
    rect(xpos-25,ypos-45,175,120);
    rect(xpos+25,ypos-100,250,120);
  }

  //Function
  void move(){
    xpos = xpos + xspeed;
    if ((xpos > width)||(xpos < 1)) {
      xspeed = -xspeed;
    }

    ypos = ypos + yspeed;
    if ((ypos > height)||(ypos < 0)) {
      yspeed = -yspeed;
    }
  }  
}


