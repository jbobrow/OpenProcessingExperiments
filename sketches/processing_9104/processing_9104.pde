
    size (400, 400);
    background (255);
    translate (width/2, 0);
    ellipseMode( CORNER );
    smooth();
    noStroke();
    
    for ( float i = height; i >= height/4*3; i = i - height/18 )
    {
      fill (0);
      ellipse (-i/2, 0, i, i);
      fill (255);
      ellipse (-i/2+height/72, 0, i-height/36, i-height/36);
    }
    
    for ( float i = height/4*3; i >= height/4; i = i - height/18 )
    {
      translate (0, height/36);
      fill (0);
      ellipse (-i/2, 0, i, i);
      
      translate (0, height/36);
      fill (255);
      ellipse (-i/2+height/72, 0, i-height/36, i-height/36);
    }
    
    translate (0, -height/36);
    
    for ( float i = height/4; i >= height/18; i = i - height/18 )
    {
      fill (0);
      ellipse (-i/2, 0, i, i);
      
      fill (255);
      ellipse (-i/2+height/72, 0, i-height/36, i-height/36);
    }

