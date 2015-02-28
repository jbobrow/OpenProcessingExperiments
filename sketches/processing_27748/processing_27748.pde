
class Ball {
  float x, y; // Position of the ball
  float speedX, speedY; // Speed of the ball
  float radius; // Radius of the ball
  color ball_color = color(0,random(0,250)); // Color of the ball
  int resizeControl = 0;
  int id;
  int play1 = 4;
  int play2 = 4; 
  int edge = 56;
  int edge1 = 56;
  int edge2 = 56;
  int edge3 = 56;
  int edge4 = 56;
  int volume = 0;
  float d1;
  float d2;
  float d3;
  float d4;
  // Constructor
  Ball(float x_, float y_, float speedX_, float speedY_, float radius_, int id_) {
    x = x_;
    y = y_ ;
    speedX = speedX_;
    speedY = speedY_;
    radius = radius_;
    id = id_;
  }

  // Draws the ball
  void display() {
    fill(ball_color);
    stroke(ball_color);
    ellipse(x, y, radius * 2, radius * 2);
    d1 = dist (x,y,0,y);
    d2 = dist (x,y,width,y);
    d3 = dist (x,y,x,0);
    d4 = dist (x,y,x,height);
  }

  // Updates the ball's position, and reverses speed if it hits the wall
  void update() {
    x = x + speedX* mouseY/100;
    y = y + speedY* mouseY/100;     
    // change direction when it has a wall collision
    if (x + edge + radius > width || x - edge - radius < 0) {
      speedX = - speedX;
    }
    if (y + edge + radius > height || y -  edge - radius < 0) {
      speedY = - speedY;
    }
  }

  void mouse() {
    int CO = 10;
    if (mousePressed) {
      resizeControl = 1;
      if(mouseButton == RIGHT) {
        if (resizeControl == 1) { 
          if(radius<50 && radicont==1) {
            radius=radius+1;

            notes[1].getGain();
            notes[2].setGain(volume);
            notes[3].setGain(volume);
            notes[4].setGain(volume);
            notes[5].setGain(volume);
            notes[6].setGain(volume);
            notes[7].setGain(volume);
            notes[8].setGain(volume);
            notes[9].setGain(volume);
            notes[10].setGain(volume);
            volume=volume+50;
            if(radius==49) {
              radicont=0;
            }
          }
          if(radius>10 && radicont==0) {
            radius=radius-1;

            notes[1].setGain(volume);
            notes[2].setGain(volume);
            notes[3].setGain(volume);
            notes[4].setGain(volume);
            notes[5].setGain(volume);
            notes[6].setGain(volume);
            notes[7].setGain(volume);
            notes[8].setGain(volume);
            notes[9].setGain(volume);
            notes[10].setGain(volume);
            volume=volume-50;
            if(radius==11) {
              radicont=1;
            }
          }
        }
      }
      else if (mouseButton == LEFT) {    
        resizeControl = 0;
      }
    }
  }
  void line1() {
    noFill();
    stroke(0);
    rect(edge1,-1,width*1.5,height+2);
  }

  //wobble sides when ball collides
  void wobble1() {
    if (x - edge1 - radius < 0) {  
      edge1 = edge1 - 10;
      line1();
      line1();
      edge1 = edge1 + 10;
    }
    line1();
  }

  void line2() {
    noFill();
    stroke(0);
    rect(width-edge2,-1,width/12+2,height+2);
  }

  void wobble2() {
    if (x + edge + radius > width) {
      edge2 = edge2 - 10;
      line2();
      line2();
      edge2 = edge2 + 10;
    }
  }

  void line3() {
    noFill();
    stroke(0);
    rect(-1,edge3,width+2,height*1.5);
  }

  void wobble3() {
    if (y - edge - radius < 0) {
      edge3 = edge3 - 10;
      line3();
      line3();
      edge3 = edge3 + 10;
    }
  }


  void line4() {
    noFill();
    stroke(0);
    rect(-1,height-edge4,width+2,height/12);
  }

  void wobble4() {
    if (y + edge + radius > height) {
      edge4 = edge4 - 10;
      line4();
      line4();
      edge4 = edge4 + 10;
    }
  }

  //play sounds when wall collision is present
  void sound() {    
    //    if (x + edge + radius > width){// || x - edge - radius < 0) {
    //    notes[id].loop(0);
    //   notes[id].cue(10);
    // }      
//    if (y + edge + radius > height || y - edge - radius < 0) {
  //    notes[id].loop(0);
    //  notes[id].cue(10);
    //}
    if (d1 < edge1+radius) {
      notes[id].loop(0);
      notes[id].cue(10);
    }
    if (d2 < edge2+radius) {
      notes[id].loop(0);
      notes[id].cue(10);
    }
    if (d3 < edge3+radius) {
      notes[id].loop(0);
      notes[id].cue(10);
    }
    if (d4 < edge4+radius) {
      notes[id].loop(0);
      notes[id].cue(10);
    } 
  }
}


