


void setup()
{
  size(1200,1600);
  background(120, 0, 0) ;
  smooth();
  frameRate(10);

}

 

void draw()
{
 
 
 fill( random(255), random(255), random(255)) ;
 textSize( 90 ) ;
   textAlign ( CENTER ) ;
 // noLoop() ;
 image( loadImage("lebronjames.jpg"), 0, 0) ;
 image( loadImage("basketball.png"), mouseX, mouseY) ;
 image( loadImage("hoop.png"), 1000, 400) ;
 
 text( "Lebron James", 600, 800) ;
 text( "The King", 600, 100) ;
 text( "#6", 600, 600) ;

}





