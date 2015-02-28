

Object object1;
Object object2; 
Object object3;
Object object4; 
Object object5;
Object object6;
Object object7;
Object object8;
Object object9;
Object object10;
Object object11;
Object object12;
Object object13;
Object object14;
Object object15;
Object object16;
Object object17;
Object object18;
Object object19;
Object object20;
Object object21;
Object object22;
Object object23;
Object object24;



void setup() {
  size(800,720);
  object1 = new Object(color(69,204,199),0,0,12); // Parameters go inside the parentheses when the object is constructed.
  object2 = new Object(color(69,201,160),160,60,11);
  object3 = new Object(color(68,180,126),320,120,10);
  object4 = new Object(color(174,131,232),480,180,9);
  object5 = new Object(color(245,239,173),640,240,8);
  object6 = new Object(color(255,205,255),800,300,7);
  object7 = new Object(color(255,165,193),160,360,6);
  object8 = new Object(color(165,220,255),320,420,5);
  object9 = new Object(color(255,255,255),480,480,4);
  object10 = new Object(color(196,255,165),640,540,3);
  object11 = new Object(color(240,97,135),800,600,2);
  object12 = new Object(color(255,70,252),160,660,1);
  object13 = new Object(color(255,165,193),160,0,6);
  object14 = new Object(color(165,220,255),320,60,5);
  object15 = new Object(color(255,255,255),480,120,4);
  object16 = new Object(color(196,255,165),640,180,3);
  object17 = new Object(color(240,97,135),800,240,2);
  object18 = new Object(color(255,70,252),160,300,1);
  object19 = new Object(color(69,204,199),0,360,12); 
  object20 = new Object(color(69,201,160),160,420,11);
  object21 = new Object(color(68,180,126),320,480,10);
  object22 = new Object(color(174,131,232),480,540,9);
  object23 = new Object(color(245,239,173),640,600,8);
  object24 = new Object(color(255,205,255),800,660,7);
}

void draw() {
  background(0);
  object1.move();
  object1.display();
  object2.move();
  object2.display();
  object3.move();
  object3.display();
  object4.move();
  object4.display();
  object5.move();
  object5.display();
  object6.move();
  object6.display();
  object7.move();
  object7.display();
  object8.move();
  object8.display();
  object9.move();
  object9.display();
  object10.move();
  object10.display();
  object11.move();
  object11.display();
  object12.move();
  object12.display();
  object13.move();
  object13.display();
  object14.move();
  object14.display();
  object15.move();
  object15.display();
  object16.move();
  object16.display();
  object17.move();
  object17.display();
  object18.move();
  object18.display();
  object19.move();
  object19.display();
  object20.move();
  object20.display();
  object21.move();
  object21.display();
  object22.move();
  object22.display();
  object23.move();
  object23.display();
  object24.move();
  object24.display();
  
}

class Object { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isnâ€™t object-oriented programming swell?
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Object(color tempC, float tempXpos, float tempYpos, float tempXspeed) { // The Constructor is defined with arguments.
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    noStroke();
    fill(c);
    rect(xpos,ypos,160,60,0,100,0,100);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}


