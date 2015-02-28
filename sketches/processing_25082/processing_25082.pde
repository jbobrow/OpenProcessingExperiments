
class Face {

  float x;
  float y;
  float z;


  Face (float tempXpos,float tempYpos, float tempZspeed) {
    x = tempXpos;
    y = tempYpos;
    z = tempZspeed;
  }

  void display () {

    noStroke();
    fill(241,13,87);
    //ear
    ellipse(x+15,y-30,30,30);
    ellipse(x-15,y-30,30,30);

    fill(255,214,169);
    //face
    ellipse(x,y-10,70,60);
    fill(162,91,20);
    //eye
    ellipse(x-12,y-20,20,30);
    ellipse(x+10,y-20,20,30);
    //ellipse(100,90,2,2);
    point(100,90);
    noStroke();
    //ellipse(100,98,8,9);
    ellipse(x,y+8,5,5);
  }
    void move(){
      x = x+z;
      if(x > width) {
        x=0;
      }
    }
  }


