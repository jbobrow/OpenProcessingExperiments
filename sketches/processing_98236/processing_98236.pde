
//Example of a simple timer - useful for our timed supermarket App. A simple design yet effective as a form of motivation for shoppers
//Adjusting "threshold" changes the amount of time.
//Referenced from Michael:
  //Unknown, Michael,2011, Simple Timer,Open Processing, accessed 25 April 2013, <http://www.openprocessing.org/sketch/20147>.

  //Colour Variables
  int r;
  int g;
  int b;

  int threshold;
  int prev=0;
  float x = 0.0;

//What I want processing to run through each time it refreshes
  void setup()
{
  size(1500,300);
  smooth();
  //this gave a fairly accurate second counter. It meant the timer increased at a speed that encouraged the shopper to move round the store quickly.
  //Acts as, roughly, a thirty second timer.
  threshold = 1000;
  fill(r,g,b);
  //allows you to still be able to distinguish the black boxes around the coloured timer
  background(33);
  //easier to see the square as it adds on each second
  strokeWeight(10);
}
 
  void draw()
{
  if(millis() - prev >= threshold)
  {
   //Used a rectangle as it feels like a timer filling up the screen, creates a sense of urgency.  
    rect(x, height/2, 50,50);
       
    x += 50;
    //prev = millis();greater accuracy over time
    prev += threshold; 
                            

 //I selected these colour ranges as they suit our chosen colour palette and create a sense of fun.                           
  r = int(random(250));
  g = int(random(150));
  b = int(random(300));
   fill(r,g,b);
  
  } 
}



