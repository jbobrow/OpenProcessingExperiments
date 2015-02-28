
//this is a class for the background graphics

class BgRect {
  float bgposx = width/2;
  float bgposy = height/4;
  float bgdirx = random (5);
  float bgdiry = random (5);
  float xsize;
  float ysize;
  float scrollspeed;
  int i;
  // rectMode (CENTER);
  //fill (0, 10);

  BgRect(float _xsize, float _ysize, float _scrollspeed) {
    xsize = _xsize;
    ysize = _ysize;
    scrollspeed = _scrollspeed;
    //println(xsize);

    /*if (xsize >= 70){
     background (10, 10);
     xsize = 0;
     ysize = 0;
     } */
  }

  void scroll() {
    //background(10);
    xsize += 8;
    ysize += 4;
    if (xsize >= width*2) {
      xsize = i*10;
      ysize = i*10;
    }
  }

  void display () {
    // background(10);
    stroke (#BBDEFA);
    noFill();
    //fill (0, 10);
    rect(bgposx, bgposy, xsize, ysize);

    //make centerpoint move: that would be cool lol
  }
}


