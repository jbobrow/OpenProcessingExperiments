
// jyong_015 - rubberstamp transformations
// shooting star nitescape

int [][] coord;
int clickcounter;
int [][] mouse_coord;

int x1 = -600;
int y1 = -500;
int x2 = 400;
int y2 = 0;
int starspeed1 = 10;
int starspeed2 = 20;

void setup()
{
  size (400,400);
  coord = new int [8][2]; // Defining the Coordinates
  coord [0][0] = 0;
  coord [0][1] = 0;
  coord [1][0] = 5;
  coord [1][1] = -30;
  coord [2][0] = 10;
  coord [2][1] = 0;
  coord [3][0] = 40;
  coord [3][1] = 5;
  coord [4][0] = 10;
  coord [4][1] = 10;
  coord [5][0] = 5;
  coord [5][1] = 40;
  coord [6][0] = 0;
  coord [6][1] = 10;
  coord [7][0] = -30;
  coord [7][1] = 5;
  mouse_coord = new int [100][2];
}

void draw(){
  x1 += 300/starspeed1;
  y1 += 400/starspeed1;
  x2 -= 300/starspeed2;
  y2 += 400/starspeed2;
  noStroke();

  background(0);

  beginShape();  //night sky
  fill(0);
  vertex (0,0);
  vertex (400,0);
  fill(61,0,152);
  vertex (400,400);
  vertex (0,400);
  endShape(CLOSE);

  placeRubberStamp (x2,y2);
  placeRubberStamp (150,150);

  pushMatrix();
  scale (0.5,0.5);
  placeRubberStamp (x1,y1);
  popMatrix();

  pushMatrix();
  scale (0.3,0.3);
  rotate(PI/20);
  placeRubberStamp (200,200);
  popMatrix();

  pushMatrix();
  scale (0.5,0.5);
  placeRubberStamp (450,50);
  scale (0.4,0.4);
  placeRubberStamp (450,50);
  popMatrix();

  pushMatrix();
  translate (40,50);
  placeRubberStamp (300,150);
  popMatrix();

  if (y1 > 3200){
    x1 = -780;
    y1 = -500;
  }

  if (y2 > 1600){
    x2 = 400;
    y2 = 0;
  }

  fill (125); //landscape
  noStroke();
  ellipseMode (CENTER);
  ellipse(400,450, 1000,250);

}

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
  vertex (coord [0][0] + px, coord [0][1] + py);
  endShape();
}

