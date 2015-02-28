

void elementMalen1 ()
{
    // schreibt hier und unten in elementMalen2 euren eigenen code hin!
    // fill und rect dürft ihr natürlich löschen
    
   noFill();
   colorMode(HSB);
   pushStyle();
    strokeWeight( random (0,30) );
    stroke (color  (255, 20, 65, 250)); //wenn das weg dann nur schwarz
   
    ellipse ( 0,0, 100, 100 );
    popStyle();
  }

void elementMalen2 ()
{
    // ... und hier!
    
    noFill();
     pushStyle();
    strokeWeight( random (0,60) );
    
   
    ellipse ( 0,0, 100, 100 );
    popStyle();
}

