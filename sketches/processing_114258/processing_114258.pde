
//annie ranttila, copyright 2013
//carnegie mellon university
//assignment 7 - programming in the arts with processing

//global variables
color col1, col2;
float x1, y1, sz1, dx1, dy1, x2, y2, sz2, dx2, dy2, tempx1, tempy1;
PImage img, img2, img3;

void setup()
{
  size(600,600);
  x1=random(50, width-50);
  y1=random(50,width-50);
  sz1=random(120,130);
  dx1=random(5,10);
  dy1=random(5,10);
  col1 = color (random(255), random(255), random(255));
  x2=random(50, width-50);
  y2=random(50, width-50);
  sz2=random(120,130);
  dx2=random(0);
  dy2=random(5,10);
  col2 = color (0,200,200);
  rectMode(CENTER);
  fill(0,10);
  tempx1 = dx1;
  tempy1 = dy1;
  img3 = loadImage("slice.jpg");
  img2 = loadImage("plate.jpg");
  img = loadImage("PIZZA1.jpg");
}

void draw()
{
  background(255,255,255);
  prepScreen(); // function call
  moveFigure(); // function call
  drawFigure(); // function call
  drawFigure2();
  moveFigure2();
  checkCollision();
}

void keyPressed()
{
  
  if (key == CODED);
  {
    if (keyCode == UP) 
    {
      y2=y2+5;
  }
  else if(keyCode == DOWN) 
  {
  y2=y2-5;
}
  else if(keyCode == RIGHT) 
{
x2=x2+5;
}
  else if(keyCode == LEFT) 
{
x2 = x2-5;
}
else if (keyCode == ENTER)
{
  dy1++;
  dx1++;
}
else if (keyCode==TAB)
{
  dy1--;
  dx1--;
}
  }
}

void drawFigure2()
{
  imageMode(CENTER);
  
  image(img2,x2,y2,sz2,sz2);
}

void moveFigure() // pizza

 {
  x1 += dx1;
  if(x1>width || x1 <0)
  {
    dx1 = -dx1;
  }
  y1 += dy1;
  if(y1>height || y1<0)
  {
    dy1 = -dy1;
  }
  
}

void moveFigure2() //plate
{
  x2+= dx2;
  if(x2>width)
  {
    x2= 0;
  }
  if (x2<0)
  {
    x2 = width;
  }
  
}

void prepScreen()
{
 // fill(0,20);
 // rect(width/2,height/2,width, height);
 
}

void drawFigure() // pizza

{

imageMode(CENTER);

image(img,x1,y1,sz1,sz1);
noFill();
strokeWeight(15);
stroke(255,85,26);
ellipse(x1,y1,sz1,sz1);
}

void checkCollision()
{
  float d = dist(x1, y1, x2, y2);
  float colDist = sz1/2 + sz2/2;



  if (d< (sz1/2 + sz2/2))
  

  {
    fill (255,0,0);
    rectMode(CENTER);
    noStroke();
    rect(width/2, height/2, width, height);
    fill(255,255,255);
    textSize( 100 );
   textAlign( CENTER );
    text ("PIZZA", width*.5, height - 400 );
    text("PARTY!", width*.5, height-100);
    imageMode(CENTER);
  
  image(img3,width/2,height/2,width/3,width/3);
  
    dx1 = dx2 + random(3, -50);
    //dx2 = tempx1;
   dy1 = dy2 + random(3, -50);
   // dy2 = tempy1;
    
  }
}




