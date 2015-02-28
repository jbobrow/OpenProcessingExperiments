
class Creature {

  color c1=color(232, 226, 211);
  color c2=color(85, 82, 82);
  color b=color(0);
  color w=color(255);


  float gravity = 1.0;
  float damping = 0.75;

  String name;
  float x, y;
  float _x;
  float _y;
  float dx, dy; 
  color mouth;
  boolean isActive;


  color active_color = color (25, 188, 250);

  Creature(int width) {
    x= random(width);
    y= _y;
    dx= 0.0;
    dy= 0.0;
    mouth= color (random(255), random(255), random(255));
    isActive = false;
  }

  void reposition(float _x, float _y) {
    if (isActive) {
      x= this._x =  _x;
      y=_y;
    }
  }

  void move() {
    if (!isActive) {
      float speed = sqrt(dx*dx+dy*dy);

      if (speed <1) {
        dx= 0.0;
      }

      if (speed<1 && abs(y-height) <1) {
        dy = 0.0;
      } 
      else {
        dy+= gravity;
      }

      x+=dx;
      y+=dy; 
      if ( x<100) {
        dx *= -damping;
        dy *= damping;
        x = 100;
      } 
      else if ( x > width-100) {
        dx *=-damping;
        dy *= damping;
        x = width-100;
      }

      if (y<230) {
        dx*= damping;
        dy*=-damping;
        y=230;
      }
      else if ( y+235>height) {
        dx *=damping;
        dy*=-damping;
        y= height-235;
      }
    }
  }

  boolean select ( int _x, int _y) {

    if ( ( abs(_x-x) < 100 ) && (abs(_y-y) <100) ) {
      return isActive = true;
    }
    return false;
  }

  void deselect( float _dx, float _dy) {
    if ( isActive) {
      dx = _dx;
      dy = _dy;
    }

    isActive = false;
  }

  void display() {
    if ( isActive ) {
      draw_active_hilite();
    }


    draw_basic_body();
    draw_eyes();
    draw_belly();
  }

  void draw_active_hilite() {
    ellipseMode(CENTER);
    stroke( active_color);
    fill (active_color);
    ellipse(x, y+70, 300, 450);
  }

  void draw_invisible_stuff () {

    //invisible stuff!
    noStroke(); 
    rect(x, y, 10, 10);
    rect(x+5, y+5, 10, 10);
    point(x, y);
    point(x+2, y+2);
  }

  void draw_basic_body() {


    //body
    noStroke();
    fill(c2);
    ellipse(x, y+100, 260, 300);  //body
    ellipse(x, y-45, 150, 150);  //head
    ellipse(x-50, y-120, 20, 100);  //left ear
    ellipse(x+50, y-120, 20, 100);  //right ear

    //mouth
    fill(mouth);
    ellipse(x, y-50, 25, 10);

    //feet
    fill(c2);
    ellipse(x-50, y+235, 120, 50);
    ellipse(x+50, y+235, 120, 50);

    //arms
    ellipse(x-120, y+100, 50, 150);
    ellipse(x+120, y+100, 50, 150);
  }

  void draw_eyes() {

    //eyes
    fill(w);
    ellipse(x-45, y-80, 22, 22);   //left white
    ellipse(x+45, y-80, 22, 22);  //right white
    fill(b);

    //eye movement
    float thetaLeft = atan2(mouseY-(y-80+11), mouseX-(x-45+11));
    float thetaRight = atan2(mouseY-(y-80+11), mouseX-(x+45+11));
    float DRX = abs((x-mouseX)/( (mouseX<x)? x : x-mouseX ) *6);
    if (mouseX == x) DRX = 0;
    float DRY = abs((y-mouseY)/( (mouseY<y)? y : y-mouseY ) *6);
    if (mouseY == y) DRY = 0;
    ellipse((int)(x-45+DRX*cos(thetaLeft)), (int)(y-80+DRY*sin(thetaLeft)), 10, 10);   //left pupil
    ellipse((int)(x+45+DRX*cos(thetaRight)), (int)(y-80+DRY*sin(thetaRight)), 10, 10);   //right pupil

    fill(w);
    ellipse((int)(x-44+DRX*cos(thetaLeft)), (int)(y-83+DRY*sin(thetaLeft)), 4, 4);     //white reflect eyes
    ellipse((int)(x+46+DRX*cos(thetaRight)), (int)(y-83+DRY*sin(thetaRight)), 4, 4);     //white reflect eyes
  }

  void draw_belly() {


    //belly
    if (mousePressed) {
      if (mouseButton == RIGHT)
      {
        c1=color(random(255), random(255), random(255));
      }
    }
    fill(c1);
    ellipse(x, y+100, 210, 250);

    fill(b);
    stroke(10);
    line(x-47, y-57, x-105, y-79); //left of face wiskers
    line(x-47, y-53,x-113, y-56);
    line(x-47, y-48, x-107, y-32);
    line(x+47, y-57, x+105, y-81); //right of face wiskers
    line(x+47, y-53, x+113, y-56);
    line(x+47, y-48, x+107, y-31);
  }
}


