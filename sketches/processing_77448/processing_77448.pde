
/*This code demonstrates the use of curly brackes in Processing

CURLY BRACKETS DEFINE A BLOCK OF CODE!

developed by Laura Maye
University of Limerick */

void setup()
{
  //Inside these curly brackets is the code for the setup function.
  //I know this because the curly brackets are underneath
  //the declaration of this function
  size(200, 200);
}

void draw()
{
  //All of the code in these curly brackets (including other blocks of code inside this block of code)
  //Is part of the draw() function
  if (keyPressed)
  {
    //Includes all the code to run if any key has been pressed
    println("a key on the keyboard has been pressed!");
    if(key == 'a')
    {
      //The code to run if the key 'a' has been pressed
      println("The key 'a' has been pressed!");
    }
  }
  println("This line of code is not inside the conditional statement. Why?");
}
