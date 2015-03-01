
int bit = 3;       // size of the blocks, used for position
color c;           // color of blocks
int BI = 0;        // number of block instances
int platNum = 5;   // number of platforms
boolean can = true;
int d = 0;         // variable for randDir()
int i;             // iterator variable
int j;
int k;


// class block array
  
Block[] blocks = new Block[BI];      // block array, starts at size 0, uses append()

// class platform array

Platform[] platforms = new Platform[platNum];

void setup(){
  
  frameRate(20);
  size(600,600);
  colorMode(HSB,360,100,100);    // brighter, better colors
  cursor(CROSS);
  
  for(i=0;i<platNum;i++){
    platforms[i] = new Platform(int(random(150))*bit,int(random(4,8))*bit*20,int(random(10,50))*bit);
  }
}


void draw(){
  noStroke();
  fill(0);
  rect(0,0,600,600);                        // background
  
  if(!mousePressed){
    c = color(int(random(6))*60,99,99);       // new block color, limits to 6 pure colors
  } else if(can == true){
    makeBlock();
    can = false;
  } else {
    can = true;
  }
  for(i=0;i<BI;i++){                        // for each object in the array, call methods  
    
    if(blocks[i].stable == false){  
      blocks[i].update();                   // movement update
    }
    blocks[i].draw();
  }
  
  for(i=0;i<platNum;i++){
    platforms[i].draw();
  }
}

//         //
// CLASSES //
//         //

// class Pixel

class Block {
  int X;                              // x position
  int Y;                              // y position
  color C;                            // color of block
  boolean stable = false;             // bool to limit collision check
  int NB = 100000;                    // stores collision data
  int dir;                            // stores direction data
  int ID;
  
  Block(int x, int y, color shade, int num){
    X = x;
    Y = y;
    C = shade;
    ID = num;
  }
  
  void update(){
    
    if(stable == false){
      
      if(Y==height-bit){                // if colliding with bottom of screen, stop falling
        stable = true;
      }
      
      for(k=0;k<platNum;k++){          // if colliding with a platform, stop falling
        if(Y+bit == platforms[k].Y){
          if(X >= platforms[k].X && X <= (platforms[k].X + platforms[k].size - bit)){
            stable = true;
          }
        }
      }
      
      for(j=0;j<BI;j++){               // checks to see if block is on top of another block
        if(blocks[j].stable == true){
          if((blocks[j].X+bit) == X && blocks[j].Y == Y){
            NB += 10000;
          }
          if((blocks[j].X+bit) == X && (blocks[j].Y-bit) == Y){
            NB += 1000;
          }
          if(blocks[j].X == X && (blocks[j].Y-bit) == Y){
            NB += 100;
          }
          if((blocks[j].X-bit) == X && (blocks[j].Y-bit) == Y){
            NB += 10;
          }
          if((blocks[j].X-bit) == X && blocks[j].Y == Y){
            NB += 1;
          }
        }
      }
    }
    
    if(NB>=100100){
      switch(NB) {                    // checks the collision situation
        
        case 100100:                  // case unstable collision
          dir = randDir();
          X += dir * bit;             // move to left or right
          NB = 100000;
          break;
          
        case 101100:                  // case could be stable R
          dir = int(random(2));
          if(dir==0){
            stable = true;
          } else {
            X += dir * bit;
          }
          NB = 100000;
          break;
          
        case 100110:                  // case could be stable L
          dir = int(random(2));
          if(dir==0){
            stable = true;
          } else {
            X -= dir * bit;
          }
          NB = 100000;
          break;
          
        case 101110:                  // stable cases
        case 111110:
        case 101111:
        case 111111:
          stable = true;
          NB = 100000;
          break;
          
        case 111100:                  // case slope R
          X +=bit;
          NB = 100000;
          break;
          
        case 100111:                  // case slope L
          X -= bit;
          NB = 100000;
          break;
      }
    }
    
    if(stable==false){       // if it isn't immobilised
      Y += bit;
      NB=100000;
    }    
  }
  
  void draw(){
    noStroke();
    fill(C);                                  // draw block at updated position
    rect(X,Y,bit,bit);
  }
}

// class platform

class Platform {
  int X;            // x pos
  int Y;            // y pos
  int size;         // length of platform
  
  Platform(int x, int y, int s){
    X = x;
    Y = y;
    size = s;
  }
  
  void draw(){
    noStroke();
    fill(200);
    rect(X,Y,size,5);
  }
}
  
//                  //
// HELPER FUNCTIONS //
//                  //

// block spawner

void makeBlock(){
  int Xpos = int(mouseX/bit) * bit;
  //int Ypos = int(mouseY/bit) * bit;
  //int pos = int(random(0+5,width/bit-5));    // x spawn location, in block increments
  BI++;                                      // keep track of block numbers
  blocks = (Block[])append(blocks, new Block(Xpos,-bit,c,BI-1));  // add new object to array
}

// random direction

int randDir(){            // generates either a 1 or -1
  d = int(random(-2,2));  // assigns -1, 0, or 1 to d
  while(d==0){               // if d is 0, "reroll" cast, we want 1 or -1
    d = int(random(-2,2));
  }
  return d;             // return 1 or -1
}


