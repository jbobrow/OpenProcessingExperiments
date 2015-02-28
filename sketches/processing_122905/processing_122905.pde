
// Interactive_Toy 
// by Austin Drexler
// We are going to make a program that lets users
// goof around... hahaha no literally go around and around
// to your heart's content.



// OUR STATIC VARIABLES //
int mScore;
int pScore;
// OUR CLASS INSTANCES  // 
Player p;
Vec[][] Grid;

// OUR BOOLEANS         //
Boolean goal;
// OTHER NECESSITIES
int curX = 0;
int curY = 0;

int A = 0;
int B = 0;
void setup() {
  // size of our canvas
  size(800, 600);

  // Constructing the board
  int gridPointsX = width/50;
  int gridPointsY = height/50;
  mScore = gridPointsX*gridPointsY;
  pScore = 0;
  Grid = new Vec[gridPointsX][gridPointsY];
  makeGrid(gridPointsX, gridPointsY);

  // MAKE THE PLAYER
  Vec p1 = Grid[int(random(1, gridPointsX))][int(random(1, gridPointsY))];
  Vec p2 = new Vec(p1.x + 50, p1.y);
  p = new Player(p1, p2);
}

void draw() {
  background(175);
  displayGrid();
//  if(checkGoal(p.start)){
//   makeNewLucky(pScore);
//  }
  p.update();
  
}
//GET INPUTS
void mousePressed() {
  p.cc = !p.cc;
}
void keyPressed() {
  if (key == ' ') {

    p.pivot(p.end, checkGrid(p.start, p.end));
  }
}
Boolean checkGoal(Vec pos){
  if (pScore >= mScore) return false;
  for (int i = 1; i < Grid.length; i++) {
    for (int k = 1; k < Grid[i].length; k++) {
      if (pos.x == Grid[i][k].x && pos.y == Grid[i][k].y) {
        curX = i;
        curY = k;
      }
    }
  }
  if(Grid[curX][curY].type == "yellow") return true;
  else return false;
}
void makeNewLucky(int s){
  A = int(random(1, Grid.length));
  B = int(random(1, Grid[1].length));
  Vec luc = Grid[A][B];
  if(pScore > s)return;
  else if(luc.type != "yellow"){
    luc.setType("yellow");
    pScore +=1;
  }else{
    makeNewLucky(s);
  }
  
}
Vec[] checkGrid(Vec a, Vec b) {
  //We need to Get nearby points
  int xCord = 0;
  int yCord = 0;
  Vec[] Near = new Vec[0];
  Vec next = new Vec(50, 50);

  //To do this we first need to find out which dot the player is on
  for (int i = 1; i < Grid.length; i++) {
    for (int k = 1; k < Grid[i].length; k++) {
      if (a.x == Grid[i][k].x && a.y == Grid[i][k].y) {
        xCord = i;
        yCord = k;
      }
    }
  }
  // now we can run a check to make which spaces he can snap to
  if (xCord >= 1 && xCord <= Grid.length - 2) {
    Near = (Vec[]) append(Near, new Vec(Grid[xCord+1][yCord].x, Grid[xCord+1][yCord].y));
    Near[Near.length-1].setDir("right");
    //    if(b.x >= a.x && b.y <= a.y && p.cc) next = Grid[xCord +1][yCord];
    //    else if(b.x >= a.x && b.y >= a.y && !p.cc) next = Grid[xCord +1][yCord];
  }
  if (xCord <= Grid.length && xCord >= 2) {
    Near = (Vec[]) append(Near, new Vec(Grid[xCord-1][yCord].x,Grid[xCord-1][yCord].y));
    Near[Near.length-1].setDir("left");
    //    if(b.x <= a.x && b.y <= a.y && !p.cc) next = Grid[xCord - 1][yCord];
    //    else if(b.x <= a.x && b.y >= a.y && p.cc) next = Grid[xCord - 1][yCord];
  }
  if (yCord >= 1 && yCord <= Grid[xCord].length -2) {
    Near = (Vec[]) append(Near, new Vec(Grid[xCord][yCord + 1].x, Grid[xCord][yCord + 1].y));
    Near[Near.length-1].setDir("down");
    //    if(b.x <= a.x && b.y >= a.y && !p.cc) next = Grid[xCord][yCord + 1];
    //    else if(b.x >= a.x && b.y >= a.y && p.cc) next = Grid[xCord][yCord + 1];
  }
  if (yCord <= Grid[xCord].length && yCord >=  2) {
    Near = (Vec[]) append(Near, new Vec(Grid[xCord][yCord - 1].x,Grid[xCord][yCord - 1].y));
    Near[Near.length-1].setDir("up");
    //    if(b.x <= a.x && b.y >= a.y && !p.cc) next = Grid[xCord][yCord + 1];
    //    else if(b.x >= a.x && b.y >= a.y && p.cc) next = Grid[xCord][yCord + 1];
  }
  println(" We had " + Near.length + " spaces to choose from");
  // Now we must find the next likely space!

  //  if(b.x >= a.x && b.y <= a.y && p.cc) next = Grid[xCord +1][yCord];
  //  else if(b.x >= a.x && b.y >= a.y && !p.cc) next = Grid[xCord +1][yCord];
  //  
  //  else if(b.x >= a.x && b.y <= a.y && !p.cc) next = Grid[xCord][yCord - 1];
  //  else if(b.x <= a.x && b.y <= a.y && p.cc) next = Grid[xCord][yCord - 1];
  //  
  //  else if(b.x <= a.x && b.y <= a.y && !p.cc) next = Grid[xCord - 1][yCord];
  //  else if(b.x <= a.x && b.y >= a.y && p.cc) next = Grid[xCord - 1][yCord];
  //  
  //  else if(b.x <= a.x && b.y >= a.y && !p.cc) next = Grid[xCord][yCord + 1];
  //  else if(b.x >= a.x && b.y >= a.y && p.cc) next = Grid[xCord][yCord + 1];

  if (Near == null) {
//    for (int j = 0; j < Near.length; j++) {
//      if (Near[j].x == next.x && Near[j].y == next.y) return next;
//    }
    Vec[] blank = new Vec[1];
    blank[0] = new Vec(a.x, a.y);
    return blank;
  }
  
  return Near;
}
void makeGrid(int w, int h) {
  int uni = 50;
  Vec lucky = new Vec( int(int(random(Grid.length)) * uni), int(int(random(Grid[0].length)) * 50));
  print(lucky.x + " " + lucky.y);
  for (int i = 0; i < Grid.length; i++) {
    for (int k = 0; k < Grid[i].length; k++) {
      Grid[i][k] = new Vec(i* uni, k * uni);
      if (Grid[i][k].x == lucky.x && Grid[i][k].y == lucky.y) {
        Grid[i][k].setType("yellow");
        print(Grid[i][k].type + " " + lucky.x + " " + lucky.y);
      }
    }
  }
}
void displayGrid() {
  fill(255);
  strokeWeight(1);
  for (int i = 1; i < Grid.length; i++) {
    for (int k = 1; k < Grid[i].length; k++) {
      if (Grid[i][k].type == "yellow")fill(Grid[i][k].c);
      else fill(255);
      ellipse(Grid[i][k].x, Grid[i][k].y, 10, 10);
    }
  }
}

