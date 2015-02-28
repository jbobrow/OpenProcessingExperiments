
import processing.opengl.*;
PImage c1,c2,c3,c4;
int curblen=0;
/**
 * Conway's Game of Life 
 * by Mike Davis. 
 * 
 * This program is a simple version of Conway's 
 * game of Life.  A lit point turns off if there 
 * are fewer than two or more than three surrounding 
 * lit points.  An unlit point turns on if there 
 * are exactly three lit neighbors.  The 'density' 
 * parameter determines how much of the board will 
 * start out lit.  
 */
 float xsize, ysize;
 int cellcount;
int sx, sy; 
int usecell;
int alldead=0;
float density = .05;   //ALTER .... HOW MUCH TO POPULATE INITIALLY
int[][][] world;

int[][][] world2;
 
void setup() 
{ 
  
  c1=loadImage("orangecell_001.png");
  c2=loadImage("bluecell_001.png");
  c3=loadImage("greencell_001.png");
  c4=loadImage("redcell_001.png");
  
  size(720,720,OPENGL); // screen size (alter)
  frameRate(12);
  smooth();
  //alter
  sx = 80; ///how many cells width
  sy = 80; //////how many cells height
  cellcount=0;
  usecell=int(random(3))+1;
  xsize=(float)width/(float)sx;
  ysize=(float)height/(float)sy;
  int usecell=int(random(3))+1;
  
  world = new int[sx][sy][2]; 
  world2 = new int[sx][sy][2];
   
  // Set random cells to 'on' 
  for (int i = 0; i < sx * sy * density; i++) { 
    world[(int)random(sx)][(int)random(sy)][1] = 1; 
  } 
  
   for (int i = 0; i < sx * sy * density*3; i++) { 
    world2[(int)random(sx)][(int)random(sy)][1] = 1; 
  } 
} 


 
void draw() {
println(cellcount);


if((mousePressed==true || cellcount>390) ||(cellcount>50 && curblen==0)){
   world = new int[sx][sy][2]; 
   density=random(.05,.1);
  // Set random cells to 'on' 
  for (int i = 0; i < sx * sy * density; i++) { 
    world[(int)random(sx)][(int)random(sy)][1] = 1; 
  } 
  cellcount=0;
  
  world2 = new int[sx][sy][2];
   for (int i = 0; i < sx * sy * density*4.5; i++) { 
    world2[(int)random(sx)][(int)random(sy)][1] = 1; 
  } 
  
   usecell=int(random(3))+1;
   println(usecell);
}

cellcount++;

  background(0); 
 //bgworld
  // Drawing and update cycle 
  alldead=1;
  for (int x = 0; x < sx; x=x+1) { 
    for (int y = 0; y < sy; y=y+1) { 
      //if (world[x][y][1] == 1) 
     
      // Change recommended by The.Lucky.Mutt
      if ((world2[x][y][1] == 1) || (world2[x][y][1] == 0 && world2[x][y][0] == 1)) 
      { 
        world2[x][y][0] = 1; 
       // set(x, y, #00FF00); 
       strokeWeight(2.5);
       fill(0);
        stroke(0,255,0,150);
     if(usecell==1) image(c1,x*xsize,y*ysize,xsize,ysize);
     if(usecell==2) image(c3,x*xsize,y*ysize,xsize,ysize);
     if(usecell==3) image(c4,x*xsize,y*ysize,xsize,ysize);
     alldead=0;
      // rect(x*xsize,y*ysize,xsize,ysize);
      } else{
         stroke(0,200,0,30);
          //fill(0);
       noFill();
     rect(x*xsize,y*ysize,xsize,ysize);
        
      }
      
      
      if (world2[x][y][1] == -1) 
      { 
        world2[x][y][0] = 0; 
      } 
      world2[x][y][1] = 0; 
    } 
  } 
  // Birth and death cycle 
  for (int x = 0; x < sx; x=x+1) { 
    for (int y = 0; y < sy; y=y+1) { 
      int count = neighbors2(x, y); 
      if (count==3 && world2[x][y][0] == 0) //>2  was ==3   ///NEW CELL CREATION
      { 
        world2[x][y][1] = 1; 
      } 
      if ((count < 2 || count >3 ) && world2[x][y][0] == 1) //KILL CELLS    was  <2    >3
     { 
        world2[x][y][1] = -1; 
      } 
    } 
  } 
  
  
  
  //frontworld
 
  if(cellcount>100){
    
  // Drawing and update cycle 
  for (int x = 0; x < sx; x=x+1) { 
    for (int y = 0; y < sy; y=y+1) { 
      //if (world[x][y][1] == 1) 
      // Change recommended by The.Lucky.Mutt
      if ((world[x][y][1] == 1) || (world[x][y][1] == 0 && world[x][y][0] == 1)) 
      { 
        world[x][y][0] = 1; 
       // set(x, y, #00FF00); 
       strokeWeight(2.5);
       fill(0);
        stroke(0,255,0,150);
     if(cellcount>103){
     
       image(c2,x*xsize,y*ysize,xsize,ysize);
       
      // if(cellcount>400){
        if(random(40)>39){
         world2[x][y][0] = -1;
        }
         
          if(alldead==1){
            if(random(100)>98){
         //   for(int lop3=0; lop3<3;lop3++){
            world[(int)random(sx)][(int)random(sy)][0] = -1;
          //  }
            }
          }
          
         
      // }
       
     }
      // rect(x*xsize,y*ysize,xsize,ysize);
      } else{
         stroke(0,200,0,30);
          noFill();
       if(cellcount<=100){
     rect(x*xsize,y*ysize,xsize,ysize);
       }
        
        
        
        
      }
      
      
      if (world[x][y][1] == -1) 
      { 
        world[x][y][0] = 0; 
      } 
      world[x][y][1] = 0; 
    } 
  } 
  // Birth and death cycle 
  for (int x = 0; x < sx; x=x+1) { 
    for (int y = 0; y < sy; y=y+1) { 
      int count = neighbors(x, y); 
      if (count>2 && world[x][y][0] == 0) //>2  was ==3   ///NEW CELL CREATION
      { 
        world[x][y][1] = 1; 
      } 
      if ((count < 2 || count > 3) && world[x][y][0] == 1) //KILL CELLS    was  <2    >3
     { 
        world[x][y][1] = -1; 
      } 
    } 
  } 
  
  }
  
  
  if(cellcount<50 && curblen<=255){
  curblen=curblen+5;
  if(curblen>255) curblen=255;
 //  tint(255,255,255, 255-curblen); 
   fill(0,0,0,255-curblen);
   rect(-10,-10,width+20,height+20);
  
}

if((cellcount>330 && curblen>=0)){
  curblen=curblen-5;
  if(curblen<0) curblen=0;
 //  tint(255,255,255, 255-curblen); 
   fill(0,0,0,255-curblen);
   rect(-10,-10,width+20,height+20);
  
}
  
  
  
} 



 
// Count the number of adjacent cells 'on' 
int neighbors(int x, int y) 
{ 
  return world[(x + 1) % sx][y][0] + 
         world[x][(y + 1) % sy][0] + 
         world[(x + sx - 1) % sx][y][0] + 
         world[x][(y + sy - 1) % sy][0] + 
         world[(x + 1) % sx][(y + 1) % sy][0] + 
         world[(x + sx - 1) % sx][(y + 1) % sy][0] + 
         world[(x + sx - 1) % sx][(y + sy - 1) % sy][0] + 
         world[(x + 1) % sx][(y + sy - 1) % sy][0]; 
} 


int neighbors2(int x, int y) 
{ 
  return world2[(x + 1) % sx][y][0] + 
         world2[x][(y + 1) % sy][0] + 
         world2[(x + sx - 1) % sx][y][0] + 
         world2[x][(y + sy - 1) % sy][0] + 
         world2[(x + 1) % sx][(y + 1) % sy][0] + 
         world2[(x + sx - 1) % sx][(y + 1) % sy][0] + 
         world2[(x + sx - 1) % sx][(y + sy - 1) % sy][0] + 
         world2[(x + 1) % sx][(y + sy - 1) % sy][0]; 
} 

