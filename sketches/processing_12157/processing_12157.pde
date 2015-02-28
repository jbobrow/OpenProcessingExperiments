
/*
 Kandinsky Generator
 Sanford Gifford
 Sarah Lawrence College
 9.17.10
*/

// general constants
int[] BGCOLOR = {237, 236, 211};  // our background color, we want to hold onto this for later use
float DEF_LINE_WEIGHT = 3;  // default line weight, used whenever nothing else is given or to set constants below

/*
 CONTANTS NOTES:
 Each shape has at least 3 constants.  Its weight (the constants
 ending in [SHAPE]_WC) is the chance that it will be picked
 given the size requirements are met; the chance is calculated
 by [SHAPE]_WC / (sum of valid shapes weight).  It's size
 requirements ([SHAPE]_MIN_SIZE and [SHAPE]_MAX_SIZE) limit when
 the shape is drawable based on the distance between the two
 clicks.
 
 For descriptions of what each shape type is, see the
 corresponding functions.
*/

// interCircles constants
float ICIRCS_WC = 2;
float IC_MIN_SIZE = 0;
float IC_MAX_SIZE = 150;
float IC_MAX_DIFF_PERCENT = 0.1; // percent of the radius which any given layer can occupy
int IC_MAX_LEVEL_COUNT = 8;  // maximum number of levels this shape can have.  Combined with IC_MAX_DIFF_PERCENT, one can control the maximum and minimum size of the center
int IC_WHITE_CHANCE = /* 1 out of */ 3;  // chance that one of the non-black layers will be white (and not the background color)

// lines/snapLines constants (snapLines not implemented, yet)
float LINE_WC = 2;
float L_MIN_SIZE = 25;
float L_MAX_SIZE = 2000;
float L_LINE_WEIGHT = DEF_LINE_WEIGHT;  // for now, we'll just keep this as the default line weight
int L_MIN_LINES = 1;  // the minimum and maximum line counts
int L_MAX_LINES = 4;
float L_MIN_SPACING = 5;  // maximum and minum spacing (in pixels) between each line
float L_MAX_SPACING = 8;

// rectangle constants
float RECT_WC = 3;
float R_MIN_SIZE = 0;
float R_MAX_SIZE = 100;
float R_BORDER_CHANCE = /* 1 out of */ 1.5;  // chance that the rectangle has a border
float R_LINE_WEIGHT = DEF_LINE_WEIGHT;  // for now, we'll just keep this as the default line weight

// squiggles constants
float SQUIG_WC = 1;
float S_MIN_SIZE = 100;
float S_MAX_SIZE = 500;
float S_MIN_SEGMENTS = 1;  // maximum and minimum arc count
float S_MAX_SEGMENTS = 5;
float S_LINE_WEIGHT = DEF_LINE_WEIGHT;  // for now, we'll just keep this as the default line weight

//general non-constants
float mx = 0;  // stores the last mouse click location
float my = 0;
int clickStat = 0;  // is this the first or second click?

// initializing
void setup()
{
  size(640,480);
  background(BGCOLOR[0], BGCOLOR[1], BGCOLOR[2]);
  smooth();  // we're in no hurry, let's take our time and make this look pretty
}

