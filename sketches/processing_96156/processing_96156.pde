
PImage sun;
PImage earth;
PImage stars;

Sun sunspot;
Clock earthclock;




float angle;
float offset = .4;


void setup () {
  size(600, 600);  
  
  stars = loadImage("stars.png");
  sun = loadImage("sun.png");
  earth = loadImage("earth.png");

  sunspot = new Sun();
  earthclock = new Clock();
}

void draw () {
  background(0);
  
  image(stars,0,0);

  float w = map(second(), 0, 59, 0, width);
  rect(0, height-5, w, 30);

  angle = map(hour(), 0, 23, PI*2,0)+offset;
  //  println(angle);
  earthclock.display();
  sunspot.display();
}//end Draw


class Sun {
  float x;
  float y;
  float w;
  float h;
  Sun () {
    x = 0;
    y = 0;
    w = width;
    h = height;
  }//end CS

  void display() {
    image(sun, 0, 0);
  }
}//end Class


class Clock {
  float x;
  float y;
  float w;
  float h;
  Clock () {
    x=0;
    y=0;
    w=width;
    h=height;
  }//end CS

  void display () {
    imageMode(CENTER);

    pushMatrix();
    translate(w-345, h/2);
    rotate(angle);

    image(earth, 0, 0);

    fill(255, 0, 0);
    ellipse(-135, 30, 10, 10);
    fill(255);

    popMatrix();


    imageMode(CORNER);
  }//end display
}//end Class



