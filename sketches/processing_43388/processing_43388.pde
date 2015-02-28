
float [ ] [ ] points_; //array for stamp points_


void setup ( )
{
  size (400, 400);
  background (127);
  points_ = new float [10] [2];
  points_ [0][0] = 0;
  points_ [0][1] = 0;
  points_ [1][0] = 10;
  points_ [1][1] = 0;
  points_ [2][0] = 10;
  points_ [2][1] = 5;
  points_ [3][0] = 0;
  points_ [3][1] = 5;
  points_ [4][0] = 0;
  points_ [4][1] = 10;
  points_ [5][0] = 10;
  points_ [5][1] = 10;
  points_ [6][0] = 10;
  points_ [6][1] = 15;
  points_ [7][0] = 0;
  points_ [7][1] = 15;
  points_ [8][0] = 0;
  points_ [8][1] = 20;
  points_ [9][0] = 10;
  points_ [9][1] = 20;
}

void draw ( )
{
  background (127);
  
  placeRubberStamp (200, 200);
  
  pushMatrix( );
  translate (50 * cos(millis() / 900.0), 50 * sin(millis() / 1000.0));
  placeRubberStamp (200, 200);
  popMatrix( );
  
  pushMatrix( );
  scale (6 + 5*sin(millis() / 1000.0), 6 + 5*cos(millis() / 870.0));
  placeRubberStamp (0, 0);
  popMatrix( );
  
  pushMatrix( );
  rotate ((PI/4)*sin(millis() / 368.0));
  placeRubberStamp (100, 100);
  popMatrix( );
}


void placeRubberStamp (int px, int py)
{
  stroke (1);
  noFill();
  beginShape ();
  for(int i = 0; i< points_.length; i++)
  {
  vertex (points_ [i][0] + px, points_ [i][1] + py);
  
  }
  endShape ( );
}

