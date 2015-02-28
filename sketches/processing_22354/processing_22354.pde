
Thing thing1;
Thing thing2;
Thing thing3;
Thing thing4;
Thing thing5;
Thing thing6;
Thing thing7;
Thing thing8;
Thing thing9;



void setup () {
size (400, 400);

thing1 = new Thing (350,350,200,8.5, color  (0,255,random(255),random(70,50)));
thing2 = new Thing (300,300,190,8.5, color  (0,255,random(255),random(70,50)));
thing3 = new Thing (260,260,180,8.6, color  (0,255,random(255),random(70,50)));
thing4 = new Thing (200,200,170,8.6, color  (0,255,random(255),random(70,50)));
thing5 = new Thing (150,150,160,8.5, color  (0,255,random(255),random(70,50)));
thing6 = new Thing (100,100,150,8.4, color  (0,255,random(255),random(70,50)));
thing7 = new Thing (65,65,150,8.5, color  (0,255,random(255),random(70,50)));
thing8 = new Thing (20,20,130,8.5, color  (0,255,random(255),random(70,50)));

thing9 = new Thing (100,400,900,2.8, color  (0,255,random(255),random(20)));
}

void draw () {
  
rect (400,400,400,1);
thing1.move();
thing2.move();
thing3.move();
thing4.move();
thing5.move();
thing6.move();
thing7.move();
thing8.move();
thing9.move();


}

//name the class
class Thing {

//date (variables)

float xpos;
float ypos;
float radius;
float speed;
color c;

//constructor
Thing (float tempX, float tempY, float tempRadius, float tempSpeed, color tempc){
xpos = tempX;
ypos = tempY;
radius = tempRadius;
speed = tempSpeed;
c = tempc;
}


//methods and functions

void move () {
ypos =ypos+speed;
if ((ypos > height) || (ypos<0)) {
speed *= -1;
}

stroke(0,90);
strokeWeight(5);
fill (c);

ellipse (xpos, ypos, radius, radius);
}



}

