
//Treavor Philyaw
//Ista 301
//Assignment #3

//Variables
Circles[] circArr;
Squares[] squaArr;
color bgCol, bgCol2;
char soc;

void setup() {
  //Setups up the window size, bg color, etc.
  size(500, 300);
  background(132,36,0);
  smooth();
  noStroke();
  
  //Defines the array that holds the different circles
  int aSize = int(random(100));
  circArr = new Circles[aSize];
  for (int x = 0; x< circArr.length; x++) {
    circArr[x] = new Circles();
  }
  
  //Defines the array that holds the different squares
  int bSize = int(random(100));
  squaArr = new Squares[bSize];
  for (int x = 0; x< squaArr.length; x++) {
    squaArr[x] = new Squares();
  }
  
  soc = 's';
  if (random(2) > 1){
    soc = 'c';
  }
  
  //Randomly selects colors for the Outer most 2 aka outer and nucleus.
  bgCol = color(random(255), random(255), random(255));
  bgCol2 = color(random(255), random(255), random(255));
}

//Draws the circles/squares
void draw() {
  //Makes sure circle/square remains don't stick around
  background(132,36,0);
  
  if (soc == 'c'){
    for (int x = 0; x< circArr.length; x++) {
      //Each circle only need be updated once per draw
      circArr[x].updateMe();
      circArr[x].drawMe1();
    }
    for (int x = 0; x< circArr.length; x++) {
      circArr[x].drawMe2();
    }
    for (int x = 0; x< circArr.length; x++) {
      circArr[x].drawMe3();
    }
  }else{
    for (int x = 0; x< squaArr.length; x++) {
      //Each square only need be updated once per draw
      squaArr[x].updateMe();
      squaArr[x].drawMe1();
    }
    for (int x = 0; x< squaArr.length; x++) {
      squaArr[x].drawMe2();
    }
    for (int x = 0; x< squaArr.length; x++) {
      squaArr[x].drawMe3();
    }
  }
}

//Restarting the program completely restarts it, different colors, square or cirlce, etc.
void restart(){
  setup();
}

//Clicking the mouse restarts the program
void mousePressed(){
  restart();
}

class Circles {
  float x, y;
  float xspeed, startx;
  float innerW, nucleusW, outerW;
  float ynoise;
  char updown;
  
  //When a circle is made it is given a start positon, dimensions of circles,
  //speed.
  Circles() {
    float factor = random(50);
    updown = 'd';
    startx = factor;
    //Determines if it starts on top or bottom side of screen
    if (random(2) > 1) { 
      startx = height-startx; 
    }
    //Determines if circle goes left or right on the screen.
    if (random(2) > 1) { 
      updown = 'u'; 
    }
    
    //Movements
    x = height + 50;
    xspeed = 1 + random(3);
    ynoise = random(10);
    
    //Sizes
    innerW = 5+ random((150-factor)/6);
    outerW = 30+ random((150-factor)/4);
    nucleusW = innerW + random(outerW - innerW);
  }
  
  void updateMe() {
    if(updown == 'u'){
      x -= xspeed;
    } else{
      x += xspeed;
    }
    //Noise is a smoother function than random, giving more sequential numbers causing the moving back and forth
    //motion of the circles to be more fluid.
    ynoise += 0.005;
    if (startx < height/2) {
     y = startx + (noise(ynoise) * 100);
    } else {
     y = startx - (noise(ynoise) * 100);
    }
    
    //resets position if off screen
    if(updown == 'u'){
      if (x < -50) { 
        x = width + 50; 
      }
    } else{
      if (x > (width + 50)) { 
        x = -50; 
      }
    }
  }
    
  void drawMe1() {
    fill(bgCol);
    ellipse(x, y, outerW, outerW);
  }
  
  void drawMe2() {
    fill(bgCol2);
    ellipse(x, y, nucleusW, nucleusW);
  }
  
  void drawMe3() {
    fill(255);
    ellipse(x, y, innerW, innerW);
  }
}

class Squares {
  float x, y;
  float yspeed, startx;
  float innerW, nucleusW, outerW;
  float xnoise;
  char updown;
  
  //When a square is made it is given a start positon, dimensions of square,
  //speed.
  Squares() {
    float factor = random(50);
    updown = 'd';
    startx = factor;
    //Determines if it starts on left or right side of screen
    if (random(2) > 1) { 
      startx = width-startx; 
    }
    //Determines if square goes up or down the screen.
    if (random(2) > 1) { 
      updown = 'u'; 
    }
    
    //Movements
    y = height + 50;
    yspeed = 1 + random(3);
    xnoise = random(10);
    
    //Sizes
    innerW = 5+ random((150-factor)/6);
    outerW = 30+ random((150-factor)/4);
    nucleusW = innerW + random(outerW - innerW);
  }
  
  void updateMe() {
    if(updown == 'u'){
      y -= yspeed;
    } else{
      y += yspeed;
    }
    //Noise is a smoother function than random, giving more sequential numbers causing the moving back and forth
    //motion of the squares to be more fluid.
    xnoise += 0.005;
    if (startx < width/2) {
     x = startx + (noise(xnoise) * 100);
    } else {
     x = startx - (noise(xnoise) * 100);
    }
    
    //resets position if off screen
    if(updown == 'u'){
      if (y < -50) { 
        y = height + 50; 
      }
    } else{
      if (y > (height + 50)) { 
        y = -50; 
      }
    }
  }
    
  void drawMe1() {
    fill(bgCol);
    rect(x, y, outerW, outerW);
  }
  
  //x or y + (The different of the widths of the biggest square and the square we are trying to center over 2)
  //will center that square. Biggest = 100 Center = 20 x = 0 y = 0,  100-20 = 80 / 2 = 40. Creating a 20x20
  //square at 40,40 will put a centered square inside one that is 100x100 at 0,0.
  void drawMe2() {
    fill(bgCol2);
    rect(x + ((outerW-nucleusW)/2), y + ((outerW-nucleusW)/2), nucleusW, nucleusW);
  }
  
  void drawMe3() {
    fill(255);
    rect(x + ((outerW-innerW)/2), y + ((outerW-innerW)/2), innerW, innerW);
  }
}