// This is our avatar :D
// it's a line

class Player{
  // PLAYER'S MANY ATTRIBUTES BROKEN UP
  // POSITION VARIABLES
  Vec start;
  Vec end;
  
  // TIME
  float theta;
  // SPEED
  float speed;
  // RADIUS
  float radius;
  // COLOR
  color hue;
  // BOOLEAN for Clockwise and Counter-Clockwise
  boolean cc;
  float grace;
  // SURROUNDINGS
  
  Player(Vec s, Vec e){
    start = s;
    end = e;
    
    theta = radians(0);
    radius = 50;
    speed = .05;
    grace = 30;
    hue = color(0,100,200);
    cc = true;
    
  }
  // NORMAL BEHAVIOR
  // Calculate the position of the end point of a line segment 
  // by using trigonometric functions
  void orbit(){
    end.x = start.x + radius * cos(theta);
    end.y = start.y + radius * sin(theta); 
  }
  //CHECK 
  void pivot(Vec pos, Vec []node){
    for(int j = 0; j < node.length; j++){
      if(dist(node[j].x,node[j].y,pos.x,pos.y) <= grace){
        start = new Vec(node[j].x, node[j].y);
        theta += PI;
        cc = !cc;
      }
    }
  }
  
  //GET INPUTS
//  void mousePressed(){
//    cc = !cc;
//  }
//  void keyPressed(){
//    if(key == ' '){
//      pivot(end, new Vec(100, 50));
//    }
//  }
  
  // DRAW
  void update(){
     orbit();
     if(!cc){
       theta -= speed;
     }
     else{
       theta += speed;
     }
     pushStyle();
     stroke(hue);
     strokeWeight(3);
     line(start.x,start.y,end.x,end.y);
     popStyle();
     
  }
  
  
  
  
  
  
}
class Vec{
  // Helper class that keeps track of (x, y) coordinates
  float x;
  float y;
  String type;
  String dir;
  color c;
  Vec(float a, float b){
    x = a;
    y = b;
    c = color(255);
    type = "white";
    dir = "none";
  }
  void setType(String T){
    type = T;
    if(type == "yellow")
      c = color(255,255,0);
  }
  void setDir(String d){
    dir = d;
  }
}


