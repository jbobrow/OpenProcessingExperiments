
PShape n;
PShape m;

Blob Blob1;
Blob Blob2;
Blob Blob3;
Blob Blob4;
Blob Blob5;
Blob Blob6;
Blob Blob7;
Blob Blob8;
Blob Blob9;
Blob Blob10;
Blob Blob11;
Blob Blob12;
Blob Blob13;
Blob Blob14;
Blob Blob15;


void setup() {
  size(500, 500);
  background(0, 150, 150);
  n=loadShape("lossesmeanmorethangains.svg");
  m=loadShape("gainsoverlosses-01.svg");
  Blob1 = new Blob(color (150, 150, random(0, 255)), 0, 50, 1, 30, 30); 
  Blob2 = new Blob(color (0, 150, random(0, 255)), 0, 100, 6, 40, 80);
  Blob3 = new Blob(color (50, 0, random(0, 255)), 0, 200, 5, 40, 40);
  Blob4 = new Blob(color (0, 180, random(0, 255)), 0, 400, 2, 80, 40);
  Blob5 = new Blob(color (50, 50, random(0, 255)), 0, 300, 1, 130, 160);
  Blob6 = new Blob(color (0, 200, random(0, 255)), 0, 178, 1.5, 50, 70);
  Blob7 = new Blob(color (100, 100, random(0, 255)), 0, 245, 6, 100, 100);
  Blob8 = new Blob(color (0, 200, random(0, 255)), 0, 429, 3, 20, 30);
  Blob9 = new Blob(color (70, 150, random(0, 255)), 0, 389, 4, 50, 50);
  Blob10 = new Blob(color (30, 50, random(0, 255)), 0, 100, 8, 80, 60);
  Blob11 = new Blob(color (10, 0, random(0, 255)), 0, 450, 1.5, 130, 130);
  Blob12 = new Blob(color (100, 100, random(0, 255)), 0, 25, 2.5, 40, 50);
  Blob13 = new Blob(color (200, 200, random(0, 255)), 0, 220, 3.5, 20, 20);
  Blob14 = new Blob(color (40, 200, random(0, 255)), 0, 350, 4.5, 80, 100);
  Blob15 = new Blob(color (70, 20, random(0, 255)), 0, 250, 5.5, 40, 60);
}

void draw() {
  if (key=='q') {  
    calculation();
  }
  if (key == 'w') {
    gains();
  }
}

void calculation() {
  background(230, 200, 0);
  Blob1.move();
  Blob1.display();
  Blob2.move();
  Blob2.display();
  Blob3.move();
  Blob3.display();
  Blob4.move();
  Blob4.display();
  Blob5.move();
  Blob5.display();
  Blob6.move();
  Blob6.display();
  Blob7.move();
  Blob7.display();
  Blob8.move();
  Blob8.display();
  Blob9.move();
  Blob9.display();
  Blob10.move();
  Blob10.display();
  Blob11.move();
  Blob11.display();
  Blob12.move();
  Blob12.display();
  Blob13.move();
  Blob13.display();
  Blob14.move();
  Blob14.display();
  Blob15.move();
  Blob15.display();
}

void gains() {
  background(255);
  shape(n, 0, 0);

  if (mousePressed) {
    background(255);
    shape(m, 0, 0);
  }
}





class Blob {
  //color
  color c;
  //x coordinate
  float xpos;
  //y coordinate
  float ypos;
  //speed
  float xspeed;
  float xsize;
  float ysize;

  //variables just set up the arguments, what is the current color for this one instance of the class?, could name them anything
  Blob(color CurrentColor, float CurrentXpos, float CurrentYpos, float CurrentXspeed, float CurrentXsize, float CurrentYsize) {
    //the color = the current color entered into the class's arguments 
    c = CurrentColor;
    xpos = CurrentXpos;
    ypos = CurrentYpos;
    xspeed = CurrentXspeed;
    xsize = CurrentXsize;
    ysize = CurrentYsize;
  }

  void display() {
    fill (c);
    noStroke();
    ellipse(xpos, ypos, xsize, ysize);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos>width) {
      xpos=0;
    }
  }
}



