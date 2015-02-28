
// press space bar to see the skeleton

float[ ][ ] points;
float number_of_points = 12.0;
int [ ] [ ] [ ] letters = new int [26] [6] [2];
int currKey, nextKey;
int clickCount = 0;
float speeds[] = new float[12];
float transition = 1.0;
// bigger = faster transitions
float zenoFactor = .3;
float rotateStart = 0.0;
// .5 seconds
float rotateTime = 500.0;
// 1/1000 chance every frame
float rotateChance = .001;
boolean flag = false;

void setup ( )
{
  smooth ( );
  size (400, 400);
  background (210, 200, 230);
  currKey = nextKey = 0;
  for (int i = 0; i < 12; i++)
  {
    speeds[i] = random(-1.2, 1.2);
  }
  points = new float[(int)number_of_points][2];
  for (int i = 0; i < number_of_points; i++)
  {
    points [i][0] = 150 * sin(i/number_of_points * TWO_PI);
    points [i][1] = 150 * cos(i/number_of_points * TWO_PI);
    //float px(i + 1) = points [i][0];
    //float py(i + 1) = points [i][1];
  }

  //------------------------A
  letters [0][0][0] = 3;
  letters [0][0][1] = 7;
  letters [0][1][0] = 5;
  letters [0][1][1] = 9;
  letters [0][2][0] = 7;
  letters [0][2][1] = 11;
  letters [0][3][0] = 3;
  letters [0][3][1] = 7;
  letters [0][4][0] = 5;
  letters [0][4][1] = 9;
  letters [0][5][0] = 7;
  letters [0][5][1] = 11;
  //------------------------B
  letters [1][0][0] = 3;
  letters [1][0][1] = 9;
  letters [1][1][0] = 6;
  letters [1][1][1] = 8;
  letters [1][2][0] = 8;
  letters [1][2][1] = 12;
  letters [1][3][0] = 9;
  letters [1][3][1] = 3;
  letters [1][4][0] = 12;
  letters [1][4][1] = 3;
  letters [1][5][0] = 6;
  letters [1][5][1] = 9;
  //------------------------C
  letters [2][0][0] = 5;
  letters [2][0][1] = 7;
  letters [2][1][0] = 7;
  letters [2][1][1] = 9;
  letters [2][2][0] = 9;
  letters [2][2][1] = 12;
  letters [2][3][0] = 12;
  letters [2][3][1] = 3;
  letters [2][4][0] = 5;
  letters [2][4][1] = 7;
  letters [2][5][0] = 12;
  letters [2][5][1] = 9;
  //------------------------D
  letters [3][0][0] = 5;
  letters [3][0][1] = 8;
  letters [3][1][0] = 8;
  letters [3][1][1] = 12;
  letters [3][2][0] = 12;
  letters [3][2][1] = 5;
  letters [3][3][0] = 8;
  letters [3][3][1] = 5;
  letters [3][4][0] = 12;
  letters [3][4][1] = 8;
  letters [3][5][0] = 5;
  letters [3][5][1] = 12;
  //------------------------E
  letters [4][0][0] = 5;
  letters [4][0][1] = 9;
  letters [4][1][0] = 6;
  letters [4][1][1] = 8;
  letters [4][2][0] = 8;
  letters [4][2][1] = 12;
  letters [4][3][0] = 12;
  letters [4][3][1] = 2;
  letters [4][4][0] = 8;
  letters [4][4][1] = 6;
  letters [4][5][0] = 12;
  letters [4][5][1] = 8;
  //------------------------F
  letters [5][0][0] = 5;
  letters [5][0][1] = 9;
  letters [5][1][0] = 6;
  letters [5][1][1] = 8;
  letters [5][2][0] = 8;
  letters [5][2][1] = 12;
  letters [5][3][0] = 9;
  letters [5][3][1] = 5;
  letters [5][4][0] = 8;
  letters [5][4][1] = 6;
  letters [5][5][0] = 12;
  letters [5][5][1] = 8;
  //------------------------G
  letters [6][0][0] = 1;
  letters [6][0][1] = 4;
  letters [6][1][0] = 5;
  letters [6][1][1] = 7;
  letters [6][2][0] = 7;
  letters [6][2][1] = 10;
  letters [6][3][0] = 10;
  letters [6][3][1] = 1;
  letters [6][4][0] = 11;
  letters [6][4][1] = 4;
  letters [6][5][0] = 10;
  letters [6][5][1] = 7;
  //------------------------H
  letters [7][0][0] = 2;
  letters [7][0][1] = 6;
  letters [7][1][0] = 5;
  letters [7][1][1] = 9;
  letters [7][2][0] = 8;
  letters [7][2][1] = 12;
  letters [7][3][0] = 6;
  letters [7][3][1] = 2;
  letters [7][4][0] = 9;
  letters [7][4][1] = 5;
  letters [7][5][0] = 12;
  letters [7][5][1] = 8;
  //------------------------I
  letters [8][0][0] = 6;
  letters [8][0][1] = 8;
  letters [8][1][0] = 7;
  letters [8][1][1] = 1;
  letters [8][2][0] = 12;
  letters [8][2][1] = 2;
  letters [8][3][0] = 8;
  letters [8][3][1] = 6;
  letters [8][4][0] = 1;
  letters [8][4][1] = 7;
  letters [8][5][0] = 2;
  letters [8][5][1] = 12;
  //------------------------J
  letters [9][0][0] = 1;
  letters [9][0][1] = 7;
  letters [9][1][0] = 6;
  letters [9][1][1] = 8;
  letters [9][2][0] = 10;
  letters [9][2][1] = 11;
  letters [9][3][0] = 11;
  letters [9][3][1] = 1;
  letters [9][4][0] = 7;
  letters [9][4][1] = 1;
  letters [9][5][0] = 1;
  letters [9][5][1] = 11;
  //------------------------K
  letters [10][0][0] = 6;
  letters [10][0][1] = 9;
  letters [10][1][0] = 8;
  letters [10][1][1] = 12;
  letters [10][2][0] = 9;
  letters [10][2][1] = 2;
  letters [10][3][0] = 9;
  letters [10][3][1] = 6;
  letters [10][4][0] = 12;
  letters [10][4][1] = 8;
  letters [10][5][0] = 2;
  letters [10][5][1] = 9;
  //------------------------L
  letters [11][0][0] = 2;
  letters [11][0][1] = 3;
  letters [11][1][0] = 8;
  letters [11][1][1] = 12;
  letters [11][2][0] = 12;
  letters [11][2][1] = 2;
  letters [11][3][0] = 3;
  letters [11][3][1] = 2;
  letters [11][4][0] = 12;
  letters [11][4][1] = 8;
  letters [11][5][0] = 2;
  letters [11][5][1] = 12;
  //------------------------M
  letters [12][0][0] = 3;
  letters [12][0][1] = 6;
  letters [12][1][0] = 6;
  letters [12][1][1] = 1;
  letters [12][2][0] = 8;
  letters [12][2][1] = 1;
  letters [12][3][0] = 8;
  letters [12][3][1] = 1;
  letters [12][4][0] = 1;
  letters [12][4][1] = 6;
  letters [12][5][0] = 11;
  letters [12][5][1] = 8;
  //------------------------N
  letters [13][0][0] = 8;
  letters [13][0][1] = 2;
  letters [13][1][0] = 8;
  letters [13][1][1] = 12;
  letters [13][2][0] = 2;
  letters [13][2][1] = 6;
  letters [13][3][0] = 6;
  letters [13][3][1] = 2;
  letters [13][4][0] = 2;
  letters [13][4][1] = 8;
  letters [13][5][0] = 12;
  letters [13][5][1] = 8;
  //------------------------O
  letters [14][0][0] = 1;
  letters [14][0][1] = 3;
  letters [14][1][0] = 3;
  letters [14][1][1] = 5;
  letters [14][2][0] = 5;
  letters [14][2][1] = 7;
  letters [14][3][0] = 7;
  letters [14][3][1] = 9;
  letters [14][4][0] = 9;
  letters [14][4][1] = 11;
  letters [14][5][0] = 11;
  letters [14][5][1] = 1;
  //------------------------P
  letters [15][0][0] = 6;
  letters [15][0][1] = 8;
  letters [15][1][0] = 6;
  letters [15][1][1] = 9;
  letters [15][2][0] = 8;
  letters [15][2][1] = 12;
  letters [15][3][0] = 9;
  letters [15][3][1] = 6;
  letters [15][4][0] = 12;
  letters [15][4][1] = 8;
  letters [15][5][0] = 8;
  letters [15][5][1] = 6;
  //------------------------Q
  letters [16][0][0] = 1;
  letters [16][0][1] = 4;
  letters [16][1][0] = 6;
  letters [16][1][1] = 4;
  letters [16][2][0] = 8;
  letters [16][2][1] = 6;
  letters [16][3][0] = 11;
  letters [16][3][1] = 8;
  letters [16][4][0] = 11;
  letters [16][4][1] = 1;
  letters [16][5][0] = 2;
  letters [16][5][1] = 10;
  //------------------------R
  letters [17][0][0] = 2;
  letters [17][0][1] = 9;
  letters [17][1][0] = 8;
  letters [17][1][1] = 6;
  letters [17][2][0] = 6;
  letters [17][2][1] = 9;
  letters [17][3][0] = 8;
  letters [17][3][1] = 12;
  letters [17][4][0] = 9;
  letters [17][4][1] = 2;
  letters [17][5][0] = 12;
  letters [17][5][1] = 8;
  //------------------------S
  letters [18][0][0] = 6;
  letters [18][0][1] = 8;
  letters [18][1][0] = 8;
  letters [18][1][1] = 5;
  letters [18][2][0] = 12;
  letters [18][2][1] = 5;
  letters [18][3][0] = 5;
  letters [18][3][1] = 12;
  letters [18][4][0] = 5;
  letters [18][4][1] = 8;
  letters [18][5][0] = 8;
  letters [18][5][1] = 6;
  //------------------------T
  letters [19][0][0] = 1;
  letters [19][0][1] = 7;
  letters [19][1][0] = 7;
  letters [19][1][1] = 1;
  letters [19][2][0] = 8;
  letters [19][2][1] = 6;
  letters [19][3][0] = 6;
  letters [19][3][1] = 8;
  letters [19][4][0] = 1;
  letters [19][4][1] = 7;
  letters [19][5][0] = 6;
  letters [19][5][1] = 8;
  //------------------------U
  letters [20][0][0] = 3;
  letters [20][0][1] = 6;
  letters [20][1][0] = 11;
  letters [20][1][1] = 8;
  letters [20][2][0] = 11;
  letters [20][2][1] = 3;
  letters [20][3][0] = 3;
  letters [20][3][1] = 11;
  letters [20][4][0] = 6;
  letters [20][4][1] = 3;
  letters [20][5][0] = 8;
  letters [20][5][1] = 11;
  //------------------------V
  letters [21][0][0] = 1;
  letters [21][0][1] = 6;
  letters [21][1][0] = 8;
  letters [21][1][1] = 1;
  letters [21][2][0] = 1;
  letters [21][2][1] = 8;
  letters [21][3][0] = 6;
  letters [21][3][1] = 1;
  letters [21][4][0] = 1;
  letters [21][4][1] = 8;
  letters [21][5][0] = 6;
  letters [21][5][1] = 1;
  //------------------------W
  letters [22][0][0] = 12;
  letters [22][0][1] = 9;
  letters [22][1][0] = 12;
  letters [22][1][1] = 7;
  letters [22][2][0] = 2;
  letters [22][2][1] = 7;
  letters [22][3][0] = 5;
  letters [22][3][1] = 2;
  letters [22][4][0] = 2;
  letters [22][4][1] = 7;
  letters [22][5][0] = 12;
  letters [22][5][1] = 7;
  //------------------------X
  letters [23][0][0] = 3;
  letters [23][0][1] = 8;
  letters [23][1][0] = 8;
  letters [23][1][1] = 3;
  letters [23][2][0] = 6;
  letters [23][2][1] = 11;
  letters [23][3][0] = 11;
  letters [23][3][1] = 6;
  letters [23][4][0] = 8;
  letters [23][4][1] = 3;
  letters [23][5][0] = 11;
  letters [23][5][1] = 6;
  //------------------------Y
  letters [24][0][0] = 1;
  letters [24][0][1] = 4;
  letters [24][1][0] = 4;
  letters [24][1][1] = 6;
  letters [24][2][0] = 4;
  letters [24][2][1] = 8;
  letters [24][3][0] = 4;
  letters [24][3][1] = 1;
  letters [24][4][0] = 6;
  letters [24][4][1] = 4;
  letters [24][5][0] = 8;
  letters [24][5][1] = 4;
  //------------------------Z
  letters [25][0][0] = 3;
  letters [25][0][1] = 11;
  letters [25][1][0] = 6;
  letters [25][1][1] = 11;
  letters [25][2][0] = 8;
  letters [25][2][1] = 6;
  letters [25][3][0] = 6;
  letters [25][3][1] = 8;
  letters [25][4][0] = 11;
  letters [25][4][1] = 6;
  letters [25][5][0] = 11;
  letters [25][5][1] = 3;
  //------------------------
  // because I am STOOPID
  for(int i = 0; i < 26; i++)
  for(int j = 0; j < 6; j++)
  for(int k = 0; k < 2; k++)
  letters[i][j][k] -= 1;
}

