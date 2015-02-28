
// Snake
// By: Daniel L. Lu
// To demonstrate a novel method to implement this game for potentially infinite length snake,
// and an elegant way to check for wall collision

/*const*/ int gridSizeX = 40; //number of elements in a row in grid
/*const*/ int gridSizeY = 20; //number of elements in a column in grid
/*const*/ int SIZE = 22; //size of each tile on the grid

int snakeX = gridSizeX/2; //position of snake head, X
int snakeY = gridSizeY/2; //position of snake head, Y

int foodX = (int)random(1,gridSizeX); //position of food, X
int foodY = (int)random(1,gridSizeY); //position of food, Y

int foods = 1; //number of foods eaten so far

int direction = 0; //direction currently going - 4 is up, 3 is down, 2 is left, 1 is right, anything else is not moving
int [][] grid = new int[gridSizeX+2][gridSizeY+2]; //the crux of the program

boolean alive = true; //whether snake is alive
boolean eaten = false; //whether the snake has eaten something in the current frame

void setup(){
  size(880, 440);//somehow size(gridSizeX*SIZE,gridSizeY*SIZE); doesn't work in open processing
  textFont(createFont("Arial",2*SIZE,true));
  colorMode(HSB,100);//allows me to make the rainbow snake by changing hue
  frameRate(6);
}

void draw(){
  if(!alive){
    dead(); return;
  }
  background(#333333);
  snakeX+=direction==1?1:(direction==2?-1:0);//move the snake
  snakeY+=direction==3?1:(direction==4?-1:0);
  if(snakeX==foodX&&snakeY==foodY){//check for eating food
    foodX = (int)random(1,gridSizeX);
    foodY = (int)random(1,gridSizeY);
    foods++;
    eaten = true;
  }
  if(snakeX%(gridSizeX+1)==0||snakeY%(gridSizeY+1)==0||grid[snakeX][snakeY]>0){//check if died
    alive=false;
    dead(); return;
  }
  grid[snakeX][snakeY]=eaten?foods-1:foods;
  for(int i=1;i<=gridSizeX;i++){
    for(int j=1;j<=gridSizeY;j++){
      fill(grid[i][j]<=0?#232323:color(grid[i][j]*100/foods,100,100));
      rect((i-1)*SIZE,(j-1)*SIZE,SIZE,SIZE);
      if(!eaten) grid[i][j]--;
    }
  }
  fill(#FF0000);
  ellipse((foodX-1)*SIZE+SIZE/2,(foodY-1)*SIZE+SIZE/2,SIZE,SIZE);
  eaten = false;
  if(direction==0){//I added this because many people seem to complain about not being able to reset, or scrolling issues when pressing arrow keys. Probably noobs who don't read the description.
    fill(#ffffff);
    textAlign(CENTER);
    text("Control the snake with WASD or arrow keys.\n\n\n\nPress R to reset.",gridSizeX*SIZE/2,gridSizeY*SIZE/4);
  }
}

void keyPressed(){
  if(key=='w'||keyCode==UP) direction=direction==3?3:4;
  if(key=='s'||keyCode==DOWN) direction=direction==4?4:3;
  if(key=='a'||keyCode==LEFT) direction=direction==1?1:2;
  if(key=='d'||keyCode==RIGHT) direction=direction==2?2:1;
  if(key=='r'){//reset everything!
    direction=0;
    alive=true;
    foods=1;
    snakeX = gridSizeX/2;
    snakeY = gridSizeY/2;
    for(int i=1;i<=gridSizeX;i++){
      for(int j=1;j<=gridSizeY;j++){
        grid[i][j]=0;
      }
    }
  }
}

void dead(){
  fill(#ffffff);
  background(#232323);
  textAlign(CENTER);
  text("Game Over. \n\n\n\nPress R to reset.",gridSizeX*SIZE/2,gridSizeY*SIZE/2);
}                                                                                                       
