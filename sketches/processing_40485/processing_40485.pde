
// homework 8 
// copyright Caroline Record October 3, 2011 Pittsburgh, PA
//question: why does the seconds display in floats??

float x, y, wd, ht;// postion and dimensions of initials
float speedy; //intial speed of the initials in the y 
float speedx; //intial speed of the initials in the x

//something variables
float x1, y1; 
float wd1= 150;
float ht1 =150; 
float somethingSpeedx;
float somethingSpeedy;

//counting collisions
int collisionCount;

void setup()
{
  size(700, 700);
  background(255);

  x=width/2;//initial position of intials 
  y=height/2; //initial position of intials 
  speedy = 0; //intial speed of the initials in the y 
  speedx = 0; //intial speed of the initials in the x

  //something variables
  x1=random(wd1/2, width-wd1/2);
  y1=random(ht1/2, height-ht1/2); 
  somethingSpeedx= random(1, 6);
  somethingSpeedy= random(1, 6);
  //counting collisions
  collisionCount = 0;


}

void draw ()
{

  prepScreen ();

  drawIntials();
  drawSomething();

  moveIntials();
  moveSomething();

  checkIntials();
  checkCollision();

  showStats();
}

void showStats()
{
    
    int secondsRolloverTime = millis()/1000;
  
  int speedxint =  int (speedx);
  int speedyint = int (speedy);
  
  fill (150);
  text("Collision"+" "+"count"+ " "+ collisionCount, 20, 20);
  text("Vertical"+" "+"speed"+ " "+speedyint, 20, 40); 
  text("Horizontal"+" "+"speed"+ " "+speedxint, 20, 60); 
  text("Time"+ " "+ secondsRolloverTime + " "+ "secs", 20, 80);
}

void checkCollision()
{
  float d;

  d = dist (x1, y1, x, y);


  if (d<(wd1/4+wd/2))
  {
    //the dramatic event!!
    noStroke();
    fill(255, 0, 0);
    beginShape();
    vertex (299.0, 261);
    vertex (324.0, 239 );
    vertex (547.0, 66);
    vertex ( 442, 267 );
    vertex (616, 315);
    vertex (388, 363 );
    vertex (587, 536 );
    vertex (306, 460 );
    vertex (325, 640 );
    vertex (158, 625 );
    vertex (158, 419);
    vertex (50, 542 );
    vertex (164, 368 );
    vertex (52, 253 );
    vertex (225, 341);
    vertex (139, 97);
    vertex (300, 264 );
    endShape();
   
   //Failled use of an array!
   
    /* 
    float xPoints[] = {299.0, 324.0, 547.0, 442.0, 616.0, 388.0, 587.0, 306.0, 325.0, 158.0, 158.0, 50.0, 164.0, 52.0, 225.0, 139.0, 300.0};
float yPoints[] = {261.0, 239.0, 66.0, 267.0, 315.0, 363.0, 536.0, 460.0, 640.0, 625.0, 419.0, 542.0, 368.0, 253.0, 341.0, 97.0, 264.0};

void setup ()
{
  size (700, 700);
}

void draw ()
{
  for (int i=0; i>xPoints.length; i++)
  {
    for (int t=0; t>yPoints.length; t++)
    {
      beginShape(LINES);
      vertex ( xPoints[i], yPoints[t]);
      endShape();
    }
  }
}

    */
    
    //change something's position and speed 
    x1=random(wd1/2, width-wd1/4);//randomize position of object
    y1=random(ht1/2, height-ht1/4); //randomize position of object

    somethingSpeedx= random(1, 6);
    somethingSpeedy= random(1, 6);
    
    //count the collision
    collisionCount= collisionCount+1;
  }
}


void checkIntials()
{
  if ((x>width)||(x<0)||(y>height)||(y< 0))
  {
    fill (255, 0, 0);
    rectMode (CENTER);
    rect( width/2, width/2, 300, 200);
    textAlign(CORNER);
    fill (255);
    text ("You"+" "+"ran"+" "+"away"+"!", width/2-90, height/2-40);
    text ("Come"+" "+"back"+" "+"by"+" "+"pressing"+" "+"space"+".", width/2-90, height/2);
  }
}

