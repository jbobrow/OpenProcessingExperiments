
//------------------------------------------------------//
//-----------------GLOBAL CONSTANTS---------------------//
//------------------------------------------------------//
int cols = 12;                // number of columns of city blocks
int rows = 6;                // number of rows of city blocks
int sizeOfBlock = 61;        // how many pixels wide is one block
int startPedestrians = 350;   // how many pedestrians will we start with
int maxPedestrians = 10000;    // how many pedestrians will we go through
int Delays = 100;             // max random delay between adding Pedestrians
float startWander = .5;      // how far from the block hub can they be placed initialy
float defaultSpeed = 7.0;   // reference velocity
int WalkingTrail = 8;

String Picture = "northwestern.png";

int numPedestrians = 0;      // keep track of how many pedestrians there have been
int numPal = 0;              // colors added to the pallate thus far

//------------------------------------------------------//
//-----------------GLOBAL VARIABLES---------------------//
//------------------------------------------------------//
float[] BlocksArray = new float[cols*rows];
int[] BlocksPop = new int[cols*rows];
Pedestrian[] peds = new Pedestrian[maxPedestrians];
color[] pallate = new color[cols*rows];

//------------------------------------------------------//
//----------------------SETUP---------------------------//
//------------------------------------------------------//
void setup() {  

  background(255);
  //size(cols*sizeOfBlock, rows*sizeOfBlock);
  size(732,366);
  smooth();
  takecolor(Picture);
  background(255);


  // Set up the probability array for destinations
  BlocksArray[0] = sqrt(sqrt(random(0.001, 10)));
  for (int i=1; i<(cols*rows); i=i+1) {
    BlocksArray[i] = sqrt(sqrt(random(0.0, 10)))+BlocksArray[i-1];
  }
  for (int i=0; i<(cols*rows); i=i+1) {
    BlocksArray[i] = BlocksArray[i]/BlocksArray[rows*cols-1];
  }
  // Set up the Array to keep track of populations
  for (int i=0; i<(cols*rows); i=i+1) {
    BlocksPop[i] = 0;
  }
  for (int i = 0; i < startPedestrians; i++) {
    peds[i] = new Pedestrian();
  }
  //noLoop();
}

//------------------------------------------------------//
//-----------------DRAW (iterate)-----------------------//
//------------------------------------------------------//
void draw() {
  

  noStroke();
  fill(255, 255);
  rect(0, 0, width, height);

  int count;
  for ( int jk = 0; jk<10; jk++) {
    count = floor(random(0, Delays));
    if ((count%Delays == 0)&&(numPedestrians<maxPedestrians)) {
      peds[numPedestrians] = new Pedestrian();
    }
  }

  for (int k = 0; k < numPedestrians; k++) {
    peds[k].update();
    peds[k].display();
  }
  
  //println(peds[0].PastPositions.D);
}


//------------------------------------------------------//
//-----------------PEDESTRIAN CLASS---------------------//
//------------------------------------------------------//
class Pedestrian {

  PVector Origin_Block;
  PVector Destination_Block;
  PVector Position_Coords;
  PVector Position_Block;// = new PVector(0, 0);
  //PVector Velocity_Coords;// = new PVector(0, 0);
  int Visibility;
  PVector[] Pasts;

  // Constructor
  Pedestrian() {
    Visibility = 1;
    numPedestrians = numPedestrians+1;
    Origin_Block = findBlock(random(0, 1));
    Position_Block = Origin_Block;
    BlocksPop[Block2index(Position_Block)] = BlocksPop[Block2index(Position_Block)]+1; 
    Destination_Block = findBlock(random(0, 1));
    while ( (Origin_Block.x==Destination_Block.x)&&(Origin_Block.y==Destination_Block.y)) {
      Destination_Block = findBlock(random(0, 1));
    }
    Position_Coords = Block2Coords(Origin_Block);
    Position_Coords.x = Position_Coords.x+floor(startWander*(.5*(random(-sizeOfBlock, sizeOfBlock))));
    Position_Coords.y = Position_Coords.y+floor(startWander*(.5*(random(-sizeOfBlock, sizeOfBlock))));
    Pasts = new PVector[WalkingTrail];
    for (int i=0; i<WalkingTrail; i++){
      Pasts[i] = new PVector(Position_Coords.x,Position_Coords.y,0);
    }
 
  }

