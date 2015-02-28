
//Eleni Katrini
//ekatrini@andrew.cmu.edu
//copyright © Eleni Katrini, September 2013
//HW04_Fix Jim


float x, y, a, b, wd, ht, xel, yel, xer, yer, xm, ym, xh, yh;
color col= color(253, 50, 0);


void setup()
{
  size(600, 600);
  background(col);
  smooth();
  noStroke();
  frameRate(100);
    
  x=300;
  y=300;
  a= width/2; //width
  b= height/2; //height
  xel= x; //x eyeleft
  yel= y; //y eyeleft
  xer= x; //x eyeright
  yer= y; //y eyeright
  xm= x;  //x moustache
  ym= y;  //y moustache
  xh= x;  //x hair
  yh = y; //y hair
}


void draw()
{

background(col);

//TEXT instructions: JIM GOT MESSED UP!
//press UP, DOWN, LEFT, RIGHT to move moustache
//press I, M, J, K to move right eyeball
//press E, X, S, D to move left eyeball
//press SPACEBAR to move hair
//click anywhere to start over

  fill(255, 255, 255);
  textSize(24);
  text("JIM got ALL MESSED UP!",170, 550); 
  textSize(14);
  text("press Up, Down, Left, Right, I, J, K, M, E, D, S, X and SPACEBAR to fix him", 70, 570);
  text("click mouse to start over!", 210, 590);
  
//head
fill(250, 129, 161);
noStroke();
ellipse( x, y, a, b);

//mouth
stroke(255, 255, 255, 99);
strokeWeight(8);
line( x - a*.1, y + b*.35, x + a*.1, y + b*.35);

///moustache TO MOVE
fill(255, 255, 255);
stroke(255, 255, 255);
strokeWeight(2);
ellipseMode(CORNER);

beginShape();
  arc(xm + 50 - a*.25, ym + 100 + b*.15, a*.25, b*.25, radians(0), radians(180));
  arc(xm + 50, ym + 100 + b*.15, a*.25, b*.25, radians(0), radians(180));
endShape();


//nose
noFill();
strokeCap(ROUND);
stroke(255, 255, 255);
strokeWeight(2);

ellipseMode(CENTER);
arc( x - a*.1, y + b*.24, a*.05, b*.05, radians(90), radians(240));
arc( x + a*.1, y + b*.24, a*.05, b*.05, radians(-60), radians(90));
line( x - a*.1, y + b*.265, x + a*.1, y + b*.265);


//ears
fill(250, 129, 161);
noStroke();
beginShape();
  curveVertex( x - a*.2, y       ); //left ear reference point
  curveVertex( x - a*.4, y - b*.15); //left ear first point
  curveVertex( x - a*.55, y - b*.10); //left ear second point
  curveVertex( x - a*.4, y + b*.25); //left ear third point
  curveVertex( x - a*.6, y        ); //left ear reference point
endShape();

beginShape();
  curveVertex( x + a*.2, y       ); //right ear reference point
  curveVertex( x + a*.4, y - b*.15); //right ear first point
  curveVertex( x + a*.55, y - b*.10); //right ear second point
  curveVertex( x + a*.4, y + b*.25); //right ear third point
  curveVertex( x + a*.6, y        ); //right ear reference point
endShape();

//eyeballs TOMOVE
fill(70, 35, 0);
noStroke();
ellipse(xel - 200 -a*.15, yel - 100 + b*0.01, a*.08, b*.08);
ellipse(xer + 150 +a*.15, yer - 200 + b*0.01, a*.08, b*.08);

//glasses-eyes
fill(255, 255, 255);
arc(x-a*.15, y, a*.2, b*.2, radians(-180), radians(0));
arc(x+a*.15, y, a*.2, b*.2, radians(-180), radians(0));
line(x-a*.25,y , x-a*.05, y);

noFill();
strokeWeight(2);
stroke(255, 255, 255);
arc(x-a*.15, y, a*.2, b*.2, radians(45), radians(180));
arc(x+a*.15, y, a*.2, b*.2, radians(0), radians(135));


//hair TO MOVE
noStroke();

fill(230, 230, 230);
ellipseMode(CENTER);


//LEFT
arc(xh - a*.45, yh - 100 - b*.55, a*.75, b*.75, radians(0), radians(102), 1);
arc(xh - a*.1355, yh - 100 - b*.18, a*.75, b*.75, radians(175), radians(280), 1);

//RIGHT
arc(xh + a*.35, yh - 100 - b*.55, a*.85, b*.85, radians(70), radians(182), 1);
arc(xh + a*.07, yh - 100 - b*.18, a*.85, b*.85, radians(248), radians(367), 1);

}

void keyPressed()
{
  if (keyCode == UP)
  {
   ym = ym - 3; 
  }
  
  else if (keyCode == DOWN)
  {
    ym = ym + 3;
  }
  
  else if (keyCode == LEFT)
  {
    xm = xm - 3;
  }
  
  else if (keyCode == RIGHT)
  {
    xm = xm + 3;
  }
  
  else if (keyCode == 'K')
  {
    xer = xer + 3;
  }
  
  else if (keyCode == 'J')
  {
    xer = xer - 3;
  }
  
  else if (keyCode == 'M')
  {
    yer = yer + 3;
  }
  
  else if (keyCode == 'I')
  {
    yer = yer - 3;
  }

    
  else if (keyCode == 'D')
  {
    xel = xel + 3;
  }
  
  else if (keyCode == 'S')
  {
    xel = xel - 3;
  }
  
  else if (keyCode == 'X')
  {
    yel = yel + 3;
  }
  
  else if (keyCode == 'E')
  {
    yel = yel - 3;
  }

  else if (keyCode == ' ')
  {
    xh = x + random(-100, 100);
    yh = y + random(-100, 100);
  }
}

void mousePressed()
{
 xel= x;
 yel= y;
 xer= x;
 yer= y;
 xm= x;
 ym= y;
 xh= x;
 yh= y;
 
 col= color(random(100), random(200), random(255));
 
}




