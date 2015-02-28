
/*
Hybridize
Christie Leece
Final Project, ICM-Dewey-Hagborg-F11
Humans are creating hybrid animals explicitly and implicitly. 
This sketch allows users to re-hybridize animals and save an image of their creation. 
*/


// Define all images
String[] headImages = {
  "zorseHead.gif", "pheasantHead.gif", "dzoHead.gif", "grolarHead.gif", "ligerHead.gif", "rabbitHead.gif", "wholphinHead.gif"
};
String[] bodyImages= {
  "zorseBody.gif", "pheasantBody.gif", "grolarBody.gif", "rabbitBody.gif", "ligerBody.gif", "wholphinBody.gif"
};
String[] legImages= {
  "zorseLeg.gif", "pheasantLeg.gif", "grolarLeg.gif", "rabbitLeg.gif", "ligerLeg.gif", "wholphinLeg.gif"
};
String[] tailImages= {
  "zorseTail.gif", "pheasantTail.gif", "ligerTail.gif", "rabbitTail.gif", "wholphinTail.gif"
};
String[] frame= {
  "frameImage.gif"
};

//global variables
//all the bodypart allowable, up to a hundred
int myX, myY;
bodypart[] imagesOnFrame = new bodypart[100];
//count the number of bodypart used
int nmbPartInserted = 0;
//booleans to describe whether an item is dragged or a button pressed
boolean btnPressed = false;
boolean partDrag = false;
bodypart part;
boolean partShake=false;

void setup()
{
  size (1400, 800);
  smooth();
  frameRate(10);
}


void draw()
{
  background (255);
  //call the parts to be displayed and dragged 
  //create text to describe the process
  PFont font;
  font = loadFont("Futura-Medium-20.vlw"); 
  textFont(font); 
  String s = "Hybridize! Press B for a body, H for a head, L for a leg or T to create a tail.  Press and drag the body part where you want it and release to drop it.  Hit the space bar to capture a picture of your animal.";
  fill(0);
  text(s, 30, 30, width-50, 70);

  int x, y;
  for (int i=0; i<nmbPartInserted;i++)
  {
    part=imagesOnFrame[i];

if(part != null)
{
    part.shake();
    if (nmbPartInserted == (i+1))
    {
      if (partDrag)
      {
        myX = mouseX;
        myY = mouseY;
        part.setPos(myX, myY);
        part.display();
      }
    }
}
  }
}

//identify which key triggers which body part. 
//This should ideally be in an array with more body parts randomly chosen.
void keyPressed() {
  if (!btnPressed)
  {
    btnPressed = true;
    partDrag = true;
    bodypart part;
    switch(key) 
    {
      case('h'):
      case('H'):
      {
        String imageName = headImages[round(random(0, headImages.length - 1))]; // find random head image
        part = new bodypart(imageName, 0);
        imagesOnFrame[nmbPartInserted]=part;
      }
      break;
      case('b'):
      case('B'):
      {
        String imageName = bodyImages[round(random(0, bodyImages.length - 1))]; // find random body image
        part = new bodypart(imageName, 1);
        imagesOnFrame[nmbPartInserted]=part;
      }
      break;
      case('l'):
      case('L'):
      {
        String imageName = legImages[round(random(0, legImages.length - 1))]; // find random leg image
        part = new bodypart(imageName, 2);
        imagesOnFrame[nmbPartInserted]=part;
      }
      break;
      case('t'):
      case('T'):
      {
        String imageName = tailImages[round(random(0, tailImages.length - 1))]; // find random tail image
        part = new bodypart(imageName, 3);
        imagesOnFrame[nmbPartInserted]=part;
      }
      break;
      case(' '):
      {
        String imageName = frame[round(random(0, frame.length - 1))]; // find random tail image
        part = new bodypart(imageName, 0);
        imagesOnFrame[nmbPartInserted]=part;
        saveFrame("animalHybrid-####.png");
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
//if mouse is released, leave the part in place
void mouseReleased() 
{
  partDrag = false;
}


