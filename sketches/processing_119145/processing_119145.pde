
/*@pjs font="Arial.ttf"*/
int counter;
int gridSize;
String place = "/help/instructions.rtf";
DPixel[][] grid; // The two dimensional array that has all the pixels in it
Brush brush; // The user's brush
PFont f;
boolean released;
boolean paused;
float speed;

void setup() {  //setup function called initially, only once
  size(400, 400);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  f = createFont("Arial.ttf",14,true);
  released = false;
  paused = true;
  brush = new Brush(1,255,255,255,1);
}

void draw() {  //draw function loops 
  if(place.equals("/help/instructions.rtf")){
    background(250);
    textFont(f);
    text("    Welcome to Dynamic Equilibrium. This is a visualization of the concept. In nature things tend to reach a balance. On the screen you can create colored pixels and borders. When you run the simulation all of the pixels will try to balance out their colors with their neighbors. You can also adjust the speed of the simulation. The borders will not allow colors to be transfered to them. This allows you to create interesting chain reactions.",5,20,width-12,200);
    text("version 1.0",5,height);
    button("Play","Go(/game/create",5,200);
    button("More","none",300,200);
  }
  else if(place.equals("/game/create")) {
    background(250);
    text("Choose the dimensions of the simulation:",2,20);
    button("10x10","grid(10",5,24+(height/10));
    button("","Go(/game/menu",5,24+(height/10));
    button("","Go(/game/menu",5,24+2*(height/10));
    button("25x25","grid(25",5,24+2*(height/10));
    button("","Go(/game/menu",5,24+3*(height/10));
    button("50x50","grid(50",5,24+3*(height/10));
    button("","Go(/game/menu",5,24+4*(height/10));
    button("100x100","grid(100",5,24+4*(height/10));
    button("","Go(/game/menu",5,24+5*(height/10));
    button("200x200","grid(200",5,24+5*(height/10));
  }
  else if(place.equals("/game/grid")) {
   for(int x = 0; x < gridSize; x++) {
     for(int y = 0; y < gridSize; y++) {
       grid[x][y].displer();
       if(paused == false) {grid[x][y].chooseNeighbor();}
     }
   }
  }
  else if(place.equals("/game/menu")) {
    background(250);
    fill(0);
    text("The game is paused: "+str(paused),5,20);
    text("To return to the simulation press m",5,40);
  }
  else{ //Unknown location
    paused = true;
    background(250);
    fill(0);
    text("Something went wrong \n There is a chance that your grid still exists \n If it exists then it has been paused",5,20);
    button("Go Back","Go(/game/grid",5,200);
    button("Home","Go(/help/instructions.rtf",width-5-(width/5),200);
  }
}
void button(String t, String action, int x, int y) { //A regular button
  int h = (height/10)-4;
  int w = (width/5)-4;
  fill(240);
  if(mousePressed && mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
      fill(200);
      if(released) {
        doAction(action);
        released = false;
      }
  }
  stroke(0);
  rectMode(CORNER);
  rect(x,y,w,h); //A rectangle
  fill(0);
  textFont(f);
  text(t,centerX(t,w,x),centerY(t,h,y));
}
int centerX(String t, int w, int x) { //This method returns the x position of horizontally aligned text
  return ((w-textWidth(t))/2)+x;
}
int centerY(String t, int h, int y) { //This method returns the y position of vertically aligned text
  return (h/2)+y+3;
}
void mouseReleased() { //Runs when the mouse is released
  released = true;
}
void doAction(String action) { //Interprets general action script, specifically for DE
  String[] a = split(action, "(");
  if(a[0].equals("Go")) { // Go(location
    place = a[1];
  }
  else if(a[0].equals("grid")) { // grid(side
    grid = new DPixel[int(a[1])][int(a[1])];
    for(int x = 0; x < int(a[1]); x++) { //Makes all of the pixels
      for(int y = 0; y < int(a[1]); y++) {
        grid[x][y] = new DPixel(x,y,0,0,0,int(a[1]));
      }
    }
    gridSize = int(a[1]);
    brush.max = gridSize;
    place = "/game/grid";
  }
  else if(a[0].equals("red")) {brush.red = int(a[1]);}
  else if(a[0].equals("green")) {brush.green = int(a[1]);}
  else if(a[0].equals("blue")) {brush.blue = int(a[1]);}
}
int rng(int[] nums) { //Random integer generator
  return nums[int(floor(random(0,nums.length())))];
}
void slider(int x, int y, String t, String a) {
  rectMode(CORNER);
  fill(240);
  stroke(0);
  
}
void keyReleased() {
  if(key != CODED) {
    if(key == 'p' || key == 'P') {
      if(paused) {paused = false;}
      else {paused = true;}
    } //P
    else if(key == 'm') {
      place = "/game/grid";
    }
  } else {
    
  }
}
class DPixel{ //Dynamic pixel class
  int xindex;
  int yindex;
  int red;
  int green;
  int blue;
  int size;
  int max;
  int rate;
  boolean border;
  DPixel(int x, int y, int r, int g, int b, int m) {//The constructor of this class
    xindex = x; //The x coordinate in the array
    yindex = y; //The y coordinate in the array
    red = r; //How much red the pixel has
    green = g; //How much green the pixel has
    blue = b; //How much blue the pixel has
    max = m; //The maximum amount of pixels in each row or column
    size = width/m; //The size of each pixel
    border = false; //If border is true then it will not update its neighbors and others can't update it either
  }
  void chooseNeighbor() {
    /* The pixels are as follows:
    | 1 | 2 | 3 |
    | 8 |YOU| 4 |
    | 7 | 6 | 5 |
    */
    if(xindex == 0 && yindex == 0) { //Upper left corner
      int client = int(floor(random(4,7)));
      balanceNeighbor(client);
    }
    else if(xindex == 0 && yindex == max-1) { //Lower left corner
      int client = int(floor(random(2,5)));
      balanceNeighbor(client);
    }
    else if(xindex == 0 && yindex != 0 && yindex != max-1) { //Left side
      int client = int(floor(random(2,7)));
      balanceNeighbor(client);
    }
    else if(xindex == max-1 && yindex == 0) { //Upper right hand corner
      int client = int(floor(random(6,9)));
      balanceNeighbor(client);
    }
    else if(xindex == max-1 && yindex == max-1) { //Lower right hand corner
      int client = rng({8,1,2});
      balanceNeighbor(client);
    }
    else if(xindex == max-1 && yindex != 0 && yindex != max-1) { //The right side
      int client = rng({6,7,8,1,2});
      balanceNeighbor(client);
    }
    else if(yindex == 0 && xindex != 0 && xindex != max-1) { //The top
      int client = int(floor(random(4,9)));
      balanceNeighbor(client);
    }
    else if(yindex == max-1 && xindex != 0 && xindex != max-1) { //The bottom
      int client = rng({8,1,2,3,4});
      balanceNeighbor(client);
    }
    else { //The middle
      int client = int(floor(random(1,9)));
      balanceNeighbor(client);
    }
  }
  void balanceNeighbor(int c) {
    switch(c) {
      case 1:
      if(grid[xindex-1][yindex-1].red < this.red-1) {grid[xindex-1][yindex-1].red++;}
      else if(grid[xindex-1][yindex-1].green < this.green-1) {grid[xindex-1][yindex-1].green++;}
      else if(grid[xindex-1][yindex-1].blue < this.blue-1) {grid[xindex-1][yindex-1].blue++;}
      break;
      case 2:
      if(grid[xindex][yindex-1].red < this.red-1) {grid[xindex][yindex-1].red++;}
      else if(grid[xindex][yindex-1].green < this.green-1) {grid[xindex][yindex-1].green++;}
      else if(grid[xindex][yindex-1].blue < this.blue-1) {grid[xindex][yindex-1].blue++;}
      break;
      case 3:
      if(grid[xindex+1][yindex-1].red < this.red-1) {grid[xindex+1][yindex-1].red++;}
      else if(grid[xindex+1][yindex-1].green < this.green-1) {grid[xindex+1][yindex-1].green++;}
      else if(grid[xindex+1][yindex-1].blue < this.blue-1) {grid[xindex+1][yindex-1].blue++;}
      break;
      case 4:
      if(grid[xindex+1][yindex].red < this.red-1) {grid[xindex+1][yindex].red++;}
      else if(grid[xindex+1][yindex].green < this.green-1) {grid[xindex+1][yindex].green++;}
      else if(grid[xindex+1][yindex].blue < this.blue-1) {grid[xindex+1][yindex].blue++;}
      break;
      case 5:
      if(grid[xindex+1][yindex+1].red < this.red-1) {grid[xindex+1][yindex+1].red++;}
      else if(grid[xindex+1][yindex+1].green < this.green-1) {grid[xindex+1][yindex+1].green++;}
      else if(grid[xindex+1][yindex+1].blue < this.blue-1) {grid[xindex+1][yindex+1].blue++;}
      break;
      case 6:
      if(grid[xindex][yindex+1].red < this.red-1) {grid[xindex+1][yindex+1].red++;}
      else if(grid[xindex][yindex+1].green < this.green-1) {grid[xindex][yindex+1].green++;}
      else if(grid[xindex][yindex+1].blue < this.blue-1) {grid[xindex][yindex+1].blue++;}
      break;
      case 7:
      if(grid[xindex-1][yindex+1].red < this.red-1) {grid[xindex-1][yindex+1].red++;}
      else if(grid[xindex-1][yindex+1].green < this.green-1) {grid[xindex-1][yindex+1].green++;}
      else if(grid[xindex-1][yindex+1].blue < this.blue-1) {grid[xindex-1][yindex+1].blue++;}
      break;
      case 8:
      if(grid[xindex-1][yindex].red < this.red-1) {grid[xindex-1][yindex].red++;}
      else if(grid[xindex-1][yindex].green < this.green-1) {grid[xindex-1][yindex].green++;}
      else if(grid[xindex-1][yindex].blue < this.blue-1) {grid[xindex-1][yindex].blue++;}
      break;
      default:
      this.red = int(floor(random(256)));
      this.green = int(floor(random(256)));
      this.blue = int(floor(random(256)));
      break;
    }
  }
  void displer() {
    if(border) {
    rectMode(CORNER);
    fill(red,green,blue);
    noStroke();
    rect(xindex*size,yindex*size,size,size);
    }
  }
}
class Brush{
  int stroke;
  int red;
  int green;
  int blue;
  int max;
  Brush(int s, int r, int g, int b, int m) {
    stroke = s;
    red = r;
    green = g;
    blue = b;
    max = m;
  }
  void setStroke(int s) {stroke = s;}
  void setColor(int r, int g, int b) {red = r; green = g; blue = b;}
  void paint() {
    if(mousePressed) {
      
    }
  }
}