void mousePressed()
{
  if(clickStat == 0)
  {
    // first click
    println("first click!");
    mx = mouseX;
    my = mouseY;
    
    // make sure we recognize the next click as a first click
    clickStat = 1;
  }else{
    // second click
    println("second click!");
    float distance = sqrt(pow((mouseX - mx),2) + pow((mouseY - my),2));
    println("distance = " + distance);
    
    // each shape type has a weight, this weight is only added if the size criteria (below) are met
    float icircs = 0;
    float lines = 0;
    float rectangle = 0;
    float squig = 0;
    
    // check to see if each shapes size criteria are met.  If so, set the corresponding variable above to the appropriate weight constant 
    if(distance > L_MIN_SIZE && distance < L_MAX_SIZE)
    {
      println("LINE is possible");
      lines = LINE_WC;
    }
    
    if(distance > IC_MIN_SIZE && distance < IC_MAX_SIZE)
    {
      println("ICIRCS is possible");
      icircs = ICIRCS_WC;
    }
    
    if(distance > R_MIN_SIZE && distance < R_MAX_SIZE)
    {
      println("RECT is possible");
      rectangle = RECT_WC;
    }
    
    if(distance > S_MIN_SIZE && distance < S_MAX_SIZE)
    {
      println("SQUIG is possible");
      squig = SQUIG_WC;
    }
    
    // the random number that picks which shape to use.  It picks a number from the total valid weights combined
    float cliche = random(icircs + lines + rectangle + squig);
    println("cliche = " + cliche + "   total = " + (icircs + lines + rectangle + squig));
    
    // to decide if a shape is picked, cliche is compared to the shapes weight PLUS the weights of all the previously checked shapes
    if(cliche < ICIRCS_WC && icircs != 0)
    {
      println("ICIRC");
      interCircles(mx, my, mouseX, mouseY);
    }else
    if(cliche < LINE_WC + icircs && lines != 0)
    {
      println("LINES");
      lines(mx, my, mouseX, mouseY);
    }else
    if(cliche < RECT_WC + icircs + lines && rectangle != 0)
    {
      println("RECT");
      rectangle(mx, my, mouseX, mouseY);
    }else
    if(cliche < SQUIG_WC + icircs + lines + rectangle && squig != 0)
    {
      println("SQUIG");
      squiggle(mx, my, mouseX, mouseY);
    }
    
    // make sure we recognize the next click as a first click
    clickStat = 0;
  }
}

// mousePressed will NOT work without this override present.  No explanation as to why, though
void draw() {
 // No one here but us comments
}

// series of concentric black, white, and neutral (background) colored circles with a randomly colored center
// x1, y1 -> center
// x2, y2 -> a point on perimeter (define radius)
void interCircles(float x1, float y1, float x2, float y2)
{
  float radius = sqrt(pow((x2 - x1),2) + pow((y2 - y1),2));
  float maxDif = radius * IC_MAX_DIFF_PERCENT;  //calculate what the maximum difference between circles can be for this particular shape
  int circCount = round(random(IC_MAX_LEVEL_COUNT));
  
  // don't want strokes muddying things up
  noStroke();

  // loop iterates once for each layer -1 (for the center, which is done after the loop)
  for(int i = 0; i < circCount - 1; i++)
  {
    if(floor((float)(i) / 2) == ((float)(i) / 2)) // alternating algorithm; is true on even values of i, false on odd
    {
      fill(0);  // every other ring should be black
    }else{
      if(random(IC_WHITE_CHANCE) <= 1) // every OTHER ring (not black) should be either the background color, or white (for flair)
      {
        fill(255);
      }else{
        fill(BGCOLOR[0], BGCOLOR[1], BGCOLOR[2]);
      }
    }
    ellipse(x1, y1, (2 * radius), (2 * radius));  // draw elipse. 3rd and 4th parameters are width and height, thus double radius.
    radius -= random(maxDif);
  }
  
  fill(random(255), random(255), random(255)); // random color for the center
  ellipse(x1, y1, (2 * radius), (2 * radius));
}