void draw ( )
{
  translate (50, 50);
  background (210, 200, 230);
  for (int L = 0; L<26; L++)
  {
    currKey = L;
    nextKey = L;
    pushMatrix( );
    translate(40.0*(L%8), (L/8)*40.0);
    scale(0.1, 0.1);
   /* 
    if ((millis() - rotateStart) < rotateTime)
      rotateY(TWO_PI * (millis() - rotateStart) / rotateTime);
    else if ((random(0.0, 1.0) < rotateChance))
      rotateStart = millis();
    */
    float r = 20.0;
    float theta = (float)millis()/400.0;
    strokeWeight (1);

    beginShape(LINES);
    stroke (100);
    transition += zenoFactor * (1.0 - transition);
    for (int i=0; i<6; i++){
      float dx1Curr = r * cos (speeds[letters[currKey][i][0]]*theta);
      float dy1Curr = r * sin (speeds[letters[currKey][i][0]]*theta);
      float dx2Curr = r * cos (speeds[letters[currKey][i][1]]*theta);
      float dy2Curr = r * sin (speeds[letters[currKey][i][1]]*theta);
      float dx1Next = r * cos (speeds[letters[nextKey][i][0]]*theta);
      float dy1Next = r * sin (speeds[letters[nextKey][i][0]]*theta);
      float dx2Next = r * cos (speeds[letters[nextKey][i][1]]*theta);
      float dy2Next = r * sin (speeds[letters[nextKey][i][1]]*theta);

      vertex((1.0 - transition)*(points[letters[currKey][i][0]][0] + dx1Curr)
      + transition*(points[letters[nextKey][i][0]][0] + dx1Next),
      (1.0 - transition)*(points[letters[currKey][i][0]][1] + dy1Curr)
      + transition*(points[letters[nextKey][i][0]][1] + dy1Next));

      vertex((1.0 - transition)*(points[letters[currKey][i][1]][0] + dx2Curr)
      + transition*(points[letters[nextKey][i][1]][0] + dx2Next),
      (1.0 - transition)*(points[letters[currKey][i][1]][1] + dy2Curr)
      + transition*(points[letters[nextKey][i][1]][1] + dy2Next));
    }
    endShape();

    if (flag)
    {
      stroke (190, 180, 210);
      strokeWeight(1);
      noFill();
      beginShape ();

      for (int i = 0; i < number_of_points; i++)
      {
        float dx = r * cos (speeds[i]*theta);
        float dy = r * sin (speeds[i]*theta);
        vertex (dx + points [i][0],dy +  points [i][1]);
      }
      endShape (CLOSE);
      strokeWeight (4);
      stroke (200, 150, 230);
      strokeWeight(20);
      beginShape (POINTS);
      for (int i = 0; i < number_of_points; i++)
      {
        float dx = r * cos (speeds[i]*theta);
        float dy = r * sin (speeds[i]*theta);
        vertex (dx + points [i][0],dy +  points [i][1]);
      }
      endShape ( );
    }
    popMatrix( );
  }
}

void keyPressed(){

  int tmpKey = key;

  // convert all letters to uppercase
  if ((key >= 'a') && (key <= 'z')){
    tmpKey -= ('a' - 'A');
  }

  if ((key == '1') && ((millis() - rotateStart) > rotateTime))
  rotateStart = millis();

  // really want currKey to be 0..6, NOT A..F (97-103)
  tmpKey = tmpKey - 'A';
  if ((tmpKey >=0) && (tmpKey < 26)){
    currKey = nextKey;
    nextKey = tmpKey;
    transition = 0.0;

  }

  if (key == ' ') {
    flag = !flag;
  }
}

