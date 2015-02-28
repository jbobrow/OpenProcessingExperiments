
// Arthur Siebesian...Race 
//Used Danial Shiffmans example to further understand concept
//added parts so that I could get a grasp of how the function worked
//March 4,2014
//Number 2 SpaceSHIPS!!!
Sphere mySphere1;
Sphere mySphere2;
Sphere mySphere3;
Sphere mySphere4;
Sphere mySphere5;
Sphere mySphere6;

void setup() {
  size(500,200);
  mySphere1 = new Sphere(color(255,0,0),0,30,random(10)); // color of each indiv. sphere
  mySphere2 = new Sphere(color(0,0,255),30,60,random(10)); // the 3 parameters next to the color...
  mySphere3 = new Sphere(color(50,255,100),0,90,random(10)); // dictate position and speed.
  mySphere4 = new Sphere(color(140,10,200),0,120,random(10));
  mySphere5 = new Sphere(color(200,50,100),0,150,random(10));
  mySphere6 = new Sphere(color(200,155,25),100,180,random(10));
}

void draw() {
  background(0); // background gray
  stroke(255);
  line(490,0,490,490); //finish line
  line(0,15,490,15);
  line(0,45,490,45);
  line(0,75,490,75);
  line(0,105,490,105);
  line(0,135,490,135);
  line(0,165,490,165);
  line(0,195,490,195);
  mySphere1.move();
  mySphere1.display();
  mySphere2.move();
  mySphere2.display();
  mySphere3.move();
  mySphere3.display();
  mySphere4.move();
  mySphere4.display();
  mySphere5.move();
  mySphere5.display();
  mySphere6.move();
  mySphere6.display();
}

class Sphere { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Sphere(color sphereC, float sphereXpos, float sphereYpos, float sphereXspeed) { 
    c = sphereC;
    xpos = sphereXpos;
    ypos = sphereYpos;
    xspeed = sphereXspeed;
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    ellipse(xpos,ypos,20,10);
    rect(xpos-10,ypos-10,10,10);
    rect(xpos-10,ypos+10,10,10);
  }

  void move() {
    xpos = xpos + xspeed;
    if (mousePressed) {
      xpos = 0;
    }
  }
}
