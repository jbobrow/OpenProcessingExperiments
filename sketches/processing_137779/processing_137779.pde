
//objects HW#7 Rachel Hill, March 2.
//Use objects and classes to animate a race between objects 

Fish raceFish1;
Fish raceFish2;
Fish raceFish3;
Fish raceFish4;
Fish raceFish5;

void setup() {
  size(500, 400);
  //represents color of fish as well as position and speed
  raceFish1 = new Fish(color(#F58216), 0, 20, 3);
  raceFish2 = new Fish(color(#F54716), 0, 100, 5);
  raceFish3 = new Fish(color(#F51616), 0, 200, 2);
  raceFish4 = new Fish(color(#F5D016), 0, 300, 4);
  raceFish5 = new Fish(color(#A6F516), 0, 350, 1);
}

void draw() {
  background(#0270DB);
  raceFish1.swim();
  raceFish1.display();
  raceFish2.swim();
  raceFish2.display();
  raceFish3.swim();
  raceFish3.display();
  raceFish4.swim();
  raceFish4.display();
  raceFish5.swim();
  raceFish5.display();
}

class Fish {
  color c; //color
  float xpos;    //position on the x
  float ypos;    //postion on the y
  float xspeed;    //speed 


  Fish(color fC, float fxpos, float fypos, float fxspeed) {
    c = fC;
    xpos = fxpos;
    ypos = fypos;
    xspeed = fxspeed;
  }

  void display() {
    noStroke();
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, 40, 30); //body
    triangle(xpos-20, ypos, xpos-35, ypos+20, xpos-35, ypos-20);//fin
    fill(0);
    ellipseMode(CENTER);
    ellipse(xpos+10, ypos-2, 7, 7);//eye
  }

  void swim() {
    xpos = xpos + xspeed;
    if (mousePressed) {
      xpos = 0;    //Fish start over
    }
  }
}
