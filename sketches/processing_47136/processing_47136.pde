
//HW 13 Information Visualization
//Copyright Kristen McConnell, Pittsburgh, PA, Nov. 2011

//Data: 2010-2011 Academic Achievement Report for Allegheny County School Districts
//Source: http://paayp.emetric.net/County/DistrictList/c2

//Image Arrays
PImage bg, greenShield, orangeShield, yellowShield, redShield;
PImage [] shieldArray;
PFont garamondBold, garamondLight;
int MAX = 43;

//Width & Height of Screen
int ht = 600;
int wt = 600;

void setup()
{
 //Preping the Screen
 size(600,600);//I had the size as wt and ht, but OpenProcessing didn't like it. This is to fix the problem, so it can be displayed in OpenProcessing.
 //Loading Images
 bg = loadImage("alleghlg.jpg");
 greenShield = loadImage("0.png");
 orangeShield = loadImage("1.png");
 yellowShield = loadImage("2.png");
 redShield = loadImage("3.png");
 garamondBold = loadFont("Garamond-BoldCondensed-18.vlw");
 garamondLight = loadFont("Garamond-LightCondensed-14.vlw");

 shieldArray = new PImage[MAX];
}

//X Locations for All Schools
float [] xPosition = {wt*.75, //Allegheny Valley
                     wt*.36, //Avonworth
                     wt*.575, //Baldwin-Whitehall
                     wt*.46,//Bethel Park
                     wt*.54,//Brentwood Borough
                     wt*.39,//Carlynton
                     wt*.36,//Chartiers Valley
                     wt*.65,//Clairton City
                     wt*.32,//Cornell
                     wt*.72,//Deer Lakes
                     wt*.69, //Duquesne City
                     wt*.75,//East Allegheny
                     wt*.68,//Elizabeth Forward
                     wt*.65,//Fox Chapel Area
                     wt*.81,//Gateway
                     wt*.565,//Hampton Township
                     wt*.82,//Highlands
                     wt*.43,//Keystone Oaks
                     wt*.74,//McKeesport Area
                     wt*.34,//Montour
                     wt*.23,//Moon Area
                     wt*.43,//Mt. Lebanon
                     wt*.41,//North Allegheny
                     wt*.47,//North Hills
                     wt*.42,//Northgate
                     wt*.74,//Penn Hills
                     wt*.51,//Pine-Richland
                     wt*.52,//Pittsburgh
                     wt*.83,//Plum Borough
                     wt*.28,//Quaker Valley
                     wt*.71,//Riverview
                     wt*.54,//Shaler Area
                     wt*.68,//South Allegheny
                     wt*.3,//South Fayette Township
                     wt*.52,//South Park
                     wt*.62,//Steel Valley
                     wt*.4,//Sto-Rox
                     wt*.39,//Upper Saint Clair
                     wt*.15,//West Allegheny
                     wt*.59,//West Jefferson Hills
                     wt*.61,//West Mifflin
                     wt*.66,//Wilkinsburg Borough
                     wt*.69//Woodland Hills
                     };
                     
//Y Locations for All Schools
float [] yPosition = {ht*.22, //Allegheny Valley
                     ht*.27, //Avonworth
                     ht*.53, //Baldwin-Whitehall
                     ht*.6,//Bethel Park
                     ht*.51,//Brentwood Borough
                     ht*.39,//Carlynton
                     ht*.44,//Chartiers Valley
                     ht*.65,//Clairton City
                     ht*.29,//Cornell
                     ht*.11,//Deer Lakes
                     ht*.52, //Duquesne City
                     ht*.51,//East Allegheny
                     ht*.73,//Elizabeth Forward
                     ht*.25,//Fox Chapel Area
                     ht*.42,//Gateway
                     ht*.16,//Hampton Township
                     ht*.075,//Highlands
                     ht*.43,//Keystone Oaks
                     ht*.57,//McKeesport Area
                     ht*.36,//Montour
                     ht*.27,//Moon Area
                     ht*.52,//Mt. Lebanon
                     ht*.16,//North Allegheny
                     ht*.26,//North Hills
                     ht*.31,//Northgate
                     ht*.34,//Penn Hills
                     ht*.075,//Pine-Richland
                     ht*.4,//Pittsburgh
                     ht*.29,//Plum Borough
                     ht*.2,//Quaker Valley
                     ht*.27,//Riverview
                     ht*.28,//Shaler Area
                     ht*.62,//South Allegheny
                     ht*.55,//South Fayette Township
                     ht*.64,//South Park
                     ht*.47,//Steel Valley
                     ht*.34,//Sto-Rox
                     ht*.58,//Upper Saint Clair
                     ht*.38,//West Allegheny
                     ht*.66,//West Jefferson Hills
                     ht*.57,//West Mifflin
                     ht*.42,//Wilkinsburg Borough
                     ht*.45//Woodland Hills
                     };

