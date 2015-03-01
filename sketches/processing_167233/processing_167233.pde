
//make a program run at four frames per second and display the current frame count to the console with println


  void setup ()
{ 
//code goes here
frameRate(4); //how many times a second it runs the draw loop
}

void draw() //the frame count # will always run on the console until 
{
println(frameCount);
}


