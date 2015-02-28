
Monster grr;

void setup()  {
size(500,600);
grr = new Monster();
}

void draw(){
background(255);
grr.updateMonster();
grr.testMonster();
grr.tekenMonster();
}


class Monster{

int X;
int Y;
int speed;  // botstbal

Monster(){
X=200;
Y=150;
speed=1;

}

void updateMonster(){
 X = X + speed;
}
  
 void testMonster(){ 
 if ((X>width) || (X<0)) {
    speed = speed*-1;
  }}


void tekenMonster(){
int thesize= 4;

line(X-70,Y+10,X-180,Y+190);  //left arm
line(X+90,Y+10,X+180,Y+190);  //right arm

fill(185,184,184);
ellipse(X+ 10,Y- 50,250,150);  //head

fill(0,90,0);
rect(X- 75,Y,170,400);  //body

fill(255);
line(X- 70,Y- 30,X+ 90,Y- 30);  //horizontal
line(X- 55,Y- 10,X- 55,Y- 50);
line(X- 35,Y- 10,X- 35,Y- 50);
line(X- 15,Y- 10,X- 15,Y- 50);
line(X,Y- 10,X,Y- 50);
line(X+ 15,Y- 10,X+ 15,Y- 50);
line(X+ 35,Y- 10,X+ 35,Y- 50);
line(X+ 55,Y- 10,X+ 55,Y- 50);
line(X+ 75,Y- 10,X+ 75,Y- 50);  //grin

fill(255);
ellipse(X- 65,Y- 75,40,40);
ellipse(X+ 80,Y- 75,40,40);  //eyes
line(X- 85,Y- 95,X- 40,Y- 80);
line(X+ 55,Y- 80,X+ 100,Y- 95);  //eyebrows

fill(255,0,0);
ellipse(X- 65,Y- 75,25,25);
ellipse(X+ 80,Y- 75,25,25);  //pupils

}
  }
  




