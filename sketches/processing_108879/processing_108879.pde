
   //Meghna Raghunathan
   //Copyright @Meghna Raghunathan
  //homework 3
   

float w, h, y;
int value=255; 

void setup()



{
    size( 400, 400 );  // window size
    smooth( );
    background(  0, 0,0 );
    fill(  255, 255, 255);
    w= 400;
    h= 400;
 


}
 
void draw( )
{
 


   noFill();
   stroke(random(value), random(value), value);
   strokeWeight(.1);
   line( w,w, pmouseX, pmouseY );
   
   
 

    
   noFill();
   stroke(random(value), value, random(value));
   strokeWeight(.1);
   line( w,0, pmouseX, pmouseY );
 
   

   noFill();
   stroke(value, random(value), random(value));
   strokeWeight(.1);
   line( 0,0, pmouseX, pmouseY );
 


    
}
void mouseClicked() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
} 
  //  saveFrame( “hw1.jpg”);

  






