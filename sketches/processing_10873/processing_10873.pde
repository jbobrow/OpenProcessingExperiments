
/**
 * 
 * I used Conway's Game of Life source code by Mike Davis to develop this code. 
 * Proposal to develop a simulation of Forest Fire Propagation with fuel and air parameters. 
 * The terrain is randomised to have 5 types of fuels.
 * Type of forest : propagation percentage
 * Conifers : 58.9% : color(190,204,91)
 * Transtionals : 23.3% : color(168,192,20)
 * Mix Wood : 13.2% : color(85,101,39)
 * Decidious : 4.5% : color(110,80,42)
 * Burnt / inflamable terrain : 0% :  color(48,48,48)
 * Wind speed and directions: 
 * 1-20 mph : ok
 * 20-25 mph : fast propagation with spot fires
 * The land is with grass and the user clicks to set a fire on the land. The fire propagation is simulated accordingly.
 */

int [][] grid, futureGrid;  // asigns 2 arrays 
int a = 0;
int b = 0;
int tempx = 0;
int tempy = 0;
color mwfuel, tranfuel, conifuel, decifuel, burnt, bfire, fire;    //color of different fuel types
int terrain = 0;
int E = int(random(1,100));
int windd = 0;
int wspeed = 0;
int xt = 0;
String direc;
int spread = 0;
int spoty = 0;
int spotx = 0;

void setup() {
  wspeed = int(random(1,25));
  background(0);
  mwfuel = color(190,204,91);
  tranfuel = color(168,192,20);
  conifuel = color(85,101,39);
  decifuel = color(110,80,42);
  burnt = color(48,48,48);
  bfire = color(192,64,0);
  fire = color(255,96,0);
  size(800,600);
  frameRate(8);                  // can change the value to slow the simulation
  grid = new int[width/2][height];
  futureGrid = new int[width/2][height];
  for (int i=0; i<width/2;i++){        // sets the whole terrain to 0 indicating that this pixel did not catch fire
    for (int j=0; j<height;j++){
      grid[i][j] = 0;
      terrain = int(random(1,5));
      switch(terrain) {
      case 1:
        set(i,j,mwfuel);
        break;
      case 2:
        set(i,j,tranfuel);
        break;
      case 3:
        set(i,j,conifuel);
        break;
      case 4:
        set(i,j,decifuel);
        break;
      }
    }
  }
  windd = int(random(1,5));
  switch (windd) {
  case 1:
    direc = "North";
    break;
  case 2:
    direc = "South West";
    break;
  case 3:
    direc = "West";
    break;
  case 4:
    direc = "North West";
    break;
  }
}

