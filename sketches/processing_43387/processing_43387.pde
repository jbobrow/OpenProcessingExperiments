
float [][] points;
int click_counter;
int [][] mouse_clicks;

void setup ( )
{
  smooth();
  size (400, 400, P3D);
  background (0, 2, 62);
  click_counter = 0;
  points = new float [23] [2];
  points [0][0] = 1;   points [1][0] = 18;
  points [0][1] = 3;   points [1][1] = 3;
  points [2][0] = 18;  points [3][0] = 5;
  points [2][1] = 17;  points [3][1] = 17;
  points [4][0] = 5;   points [5][0] = 19;
  points [4][1] = 32;  points [5][1] = 32;
  points [6][0] = 10;  points [7][0] = 4;
  points [6][1] = 59;  points [7][1] = 55; //gong side

  points [8][0] = 60;  points [9][0] = 33;
  points [8][1] = 3;   points [9][1] = 3;
  points [10][0] = 33;
  points [10][1] = 54;  //|-

  points [11][0] = 27; points [12][0] = 50;
  points [11][1] = 58; points [12][1] = 48; //the hook

  points [13][0] = 33;
  points [13][1] = 13;
  points [14][0] = 57;
  points [14][1] = 13; //frist horizontal

  points [15][0] = 33;
  points [15][1] = 22;
  points [16][0] = 57;
  points [16][1] = 22;//2nd horizontal

  points [17][0] = 25;
  points [17][1] = 33;
  points [18][0] = 66;
  points [18][1] = 33;//3rd horizontal

  points [19][0] = 43;
  points [19][1] = 33;
  points [20][0] = 62;
  points [20][1] = 59; //piae

  points [21][0] = 59;
  points [21][1] = 38;
  points [22][0] = 48;
  points [22][1] = 45; //dot

  mouse_clicks = new int [1000][2];
}

void draw ( )
{
  pushMatrix();
  scale(1.5);
  placeRubberStamp (35, 35);
  popMatrix();
  
  pushMatrix();
  rotateZ(PI/15);
  placeRubberStamp (215, 125);
  popMatrix();
  
  pushMatrix();
  translate(125, 125, 130);
  placeRubberStamp (85, 155);
  popMatrix();
  
  placeRubberStamp (85, 155);
  
}

void placeRubberStamp (int px, int py)
{
  strokeWeight (4);
  stroke (251, 215, 193, 20);
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
  endShape ( );

  beginShape ();
  vertex (points [8] [0] + px, points [8] [1] + py);
  vertex (points [9] [0] + px, points [9] [1] + py);
  vertex (points [10][0] + px, points [10][1] + py);
  endShape ( );

  beginShape ();
  vertex (points [11] [0] + px, points [11] [1] + py);
  vertex (points [12] [0] + px, points [12] [1] + py);
  endShape ( );

  beginShape ();
  vertex (points [13] [0] + px, points [13] [1] + py);
  vertex (points [14] [0] + px, points [14] [1] + py);
  endShape ( );

  beginShape ();
  vertex (points [15] [0] + px, points [15] [1] + py);
  vertex (points [16] [0] + px, points [16] [1] + py);
  endShape ( );

  beginShape ();
  vertex (points [17] [0] + px, points [17] [1] + py);
  vertex (points [18] [0] + px, points [18] [1] + py);
  endShape ( );

  beginShape ();
  vertex (points [19] [0] + px, points [19] [1] + py);
  vertex (points [20] [0] + px, points [20] [1] + py);
  endShape ( );

  beginShape ();
  vertex (points [21] [0] + px, points [21] [1] + py);
  vertex (points [22] [0] + px, points [22] [1] + py);
  endShape ( );

}

void keyPressed ( )
{
  click_counter = 0;

}

