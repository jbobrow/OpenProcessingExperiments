
int xValue;
float red1, green1, blue1;
float red2, green2, blue2;
//the red,green,and blue values for each color. The values are randomized in "void run"
//colormain and colormain2 are the actual colors of the background and the square.
color colormain,colormain2;
float percentchange=1;
void setup()
{
  size(800,200);
  xValue=0;
  strokeWeight(4);
  background(255);
  frameRate(60);
  red1=random(255);
  green1=random(255);
  blue1=random(255);
  red2=random(255);
  green2=random(255);
  blue2=random(255);
}
void draw()
{
  background(255);
//"Lerp Color" basically increments gives you a color
//between two colors based on how much of each color you want. 
//The idea for this program is to fade between two colors that are randomally chosen.
  colormain=lerpColor(color(red1,green1,blue1),color(red2,green2,blue2), percentchange);
  colormain2=lerpColor(color(red2,green2,blue2),color(red1,green1,blue1), percentchange);
  percentchange=percentchange+0.025;
//Every frame it slightly changes the percentage that it increments the color by.
//Then when it is fully one color, it chooses two new colors and does the same thing.
  if (percentchange >= 1.0)
  {
      red1=random(255);
      green1=random(255);
      blue1=random(255);
      red2=random(255);
      green2=random(255);
      blue2=random(255);
      percentchange = 0;
  }
  fill(colormain);
  stroke(colormain);
  background(colormain2);
  rect(xValue,50,100,100);
  //CREATES A RECTANGLE OMG
  xValue=xValue+2;
  //MAKES THE RECTANGLE MOVE OMG
  fill(colormain2);
  //MAKES THE POOP THE SAME COLOR AS THE BACKGROUND OMG
  textSize(30);
  text("POOP",xValue,80,100,100);
  //hehe, poop.
  if(xValue>800)
  {
    xValue=-100;
  }
}

