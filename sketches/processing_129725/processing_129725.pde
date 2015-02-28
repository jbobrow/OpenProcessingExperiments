
//HW_3 - Tues/Thurs 11:30
//Copyright J William Gott 2014


float x, y;
float wd, ht;
float xDist, yDist;
float easingCoef;


void setup ()
{
    size (400,400);
    easingCoef = .001;
    noCursor();
}

void draw ()
{
  
  wd = random(60);
  ht = random(20);
  x = x+xDist*0.7*easingCoef;
  y = y+yDist*0.7*easingCoef;
  xDist = mouseX - x;
  yDist = mouseY - y;
  easingCoef = .3;

  fill(0,10);
  rectMode (CORNER);
  rect(0,0, width, height);
  
  
noStroke(); 
fill(255,160,0);
ellipseMode(CENTER);
  
  //vertical ellipse
  ellipse ( x - 20 , y - 20 , 3*wd , .5*ht);
  
  ellipse ( x + 20 , y - 20 , 3*wd , .5*ht);

  ellipse ( x + 20 , y + 20 , 3*wd , .5*ht);

  ellipse ( x - 20 , y + 20 , 3*wd , .5*ht);
  
  
  
 
  ellipse ( x - 20 , y - 40 , wd , ht);
  
  ellipse ( x + 20 , y - 40 , wd , ht);

  ellipse ( x + 20 , y + 40 , wd , ht);

  ellipse ( x - 20 , y + 40 , wd , ht);
  
fill(255,175,46);
  
  ellipse ( x + 60 , y + 100 , wd , ht);

  ellipse ( x - 60 , y + 100 , wd , ht);
  
  ellipse ( x + 60 , y - 100 , wd , ht);

  ellipse ( x - 60 , y - 100 , wd , ht);
  
fill(255,193,93);  

//vertical ellipse
  ellipse ( x - 20 , y - 140 , 6*wd , .5*ht);
 
  ellipse ( x + 20 , y - 140 , 6*wd , .5*ht);

  ellipse ( x + 20 , y + 140 , 6*wd , .5*ht);

  ellipse ( x - 20 , y + 140 , 6*wd , .5*ht);

  ellipse ( x + 100 , y + 160 , wd , ht);

  ellipse ( x - 100 , y + 160 , wd , ht);
  
  ellipse ( x + 100 , y - 160 , wd , ht);

  ellipse ( x - 100 , y - 160 , wd , ht);
 
fill(255,209,134);  

  ellipse ( x + 140 , y + 220 , wd , ht);

  ellipse ( x - 140 , y + 220 , wd , ht);
  
  ellipse ( x + 140 , y - 220 , wd , ht);

  ellipse ( x - 140 , y - 220 , wd , ht);
  
fill(255,218,157);  

//vertical ellipse
  ellipse ( x - 20 , y - 260 , 9*wd , .5*ht);
 
  ellipse ( x + 20 , y - 260 , 9*wd , .5*ht);

  ellipse ( x + 20 , y + 260 , 9*wd , .5*ht);

  ellipse ( x - 20 , y + 260 , 9*wd , .5*ht);
  

  ellipse ( x + 180 , y + 280 , wd , ht);

  ellipse ( x - 180 , y + 280 , wd , ht);
  
  ellipse ( x + 180 , y - 280 , wd , ht);

  ellipse ( x - 180 , y - 280 , wd , ht);
  
fill(255,226,180);  

  ellipse ( x + 220 , y + 340 , wd , ht);

  ellipse ( x - 220 , y + 340 , wd , ht);
  
  ellipse ( x + 220 , y - 340 , wd , ht);

  ellipse ( x - 220 , y - 340 , wd , ht);
  
fill(255);  

//vertical ellipse
  ellipse ( x - 20 , y - 380 , 12*wd , .5*ht);
 
  ellipse ( x + 20 , y - 380 , 12*wd , .5*ht);

  ellipse ( x + 20 , y + 380 , 12*wd , .5*ht);

  ellipse ( x - 20 , y + 380 , 12*wd , .5*ht);

  ellipse ( x + 260 , y + 400 , wd , ht);
  
  ellipse ( x - 260 , y + 400 , wd , ht);
  
  ellipse ( x + 260 , y - 400 , wd , ht);

  ellipse ( x - 260 , y - 400 , wd , ht);
  
  
  fill(255);
  ellipseMode(CENTER);
  ellipse(x,y,random(15),random(5));
  
}
