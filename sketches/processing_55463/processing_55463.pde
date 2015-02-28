
// ------------------------------------------------------------------------------------
//  Xmatrix - this program paints a series of x's and squares on a 9x9 grid
//  Each segement changes from dim to bright when the mouse rolls over that segment
//  Each bright segment reverts back to it's dim state after a pre-determined timeout
//  The center row of x's and squares are treated different and spell out ONEXONE when
//  the mouse rolls into the associated square
//  When the space bar is pressed, all but the center row segments randomly change from
//  dim to bright and then age
// -------------------------------------------------------------------------------------

// Global variable definitions
float numcell = 81;  //Must be left at 81 because the two arrays below (onexone and oxo)
                     //have hard coded segment and pixel info encoded. Shitty programming, sorry.
int seglength = 80;
int diaglenght = 70;
float num45degseg = numcell;
float num135degseg = numcell;
float numvertseg = numcell + sqrt(numcell);
float numhorizseg = numcell + sqrt(numcell);
//Total number of line segments
float numsegs = num45degseg + num135degseg + numvertseg + numhorizseg;
int starttime, endtime, totaltime;
int i;

//Create the class that holds all the parameters for each segment
Lseg[] seg;
int segcount = 0;

// This array holds all the segments that are excluded from mouse rollover or random state changes
int[] onexone = {53,52,56,89,90,125,127,124,128,163,162,197,200,196,233,234,269,268,272,271,55,
                    54,91,88,92,126,161,160,164,199,198,235,232,236,270,305};

// Load up the letter data structure
// This array defines the boundary of each letter in pixels and the segments in each letter
int[][] oxo = {{80,160,320,400,4,52,53,56,89},      //"O"
               {160,240,320,400,1,90,0,0,0},        //"N"
               {240,320,320,400,4,124,125,127,128}, //"E"
               {320,400,320,400,2,162,163,0,0},     //"X"
               {400,480,320,400,4,196,197,200,233}, //"O"
               {480,560,320,400,1,234,0,0,0},       //"N"
               {560,640,320,400,4,268,269,271,272} }; //"E"
               
// Create constants to access fields in the oxo array               
int x1 = 0;
int x2 = 1;
int y1 = 2;
int y2 = 3;
int numoxosegs = 4;
int firstoxoseg = 5;


// Program initialization               
void setup()
{
  size(int(sqrt(numcell))*seglength,int(sqrt(numcell))*seglength);

  seg = new Lseg[int(numsegs)];
    
  background(1);
  stroke(2);
  strokeWeight(2);
  
  // Adjust this rate for best visual results on the target machine
  frameRate(600);

  //Draw the segment matrix and load the Lseg class
  for (int x=0; x < int((sqrt(numcell))*seglength); x=x+seglength)
    { 
      for (int y=0; y < int((sqrt(numcell))*seglength); y=y+seglength)
      {
      line(x,y,x+seglength,y);
      seg[segcount] = new Lseg(x,y,x+seglength,y,color(128),false,0);
      segcount = segcount +1;
      
      line(x,y,x,y+seglength);
      seg[segcount] = new Lseg(x,y,x,y+seglength,color(128),false,0);
      segcount = segcount +1;
      
      line(x+10,y+10,x+diaglenght,y+diaglenght);
      seg[segcount] = new Lseg(x+10,y+10,x+diaglenght,y+diaglenght,color(128),false,0);
      segcount = segcount +1;
      
      line(x+10,y+diaglenght,x+diaglenght,y+10);
      seg[segcount] = new Lseg(x+10,y+diaglenght,x+diaglenght,y+10,color(128),false,0);
      segcount = segcount +1;
      }
    }
  
} // end initialization

void draw()
{
//starttime = millis();  
  
  // Scan through the entire set of segments and if the mouse position matches any part of the
  // segment position, change the segment color for a predefined time.  This scan does not
  // include the segments that spell out "ONEXONE" in the center row
      for (int i=0; i < segcount; i++)
      {
        //println(i);
        seg[i].checkseg(i,128);
      }
      
   // Scan through the center row looking for a mouse position anwhere in the bounding box
   // for any of the letters onexone.  If a hit is found, light all the associated segments   
   // This section uses the constants defined above to index into the oxo array and pull out
   // the associated letter's parameters
      //println("oxo frame start");
      for (int i=0; i < 7; i++)
       {//println("mx="+mouseX+" my="+mouseY+" x1="+oxo[i][x1]+" x2="+oxo[i][x2]+" y1="+oxo[i][y1]+" y2="+oxo[i][y2]);
         if (mouseX >= oxo[i][x1] && mouseX <= oxo[i][x2] && mouseY >= oxo[i][y1] && mouseY <= oxo[i][y2])
            {  
              //println("inside box");
              //println(firstoxoseg+"  "+oxo[i][numoxosegs]);
              for (int j=firstoxoseg; j < (firstoxoseg+oxo[i][numoxosegs]); j++)
               { 
                 //println("i="+i+" j="+j);
                 //println("oxo seg="+oxo[i][j]); 
                 seg[oxo[i][j]].lightseg(oxo[i][j],255);
               }
             }
        } 
        if(keyPressed) {
          if (key == ' ') 
          {
            i = int(random(segcount));
            seg[i].lightsegrnd(i,128);
          }
        }


//endtime = millis();
//totaltime= endtime - starttime;
//if ( totaltime > 0)println(totaltime);

} 



