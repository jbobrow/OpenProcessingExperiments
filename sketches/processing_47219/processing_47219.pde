
class Bounce {


  Ball[] balls = new Ball[numBalls];



  Bounce() 
  {
    spring = 0.5;
    gravity = 0.03;




    numBalls=8;

    
      for (int i = 0; i < numBalls; i++) {
        balls[i] = new Ball(random(width), random(height/2), random(20, 40), i, balls);}

        counter=height;
        counter2=0;
        yeard =1997;
      
    
  }


  void draw() 

  {  

    background(255);
    for (int i = 0; i < numBalls; i++) {
      balls[i].collide();
      balls[i].move();
      balls[i].display();
    }
    movinglineDate();
  }

  void movinglineDate()
  {

    if ( frameCount%frameSpan == 0 )//controls how fast we traverse the array
    {


      counter= height -(counter2); //decreases the space the balls have to bounce depending on how much urbanization there is

      println  (counter2);
      println (counter);
      counter2=counter2+height/10; // increases counter
      yeard= yeard+1; //increases year
    }

    if (yeard >= 2006)
    {
      yeard=1997;//keeps year in range
      counter2=0;
    }


    fill(0);
    text(yeard, 50, counter);// text follows line

    if (counter > height )
    {
      counter=height/2;
    }

stroke(0);
    line (0, counter, width, counter);
  }
}

  class Ball {
    float x, y;
    float diameter;
    float vx = 0;
    float vy = 0;
    int id;

    Ball[] others;

    Ball(float xin, float yin, float din, int idin, Ball[] oin) {
      x = xin;
      y = yin;
      diameter = din;
      id = idin;
      others = oin;
    }



    void collide() {
      for (int i = id + 1; i < numBalls; i++) {
        float dx = others[i].x - x;
        float dy = others[i].y - y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = others[i].diameter/2 + diameter/2;
        if (distance < minDist) { 
          float angle = atan2(dy, dx);
          float targetX = x + cos(angle) * minDist;
          float targetY = y + sin(angle) * minDist;
          float ax = (targetX - others[i].x) * spring;
          float ay = (targetY - others[i].y) * spring;
          vx -= ax;
          vy -= ay;
          others[i].vx += ax;
          others[i].vy += ay;
        }
      }
    }

    void move() {
      vy += gravity;
      x += vx;
      y += vy;
      if (x + diameter/2 > width) {
        x = width - diameter/2;
        vx *= friction;
      }
      else if (x - diameter/2 < 0) {
        x = diameter/2;
        vx *= friction;
      }
      if (y + diameter/2 > counter) {
        y = counter - diameter/2;
        vy *= friction;
      } 
      else if (y - diameter/2 < 0) {
        y = diameter/2;
        vy *= friction;
      }
    }

    void display() {
      noFill();
      ellipse(x, y, diameter, diameter);
    }
  }




