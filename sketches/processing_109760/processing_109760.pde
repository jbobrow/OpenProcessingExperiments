
//Ara Lee
//aral
//copyright Ara Lee, Sept 2013, Pittsburgh, PA
//hw5
//257


//variables
//color coll;

float xsixth, xthird, xhalf, xtwothirds, xfivesixths;
float yquarter, yhalf, ythreequarters;
float xeighth, yeighth;

float a,b,c,d,e,f,g,h,i,j,k,l;

//float click;  //number of mouse clicks

void setup()
{
  size(400, 400);
  background(200);

  xsixth = width*.16667;
  xthird = width*.33333;
  xhalf = width*.5;
  xtwothirds = width*.66667;
  xfivesixths = width*.83333;

  yquarter = height*.25;
  yhalf = height*.5;
  ythreequarters = height*.75;

  xeighth = width*.125;
  yeighth = height*.125;
  
  a=0;
  b=0;
  c=0;
  d=0;
  e=0;
  f=0;
  g=0;
  h=0;
  i=0;
  j=0;
  k=0;
  l=0;
  
  //click=0;
}

void draw()
{
  cardSetup();
}

void mouseClicked()
{
  //click++
  //if(click%2==1)
  
  checkX();
}

void keyTyped()  //press any key to reset the game
{
  setup();
  draw();
}


//=================================================================
void checkX()
{
  if (mouseX<xsixth)
  {
    check1();  //1st column
  }
  else if (xsixth<mouseX && mouseX<xthird)
  {
    check2();  //2nd column
  }
  else if (xthird<mouseX && mouseX<xhalf)
  {
    check3();  //3rd column
  }
  else if (xhalf<mouseX && mouseX<xtwothirds)
  {
    check4();  //4th column
  }
  else if (xtwothirds<mouseX && mouseX<xfivesixths)
  {
    check5();  //5th column
  }
  else if (xfivesixths<mouseX)
  {
    check6();  //6th column
  }
}


//-------------------------------------------------------------------
void check1()  //column 1
{
  if (mouseY<yquarter)  //box 1,1 (column 1, row 1)
  {
    cir(xeighth*.65,yeighth);
    //a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    f=0;
    g=0;
    h=0;
    i=0;
    j=0;
    k=0;
    l=0;
    if(a==1)  //if other circle is chosen already, then highlight both 'cards'
    {
      fill(255,100);
      rect(0,0,xsixth,yquarter);
      rect(xhalf,yquarter,xsixth,yquarter);
    }
    else  //if not, then hide the two shapes; reset
    {
      
    }
    a=1;
  }
  else if (yquarter<mouseY && mouseY<yhalf)  //box 1,2  (col 1, row 2)
  {
    pentagon(xeighth*.67, yquarter+yeighth*.5);
    a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    g=0;
    //f=0;
    h=0;
    i=0;
    j=0;
    k=0;
    l=0;
    if(f==1)
    {
      fill(255,100);
      rect(0,yquarter,xsixth,yquarter);
      rect(xthird,yquarter,xsixth,yquarter);
    }
    f=1;
  }
  else if (yhalf<mouseY && mouseY<ythreequarters)  //1,3  (col 1, row 3)
  {
    square(xeighth*.25, yhalf+yeighth*.6);
    a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    f=0;
    g=0;
    h=0;
    i=0;
    //j=0;
    k=0;
    l=0;
    if(j==1)
    {
      fill(255,100);
      rect(0,yhalf,xsixth,yquarter);
      rect(xhalf,ythreequarters,xsixth,yquarter);
    }
    j=1;
  }
  else if (ythreequarters<mouseY) //1,4  (col 1, row 4)
  {
    moon(xeighth*.6,ythreequarters+yeighth);
    a=0;
    b=0;
    c=0;
    d=0;
    //e=0;
    f=0;
    g=0;
    h=0;
    i=0;
    j=0;
    k=0;
    l=0;
    if(e==1)
    {
      fill(255,100);
      rect(0,ythreequarters,xsixth,yquarter);
      rect(xtwothirds,0,xsixth,yquarter);
    }
    e=1;
  }
}

