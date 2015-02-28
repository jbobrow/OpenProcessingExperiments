
//set the size of screen
size(250,250);
//set the background colour
background(255);
// a point will start at 10, and as long a is less than 120, a will add up 20 every time.
for(int a=10; a<120;a+=20)
{
  //the first quadrant
  line(125,a,a+130,125);
  //the second quadrant
  line(125,a+130,a,125);
  //the third quadrant
  line(125,-a+120,a,125);
  //the fourth quadrant
  line(125,250-a,a+130,125); 

}

                
                