void moveIntials()
{

  y= y+speedy; 
  x= x+speedx; 
  //  float acceleration= .005;

  if (keyCode == UP) 
  {
    speedy = speedy - .005;
  } 
  else if (keyCode == DOWN) 
  {
    speedy = speedy + .005;
  } 
  else if (keyCode== LEFT)
  {
    speedx = speedx - .005;
  }
  else if (keyCode== RIGHT)
  {
    speedx = speedx + .005 ;
  }
  else if ( key==' ')
  {
    x=width/2;
    y=height/2;
    speedx=0;
    speedy=0;
  }
}




void prepScreen()
{
  noStroke();
  fill (255, 20);
  rectMode (CENTER);
  rect (width/2, height/2, width, height);
  fill (255);
  rect (95, 50, 150, 100);
}

void moveSomething()
{
  x1= x1+somethingSpeedx;
  if ((x1 > width-(wd1/4))||(x1< wd1/4))//
  {
    somethingSpeedx=-somethingSpeedx;
  }
  y1= y1+somethingSpeedy;
  if ((y1 > height-(ht1/4))||(y1 < ht1/4))//
  {
    somethingSpeedy=-somethingSpeedy;
  }
}

void drawSomething()
{
  //noLoop();

  noFill();
  strokeWeight(1);
  stroke(255, 0, 0);
  arc(x1, y1, random(wd1/2-(wd1/2-60), wd1/2), random(ht1/2-(ht1/2-2), ht1/2), 0, PI/2);
  arc(x1, y1, random(wd1/2-(wd1/2-60), wd1/2), random(ht1/2-(ht1/2-2), ht1/2), PI/2, PI);
  arc(x1, y1, random(wd1/2-(wd1/2-60), wd1/2), random(ht1/2-(ht1/2-2), ht1/2), PI, TWO_PI-PI/2);
  arc(x1, y1, random(wd1/2-(wd1/2-60), wd1/2), random(ht1/2-(ht1/2-2), ht1/2), TWO_PI-PI/2, TWO_PI);

  //arc
  noStroke();
  //fill(random(0, 40), random(70, 100));
  fill(random(231, 255), random(3, 252), random(100), 95);
  arc(x1, y1, random(wd1/2-(wd1/2-60), wd1/2), random(ht1/2-(ht1/2-2), ht1/2), 0, PI/2);
  arc(x1, y1, random(wd1/2-(wd1/2-60), wd1/2), random(ht1/2-(ht1/2-2), ht1/2), PI/2, PI);
  arc(x1, y1, random(wd1/2-(wd1/2-60), wd1/2), random(ht1/2-(ht1/2-2), ht1/2), PI, TWO_PI-PI/2);
  arc(x1, y1, random(wd1/2-(wd1/2-60), wd1/2), random(ht1/2-(ht1/2-2), ht1/2), TWO_PI-PI/2, TWO_PI);
}

