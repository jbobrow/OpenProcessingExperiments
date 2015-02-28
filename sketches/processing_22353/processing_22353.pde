
Thing thing1;
Thing thing2;
Thing thing3;
Thing thing4;
Thing thing5;
Thing thing6;
Thing thing7;
Thing thing8;

int trans = 50;

void setup () {
size (400, 400);
//smooth();
thing1 = new Thing (100, 100, 110, 5);
thing2 = new Thing (200, 200, 110, 3);
thing3 = new Thing (300, 300, 110, 4);
thing4 = new Thing (100, 100, 100, 6);
thing5 = new Thing (200, 200, 120, 4);
thing6 = new Thing (300, 300, 140, 6);
thing7 = new Thing (0, 0, 160, 8);
thing8 = new Thing (400, 0, 180, 8);
}

void draw () {
//background (255);
thing1.move();
thing2.move();
thing3.move();
thing4.move2();
thing5.move2();
thing6.move2();
thing7.move3();
thing8.move4();

trans -=1;

trans = constrain (trans,10,49);
}

//name the class
class Thing {

//date (variables)

float xpos;
float ypos;
float radius;
float speed;

//constructor
Thing (float tempX, float tempY, float tempRadius, float tempSpeed){
xpos = tempX;
ypos = tempY;
radius = tempRadius;
speed = tempSpeed;
}

//methods and functions

void move() {
ypos =ypos+speed;
if ((ypos > height) || (ypos<0)) {
speed *= -1;
}

stroke(255);
fill (random(255), 0, 0,trans);
ellipse (xpos, ypos, radius, radius);
}

void move2 () {
xpos =xpos+speed;
if ((xpos > width) || (xpos<0)) {
speed *= -1;
}
fill (random(255), 0, 0, trans);
ellipse (xpos, ypos, radius, radius);
}

void move3 () {
xpos =xpos+speed;
ypos =ypos+speed;
if ((xpos > width) || (xpos<0)) {
speed *= -1;
}
fill (random(255), 0, 0, trans);

ellipse (xpos, ypos, radius, radius);
}

void move4 () {
xpos =xpos-speed;
ypos =ypos+speed;
if ((xpos > width) || (xpos<0)) {
speed *= -1;
}
fill (random(255), 0, 0, trans);
ellipse (xpos, ypos, radius, radius);
}



}

