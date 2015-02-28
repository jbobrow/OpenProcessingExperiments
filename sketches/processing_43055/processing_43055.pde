
Ball ball;
Paddle lpaddle;
Paddle rpaddle;
void setup()
{
  size(600, 600);
  background(255);
  noStroke();
  colorMode(RGB, width);
  ball = new Ball(10, 300, 5);
  lpaddle = new Paddle (10, 240, 10, 1);
  rpaddle = new Paddle (580, 240, 10, 0);
}


void draw() {
  ball.disp();
  lpaddle.disp();
  rpaddle.disp();
}



class Ball {
  int x;
  int y;
  int speed;
  int i;
  int j;

  Ball(int setx, int sety, int setspeed) {
    x = setx;
    y = sety;
    speed = setspeed;
    j = speed;
    i = int(random(1, speed));
  }

  void disp() {
    fill(255, 255, 255);

    rect(0, 0, width, height);


    fill(0);
    ellipse(x, y, 50, 50);



    if (x<=40 &&( y > lpaddle.getpos() && y < (lpaddle.getpos() + 100))) {
      j=speed;
    }
    
    else if (x<=40 &&( y < lpaddle.getpos() || y > (lpaddle.getpos() + 100))) {
      j=0;
      i=0;
    }
    
    if (x>=560 &&( y > rpaddle.getpos() && y < (rpaddle.getpos() + 100))) {
      j=(speed)*-1;
    }
    
     else if (x>=560 &&( y < rpaddle.getpos() || y > (rpaddle.getpos() + 100))) {
      j=0;
      i=0;
    }

    if (y<=40) {
      i=speed;
    }
    if (y>=560) {
      i=(speed)*-1;
    }

    x=(x+j);
    y=(y+i);
  }
}

class Paddle {
  int x;
  int y;
  int speed;
  int isleft;


  Paddle(int setx, int sety, int setspeed, int l) {
    x = setx;
    y = sety;
    speed = setspeed;
    isleft = l;
  }
  
  public int getpos() {
    return y;
  }

  void disp() {
    fill(0);
    rect(x, y, 10, 100);

    if (isleft == 0) {
      if (keyPressed == true) {
        if  (keyCode == UP && y>0) {
          y-= speed;
        }
        if (keyCode == DOWN && y<500) {
          y+= speed;
        }
      }
    }
    
    if (isleft == 1) {
      if (keyPressed == true) {
        if ((key == 'w' || key == 'W') && y>0) {
          y-= speed;
        }
        if ((key == 's' || key == 'S') && y<500) {
          y+= speed;
        }
      }
    }
    
    
  }
}