void draw() {
  if (xt<wspeed) {
    xt++;
  }
  if (xt>wspeed) {
    xt--;
  }
  if (xt==wspeed) {
    wspeed = int(random(1,25));
  }
  if ((xt>10)&&(xt<15)) {
    spread = 1;
  }
  if ((xt>=15)&&(xt<20)) {
    spread = 2;
  }
  if (xt>=20) {
    spread = 3;
  }
  legend();
  if (mousePressed == true) {    
    a = mouseX;
    b = mouseY;
    if ((a>1) && (a<width/2)) {      // sets no error if the mouse pressed location is beyond the screen
      if ((b>1) && (b<height-1)) {
        set(a,b,fire);               // sets fire to the location where mouse is pressed.
        grid[a][b] = 1;              // sets the pixel to 1 to indicate fire.
      }
    }
  }

  for (int x=1;x<width/2; x++){
    for (int y=1; y<height-1;y++){
      int nb = neighbors(x,y);
      if ((grid[x][y] == 0)&&(nb == 0)){           //current is green and neighbours are green
        futureGrid[x][y] = 0;     
      }
      else if ((grid[x][y] == 0) && (nb != 0) && (get(x,y) == mwfuel) && (E<59)) {    //current is mix wood and neighbours are lit : start fire with 58% chances
        set(x,y,fire);
        futureGrid[x][y] = 1; 
        if(windd == 1) {
          if((y-spread>0)&&(y-spread<height)){
            for(int w=0;w<=spread;w++) {
              set(x,y-w,fire);
              futureGrid[x][y-w] = 1;
            }
            int tempy = int(random(1,y));
            if (spread == 3) {
              if (tempy<5) {
                tempy = int(random(1,y));
                set(x,tempy,fire);
                grid[x][tempy]=1;
              }
            }
          }
        }

        if(windd ==2) {
          if((x-spread>0)&&(x-spread<width/2)) {
            if((y+spread>0)&&(y+spread<height)){
              for(int w=0;w<=spread;w++) {
                set(x-w,y+w,fire);
                futureGrid[x-w][y+w] = 1;
              }
            }
          }
        }
        if(windd ==3){
          if((x-spread>0)&&(x-spread<width/2)) {
            for(int w=0;w<=spread;w++) {
              set(x-w,y,fire);
              futureGrid[x-w][y] = 1;
            }
          }
        }

        if(windd ==4) {
          if((x-spread>0)&&(x-spread<width/2)) {
            if((y-spread>0)&&(y-spread<height)){
              for(int w=0;w<=spread;w++) {
                set(x-w,y-w,fire);
                futureGrid[x-w][y-w] = 1;
              }
            }
          }
        }
      }
      E = int(random(1,100));
      if ((grid[x][y] == 0) && (nb != 0) && (get(x,y) == tranfuel) && (E<23)) {    //current is transitional forest and neighbours are lit : start fire with 23% chances
        set(x,y,fire);
        futureGrid[x][y] = 1;
        if(windd == 1) {
          if((y-spread>0)&&(y-spread<height)){
            for(int w=0;w<=spread;w++) {
              set(x,y-w,fire);
              futureGrid[x][y-w] = 1;
            }
          }
        }
        if(windd ==2) {
          if((x-spread>0)&&(x-spread<width/2)) {
            if((y+spread>0)&&(y+spread<height)){
              for(int w=0;w<=spread;w++) {
                set(x-w,y+w,fire);
                futureGrid[x-w][y+w] = 1;
              }
            }
          }
        }
        if(windd ==3){
          if((x-spread>0)&&(x-spread<width/2)) {
            for(int w=0;w<=spread;w++) {
              set(x-w,y,fire);
              futureGrid[x-w][y] = 1;
            }
          }
        }
        if(windd ==4) {
          if((x-spread>0)&&(x-spread<width/2)) {
            if((y-spread>0)&&(y-spread<height)){
              for(int w=0;w<=spread;w++) {
                set(x-w,y-w,fire);
                futureGrid[x-w][y-w] = 1;
              }
            }
          }
        }  
      }
      E = int(random(1,100));
      if ((grid[x][y] == 0) && (nb != 0) && (get(x,y) == conifuel) && (E<14)){    //current is conifer forest and neighbours are lit : start fire with 13% chances
        set(x,y,fire);
        futureGrid[x][y] = 1; 
        if(windd == 1) {
          if((y-spread>0)&&(y-spread<height)){
            for(int w=0;w<=spread;w++) {
              set(x,y-w,fire);
              futureGrid[x][y-w] = 1;
            }
          }
        }
        if(windd ==2) {
          if((x-spread>0)&&(x-spread<width/2)) {
            if((y+spread>0)&&(y+spread<height)){
              for(int w=0;w<=spread;w++) {
                set(x-w,y+w,fire);
                futureGrid[x-w][y+w] = 1;
              }
            }
          }
        }
        if(windd ==3){
          if((x-spread>0)&&(x-spread<width/2)) {
            for(int w=0;w<=spread;w++) {
              set(x-w,y,fire);
              futureGrid[x-w][y] = 1;
            }
          }
        }
        if(windd ==4) {
          if((x-spread>0)&&(x-spread<width/2)) {
            if((y-spread>0)&&(y-spread<height)){
              for(int w=0;w<=spread;w++) {
                set(x-w,y-w,fire);
                futureGrid[x-w][y-w] = 1;
              }
            }
          }
        } 
      }
      E = int(random(1,100));
      if ((grid[x][y] == 0) && (nb != 0) && (get(x,y) == decifuel) && (E<5)) {    //current is decidious forest and neighbours are lit : start fire with 4% chances
        set(x,y,fire);
        futureGrid[x][y] = 1;
        if(windd == 1) {
          if((y-spread>0)&&(y-spread<height)){
            for(int w=0;w<=spread;w++) {
              set(x,y-w,fire);
              futureGrid[x][y-w] = 1;
            }
          }
        }
        if(windd ==2) {
          if((x-spread>0)&&(x-spread<width/2)) {
            if((y+spread>0)&&(y+spread<height)){
              for(int w=0;w<=spread;w++) {
                set(x-w,y+w,fire);
                futureGrid[x-w][y+w] = 1;
              }
            }
          }
        }
        if(windd ==3){
          if((x-spread>0)&&(x-spread<width/2)) {
            for(int w=0;w<=spread;w++) {
              set(x-w,y,fire);
              futureGrid[x-w][y] = 1;
            }
          }
        }
        if(windd ==4) {
          if((x-spread>0)&&(x-spread<width/2)) {
            if((y-spread>0)&&(y-spread<height)){
              for(int w=0;w<=spread;w++) {
                set(x-w,y-w,fire);
                futureGrid[x-w][y-w] = 1;
              }
            }
          }
        }   
      }
      else if ((grid[x][y] == 1) && (nb == 0)){    //current is lit and neighbours are green
        set(x,y,bfire);
        futureGrid[x][y] = -1; 
      }
      else if ((grid[x][y] == 1) && (nb != 0)) {    //current is lit and neighbours are also lit
        set(x,y,bfire);
        futureGrid[x][y] = -1;  
      }
      else if ((grid[x][y] == -1) && (nb == 0)){   //current is ash and neighbours are green
        set(x,y,burnt);
        futureGrid[x][y] = -1;  
      }
      else if ((grid[x][y] == -1) && (nb != 0)){    //current is ash and neighbours are lit
        set(x,y,burnt);
        futureGrid[x][y] = -1;   
      }
    }
  }
  // swap current and future grid
  int[][] temp = grid;
  grid = futureGrid;
  futureGrid = temp;
}

