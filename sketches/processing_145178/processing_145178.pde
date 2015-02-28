
//Monday, April 21, 2014 11:39 AM
// Linus Woodard period 4 engineering - 4.9.13
// w a s d or armrow keys move plane, b or space bar drops bomb, r restarts
// the first time you hit a house the computer slows down but after that it should be faster  

int a=25;
int s=25;
int S=25;
int A=25;
int position1=680;
int position2=680;
int position3=680;
int red;
int green;
int blue;
int score;

void setup ()
{
  size (1500, 700);
}

void draw ()
{
  background (red, green, blue);
  
  strokeWeight (4);
  stroke (250, 5, 220);
  line (0, 600, 1500, 600);
  //firing line
  
  frameRate (600);
  //strokeWeight (1);
  noStroke ();
  fill (50);
  ellipse (a-90, s-4, 8, 8);
  ellipse (a+90, s-4, 8, 8);
  //curves on edges of fins
  rect (a-2, s-45, 4, 40);
  //tail fin
  ellipse (A, S+4, 8, 8);
  rect (A-4, S-4, 8, 8);
  //bomb
  fill (150);
  triangle (a+50, s, a+70, s, a+60, s+20);
  ellipse (a+60, s-8, 19, 10);
  triangle (a-70, s, a-50, s, a-60, s+20);
  ellipse (a-60, s-8, 19, 10);
  //engins
  fill (50);
  rect (a-90, s-8, 180, 8);
  //fins
  fill (180);
  ellipse (a, s, 30, 30);
  //body
  
  stroke (0);
  strokeWeight (1);
  fill (255);
  rect (290, position1, 20, 20);
  triangle (290, position1, 310, position1, 300, position1-10);
  rect (740, position2, 20, 20);
  triangle (740, position2, 760, position2, 750, position2-10);
  rect (1110, position3, 20, 20);
  triangle (1110, position3, 1130, position3, 1120, position3-10); 
  //targets
  if (key=='a' | key==CODED & keyCode==LEFT)
  {
    a=a-2;
    A=a;
    S=s;
    red=50;
    green=50;
    blue=240;
  }
  else if (key=='d' | key==CODED & keyCode==RIGHT)
  {
    a=a+2;
    A=a;
    S=s;
    red=50;
    green=50;
    blue=240;
  }
  else if (key=='w' | key==CODED & keyCode==UP)
  {
    s=s-2;
    S=s;
    A=a;
    red=50;
    green=50;
    blue=240;
  }
  else if (key=='s' | key==CODED & keyCode==DOWN)
  {  
    s=s+2;
    S=s;
    A=a;
    red=0;
    red=50;
    green=50;
    blue=240;
  }
  //dropping bomb
  if (key=='b' | key==' ')
  {
    S=S+4;
    A=A;
    red=240;
    green=30;
    blue=30;
  }
  else if (key=='r')
  {
    a=25;
    s=25;
    A=25;
    S=25;
    position1=680;
    position2=680;
    position3=680;
    red=50;
    green=50;
    blue=240;
  }
  else
  {
    red=50;
    green=50;
    blue=240;
  }


  if (s>600)
  {
    a=650;
    s=25;
    A=650;
    S=25;
    position1=680;
    position2=680;
    position3=680;
    red=50;
    green=50;
    blue=240;
  }

  //explode
  fill (random (0,255),0,0);
  if (S>680 && A>290 && A<310)
  {
    rect (random (280, 320), random (670, 700), 5, 5);
    rect (random (280, 320), random (670, 700), 5, 5);
    position1=800;
  }
  if (S>680 && A>740 && A<760)
  {
    rect (random (730, 770), random (670, 700), 5, 5);
    rect (random (730, 770), random (670, 700), 5, 5);
    position2=800;
  }
  if (S>680 && A>1110 && A<1130)
  {
    rect (random (1100, 1140), random (670, 700), 5, 5);
    rect (random (1100, 1140), random (670, 700), 5, 5);
    position3=800;
  }


  //score
  fill (255);
  textSize (40);
  if (position1<700 & position2<700 & position3<700)
  {
    text ('0', 1200, 100);
  }
  if (position1>700 & position2<700 & position3<700)
  {
    text ('1', 1200, 100);
  }
  if (position2>700 & position1<700 & position3<700)
  {
    text ('1', 1200, 100);
  }
  if (position3>700 & position1<700 & position2<700)
  {
    text ('1', 1200, 100);
  }
  if (position1>700 & position2>700 & position3<700)  
  {
    text ('2', 1200, 100);
  }
  if (position2>700 & position3>700 & position1<700)
  {
    text ('2', 1200, 100);
  }
  if (position1>700 & position3>700 & position2<700)
  {
    text ('2', 1200, 100);
  }
  if (position1>700 & position2>700 & position3>700)
  {
    text ('3', 1200, 100);
    textSize (200);
    text ("Winner", 350, 400);
  }
  println (position1+"   "+position2+"  "+position3);
} 


