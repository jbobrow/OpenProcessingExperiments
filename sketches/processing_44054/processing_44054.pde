
bodyparts h, b, l, t;
float x,y;
bodyparts[] imagesOnFrame = new bodyparts[100];
int nmbPartInserted = 0;
boolean btnPressed = false;
boolean partDrag = false;
void setup()
{
  size (900, 500);
  smooth();
  frameRate(60);
}

void draw()
{
  background (255);
  bodyparts part;
  float x,y;
  for(int i=0; i<nmbPartInserted;i++)
  {
      part=imagesOnFrame[i];
      part.display();
      if(nmbPartInserted == (i+1))
      {
        if(partDrag)
        {
          x = mouseX;
          y = mouseY;
          part.setPos(x,y);
        }
        part.display();
      }
  }
}

void mouseReleased() 
{
  partDrag = false;
}

void keyPressed(){
  if(!btnPressed)
  {
    btnPressed = true;
    partDrag = true;
    bodyparts part;
    switch(key) 
    {
      case('h'):case('H'):
      {
      part = new bodyparts("head");
      imagesOnFrame[nmbPartInserted]=part;
      }
      break;
      case('b'):case('B'):
      {
      part = new bodyparts("body");
      imagesOnFrame[nmbPartInserted]=part;
      }
      break;
      case('l'):case('L'):
      {
      part = new bodyparts("leg");
      imagesOnFrame[nmbPartInserted]=part;
      }
      break;
      case('t'):case('T'):
      {
      part = new bodyparts("tail");
      imagesOnFrame[nmbPartInserted]=part;
      }
      break;
      case('g'):case('G'):
      {
      part = new bodyparts("phead");
      imagesOnFrame[nmbPartInserted]=part;
      }
      break;
       case('v'):case('V'):
      {
      part = new bodyparts("pbody");
      imagesOnFrame[nmbPartInserted]=part;
      }
      break;
     case('k'):case('K'):
      {
      part = new bodyparts("pleg");
      imagesOnFrame[nmbPartInserted]=part;
      }
      break;
       case('r'):case('R'):
      {
      part = new bodyparts("ptail");
      imagesOnFrame[nmbPartInserted]=part;
      }
      break;
    }
    }
    nmbPartInserted ++;
  }

 
void keyReleased()
{  
  btnPressed = false;
}


