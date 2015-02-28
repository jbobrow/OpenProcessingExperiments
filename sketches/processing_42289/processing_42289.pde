
/*
  Created By Miranda Kuang
  Click for snow to move faster
 
 */


Cloud[] c;
Rain[] r, b;
Run[] w;
Snow[] k;

void setup()
{
  noCursor();
  size(300, 530);
  smooth();
  background(#65D1E3);
  fill(#2F9B40);
  rect(0, 450, 300, 100);
  fill(255);
  ellipse(0, 475, 250, 25);

  b = new Rain[100];
  for (int i=0; i<100; i++)
  {
    b[i] = new Rain();
    b[i].x = random(1,5);
    b[i].y = random(20, 470);
    b[i].d = (int)random(10, 90);
    b[i].v = (int)random(1, 10);
  }

  k = new Snow[375];
  for (int e=0; e<375; e++)
  {
    k[e] = new Snow();
    k[e].x = random(0,300);
    k[e].y = random(0,470);
    k[e].d = (int)random(10, 90);
    k[e].v = (int)random(1, 10);
  }


  c = new Cloud[2];
  for (int i=0; i<2; i++)
  {
    c[i] = new Cloud();
    c[i].x = 120;
    c[i].y = random(30, 100);
    c[i].d = (int)random(45, 50);
    c[i].v = (int)random(0, 10);
  }

  w = new Run[2];
  for (int i=0; i<2; i++)
  {
    w[i] = new Run();
    w[i].x = random(0, 300);
  }
}

void draw()
{
  background(#496EFA);
  fill(#2F9B40);
  rect(0, 475, 300, 100);
  fill(255);
  //fill(#A0F6FF);
  ellipse(150, 480, 250, 25);
  ellipse(0, 480, 250, 25);
  ellipse(250, 480, 250, 25);
  fill(255);
  ellipse(-5,-10,125,75);
  ellipse(50,-7,125,75);
  ellipse(100,-5,125,75);
  ellipse(300,-10,125,75);
  ellipse(200,-3,125,75);


  for (int i=0; i<b.length; i++)
  {
    b[i].move();
    b[i].show();
  }

  for (int e=0; e<k.length; e++)
  {
    k[e].move();
    k[e].show();
  }

  c[1].move();
  c[1].show();

  w[1].move();
  w[1].show();
}

class Cloud
{
  float x, y;
  int d, v;
  float i;

  void show()
  {
    noStroke();
    //stroke(#65D1E3);
    fill(255);
    ellipse(mouseX, y, d, d);
    ellipse(mouseX+25, y+10, d, d);
    ellipse(mouseX-20, y+15, d, d);
    ellipse(mouseX, y+20, d, d);
    ellipse(mouseX-35, y, d, d);
    ellipse(mouseX-30, y+20, d, d);
    ellipse(mouseX-55, y+10, d, d);
  }

  void move()
  {
    x =  x + 2 ;

    if (x>400) x = -75;
    if (x<-75) x = 400;
  }
}


class Rain
{
  float x, y;
  int d, v;
  float i, k, r;


  void show()
  {
    noStroke();
    fill(255);
    ellipse(mouseX+random(-75,35), y, 2, 2);
  }


  void move()
  {
    y =  y + random(1,4) ;

    if (y>475) y = random(100, 150);

    x =  x + 2 ;

    if (x>400) x = -75;
    if (x<-75) x = 400;
  }
}


class Run 
{
  float x, y;
  int d, v;
  float i;

  void show()
  {
    noStroke();
    fill(255);
    ellipse(mouseX,mouseY,25,25);
    ellipse(mouseX+15,mouseY-8,10,10);
    ellipse(mouseX-15,mouseY-8,10,10);
    ellipse(mouseX,mouseY+20,30,30);
    fill(0);
    ellipse(mouseX+5, mouseY,2,2);
    ellipse(mouseX-5, mouseY,2,2);

  }

  void move()
  {
    if (mouseX>400) mouseX = -75;
    if (mouseX<-75) mouseX = 400;
    if (mouseY<450) mouseY = 450;
    if (mouseY>595) mouseX = 595;
  }
}


class Snow
{
  float x, y;
  int d, v;
  float i, k, r;


  void show()
  {
    noStroke();
    fill(255);
    ellipse(x, y,3,3);
  }


  void move()
  {
    y =  y + random(1,3) ;

    if (y>475) y = random(0,5);
    
    if (mousePressed)
    {
      y =  y + random(1,3) ;
    }
    

  }
}


                
                