void check2()  //column 2
{
  if (mouseY<yquarter)  //2,1
  {
    clover(xsixth+xeighth*.68,yeighth*.8);
    a=0;
    //b=0;
    c=0;
    d=0;
    e=0;
    f=0;
    g=0;
    h=0;
    i=0;
    j=0;
    k=0;
    l=0;
    if(b==1)
    {
      fill(255,100);
      rect(xsixth,0,xsixth,yquarter);
      rect(xfivesixths,ythreequarters,xsixth,yquarter);
    }
    b=1;
  }
  else if (yquarter<mouseY && mouseY<yhalf)  //2,2
  {
    rec(xsixth+xeighth*.35,yquarter+yeighth*.4);
    a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    f=0;
    //g=0;
    h=0;
    i=0;
    j=0;
    k=0;
    l=0;
    if(g==1)
    {
      fill(255,100);
      rect(xsixth,yquarter,xsixth,yquarter);
      rect(xtwothirds,yhalf,xsixth,yquarter);
    }
    g=1;
  }
  else if (yhalf<mouseY && mouseY<ythreequarters)  //2,3
  {
    tri(xsixth+xeighth*.65, yhalf+yeighth*.55);
    a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    f=0;
    g=0;
    //h=0;
    i=0;
    j=0;
    k=0;
    l=0;
    if(h==1)
    {
      fill(255,100);
      rect(xsixth,yhalf,xsixth,yquarter);
      rect(xtwothirds,yquarter,xsixth,yquarter);
    }
    h=1;
  }
  else if (ythreequarters<mouseY)  //2,4
  {
    oval(xsixth+xeighth*.68,ythreequarters+yeighth);
    a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    f=0;
    g=0;
    h=0;
    i=0;
    j=0;
    k=0;
    //l=0;
    if(l==1)
    {
      fill(255,100);
      rect(xsixth,ythreequarters,xsixth,yquarter);
      rect(xfivesixths,yhalf,xsixth,yquarter);
    }
    l=1;
  }
}

void check3()  //column 3
{
  if (mouseY<yquarter)  //3,1
  {
    diamond(xthird+xeighth*.68,yeighth*.55);
    a=0;
    b=0;
    //c=0;
    d=0;
    e=0;
    f=0;
    g=0;
    h=0;
    i=0;
    j=0;
    k=0;
    l=0;
    if(c==1)
    {
      fill(255,100);
      rect(xthird,0,xsixth,yquarter);
      rect(xfivesixths,0,xsixth,yquarter);
    }
    c=1;
  }
  else if (yquarter<mouseY && mouseY<yhalf)  //3,2
  {
    pentagon(xthird+xeighth*.67, yquarter+yeighth*.5);
    a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    //f=0;
    g=0;
    h=0;
    i=0;
    j=0;
    k=0;
    l=0;
    if(f==1)
    {
      fill(255,100);
      rect(0,yquarter,xsixth,yquarter);
      rect(xthird,yquarter,xsixth,yquarter);
    }
    f=1;
  }
  else if (yhalf<mouseY && mouseY<ythreequarters)  //3,3
  {
    star(xthird+xeighth*.65, yhalf+yeighth*.4);
    a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    f=0;
    g=0;
    h=0;
    i=0;
    j=0;
    //k=0;
    l=0;
    if(k==1)
    {
      fill(255,100);
      rect(xthird,yhalf,xsixth,yquarter);
      rect(xthird,ythreequarters,xsixth,yquarter);
    }
    k=1;
  }
  else if (ythreequarters<mouseY)  //3,4
  {
    star(xthird+xeighth*.65, ythreequarters+yeighth*.4);
    a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    f=0;
    g=0;
    h=0;
    i=0;
    j=0;
    //k=0;
    l=0;
    if(k==1)
    {
      fill(255,100);
      rect(xthird,yhalf,xsixth,yquarter);
      rect(xthird,ythreequarters,xsixth,yquarter);
    }
    k=1;
  }
}

