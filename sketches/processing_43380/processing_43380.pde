
// jie siang yong
// jyong_014: and the sky full of stars...

int [][] coord;
int clickcounter;
int [][] mouse_coord;

void setup()
{
  size (400,400);
  clickcounter = 0;
  coord = new int [8][2]; // Defining the Coordinates
  coord [0][0] = 0;
  coord [0][1] = 0;
  coord [1][0] = 5;
  coord [1][1] = -20;
  coord [2][0] = 10;
  coord [2][1] = 0;
  coord [3][0] = 30;
  coord [3][1] = 5;
  coord [4][0] = 10;
  coord [4][1] = 10;
  coord [5][0] = 5;
  coord [5][1] = 30;
  coord [6][0] = 0;
  coord [6][1] = 10;
  coord [7][0] = -20;
  coord [7][1] = 5;
  mouse_coord = new int [100][2];
}

void draw(){
  background(0);
  noStroke();
  beginShape(POLYGON);
  fill(0);
  vertex (0,0);
  vertex (400,0);
  fill(61,0,152);
  vertex (400,400);
  vertex (0,400);
  endShape();
  fill (125);
  ellipseMode (CENTER);
  ellipse(400,450, 1000,250);


  for (int i=0; i<clickcounter; i++)
  {
    placeRubberStamp (mouse_coord[i][0], mouse_coord[i][1]);
  }
}

void mousePressed()
{
  // mouse click, store values in an array, then use those values to place?
  mouse_coord [clickcounter][0] = mouseX;
  mouse_coord [clickcounter][1] = mouseY;
  clickcounter++;
}

int px;
int py;

void placeRubberStamp (int px, int py){
  stroke (255);
  noFill();
  beginShape ();
  vertex (coord [0][0] + px, coord [0][1] + py);  // Drawing the motif
  vertex (coord [1][0] + px, coord [1][1] + py);
  vertex (coord [2][0] + px, coord [2][1] + py);
  vertex (coord [3][0] + px, coord [3][1] + py);
  vertex (coord [4][0] + px, coord [4][1] + py);
  vertex (coord [5][0] + px, coord [5][1] + py);
  vertex (coord [6][0] + px, coord [6][1] + py);
  vertex (coord [7][0] + px, coord [7][1] + py);
  endShape(CLOSE);
}

void keyPressed(){
  clickcounter = 0;
}


