
//Eleni Katrini
//ekatrini@andrew.cmu.edu
//copyright © Eleni Katrini, November 2013
//HW09_The Grid

/*NEED TO FIGURE OUT:
  A> I am not getting the exact location on screenX and screenY...How do I fix that?
*/


color c1= color(255, 255, 255);
int sz= 100;
int DS= 200;
//int sssz= 1000; //screen saver size - change here

final int MAX= int((1000/DS) + 1);

int [ ] xCoordinates= new int [MAX];
int [ ] yCoordinates= new int [MAX];
int [ ] zCoordinates= new int [MAX];


void setup()
{
  size(1000, 1000, P3D);
  background(255, 251, 124); 
  noStroke();
  //println(MAX);
}


void draw()
{
  prepWindow();
  drawBoxes(xCoordinates, yCoordinates, zCoordinates, c1); 
}


void drawBoxes(int [ ] xCoords, int [ ] yCoords, int [ ] zCoords, color col)
{
  directionalLight( 255, 251, 124, 0, 0, -20 );
  for ( int x=0; x<xCoords.length-1; x++)
 {
    xCoords[0]= sz;
    xCoords[x+1]= xCoords[x] + DS;
    for ( int y=0; y<yCoords.length-1; y++) 
       {
        yCoords[0]= sz;
        yCoords[y+1]= yCoords[y] + DS;
         for ( int z=0; z<zCoords.length-1; z++)
            {
            zCoords[0]= 0;
            zCoords[z+1]= zCoords[z] - DS;
      
            pushMatrix();
            translate(xCoords[x], yCoords[y], zCoords[z]);
            fill(col);
      
            //ROTATIONNN
            float sx= screenX(xCoords[x], yCoords[y], zCoords[z]);
            float sy= screenY(xCoords[x], yCoords[y], zCoords[z]);
            float cz= screenZ(xCoords[x], yCoords[y], zCoords[z]);
           
             if( dist(mouseX, mouseY, sx, cz) <= sz || dist(mouseX, mouseY, sx, sy) <= sz || dist(mouseX, mouseY, sy, cz) <= sz)
             {
             rotateX( radians(frameCount*x));
             rotateY( radians(frameCount*y));
             rotateZ( radians(frameCount*z));
             }

              //END OF ROTATION
        box(sz);
        popMatrix();
      }
   }
 }
}

void prepWindow()
{
 fill(255, 251, 124);
 pushMatrix();
 translate(width/2, height/2, -2*MAX*DS);
 rectMode(CENTER);
 rect(width/2, height/2, width*5, height*5);
 popMatrix();
}



