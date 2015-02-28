
// Exploding balloons
//


int explosion; // moment of explosion
balloons [] balloon; // array with balloons of different color and size
balloons myballoon;
//int i = 5;
int m=100; //time variable to make the balloons start at a different time
int cellsize = 2; //size of the cells for the explosion (2 pixel)

void setup() 
{

  balloon = new balloons [20]; //20 balloons are visible on the screen at the same time

  size(1280, 750, P3D); //size of the screen with 3D

  imageMode(CENTER); 

  for (int i = 0; i < balloon.length; i++)
  {
    int picture = int(random(1,18)); // random number for the picture (diferent color and forms)
    myballoon = new balloons(picture);
    balloon[i] = myballoon;
  }
}

void draw ()
{
  frameRate(50);
  background(0);

  for(int i = 0; i <balloon.length; i++)
  {
    // time check for the start of the screen
    if(balloon[i].time<=m)
    {
      //if the balloon didn't explode in the last "draw"
      if(!balloon[i].explode)
      {

        //if the balloon has reached his explosion position
        if(balloon[i].positiony<=balloon[i].explosion)
        {
          // to stop the explosion we have a progress variable which stops it after 40 times
          if (balloon[i].explosionProgress>40)   balloon[i].explode = true;
          // begin loop for colums  
          for ( int h = 0; h < balloon[i].columns; h++) 
          {
            // Begin loop for rows
            for ( int j = 0; j < balloon[i].rows; j++) 
            {
              int x = h*cellsize + cellsize/2;  // x position
              int y = j*cellsize + cellsize/2;  // y position
              int loc = x + y*round(balloon[i].img.width);  // Pixel array location
              color c = balloon[i].img.pixels[loc];  // Grab the color

              // calculate a z position as a function of the explosionProgress and pixel brightness
              float z = (balloon[i].explosionProgress/20.0) * brightness(balloon[i].img.pixels[loc])*4.0;

              // translate to the location, set fill and stroke, and draw the rect
              pushMatrix();
              x = (int) map(x, 0, balloon[i].img.width, 0, balloon[i].sizeX); 
              y = (int) map(y, 0, balloon[i].img.height, 0, balloon[i].sizeY); 

              translate(balloon[i].positionx+x-balloon[i].sizeX/2, balloon[i].positiony+y-balloon[i].sizeY/2, z);
              fill(c, 150-balloon[i].explosionProgress); // opportunity as a function of the explosionProgress
              noStroke();
              rectMode(CENTER);
              rect(0, 0, cellsize, cellsize);
              popMatrix();
            }
          }
          balloon[i].explosionProgress++;
        }
        //if the balloon hasn't reached his explosion position
        else
        {
          balloon[i].moveUpwarts();
          balloon[i].display();
        }
      }
      // if the balloon explode in the last "draw"
      else
      {
        //set the ballon at the bottom of the screen with a random x-position
        balloon[i].positiony=height+balloon[i].sizeY/2;
        balloon[i].positionx=random(balloon[i].sizeX/2,width-balloon[i].sizeX/2);

        //set a new time
       // balloon[i].time = int(random(0,1001));

        balloon[i].speed = int(random(1,5));

        balloon[i].explosion = int(random(0+balloon[i].sizeX*1.5,0+balloon[i].sizeX/2));

        balloon[i].explode=false;

        balloon[i].explosionProgress=0;
      }
    }

    if(m!=2000) m++;
  }
}


/*void draw() 
 {
 background(255);
 if(!explode)
 {
 
 image(img,positionx,positiony,imgSize*img.width,imgSize*img.height);
 positiony=positiony-1;
 if(positiony==explosion) explode=true;
 }
 else
 {
 for ( int i = 0; i < columns; i++) 
 {
 // Begin loop for rows
 for ( int j = 0; j < rows; j++) 
 {
 int x = i*cellsize + cellsize/2;  // x position
 int y = j*cellsize + cellsize/2;  // y position
 int loc = x + y*img.width;  // Pixel array location
 color c = img.pixels[loc];  // Grab the color
 // Calculate a z position as a function of mouseX and pixel brightness
 // float z = (mouseX / float(259)) * brightness(img.pixels[loc]) - 10.0;
 // Translate to the location, set fill and stroke, and draw the rect
 pushMatrix();
 translate(x+img.width , y+img.height , loops);
 fill(c, 204);
 noStroke();
 rectMode(CENTER);
 rect(0, 0, cellsize, cellsize);
 popMatrix();
 }
 }
 loops= loops+10;
 
 for ( int i = 0; i < columns; i++) 
 {
 // Begin loop for rows
 for ( int j = 0; j < rows; j++) {
 int x = i*cellsize + cellsize/2;  // x position
 int y = j*cellsize + cellsize/2;  // y position
 int loc = x + y*img.width;  // Pixel array location
 color c = img.pixels[loc];  // Grab the color
 // Calculate a z position as a function of mouseX and pixel brightness
 float z = (loops / float(259)) * brightness(img.pixels[loc])*3.0;
 // Translate to the location, set fill and stroke, and draw the rect
 pushMatrix();
 translate(positionx+x-img.width/2, positiony+y-img.height/2, z);
 fill(c, 204);
 noStroke();
 rectMode(CENTER);
 rect(0, 0, cellsize, cellsize);
 popMatrix();
 }
 }
 loops=loops+10;
 }
 }*/

