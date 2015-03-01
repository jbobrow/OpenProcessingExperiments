
int myState = 0;
int x = 0;

void setup () {
  size(700, 700);
}

void draw() {
  switch(myState) {
  case 0: 
  background(10); 
    myMonster ();  
    break; 
  case 1:
      background(10);
      translate(550, 150) ;
      rotate(radians(45)); 
    myMonster ();
   break; 
   case 2: 
      background(random(255));
      rotate(radians(15));
    myMonster () ;
   break;
   case 3:
      background(random(255), random (255), random (255));
      translate(200, 0);
      scale(.5);
    myMonster ();
   break;
   case 4:
      background(random(255), random (255), random (255));
      translate(100, 0);
      scale(.3);
    myMonster ();
   break;
   case 5:
      background(random(255));
      translate(100, 0);
      scale(2);
    myMonster ();
   break;
}}

void mouseReleased() {
 myState = myState + 1 ;
 if (myState > 5) {
   myState = 0 ;
}}

void myMonster () {
    fill(255);
    ellipse(265, 230, 400, 400);
    fill(10);
    ellipse(265, 230, 380, 380);
    fill(#464848);
    arc(160, 160, 200, 200, PI, TWO_PI);
    fill(#464848);
    arc(360, 160, 200, 200, PI, TWO_PI);
    fill(#1AFFE2);
    ellipse(152, 144, 72, 72);
    fill(#1AFFE2);
    ellipse(352, 144, 72, 72);
    fill(#0A0A0A);
    ellipse(152, 144, 50, 50);
    fill(#0A0A0A);
    ellipse(352, 144, 50, 50);
    fill(#F5F5F5);
    ellipse(152, 144, 30, 30);
    fill(#F5F5F5);
    ellipse(352, 144, 30, 30);
    fill(#464848);
    arc(279, 250, 280, 280, 0,PI);
    fill(#8B5A5C);
    arc(280, 250, 260, 280, 0,PI);
    fill(#FF1519);
    arc(280, 360, 160, 180, PI, TWO_PI);
    fill(#FF1519);
    arc(280, 350, 160, 100, 0, PI);
    fill(#B43E3E);
    triangle(280, 390, 280, 310, 288, 360); 
    fill(#529088);
    quad(216, 161, 216, 60, 116, 60, 44, 60);
    fill(#529088);
    quad(303, 161, 304, 60, 116, 60, 470, 60);
    fill(#FFFFFF);
    rect(166, 251, 40, 40);
    fill(#FFFFFF);
    rect(251, 251, 40, 40);
    fill(#FFFFFF);
    rect(339, 251, 40, 40);
    fill(#57F0CB);
    quad(216, 161, 200, 100, 120, 80, 50, 50) ;
    quad(303, 161, 304, 60, 320, 100, 460, 50);
}


