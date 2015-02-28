
//hannah schmitt
//project 1
//copyright, hannah schmitt, carnegie mellon university, 2012
//slider code from class code was referenced for this project

//drag mouse around on screen to move spheres around and change colors. 
//move slider back and forth to expand and shrink the size of the sphere and how far back in z space the sphere moves. 


int sliderX, sliderY, sliderWd, sliderHt;
int barX, barWd;
int index;

void setup ()
{
  size (700, 400, P3D);
  textSize (24);
  fill (0);
  background(159,208, 250);
   textAlign( CENTER, CENTER );
  rectMode( CENTER );
//  imageMode( CENTER );
//  noStroke( );
  sphereDetail(16);
  sliderX = width/2;
  sliderY = int(height*.9 );
  sliderWd = int( width*.7 );
  sliderHt = int( height*.05 );

  barWd = int(sliderWd*.03 );
  barX = sliderX;

  
}

void draw ()
{
 background(159,208, 250);
 showSlider( );
 drawSphere();
 checkSlider( );
 
 
}

void drawSphere()
{
  
  

 translate(100,100,0);
 lights();
// noStroke();
 fill(255,0,0);

  
int z = -frameCount % 50;
 
 translate(mouseX,mouseY,z*map(barX,105,595,20,120)); 
  fill(500, mouseY%255, mouseX%255);
   sphere(100);

}

void showSlider( )
{
   fill( 49, 76, 142 );
   rect( sliderX, sliderY, sliderWd, sliderHt);
   fill( 159,208, 250);
   rect(barX, sliderY,  barWd, sliderHt );
}

void checkSlider( )
{
   if ( mouseY >= sliderY- sliderHt/2 && 
        mouseY <= sliderY+ sliderHt/2 &&
        mouseX >= sliderX- sliderWd/2 &&
        mouseX <= sliderX+ sliderWd/2 
       )  // The mouse is on the slider bar
      {
         barX = constrain(    mouseX, 
                              sliderX- sliderWd/2,
                              sliderX+ sliderWd/2 );
         index = constrain(
                              int( map( mouseX, sliderX- sliderWd/2,
                              sliderX+ sliderWd/2,
                              0, 100) ),
                              0, 99);
      } 
      println(barX);
}








