

int colwidth;
int rowheight;
 int cols ;
  int rows ;
boolean grid[][];
int frames;
int frameDelay;

void setup()
{

  size(800,600);
  
   cols = 10;
   rows = 5;
  
  colwidth = width/cols;
  rowheight = height/rows;
  
  drawTiles();
  
  frameDelay = 20;
  frameRate(10);

}

void draw()
{
  
    // wait for frameDelay frames before drawing
 if (frames==frameDelay )
  {
    frames = 0;
    drawTiles();
  }
  frames++;
  
}

void drawTiles()
{
  background(0);
  //strokeWeight(int(random(4,10)));
  grid = new boolean[cols][rows];
  
  int reccols = int(random(1,cols));
  int recrows = int(random(1,rows));

  float recw = colwidth * reccols;
  float rech = rowheight*recrows;
  
  int cornerX = 0;
  int cornerY = 0;
  
  rect(cornerX,cornerY,recw, rech );
  
  // block out grid area
  for (int c=0; c<reccols; c++)
  {
     for (int r =0; r<recrows; r++)
    {
      grid[c][r]=true;
    }
  
  }





int rmin = 0;
int cmin = 0;
int rmax = 0;
int cmax = 0;

//find first free column in row
for (int r1=0; r1<rows; r1++)
{
    
    int c1=0;

    while (c1<cols)
    {
      println (" while column " + c1);
      
      if(!grid[c1][r1])  //cell free
      { 

         cmin=c1;
         rmin =r1;
         
         //continue searching the colunms for end of gap
        
         int c2; 
         for (c2=c1; c2<cols; c2++)
         {
           if(grid[c2][r1])  //cell taken
           { break; }
         }
         
          cmax = c2-1; 
          //check row gap
          for (rmax=rmin; rmax<rows; rmax++)
          {
             if(grid[c1][rmax])  //cell taken
            {
              break; 
             }
             
          }
          
          
          // gap found in row, fill it
          
          reccols = int(random(1 , (cmax-cmin+1)));
          recrows = int(random(1, (rmax-rmin+1)));
          
          println("rect " + recrows*rowheight + " x " + reccols*colwidth);
          
         // strokeWeight(random(1,20));
         int fillcol = int(random(1,10));
         
         switch(fillcol)
         {
         case 1:
         fill(#000080);
         break;
         case 2:
         fill(#FF0000);
         break;
         case 3:
         fill(#000000);
         break;
         case 4:
         fill(#FFF000);
         break;
         case 5: 
         case 6:
         case 7:
         case 8:
         case 9:
          fill(#FFFFFF);
         break;
         }
         
         int b = int(random(4,15));
          rect(cmin*colwidth+b, rmin*rowheight+b, reccols*colwidth-b, recrows*rowheight-b);
          
          // block out grid area taken by this last rect and continue
          for (int c=cmin; c<(cmin+reccols); c++)
          {
             for (int r = rmin; r<(rmin+recrows); r++)
              {
                println ("r "+r + "  c " + c + " recrows " + recrows + " reccols " + reccols +  " rmin " + rmin + " rmax " + rmax + " cmin " + cmin + " cmax " + cmax); 
                grid[c][r]=true;
                
              }
          }
       
      }
      c1++;  //chk next column
    }
    

}


 // print grid
for (int r=0; r<rows; r++)
{
   for (int c=0; c<cols; c++)
  {
    print ((grid[c][r])?1:0);
    print (" | ");
  }
 print ('\n');
}
 print ("==================== \n");
 
}

