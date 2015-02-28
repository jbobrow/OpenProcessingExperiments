


  size (500,500);
  colorMode(HSB);
  background (255);
  noFill();
   pushStyle();
    strokeWeight( 20 );
    
    for(int i=0; i<30; i++)
    {
    stroke (color( random(255),random (200), random (255), random (100))); //farbe für jeden RGB wert jeweils eins
    ellipse ( random(0,width),random (0,height), 100, 100 );
    
    fill (color( random(255),random (200), random (255), random (250)));
    ellipse ( random(0,width),random (0,height), 200, 200 );
    
    stroke (color( random(255),random (220), random (255), random (100))); //farbe für jeden RGB wert jeweils eins
    ellipse ( random(0,width),random (0,height), 50, 50 );
  }
    popStyle();




    