//String of School Names and Adequate Yearly Progress Status for Each School
String [] valueNames = {"Allegheny Valley\nMade Adequate Yearly Progress",
                       "Avonworth\nMade Adequate Yearly Progress",
                       "Baldwin-Whitehall\nMade Adequate Yearly Progress",
                       "Bethel Park\nMade Adequate Yearly Progress",
                       "Brentwood Borough\nMade Adequate Yearly Progress",
                       "Carlynton\nMade Adequate Yearly Progress",
                       "Chartiers Valley\nMade Adequate Yearly Progress",
                       "Clairton City\nMade Adequate Yearly Progress",
                       "Cornell\nMade Adequate Yearly Progress",
                       "Deer Lakes\nMade Adequate Yearly Progress",
                       "Duquesne City\nWarning",
                       "East Allegheny\nMade Adequate Yearly Progress",
                       "Elizabeth Forward\nMade Adequate Yearly Progress",
                       "Fox Chapel Area\nMade Adequate Yearly Progress",
                       "Gateway\nMade Adequate Yearly Progress",
                       "Hampton Township\nMade Adequate Yearly Progress",
                       "Highlands\nMade Adequate Yearly Progress",
                       "Keystone Oaks\nMade Adequate Yearly Progress",
                       "McKeesport Area\nCorrective Action II 1st Year",
                       "Montour\nMade Adequate Yearly Progress",
                       "Moon Area\nMade Adequate Yearly Progress",
                       "Mt. Lebanon\nMade Adequate Yearly Progress",
                       "North Allegheny\nMade Adequate Yearly Progress",
                       "North Hills\nMade Adequate Yearly Progress",
                       "Northgate\nMade Adequate Yearly Progress",
                       "Penn Hills\nMade Adequate Yearly Progress",
                       "Pine-Richland\nMade Adequate Yearly Progress",
                       "Pittsburgh\nMaking Progress: in Corrective Action II",
                       "Plum Borough\nMade Adequate Yearly Progress",
                       "Quaker Valley\nMade Adequate Yearly Progress",
                       "Riverview\nMade Adequate Yearly Progress",
                       "Shaler Area\nMade Adequate Yearly Progress",
                       "South Allegheny\nMade Adequate Yearly Progress",
                       "South Fayette Township\nMade Adequate Yearly Progress",
                       "South Park\nMade Adequate Yearly Progress",
                       "Steel Valley\nMade Adequate Yearly Progress",
                       "Sto-Rox\nDistrict Improvement I",
                       "Upper Saint Clair\nMade Adequate Yearly Progress",
                       "West Allegheny\nMade Adequate Yearly Progress",
                       "West Jefferson Hills\nMade Adequate Yearly Progress",
                       "West Mifflin Area\nMade Adequate Yearly Progress",
                       "Wilkinsburg Borough\nMaking Progress: in District Improvement I",
                       "Woodland Hills\nCorrective Action II 3rd Year"
                       };

void draw()
{
   background(bg);
   whichShield();
   shieldLocations();
   determineLocationWithMouse();
   titleAndInstructions();
}

//Determines which shield is applied to each school
void whichShield()
{
  shieldArray[0] = greenShield;//Allegheny Valley
  shieldArray[1] = greenShield;//Avonworth
  shieldArray[2] = greenShield;//Baldwin-Whitehall
  shieldArray[3] = greenShield;//Bethel Park
  shieldArray[4] = greenShield;//Brentwood Borough
  shieldArray[5] = greenShield;//Carlynton
  shieldArray[6] = greenShield;//Chartiers Valley
  shieldArray[7] = greenShield;//Clairton City
  shieldArray[8] = greenShield;//Cornell
  shieldArray[9] = greenShield;//Deer Lakes
  shieldArray[10] = yellowShield;//Duquesne City
  shieldArray[11] = greenShield;//East Allegheny
  shieldArray[12] = greenShield;//Elizabeth Forward
  shieldArray[13] = greenShield;//Fox Chapel Area
  shieldArray[14] = greenShield;//Gateway
  shieldArray[15] = greenShield;//Hampton Township
  shieldArray[16] = greenShield;//Highlands
  shieldArray[17] = greenShield;//Keystone Oaks
  shieldArray[18] = redShield;//McKeesport Area
  shieldArray[19] = greenShield;//Montour
  shieldArray[20] = greenShield;//Moon Area
  shieldArray[21] = greenShield;//Mt. Lebanon
  shieldArray[22] = greenShield;//North Allegheny
  shieldArray[23] = greenShield;//North Hills
  shieldArray[24] = greenShield;//Northgate
  shieldArray[25] = greenShield;//Penn Hills
  shieldArray[26] = greenShield;//Pine-Richland
  shieldArray[27] = orangeShield;//Pittsburgh
  shieldArray[28] = greenShield;//Plum Borough
  shieldArray[29] = greenShield;//Quaker Valley
  shieldArray[30] = greenShield;//Riverview
  shieldArray[31] = greenShield;//Shaler Area
  shieldArray[32] = greenShield;//South Allegheny
  shieldArray[33] = greenShield;//South Fayette Township
  shieldArray[34] = greenShield;//South Park
  shieldArray[35] = greenShield;//Steel Valley
  shieldArray[36] = redShield;//Sto-Rox
  shieldArray[37] = greenShield;//Upper Saint Clair
  shieldArray[38] = greenShield;//West Allegheny
  shieldArray[39] = greenShield;//West Jefferson Hills
  shieldArray[40] = greenShield;//West Mifflin
  shieldArray[41] = orangeShield;//Wilkinsburg Borough
  shieldArray[42] = redShield;//Woodland Hills
}

//Places the Correct Shield at the Correct X & Y Locations
void shieldLocations()
{
 for(int i = 0; i < MAX; i++)
 {
   image(shieldArray[i],xPosition[i],yPosition[i]);
 }
}

//Uses the mouse to determine is a school's shield is highlighted, then displays teh appropriate school information
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
      fill(0);
      textFont(garamondBold, 18);
      text(valueNames[index], width*.05, height*.705);
    }
}

//Generic text to be continually displayed on the screen
void titleAndInstructions()
{
  noStroke();
  fill(0,70,0);
  rect(0,height*.85,width,height);
  fill(255);
  textFont(garamondBold, 18);
  text("2010-2011 Academic Achievement Report: Allegheny County School Districts", width*.05, height*.92);
  textFont(garamondLight, 14);
  text("Scroll over a shield to see details about a school district.", width*.05, height*.95);
}

