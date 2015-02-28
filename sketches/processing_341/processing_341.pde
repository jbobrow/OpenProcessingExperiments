


//this is the first playing around
//
// v.1
// 2007 09 - first ideea = conway game of life playground, let's see (thanks god its friday)
// v.1.2
// 2008 01 - it's alive. really - i mean i still don't get why things are going in the direction that they are
// v.2.0
// 2008 01 - old age and gray levels
//         - new rules: older cell won't kill or spawn new cells
// v 2.1
// 2008 02 - magnification + opengl  
//
// v 2.2   
// v 2.3   
// v 2.4.0 
// 2008 02/03 - braindead
//
// v 2.4.1
// 2008 03 - [1] used to print [0] to calculate. DAMN
//         - age [2] ... damn cells only live a cycle =>
//         - age of newborn average of parents
//
// v 2.4.2 - codename spring done
//
// v 3     - death by age
//         - age faster when too many/to few neighbours
//         - all newborns inherit the average age of parents (heritance)
//
// v 3.1  
// 2008 04 - control the age of newborn by mouse (where mouse, newborn are young else they inherit)


int sx, sy;
float density = 1;
int age = 200;
int magnification = 10;
int framerate = 25;
int[][][] world;
import processing.opengl.*;


void setup() {

  size(640,480, P3D);
  background(0);
  stroke(255);
  frameRate(framerate);
  sx = width/magnification;
  sy = height/magnification;

  print("Generating world ");
  world = new int[sx][sy][3];  

    float all = (sx * sy * density);
  for (int i=0; i < all; i++) {
    int ranx = (int)random(sx);
    int rany = (int)random(sy);
    world[ranx][rany][1] = 1;
    world[ranx][rany][2] = 1;
    if ((i*100/all)%10 == 0) { print("."); }


  }
  println(" done.");
}

void draw()
  {
    int aux;
    background(0);
    // percorso [1]
    for (int x=0; x<sx; x++) {
       for (int y=0; y<sy; y++) {    
          
          //  for the moment remove the deads but @TODO something cute with them deads
          if (world[x][y][1] == -1) {
            world[x][y][0] = 0;  
            world[x][y][2] = 0;         
          }
         
          // draw a point if alive or newborn and increase age
          if ((world[x][y][1] == 1) || (world[x][y][1] == 0 && world[x][y][0] == 1)) 
          {
            world[x][y][0] = 1;
            int agecolor = 255 - world[x][y][2]*255/age;
            stroke(0);
            //stroke(agecolor);
            rect(x*magnification,y*magnification,magnification-1,magnification-1); 
            fill(255,255,255, agecolor);
          }
          
          // try to figure out where the mouse is and draw it
          //mouseX/magnification mouseY/magnification
           
           // reset [1]
           world[x][y][1] = 0;
       }
    }
    
    //circle of life   
    for (int x=0; x<sx; x++) {
       for (int y=0; y<sy; y++) {      
         int count = neighbours(x,y);
         int count_age = neighbours_age(x,y);
         
         
         // birth from 3 cells only
          if (count == 3 && world[x][y][0] == 0)  { 
            world[x][y][1] = 1;
            int newborn_age = (count_age/count);
            // age = 1 only where the mouse is
            if ((x > (mouseX/magnification - 5))&& (x < (mouseX/magnification + 5))&&(y > (mouseY/magnification - 5))&& (y < (mouseY/magnification + 5))) { world[x][y][2] = 1 ; }
            else { world[x][y][2] =  newborn_age; }
          }
         
          
         // aging and dieing
           if (world[x][y][0] == 1)  {
            
               // age faster
              if ((count < 2 ) || (count > 3)) { 
                               
               world[x][y][2] = world[x][y][2] + 5  ;  
              }
             
               // age slower
              if ((count == 2) || (count == 3)) {
               world[x][y][2] = world[x][y][2] + 1 ; 
              }
             
             // die die of old age
              if (world[x][y][2] >= age) {
               world[x][y][1] = -1;
              }
           }
            
         
 
                          
       }
    }   
  }
    


// calculusus in [0]
// (x+sx-1,y+1)    (x,y+1)    (x+1,y+1)
// (x+sx-1,y)      (x,y)      (x+1,y)
// (x+sx-1,y+sx-1) (x,y+sy-1) (x+1,y+sy-1) 
//
int neighbours(int x, int y) {
  return 
         //upper row     
         world[(x+sx - 1) % sx][(y + 1)%sy][0] +  
         world[x][(y + 1) % sy][0] + 
         world[(x + 1) % sx][(y + 1)%sy][0] + 
         // same row
         world[(x+sx -1) % sx][y][0] + 
         world[(x + 1) % sx][y][0] +
         //down row
         world[(x + sx - 1) % sx][(y+sy - 1) % sy][0] + 
         world[x][(y+sy - 1) % sy][0] + 
         world[(x + 1) % sx][(y + sy - 1) % sy][0]; 
}

int neighbours_age(int x, int y) {
  return 
         //upper row     
         world[(x+sx - 1) % sx][(y + 1)%sy][2] +  
         world[x][(y + 1) % sy][2] + 
         world[(x + 1) % sx][(y + 1)%sy][2] + 
         // same row
         world[(x+sx -1) % sx][y][2] + 
         world[(x + 1) % sx][y][2] +
         //down row
         world[(x + sx - 1) % sx][(y+sy - 1) % sy][2] + 
         world[x][(y+sy - 1) % sy][2] + 
         world[(x + 1) % sx][(y + sy - 1) % sy][2]; 
}

