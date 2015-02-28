
//homework 8
//Joel McCullough copyright Pittsburgh PA 15221 
//Arnold's target practice
float x,y, dia,deltaX,deltaY,ix,iy,vel,deltaiX,deltaiY;
int numCount;



void setup()
{
  size(600,600);
  smooth();
  deltaX=random(6,55);
  deltaY=random(10,45);
  deltaiX=0;
  deltaiY=0;
  vel=5;
  x = random(dia,width-dia/2);
  y=random(dia,height-dia/2);
  ix=width/2;
  iy=height/2;
  dia=50;
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  
 
  
}

void draw()
{ 
  prepScreen();
  moveInitials();
  moveScope();
  
  drawInitials(ix,iy);
  drawScope();
  
  checkInitials();
  checkCollisions(); 
  showData();
  resetInitials();
}


void resetInitials()
{
  if(keyPressed  && key == ' ')
  {
    ix= width/2;
    iy=height/2;
    deltaiX=0;
    deltaiY=0;
  }
}

void showData()
{
  fill(255);
  textSize(13);
  text("Collisions " + numCount, width*.1,height*.95);
  text("Time " + millis()/1000+" secs",width*.3,height*.95);
  text("Vertical Speed " + (-deltaiY),width*.55,height*.95);
  text("Horizontal Speed " +(deltaiX), width*.85,height *.95);
}

void checkInitials()
{
  if(ix <-dia || ix>width || iy <-dia || iy> height)
  {
    stroke(255,23,0);
    strokeWeight(5);
    line(width/2,height/2,ix,iy);
    fill(255,23,0);
    textSize(10);
    text("DANGER!\n You are running\n off the screen by\n" + (int)(dist(ix,iy,x,y) - width/2) + 
    " Pixels\n Get back. ITS AN ORDER!", width/2,height/2);
    noFill();
    rect(width/2,height/2,130,90);
  }
}

void killScreen()
{
  frameRate(2);
  noStroke();
  fill(209,8,8);
  rect(width/2,height/2,width,height);
  fill(229,237,186);
  textSize(30);
  text("Hasta La Vista!", width/2,height/2); 
}

void checkCollisions()
  {
    if(dist(ix,iy,x,y)<dia)
    {
      killScreen();
      numCount=numCount+1;
      ix=width/2;
      iy=height/2;
      deltaiX=0;
      deltaiY=0;
      x=random(0,width);
      y=random(0,height);
    }
  }
    
void moveInitials()
  {
    ix= ix + deltaiX;
    iy= iy + deltaiY;
  }  
void keyPressed()
  {
    if (keyCode == UP && deltaiY > -vel)
    {
      deltaiY = deltaiY - .5;
    }
 
    if (keyCode == DOWN && deltaiY < vel)
    {
       deltaiY = deltaiY + .5;
    }
 
    if (keyCode == LEFT && deltaiX > -vel)
    {
       deltaiX = deltaiX - .5;
    }
 
    if (keyCode == RIGHT && deltaiX < vel)
    {
       deltaiX = deltaiX + .5;
    }
  }

void drawInitials(float x, float y)
  {
    
    noFill();
    
  //initials vectors
    beginShape();
      //j
        stroke(0,19,114);
        curveVertex(x-dia/5,y+dia/10);//1
        curveVertex(x-dia/2,y+dia/10);//1
        curveVertex(x-dia/7,y-dia/2);//4
        curveVertex(x-dia/6,y+dia/4);//5
        curveVertex(x-dia/2.2,y+dia/4);//3
        curveVertex(x+dia/10,y-dia/10);//2
        curveVertex(x+dia/10,y-dia/10);//2
       
    endShape();
    
    beginShape();
       //d
       stroke(219,103,39);
       curveVertex(x,y-dia/2);
       curveVertex(x,y-dia/2);
       curveVertex(x,y);
       curveVertex(x+dia/4,y-dia/4);
       curveVertex(x,y-dia/2);
       curveVertex(x,y-dia/2);
    endShape();
  
  
    beginShape();
        //m
      stroke(245,255,83);
      curveVertex(x+dia/2.8,y+dia/3);//2
      curveVertex(x+dia/2.8,y+dia/3);//2
      curveVertex(x+dia/2.5,y-dia/3);//1
      curveVertex(x+dia/4,y-dia/8);//5
      curveVertex(x+dia/10,y-dia/2);//4
      curveVertex(x+dia/10,y+dia/2);//3
      curveVertex(x+dia/10,y+dia/2);//3
    endShape();
    
 } 

void moveScope()
  {
    x = x + deltaX/2;
    y = y +deltaY/2;
    //too far right://going to the right and down
    if(x > width || x< -dia/2)
    {     
      deltaX=-deltaX;
    }
   
    if(y >height || y< 0)
    {
      deltaY=-deltaY;
    }
  }
  
void drawScope()
  {
    stroke(52,255,65);
    strokeWeight(3);
    ellipse(x,y,dia,dia);
    line(x,y+10,x,y+50);
    line(x,y-10,x,y-50);
    line(x-10,y,x-50,y);
    line(x+10,y,x+50,y);
    point(x,y);
  }
  
void prepScreen()
  {
    noStroke();
    background(34,35,36);
    frameRate(60);
    text("Arnold's Shooting Range", width*.15,height *.045);
  }


