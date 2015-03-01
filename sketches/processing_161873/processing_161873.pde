
//Author: Formenti Federico
boolean[][] city;
boolean[][] copy;

void setup() {
  size(280, 250);
  city = new boolean[width][height];
  copy = new boolean[width][height];
  noSmooth();
  initialize( 10, 5 );
}

void draw() {
  //Background (Dead Cells)
  background(#333333);
  //Living Cells
  stroke(#FFFFFF);
  for( int r = 0; r < width; r++ ){
    for( int c = 0; c < height; c++ ){
      copy[r][c] = city[r][c];
      if( city[r][c] ){
        point( r, c );
      }
    }
  }
  update();
}

int neighbors( int x, int y ){
  int v = 0;
  for( int dx = -1; dx <= 1; dx++) {
    for( int dy = -1; dy <= 1; dy++) {
      if( copy[(x+dx+width)%width][(y+dy+height)%height] )
        v++;
    }
  }
  return v;
}

void initialize(int t, int q){
  for( int i = 0; i < width; i++ ){
    for( int j = 0; j < height; j++ ){
      if( random(t) > q){
        city[i][j] = true;
      }
      else{
        city[i][j] = false;
      }
    }
  }
}

void update(){
  for( int i = 0; i < width; i++ ){
    for( int j = 0; j < height; j++ ){
      //Controllo il numero di vicini
      int v = neighbors( i, j );
      city[i][j] = v == 3 || (city[i][j] && v == 4); 
    }
  }
}
