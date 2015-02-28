
void setup()
{
  size (600, 600); 
  background(255, 255, 255); 


 for(int i=0; i<100; i++) //repeats loop 100 times
   {
    
    fill(70, 70, 70, 20); // sets the fill of the circle to grey with half transparent
    ellipse(300, 300, random(0,600),random(0,600)); 
                                        //but the width is completley random, from as small as nothing, to as large as the whole screen.
   }
}
