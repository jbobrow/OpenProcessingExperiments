
//Shanna Chan

float ht,wd,x,y,sz;
float vr,dx1,dy1,x1,y1,dx2,x2,y2,dx,dy;
int hits,hits1;

void setup()
{
  size(700,400);
  ht = 50;
  wd = 50;
  vr = 30;
  x = 150;
  y = 150;
  sz = 150;
  dx1 = 1;
  dy1 = 1;
  dx2=1;
  x1 = 400;
  y1 = 250;
  x2 = 100;
  y2 = 200;
  dx = 3;
  dy = 3;
  smooth();
}

void setting ()
{
fill(101,186,227);
rect(0,0,width,height*.75);
fill(165,145,102);
rect(0,height*.75,width,height);
  stroke(157);
  strokeWeight(10);
  line(0,height*.75,width,height*.75);
  
}
void draw ()
{ println (frameCount);
setting();
showDeath();
showHit();
movePeanut();
peanut();
moveTrain();
train1();
moveApple();
apple();
detectScore();
detectHit();

}



void peanut ()
{
  pushMatrix();
translate (x,y);
figureBody ();
if (frameCount %vr<vr*.5)
{
  figureLegs1 ();
arms2();
}
else 
{
  figureLegs2 ();
arms1();
}
popMatrix();
}


void figureBody ()
{
noStroke();
fill(211,185,128);
ellipse(0,0,sz*.5,sz*.55);
ellipse(0,0+wd,sz*.4,sz*.45);
triangle(0,0-sz*.32,0-sz*.2,0-sz*.127,0+sz*.2,0-sz*.127);
//facial features
fill(0);
ellipse(0-sz*.125,0,ht*.1,wd*.1);
ellipse(0+sz*.125,0,ht*.1,wd*.1);

fill(255,5,14);
arc(0,0+sz*.1,ht*.25,wd*.25,0,PI+QUARTER_PI, CHORD);
}

void figureLegs1()
{
  stroke(211,185,128);
strokeWeight(2);
//left
line(0-sz*.05,0+wd,0-sz*.1,0+wd*2);
line(0-sz*.1,0+wd*2,0-sz*.05,0+wd*2.2);
strokeWeight(3);
line(0-sz*.05,0+wd*2.2,0-sz*.06,0+wd*2.3);

//right
line(0+sz*.05,0+wd*2.3,0+sz*.06,0+wd*2.4);
strokeWeight(2);
line(0+sz*.05,0+wd,0+sz*.07,0+wd*2.1);
line(0+sz*.07,0+wd*2,0+sz*.05,0+wd*2.3);

}

void figureLegs2()
{
  stroke(211,185,128);
strokeWeight(2);
//right
line(0+sz*.05,0+wd,0+sz*.1,0+wd*2);
line(0+sz*.1,0+wd*2,0+sz*.05,0+wd*2.2);
strokeWeight(3);
line(0+sz*.05,0+wd*2.2,0+sz*.06,0+wd*2.3);

//right
line(0-sz*.05,0+wd*2.3,0-sz*.06,0+wd*2.4);
strokeWeight(2);
line(0-sz*.05,0+wd,0-sz*.07,0+wd*2.1);
line(0-sz*.07,0+wd*2,0-sz*.05,0+wd*2.3);

}

void arms1()
{ strokeWeight (2);
line(0+wd*.5,0+ht*.75,0+wd*.75,0+ht*1.5);
line(0-wd*.5,0+ht*.75,0-wd*.7,0+ht*1.3);
}

void arms2()
{strokeWeight (2);
line(0-wd*.5,0+ht*.75,0-wd*.75,0+ht*1.5);
line(0+wd*.5,0+ht*.75,0+wd*.7,0+ht*1.3);
}

void movePeanut()
{ x +=dx1;
  y +=dy1;
  if (x>width || x<0)
  {
    dx1 = -dx1;
    x += dx1;
    
  }
   
  if (y>height || y<0)
  {
    dy1 = -dy1;
    y += dy1; 
  }
}

void keyPressed()
{
  if (keyCode == RIGHT)
  {
    dx1++;
  }
   
  else if (keyCode == LEFT)
  {
    dx1--;
  }
   
  else if (keyCode == UP)
  {
    dy1--;
  }
  else if (keyCode == DOWN)
  {
    dy1++;
  }
   
  if (key == ' ')
  {
 dx1=0;
 dy1=0;
  }
  
  else if (key == 'r')
 {
   dx++;
 }
 
else if (key == 'l')
 {
   dx--;
 }
 else if (key == 'd')
 {
   dy++;
 }
 
else if (key == 'u')
 {
   dy--;
 }
   
}
   
void moveTrain()
{x1 += dx2;
   
  if (x1 > width)
  {x1= -475;}
  
}

void train1() 
{
pushMatrix();
translate (x1,y1);
noStroke();
fill(200);
rect(0,0,475,135);
//door
fill (130,75);
rect (200,25,50,100,7);
fill (0);
rect(207.5,35,35,40,7);

fill (100,20);
rect(0,100,475,35);

fill(255,217,77);
rect(0,0,15,135);
rect(460,0,15,135);
fill(0);
//wheels
fill(0);
ellipse (50,145,25,25);
ellipse (200,145,25,25);
ellipse (250,145,25,25);
ellipse (425,145,25,25);
//windows
rect (30,35,35,35,7);
rect (70,35,35,35,7);
rect (110,35,35,35,7);
rect (150,35,35,35,7);
rect (275,35,35,35,7);
rect (315,35,35,35,7);
rect (355,35,35,35,7);
rect (395,35,35,35,7);
popMatrix();
}

void apple ()
{pushMatrix();
translate (x2,y2);
fill(255,0,4);
ellipse(0,0,25,25);
popMatrix();
}
void moveApple()
{x2 += dx;
 y2 += dy;
   
  if (x2 > width)
  {x2= 0;}
  
    if (y2 > height)
  {y2= 0;}
}

  void detectHit()
{
 float d = dist(x,y, x1+235, y1+70);
 float colDist = 150;
 if (d <= colDist)
 {
   fill (255,0,4);
   rect(0, 0, width, height);
   textSize(50);
   fill(255);
   textAlign(CENTER, CENTER);
   text("YOU KILLED PEANUT!", width*0.5, height*0.5);
   hits1++;
 }
  if (hits1>= 200)
    {
      noLoop();
      fill(0);
      textSize(40);
      text("YOU LOSE",200,300);
    }

}

  void detectScore()
{
 float d = dist(x,y, x2, y2);
 float colDist = 100;
 if (d <= colDist)
 {
   hits++;

 }
}

void showHit()
{
   fill(255, 255, 255);
   textAlign(LEFT, LEFT);
   textSize(50);
   text("SCORE: " +  hits, width*.05, height*.2 );
}

void showDeath()
{
   fill(255, 255, 255);
   textAlign(LEFT, LEFT);
   textSize(50);
   text("DEATHS: " +  hits1, width*.05, height*.4 );
}




