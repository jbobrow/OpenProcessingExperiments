
//objects HW#7 Rachel Hill, March 2.
//Use objects and classes to animate a race between objects

Fish raceFish1;
Fish raceFish2;
Fish raceFish3;
Fish raceFish4;
Fish raceFish5;

void setup() {
  size(800, 275);
  //represents color of fish as well as position and speed
  raceFish1 = new Fish(color(#F58216, 170), 0, 25, 5);
  raceFish2 = new Fish(color(#DE02F7, 170), 0, 75, 5);
  raceFish3 = new Fish(color(#F51616, 170), 0, 125, 5);
  raceFish4 = new Fish(color(#F5D016, 170), 0, 175, 5);
  raceFish5 = new Fish(color(#A6F516, 170), 0, 225, 5);
}

void draw() {
  background(#0270DB);
  stroke(255, 100);
  strokeWeight(3);
  line(0, 50, width-10, 50);
  line(0, 100, width-10, 100);
  line(0, 150, width-10, 150);
  line(0, 200, width-10, 200);
  strokeWeight(10);
  line(width-10, 0, width-10, height);
  raceFish1.swim();
  raceFish2.swim();
  raceFish3.swim();
  raceFish4.swim();
  raceFish5.swim();
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
    xspeed = random(fxspeed);
  }

  void display() {
    noStroke();
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, 40, 30); //body
    triangle(xpos-20, ypos, xpos-35, ypos+20, xpos-35, ypos-20);//fin
    triangle(xpos, ypos, xpos-20, ypos+5, xpos -20, ypos-15);
    fill(0);
    ellipseMode(CENTER);
    ellipse(xpos+10, ypos-2, 7, 7);//eye
  }

  void swim() {
    display();
    xpos = xpos + xspeed;
    if (xpos>width) {
      fill(c);
      textSize(20);
      text("1st place!!!", width/2, height-10);
      noLoop();
    }
  }
}