void check4()  //column 4
{
  if (mouseY<yquarter)  //4,1
  {
    trapezoid(xhalf+xeighth*.65,yeighth*.63);
    a=0;
    b=0;
    c=0;
    //d=0;
    e=0;
    f=0;
    g=0;
    h=0;
    i=0;
    j=0;
    k=0;
    l=0;
    if(d==1)
    {
      fill(255,100);
      rect(xhalf,0,xsixth,yquarter);
      rect(xtwothirds,ythreequarters,xsixth,yquarter);
    }
    d=1;
  }
  else if (yquarter<mouseY && mouseY<yhalf)  //4,2
  {
    cir(xhalf+xeighth*.65, yquarter+yeighth);
    //a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    f=0;
    g=0;
    h=0;
    i=0;
    j=0;
    k=0;
    l=0;
    if(a==1)
    {
      fill(255,100);
      rect(0,0,xsixth,yquarter);
      rect(xhalf,yquarter,xsixth,yquarter);
    }
    a=1;
  }
  else if (yhalf<mouseY && mouseY<ythreequarters)  //4,3
  {
    hexagon(xhalf+xeighth*.68, yhalf+yeighth*.6);
    a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    f=0;
    g=0;
    h=0;
    //i=0;
    j=0;
    k=0;
    l=0;
    if(i==1)
    {
      fill(255,100);
      rect(xhalf,yhalf,xsixth,yquarter);
      rect(xfivesixths,yquarter,xsixth,yquarter);
    }
    i=1;
  }
  else if (ythreequarters<mouseY)  //4,4
  {
    square(xhalf+xeighth*.25, ythreequarters+yeighth*.6);
    a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    f=0;
    g=0;
    h=0;
    i=0;
    //j=0;
    k=0;
    l=0;
    if(j==1)
    {
      fill(255,100);
      rect(0,yhalf,xsixth,yquarter);
      rect(xhalf,ythreequarters,xsixth,yquarter);
    }
    j=1;
  }
}

void check5()  //column 5
{
  if (mouseY<yquarter)  //5,1
  {
    moon(xtwothirds+xeighth*.6,yeighth);
    a=0;
    b=0;
    c=0;
    d=0;
    //e=0;
    f=0;
    g=0;
    h=0;
    i=0;
    j=0;
    k=0;
    l=0;
    if(e==1)
    {
      fill(255,100);
      rect(0,ythreequarters,xsixth,yquarter);
      rect(xtwothirds,0,xsixth,yquarter);
    }
    e=1;
  }
  else if (yquarter<mouseY && mouseY<yhalf)  //5,2
  {
    tri(xtwothirds+xeighth*.65, yquarter+yeighth*.55);
    a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    f=0;
    g=0;
    //h=0;
    i=0;
    j=0;
    k=0;
    l=0;
    if(h==1)
    {
      fill(255,100);
      rect(xsixth,yhalf,xsixth,yquarter);
      rect(xtwothirds,yquarter,xsixth,yquarter);
    }
    h=1;
  }
  else if (yhalf<mouseY && mouseY<ythreequarters)  //5,3
  {
    rec(xtwothirds+xeighth*.35,yhalf+yeighth*.4);
    a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    f=0;
    //g=0;
    h=0;
    i=0;
    j=0;
    k=0;
    l=0;
    if(g==1)
    {
      fill(255,100);
      rect(xsixth,yquarter,xsixth,yquarter);
      rect(xtwothirds,yhalf,xsixth,yquarter);
    }
    g=1;
  }
  else if (ythreequarters<mouseY)  //5,4
  {
    trapezoid(xtwothirds+xeighth*.65,ythreequarters+yeighth*.63);
    a=0;
    b=0;
    c=0;
    //d=0;
    e=0;
    f=0;
    g=0;
    h=0;
    i=0;
    j=0;
    k=0;
    l=0;
    if(d==1)
    {
      fill(255,100);
      rect(xhalf,0,xsixth,yquarter);
      rect(xtwothirds,ythreequarters,xsixth,yquarter);
    }
    d=1;
  }
}

