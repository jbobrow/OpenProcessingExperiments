
/*
  Spring Flowers
  Carmel McGinley, 12 Sept 2010
*/

/*
  Introduction to Digital Design G (8196)
  University of Canberra
*/

Flower[] fArray;                // declare an array called fArray based on the Flower class 
PVector[] b;                    // declare an array for the branches
PVector trunk;                  // declare a PVector for the top of the trunk

//Do the standard setup things that are run once
void setup()
{
    size( 600, 600 );      // set screen size
    noStroke();            //ensure no border is drawn on the rectangles
    smooth();              //anti-aliasing
    
    fArray = new Flower[300];    // set the number of flowers
    trunk = new PVector (width/2, height-200);  //Specify the location of the top of the trunk
    b = new PVector[5];    //Specify the number of branches
    
    for (int i=0; i<b.length; i++)   //loop through the branches
    {
      b[i] = new PVector(width/(b.length+1)*(i+1), random(50,100));  //create the top of each branch
          //the x location is evenly split across the width
          //the y location is randomly set between 50 and 100
    }
    
    for( int i=0; i<fArray.length; i++ )  //for each flower in the array
      //this used the Flower class to instantiate the flowers
      //three parameters are specified for each flower in the array
    {
        fArray[i] = new Flower((int)random(6,10),
            random(width/(b.length+1), width/(b.length+1)*(b.length)), random(20, trunk.y));  
           //petal width is randomly set to be between 6 and 10 pixels
           //x position is randomly set based on the number of branches
           //y position is randomly between 20 and the trunk top
         fArray[i].vel.set(0, random(0.1, 1), 0 );  //set the velocity to allow the flowers to drop
    }  
}  //end of the setup function
//Future feature = make flowers to cluster around each branch.


//Do the drawing
void draw()
{
    background( 0 );        // set background to black, erase old drawing
    //create a frame in the window that is 20 pixels
    fill(0);                        //fill black
    rect(0,0,width,height);         //draw a black recentangle the size of the screen
    fill(120);                      //fill grey
    rect(10,10,width-20,height-20); //draw a rectangle smaller than the window
    //the above is probably not very efficient but for a sketch of this size it is unlikely to effect performance
    
    //draw the branches
    //First draw a trunk
    stroke(77,37,17);  //set the trunk colour
    strokeWeight(10);  //set the line weight to 10 - thick
    line(trunk.x,trunk.y,width/2,height-20);  //draw the trunk in the middle of the screen
              //from the point specified above to 20 pixels from the bottom
    //draw some branches
     for (int i=0; i<b.length; i++)
      {   
        strokeWeight(5);  //set the stroke weight to 5
        line(b[i].x,b[i].y,trunk.x,trunk.y);  //get the top position from above and draw the number of branches
        strokeWeight(3);  //set the stroke weight to 3
        line(b[i].x+20,b[i].y,trunk.x,trunk.y);    //get the top position from above and 
                          //draw the number of branches offset from first 5
        strokeWeight(1);  //set the stroke weight to 3
        line(b[i].x-20,b[i].y,trunk.x,trunk.y);    //get the top position from above and 
                          //draw the number of branches offset from first 5 in the other direction
        
      }

    //now draw each flower
    for ( int i=0;i<fArray.length;i++ )  //step through each flower in the array
    {
        fArray[i].render();           // draw the Flower
        fArray[i].drift();            // make the flower jitter
    }
    for ( int i=0;i<fArray.length*0.95;i++ )  //step through each flower in the array
                                              //5% of the flowers remain on the tree
    {
        fArray[i].drop();             // update the Flower
    }

}

void keyPressed()
{ // runs when a key is pressed
    if (key =='s')                        // if the s key is pressed
      save("Blossoms" + millis() + ".jpg");  // save the current frame with the name
                                          //   "Blossums" and a number
                                          //to ensure a unique name the number of millisecods
                                          // the program has been running is appended
                                          //the file type is jpeg
}


class Flower
{
    // the flower class creates a position, velocity and a petal size.
    PVector pos;      // position of the flower as a vector (x and y)
    PVector vel;      // velocity of the flower
    int petalSizeX;   //petal width
    float petalSizeY; //petal height
    
    Flower(int p, float x, float y)   //the class requires a petal width and an x and y position
    {
        pos = new PVector(x, y);      //x and y values are required when the class is called
        vel = new PVector();          //velocity has not parameters
        petalSizeX = int(p);          //petal width is required when class called (an integer)
        petalSizeY = petalSizeX*1.2;  //the length of the petal is 1.2 times the width 
    }
    
    void render()
    {
        noStroke();   //flowers don't have borders
        //draw a circle background for each flower
        fill(247,240,247,99);  //sets the fill colour for the background circle
        ellipse(pos.x,pos.y,petalSizeY*1.8, petalSizeY*1.8);  //draw a background circle at the flower centre
        //draw the petals
        fill(247,240,247,99);  //sets the fill colour of the petals
        ellipse(pos.x,pos.y-petalSizeX/2,petalSizeX,petalSizeY);  //petal 1
        ellipse(pos.x,pos.y+petalSizeX/2,petalSizeX,petalSizeY);  //petal 2
        ellipse(pos.x-petalSizeX/2,pos.y,petalSizeY,petalSizeX);  //petal 3
        ellipse(pos.x+petalSizeX/2,pos.y,petalSizeY,petalSizeX);  //petal 14
        //draw the flower centre
        fill(200,50,100,90);  //sets the fill colour of the flower centre
        ellipse(pos.x,pos.y,petalSizeY/2, petalSizeY/2);  //draw the flower centre
    }
    
    void drop()
    { 
        pos.add( vel );      // change in velocity is in the y direction to cause flowers to 'drop'   
        if ( pos.y > (height*0.97-petalSizeY/2) )  //flowers can drop to within bottom frame
        {
            vel.y = 0;       //flowers stop
        }
        //nice feature here would be to make the flowers pile up at the bottom
    }
    void drift()
    { 
     pos.add(random(-0.1, 0.1), random(-0.1, 0.1), 0);
     //this is used before the flowers drop
    }    
}