//count the number of adjacent cells 'on'
int neighbors(int x,int y) {
  int north = (y+height-1) % height;
  int south = (y+1) % height;
  int east = (x+1) % (width/2);
  int west = ((x+width/2) -1) % (width/2);
  return grid[x][north] +      // North 
  grid[east][north] +   // NorthEast
  grid[east][y] +       // East
  grid[east][south] +   // SouthEast
  grid[x][south] +      // South
  grid[west][south] +   // SouthWest
  grid[west][y] +       // West
  grid[west][north];    // NorthWest
}

void legend() {
  PFont font;
  fill(255,0,255);
  font = loadFont("BankGothicBT-Medium-15.vlw"); 
  textFont(font); 
  String s = "Forest Fire Propagation";
  text(s, (((3*width) - (2*textWidth(s)))/4), 10, textWidth(s), 170);
  s = "Click to set a forest fire.";
  text(s, (((3*width) - (2*textWidth(s)))/4), 25, textWidth(s), 170);
  text("Legend: ", width/2+25,45,400,70);
  fill(mwfuel);
  rect(width/2+25,60,15,15);
  text("Conifers", width/2+50,67,400,70);
  fill(tranfuel);
  rect(width/2+25,80,15,15);
  text("Transitional", width/2+50,87,400,70);
  fill(conifuel);
  rect(width/2+25,100,15,15);
  text("Mix Wood", width/2+50,107,400,70);
  fill(decifuel);
  rect(width/2+25,120,15,15);
  text("Decidious", width/2+50,127,400,70);
  fill(burnt);
  rect(width/2+25,140,15,15);
  text("Burnt", width/2+50,147,400,70);
  fill(bfire);
  rect(width/2+25,160,15,15);
  text("Burning", width/2+50,167,400,70);
  fill(fire);
  rect(width/2+25,180,15,15);
  smooth();
  text("Fire", width/2+50,187,400,70);  
  strokeWeight(3);
  stroke(10,10,255);
  noFill();
  int circlex = (width-int(textWidth(s)/3));
  int circley = 80;
  int circledia = 80;
  int px = 0;
  int py = 0;
  px = circlex + int(cos(radians(45))*(circledia/2));
  py = circley + int(sin(radians(45))*(circledia/2));
  if (windd == 1) {
    text(direc,(width-int(textWidth(s)/3)-int(textWidth(direc)/2)),140,200,70);
    ellipse (circlex,circley,circledia-10,circledia-10);
    strokeWeight(1);
    ellipse (circlex,circley,circledia,circledia);
    stroke(255,0,0);
    fill(90,90,155);
    quad(circlex,circley,circlex-3,circley-(circledia/4),circlex,circley-(circledia/2),circlex+3,circley-(circledia/4));
    noStroke();
  }
  else if (windd == 2) {
    text(direc,(width-int(textWidth(s)/3)-int(textWidth(direc)/2)),140,200,70);
    ellipse (circlex,circley,circledia-10,circledia-10);
    strokeWeight(1);
    ellipse (circlex,circley,circledia,circledia);
    stroke(255,0,0);
    fill(90,90,155);
    quad(circlex,circley,circlex-22,circley+9,circlex-37,circley+23,circlex-19,circley+14);
    noStroke();
  }
  else if (windd == 3) {
    text(direc,(width-int(textWidth(s)/3)-int(textWidth(direc)/2)),140,200,70);
    ellipse (circlex,circley,circledia-10,circledia-10);
    strokeWeight(1);
    ellipse (circlex,circley,circledia,circledia);
    stroke(255,0,0);
    fill(90,90,155);
    quad(circlex,circley,circlex-(circledia/4),circley-3,circlex-(circledia/2),circley,circlex-(circledia/4),circley+3);
    noStroke();
  }
  else  {
    text(direc,(width-int(textWidth(s)/3)-int(textWidth(direc)/2)),140,200,70);
    ellipse (circlex,circley,circledia-10,circledia-10);
    strokeWeight(1);
    ellipse (circlex,circley,circledia,circledia);
    stroke(255,0,0);
    fill(90,90,155);
    quad(circlex,circley,circlex-19,circley-14,circlex-37,circley-23,circlex-22,circley-9);
    noStroke();
  }
  noStroke();
  noFill();
  String windspeed = ("Wind Speed : "+xt+" .");
  fill(0);
  rect((13*width)/14,circley+circledia-10,40,20);
  fill(255,10,255);
  stroke(255,10,255);
  text(windspeed, (4*width)/5 ,circley+circledia,400,70);
  fill(0);
  stroke(0);
  noFill();
  noStroke();
}

