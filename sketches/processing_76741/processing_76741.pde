
//evolving grids

import toxi.processing.*;
import toxi.geom.*;



//helper class for drawing
ToxiclibsSupport gfx;


//fitness data
float fThreshold; //holds best collision count 
float gr1CC;
float gr2CC;
float gr3CC;
float gr4CC;
float genCount = 1;
float genLength = 1000;

//world dims
int worldDim = 500;
Vec2D origin = new Vec2D (worldDim/2, worldDim/2);

//offset from world edges
float offset= 10;

//dimension of grid
float gridSize = (worldDim -(3*offset))/2;

//agent props
float agentDia = 5;
float maxSpeed = .9;


//grid spacing
float gridRes = 5;
float gridSpacing = agentDia*3;
float squareSize =gridSize/((gridRes -3)*gridSpacing);
float sqCentre = squareSize/2;
//steps between centres of squares
int gridStep = floor(gridSpacing + sqCentre);



//4 x centroids for Grids
Vec2D topleft =new Vec2D(offset + gridSize/2, offset + gridSize/2);
Vec2D topright = new Vec2D (worldDim - offset - gridSize/2, offset + gridSize/2);
Vec2D bottomleft = new Vec2D(offset + gridSize/2, worldDim - offset - gridSize/2);
Vec2D bottomright = new Vec2D(worldDim - offset - gridSize/2, worldDim - offset - gridSize/2);

//need the topleft hand corners for each grid object
Vec2D topleftG = new Vec2D (offset + sqCentre , offset + sqCentre);
Vec2D toprightG = new Vec2D ((worldDim-gridSize - offset) + sqCentre , offset + sqCentre);
Vec2D bottomleftG = new Vec2D (offset + sqCentre , (worldDim - gridSize - offset) - sqCentre);
Vec2D bottomrightG = new Vec2D ((worldDim - gridSize- offset) + sqCentre ,(worldDim - gridSize- offset) - sqCentre);


//current population
ArrayList<Grid> gridPop = new ArrayList<Grid>();

ArrayList<Agent> agentPop = new ArrayList<Agent>();



void setup() {

  //2d environment
  size(worldDim, worldDim);
  background(255);
  
  gfx=new ToxiclibsSupport(this);
  
  //spawn initial agents at centre of 4 grids
  Agent agent1 = new Agent(topleft,new Vec2D(random(-worldDim,worldDim),random(-worldDim,worldDim)));
  Agent agent2 = new Agent(topright,new Vec2D(random(-worldDim,worldDim),random(-worldDim,worldDim)));
  Agent agent3 = new Agent(bottomleft,new Vec2D(random(-worldDim,worldDim),random(-worldDim,worldDim)));
  Agent agent4 = new Agent(bottomright,new Vec2D(random(-worldDim,worldDim),random(-worldDim,worldDim)));
  agentPop.add(agent1);
  agentPop.add(agent2);
  agentPop.add(agent3);
  agentPop.add(agent4);
  
  

  //build intial grids in at 4 centroids
  Grid g1 = new Grid(topleftG);
  Grid g2 = new Grid(toprightG);
  Grid g3 = new Grid(bottomleftG);
  Grid g4 = new Grid(bottomrightG);
  gridPop.add(g1);
  gridPop.add(g2);
  gridPop.add(g3);
  gridPop.add(g4);
  
}

void draw() {
  background(255);
  
  println(frameRate);

  //loop through agents and run functions
  for (Agent a : agentPop) {
    a.run();
   }
  //loop through population of grid and run functions
  for (Grid g : gridPop) {
    g.run();
   
  }

   //eval();
  
    
    //respawn population using fittest grid, square rotation values
    
  }//-------------------------------------------------------end draw


  //mutate 4x newly create grid based on fit parent grid
  //mutate random quadrant of each grid- to maintain potential of good schemas

 


void eval() {
  //if performance period over, start evolution
  if (frameCount % genCount * 1000 == 1) {
    //evaluate fitness
    for (Grid gtest : gridPop) {
      gtest.testSelf();
    }
  }
}


