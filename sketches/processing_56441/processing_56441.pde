
/*
Chunzhong Li
 02/27/2012
 Lavender Home
 */
int seconds;
int minutes=0;
int l=200;
float m=40.0;// for the leftside cloud
float n=40.0;
float i=150.0;// for the rightside cloud
float j=80.0;
float sX=20.0;// for the Sun.
float sY=150.0;
float theta;
int p;
int q;
int o;
int u;


void setup()
{
  size(300, 300);
  smooth();
}

void draw()
{
  minutes = minute();
  seconds = second();
  //sky
  noStroke();
  theta=PI*( seconds/60.0);
  sX=130*cos(-theta)+150;
  sY=130*sin(-theta)+150;
  if (minutes % 2 == 0)
  {
    if (seconds < 15)
    { 
      background(16, 221, 227);
    }
    else if (seconds < 30)
    { 
      background(5, 195, 255);
    }
    else if (seconds < 45)
    { 
      background(5, 157, 255);
    }
    else 
    { 
      background(40, 119, 250);
    }
    fill(255, 24, 3);
    ellipse(sX, sY, 40, 40);
  }
  else
  {
    background (3, 10, 173);
    fill(246, 255, 5);
    ellipse(sX, sY, 40, 40);
    fill(3, 10, 173);
    ellipse(sX-20, sY, 40, 40);
  } 
  // green hill
  fill(125, 247, 138);
  rect(0, height/2.0, width, height/2.0);
  ellipse(width/6.0, height*0.6, width*0.4, height*0.4);
  ellipse(width*2.0/3.0, height*0.68, width*0.7, height*0.7);
  
  
  // my dream house
  stroke(0);
  fill(7, 71, 241);
  rect(190, 150, 80, 150); //the blue body

  fill(245, 121, 5);
  triangle(180, 150, 280, 150, 230, 70);//the roof
  for  (int a=190;a< 280; a+=20)
  {
    arc(a, 150, 20, 20, 0, PI);
  }
  quad(150, 260, 190, 260, 190, 240, 170, 240);// side top
  quad(260, 117, 270, 135, 270, 90, 260, 90);

  arc(230, 280, 20, 20, PI, TWO_PI);//door
  rect(220, 280, 20, 20);
  stroke(255);
  if (minutes % 2 == 0)
  {
    noFill();
  }
  else
  { 
    fill(255, 185, 5);
  }
  arc(190, 180, 20, 20, TWO_PI-PI/2, TWO_PI); //window top
  arc(230, 180, 20, 20, PI, TWO_PI);
  arc(270, 180, 20, 20, PI, TWO_PI-PI/2);
  arc(190, 220, 20, 20, TWO_PI-PI/2, TWO_PI);
  arc(230, 220, 20, 20, PI, TWO_PI);
  arc(270, 220, 20, 20, PI, TWO_PI-PI/2);

  rect(190, 180, 10, 10);// windows squares
  rect(190, 190, 10, 10);
  rect(220, 180, 10, 10);
  rect(220, 190, 10, 10);

  rect(230, 180, 10, 10);
  rect(230, 190, 10, 10);
  rect(260, 180, 10, 10);
  rect(260, 190, 10, 10);

  rect(190, 220, 10, 10);
  rect(190, 230, 10, 10);
  rect(220, 220, 10, 10);
  rect(220, 230, 10, 10);

  rect(230, 220, 10, 10);
  rect(230, 230, 10, 10);
  rect(260, 220, 10, 10);
  rect(260, 230, 10, 10);

  noFill();
  triangle(210, 270, 250, 270, 230, 250);// white outside door
  line(210, 270, 210, 300);
  line(250, 270, 250, 300);

  line(160, 260, 160, 290);//on the leftside, the maid door with 凉亭
  line(180, 260, 180, 290);
  line(160, 290, 190, 290);
  for (int b=160; b<195; b+=5)
  {
    line(b, 290, b, 300);//fences
  }

  // clouds
  fill(255);
  minutes =minute();
  ellipse(m+minutes, n, 20, 20); //clouds indigator in terms of minute
  ellipse(m+minutes-20, n, 20, 20);
  ellipse(m+minutes+20, n, 20, 20);
  ellipse(m+minutes-10, n-10, 20, 20);
  ellipse(m+minutes-10, n+10, 20, 20);
  ellipse(m+minutes+10, n+10, 20, 20);
  ellipse(m+minutes+10, n-10, 20, 20);

  seconds= second();
  ellipse(i, j, seconds, seconds);
  ellipse(i-20, j, seconds, seconds);
  ellipse(i+20, j, seconds, seconds);
  ellipse(i-10, j-10, seconds, seconds);
  ellipse(i-10, j+10, seconds, seconds);
  ellipse(i+10, j-10, seconds, seconds);
  ellipse(i+10, j+10, seconds, seconds);
}


