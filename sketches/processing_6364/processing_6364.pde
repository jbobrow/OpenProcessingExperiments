
int clickX, clickY, releaseX, releaseY;
boolean nowDragging;
int full = 255;
int emt = 0;
int r;
int  g;
int  b;
int num;

void setup() 
{
  size(342,300);
  smooth();
  background (255,255,255);
  frameRate (1000);
}

void draw() 
{ 
  //black
  if((mousePressed)&& (mouseX >= 0) && (mouseX <= 40) && (mouseY >= 0) && (mouseY <=50))
  {
    r = 0;
    g = 0;
    b = 0;
    print ("black");
  }
  //red
  if ((mousePressed)&& (mouseX >= 0) && (mouseX <= 40) && (mouseY >= 50) && (mouseY <=100))
  {

    r = 255;
    g = 0;
    b = 0;
    print ("red");
  }
  //green 
  if ((mousePressed)&& (mouseX >= 0) && (mouseX <= 40) && (mouseY >= 100) && (mouseY <=150))
  {
    r = 0;
    g = 255;
    b = 0;
    print ("green");
  }
  //blue 
  if ((mousePressed)&& (mouseX >= 0) && (mouseX <= 40) && (mouseY >= 150) && (mouseY <=200))
  {
    r = 0;
    g = 0;
    b = 255;
    print ("blue");
  }
  //yellow
  if ((mousePressed)&& (mouseX >= 0) && (mouseX <= 40) && (mouseY >= 200) && (mouseY <=250))
  {
    r = 255;
    g = 255;
    b = 0;
    print ("yellow");
  }
  //white
  if ((mousePressed)&& (mouseX >= 0) && (mouseX <= 40) && (mouseY >= 250) && (mouseY <=300))
  {
    r = 255;
    g = 255;
    b = 255;
    print (" white");
  }
  
          //code for the dot
          if (mousePressed) 
          {
            fill(r,g,b);
            stroke (r,g,b);
            ellipse (mouseX,mouseY,5,5);
          }
    
  //code for color rectangles 
  noStroke ();
  fill (emt); //black
  rect (0,0,40,50);
  
  fill (full,emt,emt);//red
  rect (0,50,40,50);
  
  fill (emt,full,emt);//green
  rect (0,100,40,50);
  
  fill (emt,emt,full);//blue
  rect (0,150,40,50);

  fill (full,full,emt);//yelow
  rect (0,200,40,50);
  
  stroke(0);
  strokeWeight (1);
  fill (full);//white
  rect (0,250,39,49);

 //border
  stroke (full);
  strokeWeight (3);
  line (41,0,41, 300);
  noStroke ();
  stroke (255);


}

void mousePressed()
{
  clickX = releaseX = mouseX;
  clickY = releaseY = mouseY;
}





