
// Risa Hiyama
//global variables 

float x,y;
float diam;


void setup( ) 
{ 
 size( 400, 400 ); 
 //canvas size
} 
 
void draw( ) 
{
 prepareWindow(); 
  //draw canvas
  //signiture figure(float, float,float)
 fill( 145, 44, 238 ); 
 circle( 200, 200, 300 ); 
 color cola = color( 255, 165, 0 ); 
 circle( 275, 200, 150, cola ); 
 circle( 125, 200, 150, cola ); 
 noLoop( ); 
}

void circle (float x, float y, float diam, color cola)
{ 
  fill(cola);
  ellipse(x, y, diam, diam);
 
}

void circle(float x, float y, float diam)
{
  ellipse(x, y, diam, diam);

}
void prepareWindow()
{
  fill(0);
  noStroke(); 
  rect(0,0,width,height);
}


