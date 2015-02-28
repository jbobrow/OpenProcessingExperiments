
// hw 13
// COPYRIGHT CARL BAJANDAS 2011 PIRRSBURGH PA 



///////////////////////////////////
//////// NaN ERROR 
///////////////////////////////////




int MAX = 380;

Boxx Boxx1 ; 
Boxx [] boxes; 



void setup ()
{
  size (500, 500, P3D);

  Boxx1 = new Boxx (width/2, height/2, 0, 50, 0, 0, 255);
  boxes = new Boxx [MAX]; 

  for (int i = 0, j = 0, x=50; i < boxes.length ; i++)
  {
    if (i%20 == 0 )
    {
      j +=52; 
      x= 50;
    }
    boxes [i] = new Boxx (x, j, 0, 45, 0, 0, 255);
    x+=50;
  }
}



void draw ()
{
  background (100);
  translate (-275, 150, -1200); 
  rotateX (PI/2.7);

  for (int i = 0; i < boxes.length ; i++)
  {
    boxes [i] .display  ();
  }
  //Boxx1.display(); 
  //Boxx1.floatUp(); 
  checkMouse ();
}

void checkMouse ()
{
  for (int i = 0; i < boxes.length ; i++)
  {
    float distance = dist (mouseX*2, mouseY*2, boxes[i].xPos, boxes[i].yPos );
    if (distance < boxes [i]. edge/1.5)
    {
      {
        boxes[i].col = color (boxes[i].r, boxes[i].g, boxes[i].b);
        if (boxes[i].r > 240)
          boxes[i].g += 9;
        if (boxes[i].b < 75)
          boxes[i].r+=7;   
        boxes[i].b -= 5;
        fill (boxes[i].r, boxes[i].g, boxes[i].b); 
        boxes[i].zPos+=2.75;
      }
    }
    else if (( boxes[i].zPos >= 0)) //||(boxes[i].zPos >= -50)) 
    {
      // boxes[i].zPos = -50;
      boxes[i].zPos+= -1 ;
    }
  }
}

class Boxx 
{

  color col;
  float xPos;
  float yPos; 
  float zPos; 
  float zMove;
  float edge; 
  float  r, g, b;

  Boxx (float x, float y, float z, float dim, float rd, float grn, float blu) 
  {
    col = color (rd, grn, blu);
    xPos = x;
    yPos = y;
    zPos = z;
    zMove= 1;
    edge = dim;
    r=0;
    g=0;
    b=255;
  }

  void display ()
  {
    pushMatrix ();
    translate ( xPos, yPos, zPos );
    fill (col); 
    box (edge);
    popMatrix ();
  }

  void floatUp ()
  {

    if  (mouseX > height/2)
      zPos += zMove;
    // zMove=1;
  }
}





