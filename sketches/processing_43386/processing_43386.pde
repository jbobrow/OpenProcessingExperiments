
float [][] pattern = new float [10][2];
int [][] mouse;
int clicks;

void setup(){
  size(400,400);
  background (254,74,3);
  clicks = 0;
  pattern [0][0]=0;
  pattern [0][1]=1;
  pattern [1][0]=3;
  pattern [1][1]=0;
  pattern [2][1]=23;
  pattern [2][0]=0;
  pattern [3][1]=24;
  pattern [3][0]=0;
  pattern [4][1]=0;
  pattern [4][0]=14;
  pattern [5][1]=12;
  pattern [5][0]=3;
  pattern [6][1]=0;
  pattern [6][0]=10;
  pattern [7][1]=10;
  pattern [8][0]=0;
  pattern [8][1]=0;
  pattern [9][0]=1;
  pattern [9][1]=1;
  mouse = new int [1000][2];
}

void draw (){
  background (254,74,3);
  placeRubberStamp(200,200);
  pushMatrix( );
  scale (2);
  placeRubberStamp(50,50);
  popMatrix( );
  pushMatrix( );
  translate (50,-90);
  placeRubberStamp (200,150);
  popMatrix();
  pushMatrix();
  translate(200,200);
  rotate (.75*PI);
  placeRubberStamp (0,0);
  popMatrix();

}

void placeRubberStamp (int px,int py){
  stroke(255);
  noFill();
  beginShape ();

  vertex (pattern [0][1] + px, pattern [0][0] + py);
  vertex (pattern [1][1] + px, pattern [1][0] + py);
  vertex (pattern [2][1] + px, pattern [2][0] + py);
  vertex (pattern [3][1] + px, pattern [3][0] + py);
  vertex (pattern [4][1] + px, pattern [4][0] + py);
  vertex (pattern [5][1] + px, pattern [5][0] + py);
  vertex (pattern [6][1] + px, pattern [6][0] + py);
  vertex (pattern [7][1] + px, pattern [7][0] + py);
  vertex (pattern [8][1] + px, pattern [8][0] + py);
  vertex (pattern [9][1] + px, pattern [9][0] + py);

  endShape();

}

