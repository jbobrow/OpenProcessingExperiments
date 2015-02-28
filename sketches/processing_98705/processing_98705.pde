
float theta, s, low, high, br, col, drop, control, thick, test, n, sect, ran;

int cola=100;
int colb=210;
int colc=100;


int bga=116, bgb=239, bgc=252;
PImage img;
float si=1;

void setup() {
  size(600, 600);
  frameRate(20);



  //background(255);
  //background(255);
  // translate(width/2, height);
  img = loadImage("rabb.png");
}


void draw()
{  //scale(1, -1); 
  //background(0);
  n =random(-1, 1);
  sect=random(10, 20);
  ran=random(1, 1.02);
  noStroke();

  if (bga<90)
  {
    for (int i=0; i<10;i++)
    {
      fill(255, drop);   
      ellipse(random(0, width), random(0, 300), 1+sin(frameCount)*random(6), 1+sin(frameCount)*random(6));
    }
  }                                                        //bg splatter *****


  fill(bga, bgb, bgc, 10);
  rect(0, 0, width, height); 
  bga-=1;
  bgb-=20;
  bgc-=20;
  if (bga<=12)
  {
    bga=12;
    bgb=19;
    bgc=43;
  }



  // col=noise(0, 255);
  drop++;
  cola++;
  colb++;
  colc--;
  low+= 0.01; 
  high += 0.01;
  translate(width/2, height);
  //branch(100);

  scale(1, -1);
  branch2(0, 0, 80, 0, 50);


  s=noise(low, high);
  test= noise(random(-0.75, 0.8))*2;

  si+=1;
}




int step=10;
void branch2(int x, int y, int length, float angle, int col)
{ 


  pushMatrix(); 
  stroke(180+random(30), 100+random(4, length), 120);
  translate(x, y);
  rotate(angle);
  organicLine( 0, 0, 0, length, abs(length)/30+ran, (twistiness+ abs(length)/5));



  if ( length<50)
  {
    fill((180-col)*y*0.2, random(255), random(70));
    ellipse(0, 0, 3, 3);


    if (si>=20)
    {
      si=20;
    }
  } 

  if (length%5==0 && length<70)
  {
    image(img, 10, 0, si+ran, si+ran);
  }
  popMatrix();



  if (length>10)

  {
    branch2( int((x-sin(angle)*length)), int(y+cos(angle)*length), length-int(sect/1.3), angle+random(-1, 1), col+18);

    if (length%20==0 )
    {
      branch2(int(x-sin(angle)*length), int(y+cos(angle)*length), length-step, angle+random(-1.2, 1.3), col+21);
    }
  }
}


float twistiness =1.2;

void organicLine(float x1, float y1, float x2, float y2, float strokeW, float howTwisty)
{
  strokeCap(ROUND);
  strokeWeight(strokeW);



  float cx = x2-x1; // change in x
  float cy = y2-y1; // change in y

  float nx1 = x1; // first x
  float ny1 = y1; // first y
  float nx2, ny2;
  for (int i =1; i <sect; i++) {

    nx2 = x1 + i/sect * cx;
    ny2 = y1 + i/sect * cy;


    if (y2<40)
    {   
      pushMatrix();
      rotate(sect);
      line(nx1, ny1, nx2+ (n *twistiness*ran), ny2);
      popMatrix();
    }
    line(nx1, ny1, nx2+ (n *twistiness*ran*5), ny2);

    nx1 = nx2+ (n *twistiness*ran);
    ny1 = ny2;
  }
}


void mouseMoved()
{
  if (mouseY > 0)
    twistiness = map(mouseY, 0, height, 1, 4);
  redraw();
}



