
int[][] grid, future;
void setup() {
  size(400, 400);
  frameRate(8);
  grid = new int[width][height];
  future = new int[width][height];
  float density = 0.01 * width * height;
  for(int i = 0; i < density; i++) {
    int tempX = int(random(width));
    int tempY = int(random(height));
    grid[tempX][tempY] = 1; 
  }
  background(135, 124,40);
}

void draw() {
 for(int x = 1; x < width-1; x++) {
  for(int y = 1; y < height-1; y++) {
   //Check the number of neighbors (adjacent cells) 
   int nb = neighbors(x, y);
   if((grid[x][y] == 0) && (nb > 5)) {
    future[x][y] = 2; //Isolation death
    //print(0);
    set(x, y, color(209,90,6));
   } else
   if((grid[x][y] == 1) && (nb < 5)) {
     //print(1);
     future[x][y]=1;//Overpopulation death
     set(x, y, color(118,133,21));
   } else
   if((grid[x][y] == 0) && (nb > 2)) {
    //print(2);
     future[x][y]=1;//Birth
    set(x, y, color(21,75,25));
   } else {
    future[x][y] = grid[x][y]; 
   }
  }
 } 
 println("zip");
 int[][]temp = grid;
 grid = future;
 future = temp;
}



int neighbors(int x, int y) {
  return grid[x][y-1] +   //North
         grid[x+1][y-1] + //NorthEast
         grid[x+1][y] +   //East
         grid[x+1][y+1] + //SouthEast
         grid[x][y+1] +   //South
         grid[x-1][y+1] + //Southwest
         grid[x-1][y] +   //West
         grid[x-1][y-1];  //NorthWest
}

/*int
void setseparatator(int pixnbTotals) {
  for(i=1000;i>.1;i=i/10)
{
 x=num%i;
 println((num-x)/i);
 num=x;
}
}
*/

