
int[][] grid, future;
void setup() {
  size(400, 400);
  frameRate(10);
  //noCursor();
  grid = new int[width][height];
  future = new int[width][height];
  float density = 0.09 * width * height;
  int count = 0; 
  for(int i = 0; i < density; i++) {
    count++;
    int tempX = int(random(width));
    int tempY = int(random(height));
    if(0 == count%24) {
    grid[tempX][tempY] = 10; 
    } else {
    grid[tempX][tempY] = 1; 
    }if(0 == count%1000) {
     grid[tempX][tempY] = 100; 
    }
  }
  background(110,58,42);
}

void draw() {
 for(int x = 1; x < width-1; x++) {
  for(int y = 1; y < height-1; y++) {
   //Check the number of neighbors (adjacent cells) 
   int nb = neighbors(x, y);
   //print(n(nb, 2)>=1);

   if((grid[x][y] == 1) && (nb < 2)) {//set 1 (1)
    // print(0);
    future[x][y] = 0; //Isolation death
    set(x, y, color(110,58,42));
   } else
   if((grid[x][y] == 1) && (nb < 3)) {
   // println(n(nb, 1));
    //print(1);
     future[x][y]=0;//Overpopulation death
     set(x, y, color(87,48,32));
   } else
   if((grid[x][y] == 0) && (nb == 3)) {
     //print(2);
     future[x][y]=1;//Birth
     set(x, y, color(236,90,132));
   } else 
   if((grid[x][y] == 10) && (nb < 30)) {//set 2 (10)
//print(0);
    future[x][y] = 0; //Isolation death
    set(x, y, color(76,125,243));
   } else
   if((grid[x][y] == 10) && (nb < 30)) {
//print(1);
     future[x][y]=0;//Overpopulation death
    set(x, y, color(76,125,243));
   } else
   if((grid[x][y] == 0) && (nb == 20)) {
//print(2); 
     future[x][y]=10;//Birth
     set(x, y, color(65,104,221));
   } else
   if((grid[x][y] == 1) && (nb > 100))  {
   // print(2);
     future[x][y]=0;//Birth
     set(x, y, color(77,176,67));
   } else {
   if((grid[x][y] == 1) && (nb > 0) && (nb >= 7)) {
    //print(3);
     future[x][y]=100;//Birth
    set(x, y, color(193,230,104));
   }
    future[x][y] = grid[x][y]; 
   }
  }
 } 
 //println("zip");
 int[][]temp = grid;
 grid = future;
 future = temp;
// fill(0);
// noStroke();
// rect(mouseX,mouseY,1,1);
}

void mouseDragged() {
  noCursor();
  //redraw();
  //println("here");

 if((mouseX-12 > 0) && (mouseX+12 < width) && (mouseY-12 > 0) && (mouseY+12 < height)) {
  for(int i = -12; i < 12; i++) {
   for(int j = -12; j < 12; j++) {

    grid[mouseX+i][mouseY+j] = 0;
    set(mouseX+i, mouseY+j, color(110,58,42));
    }
   }
  }
}

void keyPressed() {
 if(key == ' ') noLoop(); 
}
void keyReleased() {
   if(key == ' ') loop(); 
}

void mouseReleased() {
  cursor();
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

int n(int N, int num) {
  for(int i =1000; i >= 1; i=i/10) {
    int x;
    x = num/i;
    num = num - i*x;
    if(N==4) {
      if( i == 1000) {//red
        return x;
      }
    } 
    if(N==3) {
      if( i == 100) { //green
        return x;
      }
    } 
    if(N==2) {
      if( i == 10) {//blue
        return x;
      }
    } 
    if(N==1) {
      if( i <= 1) { //ground
        return x;
      }
    } 
  }
  return 0;
}

