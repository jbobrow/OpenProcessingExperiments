
PImage img;
int cellX =0;
int cellY = 0;
PImage webImg;
int[] circleXs = new int[500];
int[] circleYs = new int[500];
int numCircs = 0;

void setup() {
  size (800,800);
  webImg = loadImage("SampleNeuronSlice.jpg");
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
  rect(100,100,500,500);
  stroke(0);
  if(mousePressed) {
    if (mouseButton == LEFT)
     {
      if (numCircs < 500)
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


