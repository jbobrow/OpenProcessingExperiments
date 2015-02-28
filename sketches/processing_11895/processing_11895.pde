
/*
  Pink space junk sketch
  Carmel McGinley, 10 Sept 2010
*/

/*
  This code is based on a class developed example by Sam Hinton
  Introduction to Digital Design G (8196)
  University of Canberra
  Note: MovieMaker code has been commented out for upload to Open Processing website
*/
  

//import processing.video.*;  //Import the library called video to gain access to the MovieMaker class

//First of all declare global variables
Cube[] cubeArray;        //Declare an array with the cube class called PArray
//MovieMaker mm;        //declare a new variable called mm which has the MovieMaker class


void setup()  //Do the standard setup things which are run once
{
    size( 600, 600,P3D );      // set screen size and specify 3D rendering
    noStroke();                //ensure shapes don't have an outline (faster)
    smooth();                  //anti-aliasing to smooth shapes
    
    // set up the video
//    mm = new MovieMaker( this, width, height, "cubes.mov",
//                       25, MovieMaker.ANIMATION, MovieMaker.HIGH);
    // class requires parent, width, height, a filename, frames per second
    //      a movie format type and quality.
    
    cubeArray = new Cube[50];    // specify the number of cubes in the system
    //?Could make the number of cubes keyboard input
    
    for( int i=0; i<cubeArray.length; i++ )
    //Populating the array with the required number of cubes, setting the position and velocity.
    //Initially acceleration is 0
    //From the class definition below need to specify the position, size and colour.
    //Each have three parameters
    
    {
        cubeArray[i] = new Cube(random(width), random(height), 0, random(50),random(50),random(50),200,0,100 );
        //set the initial properties of the cube
        //it is in random x and y position within the dimensions of the window
        //size of the cube is random up to 50 pixels for width, height and depth
        //colour is set to pink
        
        cubeArray[i].vel.set( random(-1, 1), random(-1, 1), 0 );
        //Set each cube's velocity to a random variable between -1 and 1 in the x and y direction

        cubeArray[i].acc.set(random(-2, 2), random(-2, 2), 0 );  
           //acceleration in the x and y directions is randomly set between -2 and 2
    }  //close the for loop

    
}  //finish the setup function

void draw()  //Start the draw function. This is looped at the default frame rate
{
    background( 0 );        // set background to black, erase old drawing
    for ( int i=0;i<cubeArray.length;i++ )   //Loop through each cube in the array, one at a time
    {
        cubeArray[i].update();             // update each cube (update a function of the Cubes class)
        cubeArray[i].draw();               // draw each cube (draw a function of the Cubes class)
    }

//    mm.addFrame();    // add the current window to the video
}  //finish the draw function



void keyReleased()   //Press the spacebar to stop the video recording
{
    if (key =='s') 
      save("PinkSpaceJunk" + millis() + ".jpg"); // save the current frame
    if ( key == ' ' )   //do next statements if the spacebar is pressed
    {
//        mm.finish();    //finishes and saves the movie
        exit();         //exit the program
    }
}


/* End of the program. The rest defines the class
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

/*
------------------------------
Defining the Cube class starts here
------------------------------
*/

class Cube
{

    /* Determine (declare) all the fields that will be need for the class
        A cube will have:
            position (where it is in the window)
            velocity (how fast it moves and in which direction)
            acceleration (whether it speeds up or slows down)
            size  (a width, height and depth)
            colour
            
    
    */
    PVector pos;    // pos.x pos.y pos.z
    PVector vel;    // vel.x vel.y vel.z
    PVector acc;    // acc.x acc.y acc.z
    
    PVector boxsize; 
    
    color boxcolour;  
     
    
    Cube( float x, float y, float z, float xs, float ys, float zs, float r, float g, float b )
    //The constructor assigns initial values to the class
    {
        pos = new PVector(x, y, z);         // position has three parameters
        vel = new PVector();                // velocity is calculated from position so nothing required
        acc = new PVector();                // velocity is calculated from position so nothing required
        boxsize = new PVector(xs, ys, zs);  //boxsize has three parameters
        boxcolour =  color(r, g, b,75 );       //boxcolour has three parameters
    }  //Finish the constructor statements
    
    void update()                     //Changes the attributes of the cube
    {
        vel.add( acc );               // add the acceleration property to the velocity (to speed up or slow down)
        pos.add( vel );               // add velocity to positon (to move the cube)
        vel.mult( 0.9999f );          // apply friction (to enventually slow down the cubes)
                                      // the velocity vector is multiplied by 0.9999 at each update
        bounce();                     // bounce off edges
        acc.set( 0, 0, 0 );           // reset acceleration

    }  //Finish the update function statements
    
    void draw()  //define the draw function within the cube class
    {
        fill( boxcolour );
        pushMatrix();                        //save the current co-ordinate system into a matrix
          translate(pos.x, pos.y, pos.z);    //move the current workspace by the x, y and z positions
          rotateY(QUARTER_PI);                     //rotate the workspace by 45 degrees (quarter PI radians) around the y-axis
          box( boxsize.x,boxsize.y,boxsize.z );    // draw the cube 
        popMatrix();                         //restore the previous coordinate system
    }  //Finish the draw function statements
    
    void bounce()  //define a bounce function within the cube class to reverse direction of the cube
                   //when it reaches the edge of the screen
    {
        if ( pos.x < 0 || pos.x > width )  //check to see if the x position is outside window
        {                                  //if the above is true run the next statement
            vel.x *= -1.0f;                //if it is, reverse the x velocity
        }                                  //end the if statement
        
        if ( pos.y < 0 || pos.y > height ) //check to see if the y position is outside window
        {                                  //if the above is true run the next statement
            vel.y *= -1.0f;                //if it is, reverse the y velocity
        }                                  //end the if statement

    }  //Finish the bounce function statements

}  //Finish the cube class definition


