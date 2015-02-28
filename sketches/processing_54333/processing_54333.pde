
float numcell = 81;  //Must be a number who's square root is an integer, e.g. 9,16,64,81,256
int seglength = 80;
int diaglenght = 70;
float num45degseg = numcell;
float num135degseg = numcell;
float numvertseg = numcell + sqrt(numcell);
float numhorizseg = numcell + sqrt(numcell);
//Total number of line segments
float numsegs = num45degseg + num135degseg + numvertseg + numhorizseg;
int starttime, endtime, totaltime;

//Create the one x one segment array
//int[] onexone = new int[20];
int[] onexone = {53,52,56,89,90,125,127,124,128,163,162,197,200,196,233,234,269,268,272,271};

//Create the class that holds all the parameters for each segment
Lseg[] seg;
int segcount = 0;

void setup()
{
//size(640,480);
frameRate(120);
size(int(sqrt(numcell))*seglength,int(sqrt(numcell))*seglength);

seg = new Lseg[int(numsegs)];

     
background(1);
stroke(2);
strokeWeight(3);

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
  
      for (int i=0; i < segcount; i++)
      {
      //println(i);
      seg[i].checkseg();
      }
  
//println(segcount);
//println(numsegs);
}
void draw()
{

      starttime = millis();
      for (int i=0; i < 20; i++)
         {
           
          seg[onexone[i]].checkseg();
         //delay(1);  
       }
         endtime = millis();
         totaltime= endtime - starttime;
         if ( totaltime > 0)println(totaltime);
}      

class Lseg {
   int segstartx, segstarty, segendx, segendy, segcount, testx, testy;
   int numlinePoints = 61;
   int count = 0;
   color segcolor;
   boolean segrollover;
   int linetype = 0;
   int xmouse, ymouse;
  
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
    }
      
  void checkseg() {
        xmouse = mouseX;
        ymouse = mouseY;
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
         }
          if (segrollover == true)
          {
            segcolor = color(0);
            segcount = 2000;
            stroke(255,255,255);
            line(segstartx,segstarty,segendx,segendy);
            //println(i);
            segrollover = false;
          }

          segcount = segcount - 1;
          ////println(segcount);
          if (segcount <= 0)
          {  stroke(64);
             line(segstartx,segstarty,segendx,segendy);
          }
  //println("checkseg");
  //} 
 }
}
    

