
//computer arts for processing 60-257
//hw #7 creating a collision game 
//copyright kyree 2012

float x, y, dia, speedh,speedv;
float qx, qy, qd, qSpeedh, qSpeedv;
int hits;


void setup()
{
  size(600,450);
  smooth();
  noStroke();
  
  x = 200;
  y = 250;
  dia = 130;
  speedh = 2;
  speedv = 2;
  
  
  qx = width/2;
  qy = height/2;
  qd = 1;

  hits = 0;
}

void draw()
{
  background(#66B7A3, 200);
  drawNerd(x,y,dia);
  moveNerd();  
  drawQues(qx, qy, qd);
  moveQues();
  countHits();
}

void drawNerd(float x, float y, float dia)
{
  //draw ellipse
  noStroke(); 
  fill(255);
  ellipse(x, y, dia, dia);

  //glasses
  stroke(151, 60, 0);
  strokeWeight(10);
  beginShape();
    vertex(x-(dia*.5), y);
    vertex(x-(dia*.25), y+(dia*.25));
    vertex(x, y);
    vertex(x+(dia*.25), y+(dia*.25));
    vertex(x+dia*.5, y);
    vertex(x-(dia*.5), y);
  endShape();

  //eyes
  stroke(0);
  point(x-(dia*.25), y*1.05);
  point(x+(dia*.25), y*1.05);

//teeth
  strokeWeight(3);
  rect(x-(dia*.1), y+(dia*.25),dia/12,dia/10);
  rect(x+(dia*.01), y+(dia*.25),dia/12,dia/10);
}


void moveNerd()
{
  x = x + speedh;
  if(x > width - .5*dia)
    {
    speedh = -speedh;
    }
    else if (x < dia* .5)
    {
      speedh = -speedh;
    }
   y = y - speedv;
   
 if (y <0 + dia*.5)
    {
     speedv = -speedv;
    }
    else if (y > height - dia*.5)
    {
      speedv = -speedv;
    }
}

void drawQues(float qx, float qy, float qd)

{
  textAlign(CENTER);
  fill(255);
  fill(0,0,0,157);
 textSize(30);
  text( "?", qx, qy);
}

void moveQues()
{
  //move target with mouse
   qx += qSpeedh;
   qy+= qSpeedv;
  
 //horizontal wrap
    qx = qx + qd;
  if(qx > width)
    {
    qx = 0;
    }
    else if (qx < 0)
    {
      qd =  -qd;
    }
    
//vertical wrap    
     qy = qy + qd;
  if(qy > width)
    {
    qy = 0;
    //qd = -qd;
    }
    else if (qy < 0)
    {
      qd =  -qd;
    }
}   


void countHits()
{
  textAlign(CORNER);
  textSize(20);
  text(hits +  " hits", 50,425);
   //detect collision by distance
   float d = dist (x, y, qx, qy);
   
    if (d < 100)
    {
     hits = hits + 1; 
     speedh = speedh + .25;
     speedv = speedv + .25; 
    
    //move the target to a random location after the hit    
     qy = random(height);
     qx = random(width);
     
//     dia = dia + 5;
background(random (255), random (255), random (255));
    }
   
     //timer 

  text( millis( )/1000 + " seconds", 50, 400); 
}
    

void mouseDragged( )
{
  if (mouseX < pmouseX) {
      qSpeedh = qSpeedh - .1; 
  } else if (mouseX > pmouseX) {
     qSpeedh = qSpeedh + .1; 
  }
  if (mouseY < pmouseY) {
     qSpeedv = qSpeedv -.1;
  } else if (mouseY > pmouseY) {
    qSpeedv = qSpeedv + .1;
  }
}
   
   void keyPressed()
{
  //use the spacebar to reset target position
 if (key == ' ')
  {
  qx = width/2;
  qy = height/2;
  qSpeedv = 0;
  qSpeedh = 0;
  } 
   
}
                
