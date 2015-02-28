
/*Purpose - display a ball (filled circle)
move it until it is told to change direction
make it change size gradually
make it change colour gradually*/

void setup() {
  size(256,256);
  background(0,0,0);
  smooth();

}

int rand=0; //* random number with 2 options
int rand2=0; //* 2nd random number with 2 options
int xtrg=0;  //* Trigger for horizontal movement
int ytrg=0; //* Trigger for y movement
int wtrg=0; //* Trigger for ellipse width
int htrg=0; //* Trigger for ellipse height
int rtrg=0; //* Trigger for red colour
int gtrg=0; //* Trigger for green colour
int btrg=0; //* Trigger for blue colour
int x=128;  //* horizontal position
int y=128;  //* vertical position
int r=128;  //* red colour value
int g=128;  //* green colour value
int b=128;  //* blue colour value
int w=10;  //* width of ellipse
int h=10;  //* height of ellipse
int dx=1;  //* horizontal movement direction (-1 left; 0 none; 1 right)
int dy=1;  //* vertical movement direction (-1 up; 0 none; 1 down)
int dr=1;  //* colour red factor (-1 reduce red; 0 no change; 1 increase red) 
int dg=1;  //* colour green factor (-1 reduce green; 0 no change; 1 increase green)
int db=1;   //* colour blue factor (-1 reduce blue; 0 no change; 1 increase blue)
int dw=1;  //* ellipse width direction (-1 smaller; 0 no change; 1 bigger)
int dh=1;  //* ellipse height direction (-1 smaller; 0 no change; 1 bigger)
int lx=100;  //* horizontal length of travel 
int ly=100;  //* vertical length of travel
int lr=30;  //* red length of change 
int lg=30; //* green length of change
int lb=30;  //* blue length of change
int lw=30;  //* width length of change
int lh=10;  //* height length of change
int chng=3;  //* rate of change eg pixel movement; width; colour; size



