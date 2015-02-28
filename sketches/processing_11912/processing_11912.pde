
// Trace over 8 pointer house sketch I learn on long road trips of church sermons
// the aim is the draw the house in 8 clicks of the mouse
// whilst not repeating or drawing over any lines


PImage house; //declared house as the name of the image

int mx = 320; // setup tracing line to start over image
int my = 550; // then follow subsequent mouse co-ordinates

void setup() // initial setup functions to run once at start
{
  size(500,700); // size of screen
  house = loadImage( "house.jpg" ); //image load from saved file location in data of sketch's folder
  //noLoop(); // commented out this thing out as it stopped the lines from being visable
  smooth(); //smooths pixels
  stroke(0); //stops the horizon line from turning red after setup() function is activated by a " "
  background (255); // white
  strokeWeight(2); // thickness of line
  line(0,500,500,500); //hozion live for childish effect
  //arc(50, 55, 50, 50, 120, PI/2); wanted to draw some birds in the distance to no avail
  image(house, 175,300); //set placement of 8 pointer house
  println ("this sketch has Functions, Mouse and keyboard interaction, Loading and saving files");
 
} //closed function of setup block off

void mouseReleased() // the line to be drawn from the old previously set x,y point to the current mousex/y position 
{
  
  line(mx, my, mouseX, mouseY);
  mx = mouseX;
  my = mouseY;
  
}

void draw() //sets what the tracing line should look like, red and 2 pixels wide.
{
  stroke(255,0,0);
  strokeWeight(2);
}

// key interaction to save the image you drew by name 'myhouse' with the 'millisecond' of program run time on the end'.

void keyPressed(){ // runs when a key is pressed
    
    if (key == 's') save("myhouse" + millis() + ".jpg"); 
    if (key == ' ')  setup(); //resets your drawing from the last point you clicked
    // save the current frame
    // use millis() to make the file name unique
    // + joins strings together
    // saved in the sketch folder

}


