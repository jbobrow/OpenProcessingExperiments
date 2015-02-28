
/*James Y.
10/5/10
Massive Scales
*/
circles a, b, c, d, e, f, g;
float hi, hello = width;
float bye, goodbye = height;


void setup()
{

  size(600,600);
  smooth();
  a = new circles();
  b = new circles();
  c = new circles();
  d = new circles();
  e = new circles();
  f = new circles();
  g = new circles();
}

void draw()
{
  fill(0,50);
  rect(0,0,600,600);
  fill(255);
  line(0, 300, 600, 300);
  line(300,0,300,600);

  noStroke();
  b.showing();
  c.showingX();
  d.showingY();
  stroke(200);
  a.show();
  e.showZ();
  f.showA();
  g.showB();
  if (hi > 600 && bye > 600)
  {
    hi = 0;
    bye = 0;
  }
  
}

class circles
{
  //squares
  void show()
  {
    for(int j = 0; j<100; j++)
    {
      fill(255);
      rect(random(0,250),random(0,250),50,50);
    }
  }
  // circles
  void showing()
  {

    for(int i = 0; i < 100; i++)
    {
      fill(random(0,255),random(0,255),random(0,255));
      ellipse(random(0,275),random(320,600),50,50);
    }
  }
  // triangles
  void showingX()
  {
    for(float x = 0; x < 300; x=x+random(1,250)) {
      for(float y = 0; y < 250; y=y+random(1,250)) {
        fill(0,0,155);
        triangle(x+300,y+60,x+325,y+15,x+350,y+60);
      }
    }
  } 
  //lines
  void showingY()
  {
    stroke(200);
    fill(random(0,200),random(0,200),random(0,200));
    for(int k = 0; k < 100; k++)
    {

    line(random(300,600), random(300,600), 600, 600);
    }
  }
  //moving circle
  void showZ()
  {
    hi = hi + 2;
    ellipse(hi, 300,50,50);
  }
  void showA()
  {
    bye = bye +2;
    rect(275,bye-25,50,50);
 
    if( bye > 290 && bye < 320)
    {
      noStroke();
      fill(255,0,0);
      for(int ha = 0; ha < 50; ha++)
      {
      ellipse(random(0,600),random(0,600),50,50);
      }
          if( hi > 290 && bye < 320)
    {
      noStroke();
      fill(250,168,15);
      for(int hah = 0; hah < 50; hah++)
      {
      ellipse(random(0,600),random(0,600),50,50);
      }
    }
    
              if( hi > 290 && bye < 320)
    {
      noStroke();
      fill(255,255,15);
      for(int hah = 0; hah < 50; hah++)
      {
      ellipse(random(0,600),random(0,600),50,50);
        }
      }
    }
  }
  //end of showA
  void showB()
  {
    hello = hello -2;
    line(250,hello+600,350,hello+600);
}
}


