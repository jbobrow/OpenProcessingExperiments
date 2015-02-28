
PImage img;
int cellX =0;
int cellY = 0;
PImage webImg;
int[] circleXs = new int[1000];
int[] circleYs = new int[1000];
int numCircs = 0;

void setup() {
  size (1200,800);
  String url = "http://vs.psc.edu/~awetzel/newjosh/j40/S1WGRAL00.jpg";
  webImg = loadImage(url, "gif");
//  int imgNumber = 0;
//  String imgFile = "S1WGRAL0"+imgNumber+".jpg";
//  img = loadImage(imgFile);
}

void mouseReleased()
{
  cellX = mouseX;
  cellY = mouseY; 
  print(cellX+", "+cellY+"\n");
}

void draw() {
  image(webImg, 0, 0);
  noFill();
  stroke(0);
  rect(400,200,500,500);
  stroke(0);
  if(mousePressed) {
    if (mouseButton == LEFT)
     {
      if (numCircs < circleXs.length)
      {
        circleXs[numCircs] = mouseX;
        circleYs[numCircs] = mouseY;
        numCircs++;
      }
      else
      {
        print("Why on Earth did you click this many times!?!?!?!?!?!?!?\n");
      }
    }
    else
    {
      if(numCircs >= 1)
        numCircs--;
      else
       print("I can't delete nothing dude!\n"); 
    }
  }
  stroke(204, 102, 0);
  for( int i =0; i < numCircs; i++)
  {
    ellipse(circleXs[i],circleYs[i],15,15); 
  }
}