// sets of parallel lines
// x1, y1 -> beginning of lines, center
// x2, y2 -> end of lines, center
void lines(float x1, float y1, float x2, float y2)
{
  stroke(0);
  strokeWeight(L_LINE_WEIGHT);
  int lineCount = round(random(L_MAX_LINES - L_MIN_LINES)) + L_MIN_LINES; // pick number of lines to draw
  float spacing = random(L_MAX_SPACING - L_MIN_SPACING) + L_MIN_SPACING;  // spacing between lines
  float lWidth = lineCount * spacing;  // total width of lines
  float compMajorX = x2 - x1;  // width of whole contraption, from x to x
  float compMajorY = y2 - y1;  // height of whole contraption, from y to y
  float thetaMajor = atan(compMajorX / compMajorY);  // angle of lines
  float thetaMinor = PI - ((PI / 2) + abs(thetaMajor));  // angle on which the beginnings of the lines are aligned
  
  float compMinorX = sin(thetaMinor) * lWidth; // the components of the small triangle formed under the line formed by the beginnings of the lines
  float compMinorY = cos(thetaMinor) * lWidth;
  
  if(thetaMajor > 0)  // need to account for different quadrants, this is a little sloppy on my part
  {
    thetaMinor += PI / 2;
    compMinorX = cos(thetaMinor) * lWidth;
    compMinorY = sin(thetaMinor) * lWidth;
  }
  
  float compMSubX = compMinorX / lineCount;  // breaking it down to the amount we have to iterate in each direction
  float compMSubY = compMinorY / lineCount;
  
  float curX = x1 - (compMinorX / 2);  // the beginning of each line
  float curY = y1 - (compMinorY / 2);
  
  for(int i = 0; i < lineCount; i++) // loop iterates once for each line
  {
    //fill(0,255,0);
    //dDot(curX,curY);
    line(curX, curY, curX + compMajorX, curY + compMajorY);
    curX += compMSubX;
    curY += compMSubY;
  }
  //fill(255,0,0);
  //dDot(x1, y1);
}

// a rectangle, pretty straight forward
// x1, y1 -> one corner
// x2, y2 -> the opposite corner
void rectangle(float x1, float y1, float x2, float y2)
{
  if(random(R_BORDER_CHANCE) <= 1) // random chance to have a border
  {
    stroke(0);
    strokeWeight(R_LINE_WEIGHT);
  }else{
    noStroke();
  }
  
  fill(random(255), random(255), random(255));  // random fill color
  
  rect(x1, y1, x2 - x1, y2 - y1);
}

// 180 degree arcs in a line
// x1, y1 -> beginning of arcs
// x2, y2 -> end of arcs
void squiggle(float x1, float y1, float x2, float y2)
{
  float distance = sqrt(pow((x2 - x1),2) + pow((y2 - y1),2));
  int arcCount = round(random(S_MAX_SEGMENTS - S_MIN_SEGMENTS) + S_MIN_SEGMENTS);  // how many arcs are we going to draw?
  float arcLength = distance / arcCount;  // the diameter of every arc
  
  
  stroke(random(255), random(255), random(255));
  strokeWeight(S_LINE_WEIGHT);
  noFill();
  
  float xIt = (x2 - x1) / arcCount;  // how far to move over for each arc (x iteration)
  float yIt = (y2 - y1) / arcCount;  // how far to move up for each arc (y iteration)
  float curX = x1 + (xIt / 2);  // center of the current arc, starts with + half of the iteration so that the clicks appear at the end of the shape rather than in the middle of the first arc
  float curY = y1 + (yIt / 2);
  
  float angle = atan((y2 - y1) / (x2 - x1)); // the angle at which the shape will be drawn
  
  for(int i = 0; i < arcCount; i++)
  {
    //println("i = " + i);
    //println("curX = " + curX + ", curY = " + curY + ", arcLength = " + arcLength + ", angle = " + angle + "(" + degrees(angle) + ")" + ", PI + angle = " + (PI + angle) + "(" + degrees(PI + angle) + ")");
    
    arc(curX, curY, arcLength, arcLength, PI + angle, TWO_PI + angle); // this is a little screwy, the arc function REQUIRES that the second angle is larger than the first; so where this should go from PI + angle to angle, we need to go to TWO_PI + angle
    curX += xIt;
    curY += yIt;
  }
}

// for visual debugging
void dDot(float x, float y)
{
  ellipse(x, y, 10, 10);
}

