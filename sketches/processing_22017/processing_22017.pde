
/*
  Written by K C Tubo
  27 Feb 2011
  
  Position, color and/or size of objects change 
  depending on the hour, minute and/or second. 
  Background color also changes depending on what
  quarter of the day you are in. Colors of objects also
  change depending on which half of the hour you are in.
 */

//petal positions and sizes
float xLeftPetal;
float xRightPetal;
float yTopPetal;
float yBottomPetal;
float wPetal;
float hPetal;

//leaf positions
float xLeftLeaf;
float xRightLeaf;
float yTopLeaf;
float yMidLeaf;
float yBottomLeaf;

//petal colors
int rPetal;
int gPetal;
int bPetal;

int xCloud;
int yCloud;
int wCloud;
int hCloud;
int xRightCloud;
int xLeftCloud;
int ySideCloud;
int wSideCloud;
int hSideCloud;

//background colors
color lightPink = color(255, 162, 201);
color lightBlue = color(182, 237, 237);
color orange = color(255, 166, 0); 
color darkBlue = color(2, 9, 67); 

//sun and flower center colors
color darkYellow = color(255, 250, 0);
color lightYellow = color (255, 255, 100);

//leaves and stem colors
color darkGreen = color(20, 80, 1);
color brightGreen = color(30, 227, 54);

void setup()
{
  size(400, 400);
  smooth();
}

