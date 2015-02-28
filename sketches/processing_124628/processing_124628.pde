
 
PImage worldmap;
PFont font;
 
float [] xCoordinates = {0.546,0.547,0.496,0.455,0.487,0.498,0.498,0.486,0.496,0.493,0.479,0.475,0.482,0.476,0.466,0.472,0.473,0.563,0.558,0.523,0.504,0.519,0.486,0.469,0.466,0.479,0.515,0.525,0.522,0.511,0.516,0.514,0.503,0.509,0.514,0.491,0.516,0.498,0.511,0.505,0.504,0.502,0.536,0.526,0.514,0.574,0.273,0.261,0.267,0.282,0.243,0.266,0.266,0.144,0.129,0.131,0.139,0.139,0.136,0.235,0.260,0.244,0.256,0.243,0.224,0.242,0.137,0.235,0.278,0.271,0.265,0.197,0.296,0.578,0.883,0.857,0.791,0.832,0.848,0.783,0.277,0.311,0.139,0.548,0.532,0.709,0.479};
float [] yCoordinates = {0.454,0.438,0.437,0.452,0.386,0.423,0.403,0.396,0.385,0.368,0.373,0.360,0.362,0.348,0.338,0.373,0.337,0.433,0.458,0.468,0.399,0.380,0.434,0.441,0.431,0.443,0.394,0.392,0.403,0.400,0.433,0.417,0.410,0.412,0.426,0.376,0.363,0.377,0.392,0.373,0.388,0.362,0.368,0.316,0.342,0.471,0.429,0.415,0.418,0.419,0.433,0.442,0.430,0.365,0.433,0.442,0.458,0.466,0.428,0.434,0.442,0.518,0.468,0.468,0.443,0.401,0.383,0.473,0.428,0.438,0.451,0.490,0.400,0.338,0.445,0.466,0.648,0.482,0.444,0.638,0.831,0.835,0.358,0.414,0.388,0.412,0.450};
float [] diameters2010= {101,17,0,0,2,0,0,0,0,2,4,3,0,0,0,3,1,1,0,0,2,1,3,0,0,0,0,1,0,0,1,0,1,0,0,1,1,0,1,0,1,0,0,0,0,0,2,0,0,9,8,0,0,0,0,0,0,2,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1,0,1,0,0,0};
float [] diameters2011= {86,10,0,0,3,0,2,0,0,2,7,2,1,0,0,2,3,1,0,0,3,2,2,0,0,0,1,2,0,0,0,1,0,1,0,1,2,0,0,0,1,0,0,0,0,1,2,1,0,13,13,0,0,0,0,0,0,0,1,0,0,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0};

int check;


void setup()
{
  size(1000, 600);
  smooth();
  worldmap = loadImage("BAseline20001200.jpg");
  image( worldmap, 0, 0, width, height );
  font = loadFont("Helvetica.vlw");
  check=0;
}
  
void draw()
{
  image( worldmap, 0, 0, width, height );
  createCircles();
}

void createCircles()
{
  for(int i=0; i < xCoordinates.length; i++)
  {
    if( check == 0)
    {
     prepWindow(); 
    }
    else if( check == 1 && i <= 1)
    {
     fill(255,0,98);
     textFont(font, 30);
     text("2010", width*0.1, height*0.9);
     pushStyle();
     stroke(255,0,98);
     strokeWeight(2.5);
     noFill();
     ellipse(xCoordinates[i]*width, yCoordinates[i]*height, diameters2010[i]*1.6, diameters2010[i]*1.6);
     popStyle();
    }
    else if( check == 1 && i > 1)
    {
     fill(255,0,98);
     textFont(font, 30);
     text("2010", width*0.1, height*0.9);
     pushStyle();
     noStroke();
     fill(255,0,98);
     ellipse(xCoordinates[i]*width, yCoordinates[i]*height, diameters2010[i]*1.6, diameters2010[i]*1.6);
     popStyle();
    }
    else if( check == 2 && i <= 1)
    {
     fill(255,0,98);
     textFont(font, 30);
     text("2011", width*0.1, height*0.9);
     pushStyle();
     stroke(255,0,98);
     strokeWeight(2.5);
     noFill();
     ellipse(xCoordinates[i]*width, yCoordinates[i]*height, diameters2011[i]*1.6, diameters2011[i]*1.6);
     popStyle(); 
    }
    else if ( check == 2 && i > 0)
    {
     fill(255,0,98);
     textFont(font, 30);
     text("2011", width*0.1, height*0.9);
     pushStyle();
     noStroke();
     fill(255,0,98);
     ellipse(xCoordinates[i]*width, yCoordinates[i]*height, diameters2011[i]*1.6, diameters2011[i]*1.6);
     popStyle();
    }
  }
}

void prepWindow()
{
 String s = "2011 is considered the year of the great exit from the country for many Greeks. press left arrow to see greek population distribution in 2010, press right to see distribution in 2011, press space to clear";
 fill(255,0,98);
 textFont(font, 30);
 text(s, width*0.15, height*0.35, width*0.70, height*0.85);
}

void keyPressed()
{
 if(keyCode == LEFT)
  {
   check = 1;
  } 
  
  else if(keyCode == RIGHT)
  {
   check = 2; 
  }
  
  else if(key == ' ')
  {
   check = 0;
   image( worldmap, 0, 0, width, height ); 
  }
}