void draw(){
  fill(r,g,b);
  ellipse(x,y,w,h);
  strokeWeight(2);
  
 //* MOVEMENT
 
 //* Horizontal
 
    if (lx<1)  //* If lx<1 make a new length lx & also change xtrg to 1 (active)
    
    {
      println("It reckons lx<1, but lx="+lx+". // ");  //* Debugger line
      lx=int(random(100,200)); //* When I wrote this line as "int lx=int(random(100,200));" the programme caused a 'stuttering ball' (Problem 1)
      println();  //* Debugger line
      print("New length x: "+lx+" // ");  //* Debugger line
      print("X,Y: "+x+","+y+" // "); //* Debugger line
      xtrg=1;
    }
    
    if (xtrg==1)  //* If xtrg is active choose a new horizontal direction to move in, based on previous horizontal direction it was moving in.
     {
      rand=int(random(2));
      print ("Random number: "+rand+" // ");  //* Debugger line
       if (rand==0)
        {
        dx=0;
        xtrg=0;
        }
       if ((rand==1) && ((dx==1) || (dx==-1)))
        {
         dx=dx*-chng;
         xtrg=0;
        }
       if ((rand==1) && (dx==0))
        {
         rand2=int(random(2));
         if (rand2==0)
         {
          dx=chng;
         }
         if (rand2==1)
         {
          dx=-chng;
         } 
        xtrg=0;
        }
     } 

 x=x+dx;
 lx=lx-1; 


//* If ellipse reaches left or right edge of screen, change direction
    
   if (x<1)
   {
    dx=chng;
   }
   if (x>width)
   {
    dx=-chng;
   } 
   
 //* Vertical
 
    if (ly<1)  //* If ly<1 make a new length ly & also change ytrg to 1 (active)
    
    {
      println("It reckons ly<1, but ly="+ly+". // ");  //* Debugger line
      ly=int(random(100,200)); 
      println();  //* Debugger line
      print("New length y: "+ly+" // ");  //* Debugger line
      print("X,Y: "+x+","+y+" // "); //* Debugger line
      ytrg=1;
    }
    
    if (ytrg==1)  //* If xtrg is active choose a new horizontal direction to move in, based on previous horizontal direction it was moving in.
     {
      rand=int(random(2));
      print ("Random number: "+rand+" // ");  //* Debugger line
       if (rand==0)
        {
        dy=0;
        ytrg=0;
        }
       if ((rand==1) && ((dy==1) || (dy==-1)))
        {
         dy=dy*-chng;
         ytrg=0;
        }
       if ((rand==1) && (dy==0))
        {
         rand2=int(random(2));
         if (rand2==0)
         {
          dy=chng;
         }
         if (rand2==1)
         {
          dy=-chng;
         } 
        ytrg=0;
        }
     } 

 y=y+dy;
 ly=ly-1; 


//* If ellipse reaches top or bottom edge of screen, change direction
    
   if (y<1)
   {
    dy=chng;
   }
   if (y>height)
   {
    dy=-chng;
   }   
   
//* ELLIPSE CHANGES SIZE

//* Ellipse width

if (lw<1)  //* If lw<1 make a new length lw & also change wtrg to 1 (active)
    
    {
      println("It reckons lw<1, but lw="+lw+". // ");  //* Debugger line
      lw=int(random(10,40)); 
      println();  //* Debugger line
      print("New length w: "+lw+" // ");  //* Debugger line
      print("X,Y: "+x+","+y+" // "); //* Debugger line
      wtrg=1;
    }
    
    if (wtrg==1)  //* If wtrg is active choose a new width direction to move in, based on previous direction.
     {
      rand=int(random(2));
      print ("Random number: "+rand+" // ");  //* Debugger line
       if (rand==0)
        {
        dw=0;
        wtrg=0;
        }
       if ((rand==1) && ((dw==1) || (dw==-1)))
        {
         dw=dw*-chng;
         wtrg=0;
        }
       if ((rand==1) && (dw==0))
        {
         rand2=int(random(2));
         if (rand2==0)
         {
          dw=chng;
         }
         if (rand2==1)
         {
          dw=-chng;
         } 
        wtrg=0;
        }
     } 

 w=w+dw;
 lw=lw-1; 


//* If ellipse reaches min or max width, change direction
    
   if (w<10)
   {
    dw=chng;
   }
   if (w>50)
   {
    dw=-chng;
   } 
   
//* Ellipse height

if (lh<1)  //* If lh<1 make a new length lh & also change htrg to 1 (active)
    
    {
      println("It reckons lh<1, but lh="+lh+". // ");  //* Debugger line
      lh=int(random(10,40)); //* When I wrote this line as "int lx=int(random(100,200));" the programme caused a 'stuttering ball' (Problem 1)
      println();  //* Debugger line
      print("New length h: "+lh+" // ");  //* Debugger line
      print("X,Y: "+x+","+y+" // "); //* Debugger line
      htrg=1;
    }
    
    if (htrg==1)  //* If xtrg is active choose a new horizontal direction to move in, based on previous horizontal direction it was moving in.
     {
      rand=int(random(2));
      print ("Random number: "+rand+" // ");  //* Debugger line
       if (rand==0)
        {
        dh=0;
        htrg=0;
        }
       if ((rand==1) && ((dh==1) || (dh==-1)))
        {
         dh=dh*-chng;
         htrg=0;
        }
       if ((rand==1) && (dh==0))
        {
         rand2=int(random(2));
         if (rand2==0)
         {
          dh=chng;
         }
         if (rand2==1)
         {
          dh=-chng;
         } 
        htrg=0;
        }
     } 

 h=h+dh;
 lh=lh-1; 


//* If ellipse reaches min or max height, change direction
    
   if (h<10)
   {
    dh=chng;
   }
   if (h>50)
   {
    dh=-chng;
   }


//* CHANGE COLOUR

//* Change red colour

if (lr<1)  //* If lh<1 make a new length lh & also change htrg to 1 (active)
    
    {
      println("It reckons lr<1, but lr="+lr+". // ");  //* Debugger line
      lr=int(random(10,70)); 
      println();  //* Debugger line
      print("New length r: "+lr+" // ");  //* Debugger line
      print("X,Y: "+x+","+y+" // "); //* Debugger line
      rtrg=1;
    }
    if (rtrg==1)  //* If red colour, blah blah...
     {
      rand=int(random(2));
      print ("Random number: "+rand+" // ");  //* Debugger line
       if (rand==0)
        {
        dr=0;
        rtrg=0;
        }
       if ((rand==1) && ((dr==1) || (dr==-1)))
        {
         dr=dr*-chng;
         rtrg=0;
        }
       if ((rand==1) && (dr==0))
        {
         rand2=int(random(2));
         if (rand2==0)
         {
          dr=chng;
         }
         if (rand2==1)
         {
          dr=-chng;
         } 
        rtrg=0;
        }
     } 

 r=r+dr;
 lr=lr-1; 


//* If red colour reaches min or max value, change direction
    
   if (r<2)
   {
    dr=chng;
   }
   if (r>254)
   {
    dr=-chng;
   }
  
//* Change green colour

if (lg<1)  //* If lg<1 make a new length lg & also change gtrg to 1 (active)
    
    {
      println("It reckons lg<1, but lg="+lg+". // ");  //* Debugger line
      lg=int(random(10,70)); 
      println();  //* Debugger line
      print("New length g: "+lg+" // ");  //* Debugger line
      print("X,Y: "+x+","+y+" // "); //* Debugger line
      gtrg=1;
    }
    if (gtrg==1)  //* If red colour, blah blah...
     {
      rand=int(random(2));
      print ("Random number: "+rand+" // ");  //* Debugger line
       if (rand==0)
        {
        dg=0;
        gtrg=0;
        }
       if ((rand==1) && ((dg==1) || (dg==-1)))
        {
         dg=dg*-chng;
         gtrg=0;
        }
       if ((rand==1) && (dg==0))
        {
         rand2=int(random(2));
         if (rand2==0)
         {
          dg=chng;
         }
         if (rand2==1)
         {
          dg=-chng;
         } 
        gtrg=0;
        }
     } 

 g=g+dg;
 lg=lg-1; 


//* If green colour reaches min or max value, change direction
    
   if (g<2)
   {
    dg=chng;
   }
   if (g>254)
   {
    dg=-chng;
   } 

//* Change blue colour

if (lb<1)  //* If lb<1 make a new length lb & also change btrg to 1 (active)
    
    {
      println("It reckons lb<1, but lb="+lb+". // ");  //* Debugger line
      lb=int(random(10,70)); 
      println();  //* Debugger line
      print("New length b: "+lb+" // ");  //* Debugger line
      print("X,Y: "+x+","+y+" // "); //* Debugger line
      btrg=1;
    }
    if (btrg==1)  //* If red colour, blah blah...
     {
      rand=int(random(2));
      print ("Random number: "+rand+" // ");  //* Debugger line
       if (rand==0)
        {
        db=0;
        btrg=0;
        }
       if ((rand==1) && ((db==1) || (db==-1)))
        {
         db=db*-chng;
         btrg=0;
        }
       if ((rand==1) && (db==0))
        {
         rand2=int(random(2));
         if (rand2==0)
         {
          db=chng;
         }
         if (rand2==1)
         {
          db=-chng;
         } 
        btrg=0;
        }
     } 

 b=b+db;
 lb=lb-1; 


//* If blue colour reaches min or max value, change direction
    
   if (b<2)
   {
    db=chng;
   }
   if (b>254)
   {
    db=-chng;
   }
   
    
 } //* End of draw loop
  
  //* Problem 1
  
  //* At the moment it is reaching the end of the first lx distance 
  //* correctly and is choosing new lx, dx. But then after every 1 pixel x movement
  //* it's incorrectly choosing a new lx & dx!
  //* Need to stop it triggering every pixel
  
  //* Problem 1 solved by removing "int" from "int lx=int(random(100,200));", which treated lx as a newly assigned variable.

