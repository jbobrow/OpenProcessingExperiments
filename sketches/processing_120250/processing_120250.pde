
int i = 0;
int j = 0;
int k = 0;
int r = 0;
int speed = 20;
boolean pinWheel = false;
boolean fileFlag = true;
/* @pjs preload="sample.JPG"; */
PImage myImage;


int MY_SQUARE;


void setup()
{
  /*selectInput("Select an image to generate color palette", "fileSelected");
  while (fileFlag) 
  {
    System.out.print("");
  };*/
  MY_SQUARE = 500;
  
  myImage = loadImage("sample.JPG");
  myImage.loadPixels();
  //size(myImage.width, myImage.height);
  background(0);
  frameRate(1000000);
  size(200, 200);
  //size(600,600);
  myImage.resize(2*MY_SQUARE,2*MY_SQUARE);
  myImage.loadPixels();
  
  
  //image(myImage,0,0);
  
  
 
}

void draw()
{
  /*if(mousePressed)
  {
    saveFrame("vortex-#######.png");
  }*/
  if (!pinWheel)
  {
    noFill();
    j++;
    i = j%(6*360);  
    /*if (j >= 25200)
    {
      pinWheel = true;
    }*/
    r++;
    if(r >= 200)
    {
      k++;
      i+=0.5;
    }
    r = r % 200;
    //println(r);
    strokeWeight(2);
    int x = (int)MY_SQUARE+round(cos((i/6.0))*r);
    int y = (int)MY_SQUARE+round(sin((i/6.0))*r);
    println("("+x+","+y+")");
    
    color newStroke = myImage.get(x, y); //without converting to radians, makes cool shit
    stroke(newStroke);
    /*if (round(random(3))==1)
     {
     stroke(0, 0, 100);
     }
     else
     {
     stroke(random(210, 250), random(70, 100), random(70, 100));
     }*/
    pushMatrix();
    translate((int)width/2, (int)height/2);
    //rotate(i);
    scale(3);
    arc(0, 0, r, r, radians(i/6.0), radians((i+1)/6.0));
    popMatrix();
    /*if (pinWheel)
     {
     //adjust the integer sent to "travel" to adjust how "fast" you're going
     travel(speed);
     
     j+=30;
     }*/

    /*if ((j%36 == 0) && (j < 10080))
    {
      //saveFrame("hyperspaceAT"+speed+"-########.png");
    }*/
  }
}

void travel(int speed)
{
  int myr = r;
  for (int f = 0; f < speed; f++)
  {
    if (round(random(3))==1)
    {
      stroke(0, 0, 100);
    }
    else
    {
      stroke(random(210, 250), random(70, 100), random(70, 100));
    }
    pushMatrix();
    translate(width/2, height/2);
    //rotate(i);
    scale(4);
    arc(0, 0, r, r, radians(i), radians(i+30));
    popMatrix();
    j++;
    i = j % 360;
    r++;
  }
}


void fileSelected(File selection)
{
  if (selection == null)
  {
    myImage = createImage(100,100,RGB);
    System.out.println("No file selected");
  }
  else
  {
    myImage = loadImage(selection.getPath());
    System.out.println("File selected: "+selection.getPath());
  }
  fileFlag = false;
}



