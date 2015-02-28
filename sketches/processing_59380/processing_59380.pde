


mund1 mund1;
ohr2 ohr2; 
kopf kopf;
ohrstill ohrstill;
ohrstill2 ohrstill2;
mundstill mundstill;
augelinks augelinks;
augerechts augerechts;


void setup() {
  size(300,300); 

  mund1 = new mund1(color(255,90),100,150,5); 
ohr2 = new ohr2(color(255,80),70,130,10);
kopf = new kopf (color(255),150,150,0);
  ohrstill = new ohrstill (color(255),230,130,0);
    ohrstill2 = new ohrstill2 (color(255),70,130,0);
    mundstill = new mundstill (color(255),150,200,0);
     augelinks = new augelinks (color(0),120,120,0);
      augerechts = new augerechts (color(0),180,120,0);
      
      
      
      
}

void draw() {
  background(0,0,0);
  mund1.move();
 mund1.display();
ohr2.move();
ohr2.display();
kopf.move();
kopf.display();
ohrstill.move();
ohrstill.display();
ohrstill2.move();
ohrstill2.display();
mundstill.move();
mundstill.display();
augelinks.move();
augelinks.display();
augerechts.move();
augerechts.display();
}






//gelaber

class mund1 { 
  color c;
  float ypos;
  float xpos;
  float yspeed;

  mund1(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    ypos = tempXpos;
    xpos = tempYpos;
    yspeed = tempXspeed;
  }

  void display() {
    noStroke();
     smooth(); 
    fill(c);
    rectMode(CENTER);
    ellipse(xpos,ypos,80,30);
  }

  void move() {
    ypos = ypos + yspeed;
    if (ypos > 400) {
      ypos = 200;
    }
  }
}

//stimmen hören 
class ohr2 { 
  color c;
  float ypos;
  float xpos;
  float xspeed;

ohr2(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    noStroke();
    fill(c);
    rectMode(CENTER);
    ellipse(xpos,ypos,20,60);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > 60) {
      xpos = 0;
    }
  }
}


//kopf
class kopf { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  kopf(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(255);
     smooth(); 
   noFill();
    rectMode(CENTER);
    ellipse(xpos,ypos,140,150);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}


//ohr rechts

class ohrstill  { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  ohrstill (color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(255);
     smooth(); 
   noFill();
    rectMode(CENTER);
    ellipse(xpos,ypos,20,50);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}



//ohr links

class ohrstill2  { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  ohrstill2 (color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(255);
     smooth(); 
   noFill();
    rectMode(CENTER);
    ellipse(xpos,ypos,20,50);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}




//mund

class mundstill  { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

mundstill (color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(255);
     smooth(); 
   noFill();
    rectMode(CENTER);
    ellipse(xpos,ypos,60,30);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}


//auge links

class augelinks  { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

augelinks (color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
   stroke(255);
     smooth(); 
   noFill();
    rectMode(CENTER);
    ellipse(xpos,ypos,30,30);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}




//auge rechts


class augerechts  { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

augerechts (color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(255);
     smooth(); 
noFill();
    rectMode(CENTER);
    ellipse(xpos,ypos,30,30);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}



