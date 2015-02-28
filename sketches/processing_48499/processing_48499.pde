
//Manuela Kind, Project #2
//Fall 2011, CMU Pittsburgh PA

//---------description------------

// shuffle to pass time; avoid to 
// let the ball go behind your 
// board on the right side

//----------variables-------------

float rx, ry, rw, rh;  //board
float bx, by, bw, bh;  //ball

float deltary;
float deltabx, deltaby;

PFont font;

//-------------setup--------------

void setup()
{
  size (500,500);
  smooth();
  font = loadFont ("HelveticaInseratLTStd-Roman-48.vlw");

  ellipseMode(CENTER);
  rectMode(CENTER);

  bx = width/2;
  by = height/20;
  bw = 25;
  bh = 25;

  deltabx = 4;
  deltaby = 4;
  
  deltary = 3;

  rx = width*0.8;
  ry = height/2;
  rw = 25;
  rh = height/4;
}

//--------------draw--------------

void draw()
{
  background(255);
  ball();
  startb();
  keyPressed();
  borders();
  moveball();
  boardR();
  hit();
  reset();
}

//---------moveball---------------

void moveball()
{
if (frameCount > 350)
    {
    bx = bx + deltabx;
    by = by + deltaby; 
    }

//bouncefromwall
  
 if (bx < width/40)
    {
    deltabx = -deltabx;
   }

 else if (by > height-height/40)
    {
    deltaby = -deltaby;
    }
  
 else if (by < height/40)
    {
    deltaby = -deltaby;
    }
    
//bouncefromboard
    
 else  if( ((abs(rx-bx)) < width/20) && (abs((by-ry)) < height/8))
    {
    deltabx = -deltabx;  
    deltaby = -deltaby;
    } 
}

//---------moveboards---------------

void keyPressed()
{
  //moveboard 
    if (keyCode == UP)
    {
    ry = ry - deltary;
    }
        
    else if (keyCode == DOWN)
    {
      ry = ry + deltary;
    }
}

//-----------hit------------------

void hit()
{ 
  if (bx > width-width/40)
  {
  background(220,130,130);
  fill(255);
  textAlign(CENTER, CENTER);
  textFont(font, 155);
 
  text ("OUT!", width/2, height/2);
  }
}

void reset()
{
  if (bx > width+width*1.5)
  {
  setup();  
  }
}

//---------drawball---------------

void ball()
{
  if (frameCount > 350)
  {
  fill (150,130,130);
  stroke(170, 130, 130); 
  ellipse(bx, by, bw, bh);
  }
}

//-----------drawboard------------

//right side
void boardR()
{
  fill(0);
  rect(rx, ry, rw, rh);
}

//-----------borders---------------

void borders()
{
  noStroke();
  fill (70);
  //Top and Bottom
  rect(width/2, height-height/80, width, height/40);
  rect(width/2, height/80, width, height/40);

  //Left and Right
  fill (220,130,130);
  rect(width/80,height/2, width/40, height-height/20);
} 

//-----------pressstart---------------

void startb()
{
  println(frameCount);

  if (frameCount < 100)
  {  
  fill (0);
    
  textAlign(CENTER, CENTER);
  textFont(font, 155);
  text ("3", width/2, height/2);
  }
  
  else if (frameCount < 200)
  {
  background(255); 
  fill (0);
  text ("2", width/2, height/2);
  }  
  
  else if (frameCount < 300)
  {
  background(255);
  fill (0);
  text ("1", width/2, height/2);
  } 
  
  else if (frameCount < 350)
  {
  background(255);
  fill (0);
  text ("GO!", width/2, height/2);
  }  
}

