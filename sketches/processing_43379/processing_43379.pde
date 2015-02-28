
float [ ] [ ] points; //array for stamp points
int click_counter;
int [ ][ ] mouse_clicks; // coordinates of mouse when clicked

void setup ( )
{
  size (400, 400);
  background (127);
  click_counter = 0;
  points = new float [10] [2];
  points [0][0] = 0;
  points [0][1] = 0;
  points [1][0] = 10;
  points [1][1] = 0;
  points [2][0] = 10;
  points [2][1] = 5;
  points [3][0] = 0;
  points [3][1] = 5;
  points [4][0] = 0;
  points [4][1] = 10;
  points [5][0] = 10;
  points [5][1] = 10;
  points [6][0] = 10;
  points [6][1] = 15;
  points [7][0] = 0;
  points [7][1] = 15;
  points [8][0] = 0;
  points [8][1] = 20;
  points [9][0] = 10;
  points [9][1] = 20;
  mouse_clicks = new int [1000][2];
}

void draw ( )
{
  background (127);
  //translate(200, 200);
  //rotate(millis () / 1000.0);
  for(int i =0; i < click_counter; i++)
   {
     placeRubberStamp (mouse_clicks [i][0], mouse_clicks [i][1]);
   }

}

void mousePressed ( )
{
//  placeRubberStamp (mouseX, mouseY);
  mouse_clicks [click_counter][0] = mouseX  ;//- 200;
  mouse_clicks [click_counter][1] = mouseY  ;//- 200;
  click_counter++;
  
}

void placeRubberStamp (int px, int py)
{
  stroke (0);
  noFill();
  beginShape ();
  vertex (points [0][0] + px, points [0][1] + py);
  vertex (points [1][0] + px, points [1][1] + py);
  vertex (points [2][0] + px, points [2][1] + py);
  vertex (points [3][0] + px, points [3][1] + py);
  vertex (points [4][0] + px, points [4][1] + py);
  vertex (points [5][0] + px, points [5][1] + py);
  vertex (points [6][0] + px, points [6][1] + py);
  vertex (points [7][0] + px, points [7][1] + py);
  vertex (points [8][0] + px, points [8][1] + py);
  vertex (points [9][0] + px, points [9][1] + py);
  endShape ( );
}

void keyPressed ( )
{
  click_counter = 0;
  
}