void  drawIntials ()
{
  wd=40;
  ht=40;
  //circle
  stroke (247, 22, 22, 98);
  fill(#FAFAFA);
  strokeWeight(5);
  ellipseMode(CENTER);
  ellipse(x, y, wd, ht);
  //settings for all the letters
  noFill();
  smooth();
  strokeCap(SQUARE);
  //curve for the C
  beginShape();
  curveVertex(x-.1*wd, y-.2*ht);
  curveVertex(x-.15*wd, y-.35*ht);
  curveVertex(x-.4*wd, y-.15*ht);
  curveVertex(x-.4*wd, y+.15*ht);
  curveVertex(x-.15*wd, y+.35*ht);
  curveVertex(x-.1*wd, y+.2*ht);
  endShape();
  //curves for the B
  beginShape();
  curveVertex(x-.1*wd, y-.35*ht);
  curveVertex(x-.05*wd, y-.35*ht);
  curveVertex(x+.1*wd, y-.27*ht);
  curveVertex(x+.1*wd, y-.08*ht);
  curveVertex(x-.05*wd, y);
  curveVertex(x-.1*wd, y);
  endShape();
  beginShape();
  curveVertex(x-.1*wd, y);
  curveVertex(x-.05*wd, y);
  curveVertex(x+.1*wd, y+.08*ht);
  curveVertex(x+.1*wd, y+.27*ht);
  curveVertex(x-.05*wd, y+.35*ht);
  curveVertex(x-.1*wd, y+.35*ht);
  endShape();
  //curve for the R
  beginShape();
  curveVertex(x+.1*wd, y-.35*ht);
  curveVertex(x+.2*wd, y-.35*ht);
  curveVertex(x+.35*wd, y-.27*ht);
  curveVertex(x+.35*wd, y-.08*ht);
  curveVertex(x+.2*wd, y);
  curveVertex(x+.1*wd, y);
  endShape();
  //lines
  line(x-.05*wd, y-.35*ht, x-.05*wd, y+.35*ht);
  line(x+.2*wd, y-.35*ht, x+.2*wd, y+.35*ht);
  line(x+.2*wd, y, x+.35*wd, y+.25*ht);
  // new color

  float e, r, wt, hd;
  e=x+2;
  r=y-3;
  wt=wd+2;
  hd=ht+3;

  stroke (17, 209, 204, 98);
  noFill();
  strokeWeight(5);
  ellipseMode(CENTER);
  ellipse(e, r, wt, hd);
  beginShape();
  curveVertex(e-.1*wt, r-.2*hd);
  curveVertex(e-.15*wt, r-.35*hd);
  curveVertex(e-.4*wt, r-.15*hd);
  curveVertex(e-.4*wt, r+.15*hd);
  curveVertex(e-.15*wt, r+.35*hd);
  curveVertex(e-.1*wt, r+.2*hd);
  endShape();
  //curves for the B
  beginShape();
  curveVertex(e-.1*wt, r-.35*hd);
  curveVertex(e-.05*wt, r-.35*hd);
  curveVertex(e+.1*wt, r-.27*hd);
  curveVertex(e+.1*wt, r-.08*hd);
  curveVertex(e-.05*wt, r);
  curveVertex(e-.1*wt, r);
  endShape();
  beginShape();
  curveVertex(e-.1*wt, r);
  curveVertex(e-.05*wt, r);
  curveVertex(e+.1*wt, r+.08*hd);
  curveVertex(e+.1*wt, r+.27*hd);
  curveVertex(e-.05*wt, r+.35*hd);
  curveVertex(e-.1*wt, r+.35*hd);
  endShape();
  //curve for the R
  beginShape();
  curveVertex(e+.1*wt, r-.35*hd);
  curveVertex(e+.2*wt, r-.35*hd);
  curveVertex(e+.35*wt, r-.27*hd);
  curveVertex(e+.35*wt, r-.08*hd);
  curveVertex(e+.2*wt, r);
  curveVertex(e+.1*wt, r);
  endShape();
  //lines
  line(e-.05*wt, r-.35*hd, e-.05*wt, r+.35*hd);
  line(e+.2*wt, r-.35*hd, e+.2*wt, r+.35*hd);
  line(e+.2*wt, r, e+.35*wt, r+.25*hd);

  float h, u, it, od;
  h=x+3;
  u=y+7;
  it=wd-4;
  od=ht;

  stroke (#D9FA0D, 99);
  noFill();
  strokeWeight(5);
  ellipseMode(CENTER);
  ellipse(h, u, it, od);
  noFill();
  beginShape();
  curveVertex(h-.1*it, u-.2*od);
  curveVertex(h-.15*it, u-.35*od);
  curveVertex(h-.4*it, u-.15*od);
  curveVertex(h-.4*it, u+.15*od);
  curveVertex(h-.15*it, u+.35*od);
  curveVertex(h-.1*it, u+.2*od);
  endShape();
  //curves for the B
  beginShape();
  curveVertex(h-.1*it, u-.35*od);
  curveVertex(h-.05*it, u-.35*od);
  curveVertex(h+.1*it, u-.27*od);
  curveVertex(h+.1*it, u-.08*od);
  curveVertex(h-.05*it, u);
  curveVertex(h-.1*it, u);
  endShape();
  beginShape();
  curveVertex(h-.1*it, u);
  curveVertex(h-.05*it, u);
  curveVertex(h+.1*it, u+.08*od);
  curveVertex(h+.1*it, u+.27*od);
  curveVertex(h-.05*it, u+.35*od);
  curveVertex(h-.1*it, u+.35*od);
  endShape();
  //curve for the R
  beginShape();
  curveVertex(h+.1*it, u-.35*od);
  curveVertex(h+.2*it, u-.35*od);
  curveVertex(h+.35*it, u-.27*od);
  curveVertex(h+.35*it, u-.08*od);
  curveVertex(h+.2*it, u);
  curveVertex(h+.1*it, u);
  endShape();
  //lines
  line(h-.05*it, u-.35*hd, h-.05*wt, u+.35*hd);
  line(h+.2*it, u-.35*hd, h+.2*wt, u+.35*hd);
  line(h+.2*it, u, h+.35*it, u+.25*hd);
}
                