void draw()
{
  
  //background color change depending on time of day
  if (hour() <= 5 && minute() <=59 && second() <= 59)//morning
  {
   background(lightPink);
  }
  else if (hour() <= 11 && minute() <= 59 && second() <= 59)//early afternoon
  {
   background(lightBlue);
  }
  else if (hour() <= 17 && minute() <= 59 && second() <= 59)//late afternoon
  {
   background(orange);
  }
  else //night
  {
   background(darkBlue);
  }
  
  strokeWeight(2);
  stroke(0);
  
   //cloud colors
   if (hour() >= 18)
   {
     if (minute() <= 29)
     {
       fill(75);
     }
     else
     {
       fill(200);
     }
   }
   else 
   {
    if (minute() <= 29)
    {
      fill(255); 
    }
    else
      {
       fill(200); 
      }
   }
   
   //cloud. moves to the right every minute.
   xCloud = width * 2/3;
   yCloud = height/4;
   xRightCloud = xCloud - wCloud * 2/3;
   xLeftCloud = xCloud + wCloud * 2/3;
   ySideCloud = yCloud + hCloud * 1/4; //left and right circles of cloud
   wCloud = width/6;
   hCloud = height/6;
   wSideCloud = wCloud * 3/4; //left and right circles of cloud
   hSideCloud = hCloud * 3/4; //left and right circles of cloud
   ellipse(xCloud + minute(), yCloud, wCloud, hCloud); //middle cloud
   ellipse(xLeftCloud + minute(), ySideCloud, wSideCloud, hSideCloud);//left cloud
   ellipse(xRightCloud + minute(), ySideCloud, wSideCloud, hSideCloud); //right cloud
   rectMode(CORNERS);
   noStroke();
   rect(xRightCloud + minute(),
     (yCloud + hCloud * 1/3) - (hSideCloud)/2, //height is a little low to show off curve of circle
      xLeftCloud + minute(), 
     (yCloud + hCloud * 1/4) + (hSideCloud)/2);
   stroke(0);
   line(xRightCloud + minute(), ySideCloud + hSideCloud/2,
      xLeftCloud + minute(), ySideCloud + hSideCloud/2);
      
  //color for leaves and stem
  if (minute() <= 29) //first half hour
  {
    fill(darkGreen);
  }
  else //last half hour
  {
   fill(brightGreen);
  }
  
  //leaves. move up every minute
  xLeftLeaf = width/2 - 16;
  xRightLeaf = width/2 + 16;
  yTopLeaf = height * 7/8 - minute();
  yMidLeaf = height - minute();
  yBottomLeaf = height + (height/8) - minute();
  ellipse(xLeftLeaf, yTopLeaf, wPetal/2, hPetal/4);
  ellipse(xRightLeaf, yTopLeaf, wPetal/2, hPetal/4);
  ellipse(xLeftLeaf, yMidLeaf, wPetal/2, hPetal/4);
  ellipse(xRightLeaf, yMidLeaf, wPetal/2, hPetal/4);
  ellipse(xLeftLeaf, yBottomLeaf, wPetal/2, hPetal/4);
  ellipse(xRightLeaf, yBottomLeaf, wPetal/2, hPetal/4);
  
  //stem. move up with leaves every minute. 
  rectMode(CORNER);
  rect(width/2 - 4, (height*3)/4 - minute(), 8, height);
  
  //color for petals
  ellipseMode(CENTER);
  fill(rPetal, gPetal, bPetal);
  rPetal = 100;
  gPetal = 0;
  if (second() <= 15)
  {
   bPetal = 100 + second() * 10; //red to purple
  }
  else if (second() > 15 && second() <= 30)
  {
   bPetal = 400 - second() * 10;//red to purple
  }
  else if (second() > 30 && second() <= 45)
  {
   bPetal = second() * 10 - 200;//red to purple
  }
  else
  {
   bPetal = 700 - second() * 10; //red to purple
  }
  
  //petals. change color every second. moves up every minute
  xLeftPetal = width/2 - width/16;
  xRightPetal = width/2 + width/16;
  yTopPetal = (height*3)/4 - height/16 - minute();
  yBottomPetal = (height*3)/4 + height/16 - minute();
  wPetal = width/8;
  hPetal = height/8;
  ellipse(xLeftPetal, yTopPetal, wPetal, hPetal);
  ellipse(xRightPetal, yBottomPetal, wPetal, hPetal);
  ellipse(xRightPetal, yTopPetal, wPetal, hPetal);
  ellipse(xLeftPetal, yBottomPetal, wPetal, hPetal);
  

  //yellow colors for flower center
  if (minute() <= 29)//first half hour
  {
    fill(255, 250, 0); //dark yellow
  }
  else //last half hour
  {
    fill(255, 255, 100); //light yellow
  }
 
  //flower center. moves up every minute.
  ellipse(width/2, height * 3/4 - minute(), 
    wPetal * 3/4, hPetal * 3/4);  
    
  //yellow colors for sun (moon only from 18:00 - 23:59)
  if (hour() <= 17 && minute() <= 59 && second() <= 59)
  {
    if (minute() <= 29)//first half hour
    {
      fill(darkYellow);
    }
    else //last half hour
    {
      fill(lightYellow);
    }
  }
  else 
  {
   fill(255);
  } 
  
  //sun. size becomes bigger every hour. 
  ellipse(0, 0, width/4 + hour() * 4, height/4 + hour() * 4);
  
  //yellow colors for sun rays. blends with background at night. 
  if (hour() <= 17 && minute() <= 59 && second() <= 59)
  { 
    if (minute() <= 29)//first half hour
    {
      stroke(darkYellow);
    }
    else //last half hour
    {
      stroke(lightYellow);
    }
  }
  else
  {
   stroke(darkBlue); // blends with night background 
  }
  
  //sunrays. lines move per hour
  strokeWeight(5);
  line(width/4 + hour(), height/4 + hour(),
    width/6 + hour(), height/6 + hour());//middle
  line(width/16 + hour(), height/5 + hour(),
    width/10 + hour(), height/3 + hour());//left
  line(width/5 + hour(), height/16 + hour(),
    width/3 + hour(), height/10 + hour());//right
  line(-width/32 + hour(), height/4 + hour(),
    -width/32 + hour(), height/3 + hour()); 
  line(height/4 + hour(), -width/32 + hour(), 
    height/3 + hour(), -width/32 + hour()); 
}


