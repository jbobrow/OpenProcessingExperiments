

final int SIZE = 20;
final int RANDOM_MAX = 3;

boolean[][] grid;
int[][] values;
boolean toggle;
int maxValue;


ArrayList nodes = new ArrayList();
color wallColor = color(10,100,200);

class Pair{
  Pair(int a, int b) { x = a; y = b;}
  public int x;
  public int y;
}

void setup(){
  toggle = false;
  size(400,400);  
  maxValue = 0;
  
  newGrid();
}

void draw(){
  fillValues();
}

public void newGrid(){ 
  grid = new boolean[SIZE][SIZE];
  values = new int[SIZE][SIZE];
  nodes = new ArrayList();
  background(0);
  
  //Set up grid
  for(int x = 0; x < SIZE; x++){
    for(int y = 0; y < SIZE; y++){
      if((int)random(RANDOM_MAX) == 0){
        grid[x][y] = true;
        values[x][y] = SIZE*SIZE+1;
        fill(wallColor);
        rect(x*(width/SIZE),y*(height/SIZE),width/SIZE,height/SIZE);
      }
      else{
        grid[x][y] = false;
        values[x][y] = SIZE*SIZE;
      }
    }
  }
  values[SIZE-1][SIZE-1] = 1;
  nodes.add(new Pair(SIZE-1,SIZE-1));
  
  fillValues();
}

public void fillValues(){
  if(nodes.size() > 0)
  {
    int x = ((Pair)(nodes.get(0))).x;
    int y = ((Pair)(nodes.get(0))).y;
    if(x >= 0 && x < SIZE && y >= 0 && y < SIZE && !grid[x][y]){
      grid[x][y] = true;

      //Find lowest neighboring number
      int lowest = SIZE*SIZE;
      if(x-1 >= 0 && values[x-1][y] < lowest)
        lowest = values[x-1][y];
      if(y-1 >= 0 && values[x][y-1] < lowest)
        lowest = values[x][y-1];
      if(x+1 < SIZE && values[x+1][y] < lowest)
        lowest = values[x+1][y];
      if(y+1 < SIZE && values[x][y+1] < lowest)
        lowest = values[x][y+1];
        
      //println(lowest);
      if (maxValue < lowest)
        maxValue = lowest;
      
      //Set this value's value
      if(lowest < SIZE*SIZE )
        values[x][y] = lowest+1;
      
      //Show current rectangle  
      fill(values[x][y]*2+50);
        rect(x*(width/SIZE),y*(height/SIZE),width/SIZE,height/SIZE);
      
      //Update neighbors
      if(x > 0 && values[x-1][y] > values[x][y])
        nodes.add(new Pair(x-1,y));
      if(y > 0 && values[x][y-1] > values[x][y])
        nodes.add(new Pair(x,y-1));
      if(x+1 < SIZE && values[x+1][y] > values[x][y])
        nodes.add(new Pair(x+1,y));
      if(y+1 < SIZE && values[x][y+1] > values[x][y]){
        //println("hi");
        nodes.add(new Pair(x,y+1));
      }
      
      println(nodes.size());
        
      //dump();
    }
    nodes.remove(0);
  }
}

void keyPressed(){
  if (keyCode == ENTER){
    newGrid();
  }
  else if(key == ' ')
    println(nodes.size());
  else if(key == 'c'){
    for(int x = 0; x < SIZE; x++){
      for(int y = 0; y < SIZE; y++){
        values[x][y] = SIZE*SIZE;
        grid[x][y] = false;     
      }
    }
    recalc();
  }
  else
    toggle = !toggle;
}

void mousePressed(){
  int refX = (int)((mouseX/(double)width)*SIZE);
  int refY = (int)((mouseY/(double)height)*SIZE);
  
  //if it's a wall, make it a path
  if(values[refX][refY] == SIZE*SIZE+1){
    grid[refX][refY] = false;
    values[refX][refY] = SIZE*SIZE;
  }
  //if it's a path, make it a wall.
  else{
    grid[refX][refY] = true;
    values[refX][refY] = SIZE*SIZE+1;
  }
  recalc();
//  
//  fillValues(refX,refY);
//  for(int i = 0; i < nodes.size(); i++){
//    fillValues(((Pair)nodes.get(i)).x,((Pair)nodes.get(i)).y);
//  }
}

void dump(){
  for(int x = 0; x < SIZE; x++){
    for(int y = 0; y < SIZE; y++){
      if(values[x][y] < 10)
        print(" ");
      if(values[x][y] < 100)
        print(" ");
      if(values[x][y] == SIZE*SIZE+1)
        print("[ ],");
      else
        print(values[x][y]+",");
    }
    println(); 
  }
  println("-----------------------------");
}

void recalc(){
  background(0);
  nodes = new ArrayList();
  for(int x = 0; x < SIZE; x++){
    for(int y = 0; y < SIZE; y++){
      if(values[x][y] != SIZE*SIZE+1){
        values[x][y] = SIZE*SIZE;
        grid[x][y] = false;
      }
      else{
        fill(wallColor);
        rect(x*(width/SIZE),y*(height/SIZE),width/SIZE,height/SIZE);
        //rect(x/SIZE*SIZE,y/SIZE*SIZE,SIZE,SIZE);
      }      
    }
  }
  values[SIZE-1][SIZE-1] = 1;
  nodes.add(new Pair(SIZE-1,SIZE-1));
}

