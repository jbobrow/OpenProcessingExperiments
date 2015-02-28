
//Jennifer Kang
//jmkang
//©jennifer kang

float wd, ht, x, y, xIncrement; 

color col;




void setup ( )
{
  x = 100;
  y = 100;
  wd = 200;
  ht = 200;
  col = color (random(255), random(255), random(255));
  
  size (400,400);
  smooth ( );
  background (166, 212, 210);
  fill (239,63,72);
  xIncrement = random (1,5);
  
  //face
  noStroke ( );
  fill (226, 226, 222);
  ellipse (x + (wd/2),y +(ht/2),wd,ht);

  //left ear
  noStroke( );
  fill( 226, 226, 222 );
  ellipse( 120, 110, 100, 100 );
  
  //right ear
  noStroke( );
  fill( 226, 226, 222 );
  ellipse( 275, 110, 100, 100 );
 
  //left ear - inside
  noStroke( );
  fill( 239, 63, 72 );
  ellipse( 120, 110, 50, 50 );

  //right ear - inside 
  noStroke( );
  fill( 239, 63, 72 );
  ellipse( 275, 110, 50, 50 );


  //left eye 
  noStroke( );
  fill( 10, 127, 156 );
  ellipse( 155, 190, 50, 55 );
  
  //left eye - inside 
  noStroke( );
  fill( 226, 226, 222 );
  ellipse( 155, 190, 40, 50 );
  
   //left eye - inside ball
  noStroke( );
  fill( 10, 127, 156 );
  ellipse( 155, 190, 20, 20 );
  
    //right eye 
  noStroke( );
  fill( 10, 127, 156 );
  ellipse( 240, 190, 50, 55 );
  
  //right  - inside 
  noStroke( );
  fill( 226, 226, 222 );
  ellipse( 240, 190, 40, 50 );
  
   //right - inside ball
  noStroke( );
  fill( 10, 127, 156 );
  ellipse( 240, 190, 20, 20 );
  
  //nose
  noStroke ( );
  fill (239,63,72);
  ellipse (200, 225, 20, 20);
  
}

void draw ( )
{

  x = x + xIncrement;
      

}

void Keypressed ( )
{
  background (random(255), random(255), random(255) );
  wd = random (10, 100);
  ht = random (10, 100);
  x = 0;
  
}


void keyPressed() {
    if (key == ' '); {
      fill (random (255), random (255), random (255));
      ellipse( 120, 110, 50, 50 );
      ellipse( 275, 110, 50, 50 );
    
    

    
    }
}

{
 // fill (random(255), random(255), random(255) );
 //xIncrement = random (1,5);

  
}

void mouseClicked() {
  fill (random (255), random (255), random (255));
   ellipse (200, 225, 20, 20);
}