void check6()  //column 6
{
  if (mouseY<yquarter)  //6,1
  {
    diamond(xfivesixths+xeighth*.68,yeighth*.55);
    a=0;
    b=0;
    //c=0;
    d=0;
    e=0;
    f=0;
    g=0;
    h=0;
    i=0;
    j=0;
    k=0;
    l=0;
    if(c==1)
    {
      fill(255,100);
      rect(xthird,0,xsixth,yquarter);
      rect(xfivesixths,0,xsixth,yquarter);
    }
    c=1;
  }
  else if (yquarter<mouseY && mouseY<yhalf)  //6,2
  {
    hexagon(xfivesixths+xeighth*.68, yquarter+yeighth*.6);
    a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    f=0;
    g=0;
    h=0;
    //i=0;
    j=0;
    k=0;
    l=0;
    if(i==1)
    {
      fill(255,100);
      rect(xhalf,yhalf,xsixth,yquarter);
      rect(xfivesixths,yquarter,xsixth,yquarter);
    }
    i=1;
  }
  else if (yhalf<mouseY && mouseY<ythreequarters)  //6,3
  {
    oval(xfivesixths+xeighth*.68,yhalf+yeighth);
    a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    f=0;
    g=0;
    h=0;
    i=0;
    j=0;
    k=0;
    //l=0;
    if(l==1)
    {
      fill(255,100);
      rect(xsixth,ythreequarters,xsixth,yquarter);
      rect(xfivesixths,yhalf,xsixth,yquarter);
    }
    l=1;
  }
  else if (ythreequarters<mouseY)  //6,4
  {
    clover(xfivesixths+xeighth*.65,ythreequarters+yeighth*.8);
    a=0;
    //b=0;
    c=0;
    d=0;
    e=0;
    f=0;
    g=0;
    h=0;
    i=0;
    j=0;
    k=0;
    l=0;
    if(b==1)
    {
      fill(255,100);
      rect(xsixth,0,xsixth,yquarter);
      rect(xfivesixths,ythreequarters,xsixth,yquarter);
    }
    b=1;
  }
}

//==================================================================
void cardSetup()
{
  strokeWeight(1);
  stroke(0);
  
  line(xsixth, 0, xsixth, height);
  line(xthird, 0, xthird, height);
  line(xhalf, 0, xhalf, height);
  line(xtwothirds, 0, xtwothirds, height);
  line(xfivesixths, 0, xfivesixths, height);

  line(0, yquarter, width, yquarter);
  line(0, yhalf, width, yhalf);
  line(0, ythreequarters, width, ythreequarters);
}

//-------------------------------------------------------------------
//shape definitions
void tri(float xtri, float ytri)
{
  noStroke();
  fill(102, 0, 204);
  triangle(xtri, ytri, xtri-width*.0625, ytri+height*.1, xtri+width*.0625, ytri+height*.1);
}

void cir(float xcir, float ycir)
{
  noStroke();
  fill(255,102,102);
  ellipse(xcir, ycir, width*.1, height*.1);
}

void square(float xsquare, float ysquare)
{
  noStroke();
  fill(255, 51, 255);
  rect(xsquare, ysquare, width*.1, height*.1);
}

