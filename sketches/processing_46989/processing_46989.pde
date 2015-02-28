
//HW 13 Information Visualization
//Copyright Kristen McConnell, Pittsburgh, PA, Nov. 2011

//Data: 2010-2011 Academic Achievement Report for Allegheny County School Districts
//Source: http://paayp.emetric.net/County/DistrictList/c2

//Image Arrays
PImage bg, greenShield, orangeShield, yellowShield, redShield;
PImage [] shieldArray;
int MAX = 4;

//Width & Height of Screen
int ht = 600;
int wt = 600;


void setup()
{
 //Preping the Screen
 size(600, 600);//I originally had the size set to ht and wt, but OpenProcessing didn't like it. I made the change, so this would display in OpenProcessing.
 //Loading Images
 bg = loadImage("alleghlg.jpg");
 greenShield = loadImage("0.png");
 orangeShield = loadImage("1.png");
 yellowShield = loadImage("2.png");
 redShield = loadImage("3.png");

 shieldArray = new PImage[MAX];
}

//X Locations for All Schools
float [] xPosition = {wt*.65, //Allegheny Valley
                     wt*.34, //Avonworth
                     wt*.575, //Baldwin-Whitehall
                     wt*.69 //Duquesne City
                     };

//Y Locations for All Schools
float [] yPosition = {ht*.3, //Allegheny Valley
                     ht*.26, //Avonworth
                     ht*.51, //Baldwin-Whitehall
                     ht*.52 //Duquesne City
                     };

//String of School Names and Adequate Yearly Progress Status for Each School
String [] valueNames = {"Allegheny Valley\nMade Adequate Yearly Progress",
                       "Avonworth\nMade Adequate Yearly Progress",
                       "Baldwin-Whitehall\nMade Adequate Yearly Progress",
                       "Duquesne City\nWarning"
                       };

void draw()
{
   background(bg);
   whichShield();
   shieldLocations();
   determineLocationWithMouse();
   titleAndInstructions();
}

void whichShield()
{
 shieldArray[0] = greenShield;
 shieldArray[1] = greenShield;
 shieldArray[2] = greenShield;
 shieldArray[3] = yellowShield;
}

void shieldLocations()
{
 for(int i = 0; i < MAX; i++)
 {
   image(shieldArray[i],xPosition[i],yPosition[i]);
 }
}

void determineLocationWithMouse()
{
  int index = -1;
  for(int i = 0; i<MAX; i++)
  {
    if(dist(mouseX,mouseY, xPosition[i] + 10, yPosition[i] + 10) < 10)
    {
      index = i;
    }
  }
  if (index >= 0)
    {
      textSize(12);
      text(valueNames[index], xPosition[index], yPosition[index] + 30);
    }
}

void titleAndInstructions()
{
  fill(0);
  textSize(18);
  text("2010-2011 Academic Achievement Report\nAllegheny County School Districts", width*.1, height*.88);
  textSize(10);
  text("Scroll over a shield to see details about a school district.", width*.1, height*.96);
}

