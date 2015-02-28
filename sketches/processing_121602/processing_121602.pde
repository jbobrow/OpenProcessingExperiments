
/*@pjs font="Arial.ttf"*/
int counter;
int gridSize;
int redT = 0;
int redA = 0;
int blueT = 0;
int blueA = 0;
int greenT = 0;
int greenA = 0;
String place = "/help/instructions.rtf";
DPixel[][] grid; // The two dimensional array that has all the pixels in it
Brush brush; // The user's brush
PFont f;
boolean released;
boolean paused;
boolean stats;
float speed;

void setup() {  //setup function called initially, only once
  size(400, 400);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  f = createFont("Arial.ttf",14,true);
  released = false;
  paused = true;
  stats = false;
  brush = new Brush(128,128,128,1);
}

void draw() {  //draw function loops 
  if(place.equals("/help/instructions.rtf")){
    background(250);
    textFont(f);
    text("    Welcome to Dynamic Equilibrium. This is a visualization of the concept. In nature things tend to reach a balance. On the screen you can create colored pixels and borders. When you run the simulation all of the pixels will try to balance out their colors with their neighbors. The borders will not allow colors to be transfered to them. This allows you to create interesting chain reactions.\n    Click here to start.",5,20,width-12,200);
    text("version 1.1",5,height);
    button("Play","Go(/game/create",5,200);
    button("More","none",300,200);
  }
  else if(place.equals("/game/create")) {
    background(250);
    text("Choose the dimensions of the simulation:",2,20);
    button("10x10","grid(10;Go(/game/menu",5,24+(height/10));
    button("25x25","grid(25;Go(/game/menu",5,24+2*(height/10));
    button("50x50","grid(50;Go(/game/menu",5,24+3*(height/10));
    button("100x100","grid(100;Go(/game/menu",5,24+4*(height/10));
    button("200x200","grid(200;Go(/game/menu",5,24+5*(height/10));
    button("400x400","Go(/game/create",5,24+6*(height/10));
    text("recommended",(width/5)+4,2*(height/10)+38);
    text("slow",(width/5)+4,4*(height/10)+38);
    text("very slow",(width/5)+4,5*(height/10)+38);
    text("just no",(width/5)+4,6*(height/10)+38);
  }
  else if(place.equals("/game/grid")) {
   redT=0; blueT=0; greenT=0;
   for(int x = 0; x < grid[0].length; x++) {
     for(int y = 0; y < grid[0].length; y++) {
       grid[x][y].displer();
       fill(255);
       text(str(frameCount)+" "+str(paused),5,20);
       if(paused==false) {grid[x][y].chooseNeighbor();}
       redT += grid[x][y].red;
       blueT += grid[x][y].blue;
       greenT += grid[x][y].green;
     }
   }
   brush.paint();
   redA = redT/(grid[0].length*grid[0].length);
   blueA = blueT/(grid[0].length*grid[0].length);
   greenA = greenT/(grid[0].length*grid[0].length);
   showStats();
  }
  else if(place.equals("/game/menu")) {
    background(250);
    fill(0);
    text("The game is paused: "+str(paused),5,20);
    text("To return to the simulation press Play",5,40);
    text(str(grid[0].length),5,60);
    text("Press \'r\' to make a new grid",5,80);
    button("Play","Go(/game/grid;pause(false",5,100);
    button("Main menu", "Go(/help/instructions.rtf", width/2, 100);
    fill(brush.red,brush.green,brush.blue);
    rect(5,height/2,width/10,height/10);
    fill(0);
    text("Press \'s\' to show stats \n Press \'m\' to go back here\n Press \'r\' to make a new grid",5,height/2-48);
    text("Brush:",5,height/2-4);
    holdme("+Red","red(2",width/10+10,height/2);
    holdme("-Red","red(-2",width/10+10+(width/5),height/2);
    holdme("+Green","green(2",width/10+10+2*(width/5),height/2);
    holdme("-Green","green(-2",width/10+10+3*(width/5),height/2);
    holdme("+Blue","blue(2",width/10+10,(height/2)+(height/10));
    holdme("-Blue","blue(-2",width/10+10+(width/5),(height/2)+(height/10));
    button("border "+strToggle(brush.border),"toggle(brdbrush",width/10+10+2*(width/5),(height/2)+(height/10));
    button("random "+strToggle(brush.random),"toggle(rndbrush",width/10+10+3*(width/5),(height/2)+(height/10));
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
        if(action.indexOf(";") != -1) {
          doAction(action.substring(0,action.indexOf(";")));
          background(0);
          action = action.substring(action.indexOf(";")+1,action.length);}
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
void holdme(String t, String action, int x, int y) { //Activates while you press the button
  int h = (height/10)-4;
  int w = (width/5)-4;
  fill(240);
  if(mousePressed && mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(200);
    if(action.indexOf(";") != -1) {
          doAction(action.substring(0,action.indexOf(";")));
          background(0);
          action = action.substring(action.indexOf(";")+1,action.length);}
        doAction(action);
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
boolean toggle(boolean b) {
  if(b) {return false;}
  else {return true;}
}
String strToggle(boolean b) {
  if(b) {return "off";}
  else {return "on";}
}
void mouseReleased() { //Runs when the mouse is released
  released = true;
}
void doAction(String action) { //Interprets general action script, specifically for DE
  //This bit seperates the method name from the parameters
  String[] a = split(action, "(");
  if(a[0].equals("Go")) { // Go(location
    place = a[1];
  }
  else if(a[0].equals("grid")) { // grid(side
    grid = new DPixel[int(a[1])][int(a[1])];
    for(int x = 0; x < int(a[1]); x++) { //Makes all of the pixels
      for(int y = 0; y < int(a[1]); y++) {
        grid[x][y] = new DPixel(x,y,int(floor(random(256))),int(floor(random(256))),int(floor(random(256))),int(a[1]));
      }
    }
    gridSize = int(a[1]);
    brush.max = int(a[1]);
    place = "/game/grid";
  }
  else if(a[0].equals("red")) {brush.red += int(a[1]); brush.border = false; brush.random = false;}
  else if(a[0].equals("green")) {brush.green += int(a[1]); brush.border = false; brush.random = false;}
  else if(a[0].equals("blue")) {brush.blue += int(a[1]); brush.border = false; brush.random = false;}
  else if(a[0].equals("border")) {brush.border = boolean(a[1]);}
  else if(a[0].equals("pause")) {paused = boolean(a[1]);}
  else if(a[0].equals("toggle")) {
    if(a[1].equals("brdbrush")) {brush.border=toggle(brush.border); brush.random = false;}
    else if(a[1].equals("rndbrush")) {brush.random=toggle(brush.random); brush.border = false;}
  }
}
int rng(int[] nums) { //Random integer generator
  return nums[int(floor(random(0,nums.length())))];
}
void slider(int x, int y, String t, String a) {
  rectMode(CORNER);
  fill(240);
  stroke(0);
  
}
void showStats() { //Shows the stats
 if(stats) {
  fill(0,0,0,128);
  rect(0,0,(width/4)+(width/8),3*(height/10));
  fill(255);
  text("Average Red:"+int(redA),5,40);
  text("Average Blue:"+int(blueA),5,60);
  text("Average Green:"+int(greenA),5,80);
  }
}
void keyReleased() {
  if(key != CODED) {
    if(key == 'p' || key == 'P') {
      if(paused) {paused = false;}
      else {paused = true;}
    } //P
    else if(key == 'r' || key == 'P') {
      doAction("grid("+str(gridSize));
    }
    else if(key == 'm' || key == 'M') {
      paused = true;
      place = "/game/menu";
    }
    else if(key == 's' || key == 'S') {
      stats = toggle(stats);
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
    if(border == false) {
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
  }
  void balanceNeighbor(int c) {
    switch(c) {
      case 1:
      if(grid[xindex-1][yindex-1].red < this.red-1) {grid[xindex-1][yindex-1].red++;this.red--;}
      else if(grid[xindex-1][yindex-1].green < this.green-1) {grid[xindex-1][yindex-1].green++;this.green--;}
      else if(grid[xindex-1][yindex-1].blue < this.blue-1) {grid[xindex-1][yindex-1].blue++;this.blue--;}
      break;
      case 2:
      if(grid[xindex][yindex-1].red < this.red-1) {grid[xindex][yindex-1].red++;this.red--;}
      else if(grid[xindex][yindex-1].green < this.green-1) {grid[xindex][yindex-1].green++;this.green--;}
      else if(grid[xindex][yindex-1].blue < this.blue-1) {grid[xindex][yindex-1].blue++;this.blue--;}
      break;
      case 3:
      if(grid[xindex+1][yindex-1].red < this.red-1) {grid[xindex+1][yindex-1].red++;this.red--;}
      else if(grid[xindex+1][yindex-1].green < this.green-1) {grid[xindex+1][yindex-1].green++;this.green--;}
      else if(grid[xindex+1][yindex-1].blue < this.blue-1) {grid[xindex+1][yindex-1].blue++;this.blue--;}
      break;
      case 4:
      if(grid[xindex+1][yindex].red < this.red-1) {grid[xindex+1][yindex].red++;this.red--;}
      else if(grid[xindex+1][yindex].green < this.green-1) {grid[xindex+1][yindex].green++;this.green--;}
      else if(grid[xindex+1][yindex].blue < this.blue-1) {grid[xindex+1][yindex].blue++;this.blue--;}
      break;
      case 5:
      if(grid[xindex+1][yindex+1].red < this.red-1) {grid[xindex+1][yindex+1].red++;this.red--;}
      else if(grid[xindex+1][yindex+1].green < this.green-1) {grid[xindex+1][yindex+1].green++;this.green--;}
      else if(grid[xindex+1][yindex+1].blue < this.blue-1) {grid[xindex+1][yindex+1].blue++;this.blue--;}
      break;
      case 6:
      if(grid[xindex][yindex+1].red < this.red-1) {grid[xindex][yindex+1].red++;this.red--;}
      else if(grid[xindex][yindex+1].green < this.green-1) {grid[xindex][yindex+1].green++;this.green--;}
      else if(grid[xindex][yindex+1].blue < this.blue-1) {grid[xindex][yindex+1].blue++;this.blue--;}
      break;
      case 7:
      if(grid[xindex-1][yindex+1].red < this.red-1) {grid[xindex-1][yindex+1].red++;this.red--;}
      else if(grid[xindex-1][yindex+1].green < this.green-1) {grid[xindex-1][yindex+1].green++;this.green--;}
      else if(grid[xindex-1][yindex+1].blue < this.blue-1) {grid[xindex-1][yindex+1].blue++;this.blue--;}
      break;
      case 8:
      if(grid[xindex-1][yindex].red < this.red-1) {grid[xindex-1][yindex].red++;this.red--;}
      else if(grid[xindex-1][yindex].green < this.green-1) {grid[xindex-1][yindex].green++;this.green--;}
      else if(grid[xindex-1][yindex].blue < this.blue-1) {grid[xindex-1][yindex].blue++;this.blue--;}
      break;
      default:
      this.red = int(floor(random(256)));
      this.green = int(floor(random(256)));
      this.blue = int(floor(random(256)));
      break;
    }
  }
  void displer() {
    rectMode(CORNER);
    fill(red,green,blue);
    noStroke();
    rect(xindex*size,yindex*size,size,size);
  }
}
class Brush{
  int red;
  int green;
  int blue;
  int max;
  boolean border;
  boolean random;
  Brush(int r, int g, int b, int m) {
    red = r;
    green = g;
    blue = b;
    max = m;
    border = false;
    random = false;
  }
  void setColor(int r, int g, int b) {red = r; green = g; blue = b;}
  void paint() {
    if(red < 0) {red = 0;}
    if(green < 0) {green = 0;}
    if(blue < 0) {blue = 0;}
    if(red > 255) {red = 255;}
    if(green > 255) {green = 255;}
    if(blue > 255) {blue = 255;}
    if(mousePressed && mouseX >= 0 && mouseX <= width && mouseY >= 0 && mouseY <= height) {
      int x = int(floor(mouseX / (width/max)));
      int y = int(floor(mouseY / (height/max)));
      if(border) {
        grid[x][y].red = 224;
        grid[x][y].green = 210;
        grid[x][y].blue = 54;
        grid[x][y].border = true;
      } 
      else if(random) {
        grid[x][y].red = rng({0,50,100,150,200,255});
        grid[x][y].green = rng({0,50,100,150,200,255});
        grid[x][y].blue = rng({0,50,100,150,200,255});
        grid[x][y].border = false;
      } else {
        grid[x][y].red = this.red;
        grid[x][y].green = this.green;
        grid[x][y].blue = this.blue;
        grid[x][y].border = false;
      }
    }
  }
}
void error(String msg) {
  alert(msg);
}
