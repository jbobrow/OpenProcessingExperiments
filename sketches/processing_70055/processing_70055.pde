
//Eli N-M, CP1 4-5, Animation
float x=0;
float y=250;
float changeX=5;
float changeY=0;

void setup()
{
  frameRate(100);
  size(500,500);
}
void draw()
{
  stadium();
  baseball();
  bat();
  if(x<-1500)
  {
    x=0;
    y=250;
    changeX=5;
    changeY=0;
    H=300;
    G=400;
    W=330;
    Q=450;
  }
}


void stadium()
{
  noStroke();
  fill(34,142,42);
  rect(0,150,500,350);
  stroke(255);
  strokeWeight(2.5);
  arc(250,350,570,400,PI,2*PI);
  noStroke();
  fill(8,130,190);
  rect(0,0,500,150);
  stroke(144,86,28);
  strokeWeight(20);
  fill(34,142,42);
  quad(250,500,150,400,250,300,350,400);
  noStroke();
  fill(144,86,28);
  ellipse(250,400,30,30);
  fill(255);
  rect(245,397,10,5);
  rect(246,300,10,10);
  rect(150,397,10,10);
  rect(246,490,10,10);
  rect(341,396,10,10);
  stroke(255);
  strokeWeight(2.5);
  line(250,515,-10,250);
  line(250,515,510,250);
}


void baseball()
{
  fill(215);
  noStroke();
  ellipse(x,y,25,25);
  x=x+changeX;
  y=y+changeY;
  changeY = changeY + 0.05;
  if(x>290)
  {
    changeX=-8;
    changeY=-10;
    
  }
}

int H=300;
float G=400;
int W=330;
int Q=450;


void bat()
{
  stroke(206,159,98);
  strokeWeight(12);
  line(W,Q,G,H);
  G=G-1.7;
  if(G<200)
  {
    G=200;
    W=W-3;
    Q=Q-3;
    G=G-3;
    H=H-3;
    
  }
}
