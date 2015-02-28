
//hw 2
//Stephanie Park
//seohyunp@andrew.cmu.edu
//© Stephanie Park, 2013

float x = 350;
float y = random (400);

void setup ()
{
  size ( 400, 400 );
  smooth ();
  background ( 57 );
}

void draw ()
{
  face ();
  openMouth ();
}
  
void face ()
{
  //face_upper
  rectMode (CORNER);
  noStroke ();
  fill ( 252, 219, 176 );
  rect ( 0 , 0 , 100 , 200 ); 
  triangle ( 100 , 150 , 120 , 180 , 100 , 200 );
  rect ( 0, 200 , 100 , 80 );
  quad ( 0, 280, 100 , 280 , 40, 320 , 0, 320 );
  rect ( 0 , 320 , 40 , 80);
  fill ( 222 );
  quad ( 0 , 370 , 40 , 370 , 80 , 400 , 0 , 400 );
  
  //I'm hungry
  stroke (250);
  textSize(20);
  text("I'm HUNGRY.", 260, 50); 
  
  //hair
  noStroke ();
  fill ( 5 );
  rect ( 0, 0, 100 , 50);
  triangle ( 0, 50 , 50 , 340 , 0 , 300 );
  
  //eyes
  stroke ( 3 , 2 , 1 );
  strokeWeight (1.5);
  noFill ();
  arc ( 60, 130, 100, 100 , radians (-120), radians (-60));
  line ( 40 , 70 , 50 , 80 );
  line ( 60 , 65 , 60 , 80 );
  line ( 80 , 70 , 70 , 80 );
  strokeWeight (2);
  ellipse ( 60 , 110 , 40 , 25 );
  strokeWeight (5);
  fill ( 3 , 2 , 1 );
  ellipse ( 60 , 110 , 20 , 20 );
  
  //upperlip
  noStroke ();
  fill ( 255 , 157 , 170 );
  triangle ( 100 , 220 , 100 , 240 , 60 ,  240 );
  //bottomlip_close
  triangle ( 60 , 240, 100 , 240 ,  100 , 260 );
}

void openMouth ()
{
if (mousePressed) 
  {
  triangle ( 60 , 240 , 100 , 281 , 80 , 293 );
  fill ( 57 );
  triangle ( 60 , 240, 100 , 240 , 100 , 281 );
  }
}

void keyPressed() 
{
  background ( 57 );
  //burger_bun
  fill ( 222 , 158 , 110 );
  arc ( x , y, 60 , 60 , radians ( -180 ), radians (0) );
  rectMode (CENTER);
  fill ( 237 , 73, 48);
  ellipse ( x , y+15, 55 , 8);
  fill ( 29 , 160 , 27);
  ellipse ( x, y+10, 60 , 10 );
  fill ( 131 , 86 , 60 );
  rect ( x, y+5 , 50 , 10 );
  fill ( 222 , 158 , 110);
  arc ( x , y+18, 60 , 30 , radians ( 0 ), radians (180) );
  if ( key == CODED )
    if(keyCode == UP)
    {
      y = y - 5;
    }
    else if (keyCode == DOWN)
    {
      y = y + 5;
    }
    else if(keyCode == LEFT)
    {
      x = x - 5;
    }
    else if(keyCode == RIGHT){
      x = x + 5;
    }

}