void star(float xstar, float ystar)
{
  noStroke();
  fill(153, 76, 0);
  beginShape();
  vertex(xstar, ystar);  //1
  vertex(xstar+width*.75*.02, ystar+height*2.5*.02);  //2
  vertex(xstar+width*3.5*.02, ystar+height*2.5*.02);  //3
  vertex(xstar+width*1.7*.02, ystar+height*4.5*.02);  //4
  vertex(xstar+width*2.5*.02, ystar+height*7*.02);  //5
  vertex(xstar, ystar+height*5.5*.02);  //6
  vertex(xstar-width*2.5*.02, ystar+height*7*.02);  //7
  vertex(xstar-width*1.7*.02, ystar+height*4.5*.02);  //8
  vertex(xstar-width*3.5*.02, ystar+height*2.5*.02);  //9
  vertex(xstar-width*.75*.02, ystar+height*2.5*.02);  //10
  vertex(xstar, ystar);
  endShape();
}

void pentagon(float xpentagon, float ypentagon)
{
  noStroke();
  fill(0, 0, 0);
  beginShape();
  vertex(xpentagon, ypentagon);  //1
  vertex(xpentagon+width*1.5*.04, ypentagon+height*1.2*.04);  //2
  vertex(xpentagon+width*.8*.04, ypentagon+height*3*.04);  //3
  vertex(xpentagon-width*.8*.04, ypentagon+height*3*.04);  //4
  vertex(xpentagon-width*1.5*.04, ypentagon+height*1.2*.04);  //5
  vertex(xpentagon, ypentagon);
  endShape();
}

void hexagon(float xhexagon, float yhexagon)
{
  noStroke();
  fill(102, 255, 255);
  beginShape();
  vertex(xhexagon, yhexagon);  //top-center
  vertex(xhexagon+width*1.3*.025, yhexagon);  //1
  vertex(xhexagon+width*2.5*.025, yhexagon+height*2.3*.025);  //2
  vertex(xhexagon+width*1.3*.025, yhexagon+height*4.3*.025);  //3
  vertex(xhexagon-width*1.3*.025, yhexagon+height*4.3*.025);  //4
  vertex(xhexagon-width*2.5*.025, yhexagon+height*2.3*.025);  //5
  vertex(xhexagon-width*1.3*.025, yhexagon);  //6
  vertex(xhexagon, yhexagon);
  endShape();
}

void oval(float xoval, float yoval)
{
  noStroke();
  fill(102,102,0);
  ellipse(xoval,yoval,width*.075,height*.15);
}

void rec(float xrec, float yrec)
{
  noStroke();
  fill(255,255,255);
  rect(xrec,yrec,width*.075,height*.15);
}

void moon(float xmoon, float ymoon)
{
  noStroke();
  fill(255,153,51);
  ellipse(xmoon,ymoon,width*.1,height*.15);
  noStroke();
  fill(200);
  ellipse(xmoon-width*.03,ymoon,width*.08,height*.12);
}

void trapezoid(float xtrapezoid, float ytrapezoid)
{
  noStroke();
  fill(0,204,0);
  beginShape();
  vertex(xtrapezoid,ytrapezoid);
  vertex(xtrapezoid+width*.038,ytrapezoid);
  vertex(xtrapezoid+width*2*.038,ytrapezoid+height*2*.038);
  vertex(xtrapezoid-width*2*.038,ytrapezoid+height*2*.038);
  vertex(xtrapezoid-width*.038,ytrapezoid);
  endShape();
}

void diamond(float xdiamond, float ydiamond)
{
  noStroke();
  fill(51,51,255);
  beginShape();
  vertex(xdiamond,ydiamond);
  vertex(xdiamond+width*.06,ydiamond+height*1*.06);
  vertex(xdiamond,ydiamond+height*2*.06);
  vertex(xdiamond-width*.06,ydiamond+height*1*.06);
  endShape();
}

void clover(float xclover, float yclover)
{
  noStroke();
  fill(255,255,0);
  ellipse(xclover,yclover,width*.05,height*.05);
  ellipse(xclover+width*.023,yclover+height*.033,width*.05,height*.05);
  ellipse(xclover-width*.023,yclover+height*.033,width*.05,height*.05);
}



