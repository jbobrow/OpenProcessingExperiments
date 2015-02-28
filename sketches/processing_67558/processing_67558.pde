
float X = 20;
float Y = 20;
float K = random (-1.5,1.5);
float L = random (-1.5,1.5);
float back255;
float back150;
float back0;

void setup() {
size(900,900);
smooth();
}

void draw() {
  back255=random(50,225);
  back150=random(25,255);
  back0=random(250,255);
  
  background(back255,back150,back0);
stroke(10, 200, 50);
fill(Y+0,X+0,Y+0,X+255);
rect(X+150, Y+150, 40 , 150);
fill(X+255,X+255,Y+255,Y+255);
ellipse(X+170,Y+150, 100, 100);
line(X+150,Y+200,X+120,Y+ 350);
line(X+190,Y+200,X+220,Y+350);
fill(X+150,Y+100,Y+200,Y+250);
ellipse(X+140,Y+150,30,Y+15);
ellipse(X+200,Y+150,30,Y+15);

X = X+ K;
Y = Y+ L;
}


