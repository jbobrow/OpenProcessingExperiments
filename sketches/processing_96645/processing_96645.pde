
int age=255;

void draw ()
{
   noStroke ();
   if (age>0)
   {
     fill (age--);
     ellipse(50,50,50,50) ;
   }
   else
   {
  age=255;  
      
   }
}



