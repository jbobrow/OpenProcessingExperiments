
// initial settings 
int viewsize = 420;                           // window size
int n = 70;                                   // number of cells
int types = 3;                                // types of cell 
int threshold = 3;                            // happiness threshold
int step = 50;                                // swaps per frame
int[] colours = {#000088, #ffffff, #b0b0b0,   // default colours
                 #22cc00, #ffee00, #f06060};
boolean paused = true;                        // start paused
boolean showinfo = true;                      // info on screen 
boolean firsttime = true;                     // true at start

int maxTypes = 6;
int minTypes = 1;
int maxThreshold = 8;
int minThreshold = 0;

int[][] people = new int[n][n];               // the grid of cells
int swaps = 0;                                // swap count

PFont font;

void setup(){
  size(420, 420); // size(viewsize, viewsize)
  noStroke();
  font = loadFont("font.vlw");
  textFont(font);
  
  initPeople();
}
      
void draw(){
  drawPeople();  

  if (firsttime) drawHelp();
  if (showinfo)  drawInfobar();
    
  if (!paused){
    for (int i=0; i<step; ++i)
      swapPeople();
    swaps += step;
  }
}

// draw the help prompt if needed
void drawHelp(){
  fill(0, 160);
  rect(width/2-160,height/2-100,320, 200);
  
  fill(255);
  textAlign(CENTER,CENTER);
  text("Click to start.", width/2, height/2-80);
  text("Up/down: change number of types.", width/2, height/2-10);
  text("Left/right: change happiness threshold.", width/2, height/2+10);
  text("Enter: randomise positions.", width/2, height/2+30);
  text("Left button pauses.", width/2, height/2+60);
  text("Right button toggles info bar.", width/2, height/2+80);
}

// draw the information bar if it's on screen.
void drawInfobar(){
  fill(255, 170);
  rect(0,height-20,width,20);

  fill(0);
  textAlign(LEFT);
  text("Swaps: "+swaps, 5, height-5);
  textAlign(RIGHT);
  text("Types: "+types+" Threshold: "+threshold, width-5, height-5);
}

// set up the grid of cells
void initPeople(){
  swaps = 0;
  for (int i=0; i<n; ++i)
    for (int j=0; j<n; ++j)
      people[i][j] = int(random(types));
}

// find two unhappy people, and swap them
void swapPeople(){
  int i = findUnhappy();
  int j = findUnhappy();
  
  if (i==-1)
    return;
    
  int temp = people[i/n][i%n];
  people[i/n][i%n] = people[j/n][j%n];
  people[j/n][j%n] = temp;
}

// find an unhappy cell. return -1 if noone is unhappy.
int findUnhappy(){
  int s = int(random(n*n));
  for (int i=0; i<n*n; ++i){
    int loc = (s+i)%(n*n);
    if (happiness(loc%n, loc/n) < threshold)
      return loc;
    }
  return -1;
}

// calculate the happiness of a particular grid position
int happiness(int x, int y){
  int neighbours[][] = {{-1, -1}, { 0, -1}, { 1, -1},
                        {-1,  0},           { 1,  0},
                        {-1,  1}, { 0,  1}, { 1,  1}};
  
  int count = 0;
  for (int i=0; i<8; ++i){
    int nx = (n + x + neighbours[i][0]) % n;
    int ny = (n + y + neighbours[i][1]) % n;

    if (people[ny][nx] == people[y][x])
          ++count;  
    }
  return count;
}

// draw the grid of people
void drawPeople(){
  int rsize = viewsize/n;
    
  for (int i=0; i<n; ++i)
  for (int j=0; j<n; ++j){
    fill(colours[people[i][j]]);
    rect(rsize*j, rsize*i, rsize, rsize);
    }
}

// left click pauses/unpauses the animation
// right click shows/hides the info bar
void mousePressed(){
  if (mouseButton == LEFT){
    firsttime = false;
    paused = !paused; 
    } 
  if (mouseButton == RIGHT)
    showinfo = !showinfo;
}

// up/down change the number of types
// left/right change the threshold
// enter/return restarts the animation 
// 'p' pauses the animation
void keyPressed(){
  if (key==CODED){
    switch(keyCode){
      case UP:     if (types<maxTypes) {++types; initPeople();} break;
      case DOWN:   if (types>minTypes) {--types; initPeople();} break;
      case RIGHT:  if (threshold<maxThreshold) ++threshold; break;
      case LEFT:   if (threshold>minThreshold) --threshold; break;
    }
  }
  else{
    switch(key){
      case 'p':
      case 'P':    paused = !paused;
                   break;
      case ENTER:
      case RETURN: initPeople(); 
                   break;
     } 
  }
}


