
int sx, sy; 
float density = 0.4; 
int[][][] world;
boolean mouseP;

void setup(){ 
  size(200, 200, P2D);
  sx = width;
  sy = height;
  world = new int[sx][sy][6]; 
  mouseP = false;
  for (int i = 0; i < sx * sy * density; i++) { 
    world[(int)random(sx)][(int)random(sy)][3] = 1; 
    world[(int)random(sx)][(int)random(sy)][4] = 1; 
    world[(int)random(sx)][(int)random(sy)][5] = 1; 
  } 
} 

void draw(){ 
  background(0); 
  int nextColor[] = { 0, 0, 0 };
  if(mouseP && mouseX>=0 && mouseY>=0 && mouseX<width && mouseY<height){
    world[mouseX][mouseY][3] = 1;
    world[mouseX][mouseY][4] = 1;
    world[mouseX][mouseY][5] = 1;
  }
  for( int x=0; x<sx; x++ ){ 
    for( int y=0; y<sy; y++ ){ 
      for( int c=0; c<3; c++ ){ 
        if ((world[x][y][3+c] == 1) || (world[x][y][3+c] == 0 && world[x][y][c] == 1)) 
        { 
          world[x][y][c] = 1;
          nextColor[c] = 255;
        } 
        else { 
          nextColor[c] = 0; 
        }
        if( c == 2 ){ 
          set(x, y, color(nextColor[0],nextColor[1],nextColor[2] ) ); 
        }
        if (world[x][y][3+c] == -1) 
        { 
          world[x][y][c] = 0; 
        } 
        world[x][y][3+c] = 0; 
      }
    } 
  } 
  for( int x=0; x<sx; x++ ){ 
    for( int y=0; y<sy; y++ ){
      for( int c=0; c<3; c++ ){
        int count = neighbors( x, y, c ); 
        if( count == 3 && world[x][y][c] == 0 ){ 
          world[x][y][3+c] = 1; 
        } 
        if( (count < 2 || count > 3) && world[x][y][c] == 1 ){ 
          world[x][y][3+c] = -1; 
        } 
      } 
    }
  }
} 

int neighbors(int x, int y, int c) { 
  return world[(x + 1) % sx][y][c] + 
    world[x][(y + 1) % sy][c] + 
    world[(x + sx - 1) % sx][y][c] + 
    world[x][(y + sy - 1) % sy][c] + 
    world[(x + 1) % sx][(y + 1) % sy][c] + 
    world[(x + sx - 1) % sx][(y + 1) % sy][c] + 
    world[(x + sx - 1) % sx][(y + sy - 1) % sy][c] + 
    world[(x + 1) % sx][(y + sy - 1) % sy][c]; 
} 

void mousePressed(){
  mouseP = true;
}
void mouseReleased(){
  mouseP = false; 
}