  void update() {

    // determine block vector for travels ahead
    PVector TravelsAhead;
    TravelsAhead = new PVector(0, 0, 0);
    TravelsAhead.x = Destination_Block.x - Position_Block.x;
    TravelsAhead.y = Destination_Block.y - Position_Block.y;

    PVector Velocity_Coords;
    Velocity_Coords = new PVector(0, 0, 0);

    // determine if you have an option for direction
    if ((TravelsAhead.x==0)&&(TravelsAhead.y==0)) {  //in correct block
      if (Visibility==1) {
        BlocksPop[Block2index(Position_Block)] = BlocksPop[Block2index(Position_Block)]-1;
        if (numPedestrians<maxPedestrians) {
          peds[numPedestrians] = new Pedestrian();
        }
      }
      Visibility = 0;
      Velocity_Coords.x = 0;
      Velocity_Coords.y = 0;
    } 
    else if (TravelsAhead.x==0) {                // in correct col... move up/down only
      int Vsign;
      Velocity_Coords.x = 0;
      if (TravelsAhead.y>0) {
        Vsign = 1;
      } 
      else {
        Vsign = -1;
      }
      Velocity_Coords.y = (Vsign*defaultSpeed)/sqrt(BlocksPop[Block2index(Position_Block)]+1);
    } 
    else if (TravelsAhead.y==0) {                // in correct row... move left/right only
      int Hsign;
      Velocity_Coords.y = 0;
      if (TravelsAhead.x>0) {
        Hsign = 1;
      } 
      else {
        Hsign = -1;
      }
      Velocity_Coords.x = (Hsign*defaultSpeed)/sqrt(BlocksPop[Block2index(Position_Block)]+1);
    } 
    else {
      PVector HorizB = new PVector(0, 0);
      PVector VertB = new PVector(0, 0);

      float HorizV;
      float VertV;
      int Hsign;
      int Vsign;

      if (TravelsAhead.x > 0) {
        float[] vvh = {
          Position_Block.x + 1, Position_Block.y, 0
        };
        HorizB.set(vvh);
        Hsign = 1;
      } 
      else {
        float[] vvh = {
          Position_Block.x - 1, Position_Block.y, 0
        };
        HorizB.set(vvh);
        Hsign = -1;
      }
      if (TravelsAhead.y > 0) {
        float[] vvv = {
          Position_Block.x, Position_Block.y + 1, 0
        };
        VertB.set(vvv);
        Vsign = 1;
      } 
      else {
        float[] vvv = {
          Position_Block.x, Position_Block.y - 1, 0
        };
        VertB.set(vvv);
        Vsign = -1;
      }
      HorizV = defaultSpeed/sqrt(BlocksPop[Block2index(HorizB)]+3);
      VertV = defaultSpeed/sqrt(BlocksPop[Block2index(VertB)]+3);

      if (HorizV > VertV) {
        Velocity_Coords.x = (defaultSpeed*Hsign)/sqrt(BlocksPop[Block2index(Position_Block)]+1);
        Velocity_Coords.y = 0;
      } 
      else {
        Velocity_Coords.x = 0;
        Velocity_Coords.y = (defaultSpeed*Vsign)/sqrt(BlocksPop[Block2index(Position_Block)]+1);
      }
    }
    
    for (int i = (WalkingTrail - 1); i>0; i--){
      Pasts[i].set(Pasts[i-1]);
    }
    Pasts[0].set(Position_Coords);

    Position_Coords.add(Velocity_Coords);
    Position_Coords.x = min(width-1, Position_Coords.x);
    Position_Coords.x = max(0, Position_Coords.x);
    Position_Coords.y = min(height-1, Position_Coords.y);
    Position_Coords.y = max(0, Position_Coords.y);
         
    

    PVector OldHome;
    OldHome = Position_Block;
    Position_Block = Coords2Block(Position_Coords);
    if (!((OldHome.x == Position_Block.x)&&(OldHome.y == Position_Block.y))) {
      BlocksPop[Block2index(Position_Block)] = BlocksPop[Block2index(Position_Block)]+1;
      BlocksPop[Block2index(OldHome)] = BlocksPop[Block2index(OldHome)]-1;
    }
  }

  void display() {
    color c;
    color c2;
    // use Block2Index to take Origin_Block to an integer
    // find stroke values for that integer
    c = pallate[Block2index(Origin_Block)];
    c2 = color (red(c),green(c),blue(c),100);
    //stroke(red(c), green(c), blue(c));
    stroke(c);
    fill(c);
    
    if (Visibility == 1) {
      
      for(int i=0; i<WalkingTrail; i++){
        PVector Now;
        Now = Pasts[i];
        if(i==1){
          fill(c2);
          stroke(c2);
        }
          
        ellipse(Now.x,Now.y,4 / (1 + float(i)/4),4 / (1 + float(i)/4));
      }
      
    }
  }
}

//------------------------------------------------------//
//-----------------GLOBAL  FUNCTIONS--------------------//
//------------------------------------------------------//

//map 0-1 float to a block number.... outputs [col] [row]
PVector findBlock(float rand) {
  int i=0;
  PVector out;
  out = new PVector(0, 0);
  int[] outputs = new int[2];
  while (BlocksArray[i]<rand) {
    i=i+1;
  }
  out.x = floor(i/rows);
  out.y = (i%rows);
  return out;
}

// convert a "Block Coordinate" vector to a raw canvas coordinate number (of midpoint)
PVector Block2Coords(PVector Block) {
  float Midway = (sizeOfBlock-1)/2;
  PVector out;
  out = new PVector(0, 0);
  out.x = Midway + Block.x*sizeOfBlock;
  out.y = Midway + Block.y*sizeOfBlock;
  return out;
}

// convert a raw canvas coordinate to a "Block coordinate"
PVector Coords2Block(PVector P) {
  PVector B_out;
  B_out = new PVector(0, 0);
  B_out.x = floor(P.x/sizeOfBlock);
  B_out.y = floor(P.y/sizeOfBlock);
  return B_out;
}

// Convert a Block Coordinate to its array index as in BlocksPop
int Block2index(PVector B) {
  return  floor(((B.x) * rows) + B.y);
}

// Grab a color scheme from some outside image
void takecolor(String fn) {
  PImage b;
  b = loadImage(fn);
  image(b, 0, 0);
  //fill(255);
  //rect(0, 0, width, height);

  while (numPal< (rows*cols - 1)) {
    int x = floor(random(0, b.width));
    int y = floor(random(0, b.height));
    color c = get(x, y);

    boolean exists = false;
    for (int n=0;n<numPal;n++) {
      if (c==pallate[n]) {
        exists = true;
        break;
      }
    }

    if (!exists) {
      // add color to pal
      if (numPal<(rows*cols)) {
        pallate[numPal] = c;
        numPal++;
      }
    }
  }
}