class Lseg {
   //Lseg class variable and constant definition
   int segstartx, segstarty, segendx, segendy, segcount, testx, testy;
   int numlinePoints = 61;
   int count = 0;
   color segcolor;
   boolean segrollover;
   int linetype = 0;
   int xmouse, ymouse;
   //Create the one x one segment array
   int[] onexone = {53,52,56,89,90,125,127,124,128,163,162,197,200,196,233,234,269,268,272,271,55,
                    54,91,88,92,126,161,160,164,199,198,235,232,236,270,305};
   
  // Lseg class constructor
  Lseg(int sx, int sy, int ex, int ey, color scolor, boolean rover, int cnt)
    {
      segstartx = sx; 
      segstarty = sy;
      segendx = ex;
      segendy = ey;
      segrollover = rover;
      segcolor = scolor;
      segcount = cnt;
      if (segstarty == segendy) {linetype = 1;}
      else if (segstartx == segendx) {linetype = 2;}
      else if ((segstarty != segendy) && (segstarty < segendy)) {linetype = 3;}
      else if ((segstarty != segendy) && (segstarty > segendy)) {linetype = 4;}
    } // end Lseg class constructor
      
  void checkseg(int i,int colorvalue) {
        xmouse = mouseX;
        ymouse = mouseY;
        //println("x="+xmouse+" y="+ymouse);
        count=0;
        switch (linetype)
         {
          case 1:// Horizontal line detect
            testy = segstarty;
            while (count < numlinePoints && segrollover == false)
             {
             testx = segstartx + count; 
             count = count + 1;
             if (xmouse == testx && ymouse == testy)
              {segrollover = true;  // println(i);
              }
             }
              break;
          case 2:// Vertical line detect
            testx = segstartx;
            while (count < numlinePoints && segrollover == false)
             {
             testy = segstarty + count; 
             count = count + 1;
             if (xmouse == testx && ymouse == testy)
              {segrollover = true;  //println(i);
              }
             }
          break;
          case 3:// Diagonal line detect, top left to bottom right
            while (count < numlinePoints && segrollover == false)
             {
             testx = segstartx + count;
             testy = segstarty + count;
             count = count + 1; 
             if (xmouse == testx && ymouse == testy)
              {segrollover = true;  //println(i);
             }
            }
          break;
          case 4:// Diagonal line detect, bottom left to top right
             while (count < numlinePoints && segrollover == false)
             {
             testx = segstartx + count;
             testy = segstarty - count;
             count = count + 1; 
             if (xmouse == testx && ymouse == testy)
             {segrollover = true;  //println(i);
             }
            }
          break;
         }// end switch
         
           // Test to see if the segment belongs to the onexone set and if so
           // don't change the state.  It's done elsewhere
           for (int j=0; j < onexone.length; j++)
             {
              if (onexone[j] == i) segrollover = false;
             }
             
          if (segrollover == true)
          {
            segcolor = color(0);
            segcount = 500;
            stroke(colorvalue);
            line(segstartx,segstarty,segendx,segendy);
            //println(segcount);
            //        println(i);
            segrollover = false;
          }

          segcount = segcount - 1;
          ////println(segcount);
          if (segcount <= 0)
          {  stroke(64);
             line(segstartx,segstarty,segendx,segendy);
          }
  //println("checkseg");
  
 }// end checkseg method
 
 
 void lightseg (int i, int colorvalue)   
          {
             segcolor = color(0);
             segcount = 750;
             stroke(colorvalue);
             line(segstartx,segstarty,segendx,segendy);
             segrollover = false;
           }// end lightseg method
       //  if (onexone[j] == i)println(onexone[j]+" "+i);    
  
  void lightsegrnd (int i, int colorvalue)   
          {segrollover = true;
             for (int j=0; j < onexone.length; j++)
             {
              if (onexone[j] == i) segrollover = false;
             }
             
          if (segrollover == true)
          {
            segcolor = color(0);
            segcount = 500;
            stroke(colorvalue);
            line(segstartx,segstarty,segendx,segendy);
            //println(segcount);
            //        println(i);
            segrollover = false;
          }
              }// end lightsegrnd method         
         
}// end Lseg class
  


