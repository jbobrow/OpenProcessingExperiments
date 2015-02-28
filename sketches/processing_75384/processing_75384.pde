
import peasy.*;
PeasyCam cam;

PMatrix3D currCameraMatrix;
PGraphics3D g3; 

import processing.opengl.*;

AgentMaster master = new AgentMaster(1);
CubicPatch agentCube = new CubicPatch(10, 10, 10, 40);
ConnManager conman = new ConnManager();
Markov chain = new Markov();


void setup()
{
  size(1000,1000,OPENGL);
  background(255);  
    
  g3 = (PGraphics3D)g;
  cam = new PeasyCam(this, 0, 0, 0, 650);
  cam.setMinimumDistance(400);
  cam.setMaximumDistance(3000);
  
  agentCube.setupPatch();
  master.createPopulation(50);
  master.placePopulation(5,5,5, 10,10,10);
}


void draw()
{
  background(255);
  //println(frameCount);
  //frameRate(2);
  
  pushMatrix();
  
  //rotateX(-PI/8);
  //rotateY(PI/6);
  
  rotateX(-PI/8-PI/4);
  translate(0,0,-50);
  
  translate(-250, -250, 0);
  
  strokeWeight(2);
  //right
  stroke(84,69,150);
  line(5*40,5*40,5*40, 10000,5*40,5*40);
  //down
  stroke(237,109,28);
  line(5*40,5*40,5*40, 5*40,10000,5*40);
  //forward
  stroke(229,207,0);
  line(5*40,5*40,5*40, 5*40,5*40,-10000);
  
  agentCube.drawPatch();
  conman.drawLines();
  if(frameCount%master.agentFrameRate == 0) master.stepPopulation(agentCube);
  master.drawPopulation(agentCube);
  
  popMatrix();
}


void keyPressed()
{
  saveFrame(); 
}
class Agent
{
  int startLoc, currLoc, prevLoc;
  int currState = 0;
  int startState;
  int stepCount = 0;
  
  Agent()
  {
    currState = chain.getFirstState();
    startState = currState;
  }
  
  void firstStep(CubicPatch locations)
  {
    for(int i=0; i<locations.loc[currLoc].nCount; ++i)
    {
      if(locations.loc[currLoc].neighbourDir[i] == currState)
      {
        currLoc = locations.loc[currLoc].neighbours[i];
      }
    }
  }
  
  void step(CubicPatch locations)
  {
    stepCount++;
    if(stepCount == 7)
    {
      currLoc = startLoc;
      currState = startState;
      firstStep(locations);
      stepCount = 0; 
    }
    
    float probability = (1.0/locations.loc[currLoc].nCount);
    float decision = random(0,1);
    boolean found = false;
    
    for(int i=0; i<locations.loc[currLoc].nCount; ++i)
    {
      if(decision >= i*probability && decision <= (i+1)*probability && found == false)
      {
        locations.loc[currLoc].occupancy++;
        
        int lineIndex = locations.loc[currLoc].neighbourLines[i];  
        ConnLine currLine = (ConnLine) conman.connections.get(lineIndex);
        currLine.movement++;
        currLine.display = true;
        conman.connections.set(lineIndex, currLine);
        
        prevLoc = currLoc;
        currLoc = locations.loc[currLoc].neighbours[i];
        
        found = true;
      }
    }   
  }
  
  
  void markovStep(CubicPatch locations)
  {
    //the agent will take a defined number of steps, 
    //then it goes back to its origin and starts anew
    stepCount++;
    if(stepCount == 7)
    {
      currLoc = startLoc;
      stepCount = 0; 
    }
    
    //as in the step function, the variable decision serves to decide
    //for the following state
    float decision = random(0,1);
    float decisionPos = 0.0;
    boolean found = false;
    
    //loop through all neighbours of the current location
    println("_____________________nCount = " + locations.loc[currLoc].nCount);
    for(int i=0; i<locations.loc[currLoc].nCount; ++i)
    {
      //find the transition probability to the each neighbour, based on the current state
      //within the class Markov, getVal retrieves the probability, based on the entered values:
      //the current state and the direction of the neighbour are needed,
      //as the states and probabilities correspond to the directions
      float currProbability = chain.getVal(currState, locations.loc[currLoc].neighbourDir[i]);
      //println(currProbability);
      println("i = " + i);
      println("locations.loc[currLoc].neighbourDir[i] = " + locations.loc[currLoc].neighbourDir[i]);
      println("found = " + found);
      println("decisionPos = " + decisionPos);
      //println(currState);
      //println(locations.loc[currLoc].neighbourDir[i]);
      //println(currProbability);
      
      //in each iteration of the for loop the value of decisionPos equals the sum 
      //of the probabilities of the previous neighbours
      //for each neighbour, the condition checks whether the decision value lies 
      //within a range that equals the transition probability to this neighbour
      //the lower boundary of the range is the current decisionPos
      //the upper boundary of the range is the current cecisionPos, raised by the currentProbability
      if(decision >= decisionPos && decision <= decisionPos+currProbability && found == false)
      {
        //if the decision value lies within the range, do the following:
        
        //raise the occupancy count of the current location by one
        locations.loc[currLoc].occupancy++;
        
        //find the index of the line that leads to the chosen neighbour
        int lineIndex = locations.loc[currLoc].neighbourLines[i]; 
        //get the line from the connections array
        ConnLine currLine = (ConnLine) conman.connections.get(lineIndex);
        //increase the movement value of the line by one
        currLine.movement++;
        //set the boolean display of the line to true - line will now be drawn
        //this way, the lines are only drawn once they have been passed once
        currLine.display = true;
        //set the line in the connections array
        conman.connections.set(lineIndex, currLine);
        
        //the current state becomes the direction that is taken towards the next neighbour
        currState = locations.loc[currLoc].neighbourDir[i];
        
        //the previous location becomes the current location
        prevLoc = currLoc;
        //the current location becomes the location of the next neighbour
        currLoc = locations.loc[currLoc].neighbours[i];
        
        found = true;
      }
      
      decisionPos += currProbability;
    }   
  }
  
  
  void draw(CubicPatch locations)
  {
    PVector tempPos = locations.loc[currLoc].pos;
    
    fill(255,0,0);
    noStroke();
    
    pushMatrix();
    translate(tempPos.x, tempPos.y, tempPos.z);
    sphere(6);
    popMatrix();
  }
}
class AgentMaster
{
  Agent[] population;
  int agentFrameRate;
  
  AgentMaster(int agentF)
  {
    agentFrameRate = agentF;
  }
 
  void createPopulation(int numAg)
  {
    population = new Agent[numAg];
    for(int i=0; i<numAg; ++i)
    {
      population[i] = new Agent(); 
    }
  }
 
  //function to place a population within a cubic patch
  //the position within the cube and the dimensions of the cube are entered
  void placePopulation(int i, int j, int k, int a, int b, int c)
  {
    for(int l=0; l<population.length; ++l)
    {
      population[l].currLoc = b*c*i + c*j + k;
      population[l].startLoc = b*c*i + c*j + k;
    }
  }
  
  void doFirstStep(CubicPatch locations)
  {
    for(int l=0; l<population.length; ++l)
    {
      population[l].firstStep(locations);
    }
  }
  
  void stepPopulation(CubicPatch locations)
  {
    for(int i=0; i<population.length; ++i)
    {
      population[i].step(locations);
      //population[i].markovStep(locations); 
    }
  }
 
  void drawPopulation(CubicPatch locations)
  {
    for(int i=0; i<population.length; ++i)
    {
      population[i].draw(locations); 
    }
  } 
}
class ConnLine
{
  Location[] locs = new Location[2];
  PVector pos01, pos02;
  PVector dirVec;
  int dir01, dir02;
  int movement = 0;
  float averageMovement = 0.0;
  float displayMovement = 0.0;
  boolean display = false;
  color[] dirColor = new color[6];
  
  ConnLine(int location01, int location02, int direction01, int direction02)
  {
    locs[0] = nodeSpace(location01);
    locs[1] = nodeSpace(location02);
    
    dir01 = direction01;
    dir02 = direction02;
    
    pos01 = new PVector(locs[0].pos.x, locs[0].pos.y, locs[0].pos.z);
    pos02 = new PVector(locs[1].pos.x, locs[1].pos.y, locs[1].pos.z);
    dirVec = PVector.sub(pos02, pos01);
    dirVec.mult(0.4);
    
    dirColor[0] = color(229, 207, 0);
    dirColor[1] = color(84, 69, 150);
    dirColor[2] = color(68, 154, 213);
    dirColor[3] = color(230, 31, 84);
    dirColor[4] = color(237, 109, 28);
    dirColor[5] = color(100, 184, 93);
  }
  
  void avMovement()
  {
    averageMovement = 100.0*movement / frameCount;
    displayMovement = averageMovement*15.0 / 100.0;
  }
 
  void draw()
  {
    if(display == true)
    {
      stroke(200,200,200);
      strokeWeight(1);
      line(pos01.x, pos01.y, pos01.z, pos02.x, pos02.y, pos02.z);
      
      stroke(124, 174, 211);
      strokeWeight(displayMovement);
      line(pos01.x, pos01.y, pos01.z, pos02.x, pos02.y, pos02.z);
    }
  }
  
  void drawDir()
  {
    strokeWeight(3);
    stroke(dirColor[dir01]);
    line(pos01.x, pos01.y, pos01.z, pos01.x+dirVec.x, pos01.y+dirVec.y, pos01.z+dirVec.z);
    stroke(dirColor[dir02]);
    line(pos02.x, pos02.y, pos02.z, pos02.x-dirVec.x, pos02.y-dirVec.y, pos02.z-dirVec.z);
  }
}
class ConnManager
{
  ArrayList connections = new ArrayList();
  int lineCount = 0;
  
  ConnManager()
  {
   
  }
 
  void connect(int loc01, int loc02, Location[] locations, int dir01, int dir02)
  {
    boolean connected = false;
    
    for(int i=0; i<locations[loc01].nCount; ++i)
    {
      if(locations[loc01].neighbours[i] == loc02) connected = true;
    }
    
    if(connected == false)
    {
      connections.add(new ConnLine(loc01, loc02, dir01, dir02));
      
      //establish a mutual connection between both locations 
      //loc01 and loc02 refer to the location of each node of the line
      //whereas dir01 and dir02 are the directions associated with the connection,
      //seen from either side
      locations[loc01].setupNeighbours(loc02, lineCount, dir01);
      locations[loc02].setupNeighbours(loc01, lineCount, dir02);
      
      lineCount++;
    }
  }
 
  void drawLines()
  {
    for(int i=0; i<lineCount; ++i)
    {
      ConnLine tempLine = (ConnLine)connections.get(i);
      tempLine.avMovement();
      connections.set(i, tempLine);
      
      tempLine.draw();
      //tempLine.drawDir();
    } 
  }
}


class Location
{
  int nodeNr;
  PVector pos;
  int[] neighbours = new int[10];
  int[] neighbourDir = new int[10];
  color[] dirColor = new color[6];
  int[] neighbourLines = new int[10];
  int[] connStrength = new int[10];
  PVector[] nVecs = new PVector[10];
  int nCount = 0;
  int occupancy = 0;
  float averageOccupancy = 0.0;
  float displayOccupancy = 0.0;
  
  //array to store adjacent nodes
  //count variable to count adjacent nodes
  //transition probability for each node
  
  Location(int xPos, int yPos, int zPos)
  {
    pos = new PVector(xPos, yPos, zPos);
    
    dirColor[0] = color(229, 207, 0);
    dirColor[1] = color(84, 69, 150);
    dirColor[2] = color(68, 154, 213);
    dirColor[3] = color(230, 31, 84);
    dirColor[4] = color(237, 109, 28);
    dirColor[5] = color(100, 184, 93);
  }
 
  void setupNeighbours(int n, int lCount, int direction)
  {
    neighbours[nCount] = n;
    neighbourDir[nCount] = direction;
    neighbourLines[nCount] = lCount;
    nCount++;
  }
  
  void avOccupancy()
  {
    averageOccupancy = 100.0*occupancy / frameCount;
    displayOccupancy = averageOccupancy*15.0/100.0;
    if(displayOccupancy > 20) displayOccupancy = 20.0; 
  }
  
  void neighbourVecs()
  {   
    for(int i=0; i<nCount; ++i)
    {
      Location l = nodeSpace(neighbours[i]);
      PVector nV = PVector.sub(l.pos, pos);
      nV.mult(0.4);
      nVecs[i] = nV;
    }
  }
 
  void drawVecs()
  {
    for(int i=0; i<nCount; ++i)
    {
      stroke(dirColor[neighbourDir[i]]);
      strokeWeight(3);
      line(pos.x, pos.y, pos.z, pos.x+nVecs[i].x, pos.y+nVecs[i].y, pos.z+nVecs[i].z);
    }
  } 
  
  void draw()
  {
    fill(96, 76, 61);
    noStroke();
    
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    int boxSize = int(displayOccupancy);
    box(boxSize,boxSize,boxSize);
    popMatrix();
  }
}
class Markov
{
  //the states of the system are the directions
  //up, down, left, right, forward, backward
  float[][] transitions = new float[6][6];
  float[] firstStep = {5/15, 6/15, 1/15, 3/15, 0.0, 0.0};
  
  float[] f = {0.0, 0.3125, 0.3125, 0.125, 0.25, 0.0};
  float[] r = {10.0/14.0, 0.0, 0.0, 3.0/14.0, 0.0, 1.0/14.0};
  float[] l = {0.0, 1.0/11.0, 3.0/11.0, 4.0/11.0, 2.0/11.0, 1.0/11.0};
  float[] u = {4.0/11.0, 2.0/11.0, 3.0/11.0, 1.0/11.0, 1.0/11.0, 0.0};
  float[] d = {0.0, 0.5, 0.0, 1.0/3.0, 1.0/6.0, 0.0};
  float[] b = {0.0, 1.0, 0.0, 0.0, 0.0, 0.0};
  
  Markov()
  {
    for(int i=0; i<6; ++i)
    {
      transitions[0][i] = f[i];
      //println(transitions[0][i]);
      transitions[1][i] = r[i];
      //println(transitions[1][i]);
      transitions[2][i] = l[i];
      //println(transitions[2][i]);
      transitions[3][i] = u[i];
      //println(transitions[3][i]);
      transitions[4][i] = d[i];
      //println(transitions[4][i]);
      transitions[5][i] = b[i];
      //println(transitions[5][i]); 
    }
  }
 
  int getFirstState()
  {
    float decision = random(0,1);
    float decisionPos = 0.0;
    boolean found = false;
    int first = 0;
    
    for(int i=0; i<6; ++i)
    {
      if(decision >= decisionPos && decision <= decisionPos+firstStep[i] && found == false)
      {
        first = i;
        found = true;
      }
      decisionPos += firstStep[i];
    }
    return first; 
  }
  
  float getVal(int currentState, int nextState)
  {
    return transitions[currentState][nextState];
  } 
}
class CubicPatch
{
  int a, b, c, grid;
  Location[]loc;
  
  CubicPatch(int aDim, int bDim, int cDim, int gridDist)
  {
    a = aDim;
    b = bDim;
    c = cDim;
    grid = gridDist;
    
    loc = new Location[a*b*c];
  } 
  
  void setupPatch()
  {
    //create all nodes - 3D for loop
    //assign connectivity to nodes
    //assign transition probabilities to nodes
    
    for(int i=0; i<a; ++i)
    {
      for(int j=0; j<b; ++j)
      {
        for(int k=0; k<c; ++k)
        {
          loc[b*c*i + c*j + k] = new Location(i*grid, j*grid, k*grid);
        }  
      }
    }
    
    
    for(int i=0; i<a; ++i)
    {
      for(int j=0; j<b; ++j)
      {
        for(int k=0; k<c; ++k)
        { 
          //i+1 neighbour
          if(i < a - 1) 
          {
            conman.connect(b*c*i + c*j + k, b*c*(i+1) + c*j + k, agentCube.loc, 1, 2);
            //loc[b*c*i + c*j + k].setupNeighbours(b*c*(i+1) + c*j + k);
          }    
          
          //i-1 neighbour
          if(i > 0)
          {
            conman.connect(b*c*i + c*j + k, b*c*(i-1) + c*j + k, agentCube.loc, 2, 1);
            //loc[b*c*i + c*j + k].setupNeighbours(b*c*(i-1) + c*j + k);
          }      
          //j+1 neighbour
          if(j < b - 1)
          {
            conman.connect(b*c*i + c*j + k, b*c*i + c*(j+1) + k, agentCube.loc, 4, 3);
            //loc[b*c*i + c*j + k].setupNeighbours(b*c*i + c*(j+1) + k);
          }  
          //j-1 neighbour
          if(j > 0)
          {
            conman.connect(b*c*i + c*j + k, b*c*i + c*(j-1) + k, agentCube.loc, 3, 4);
            //loc[b*c*i + c*j + k].setupNeighbours(b*c*i + c*(j-1) + k);
          }
          //k+1 neighbour
          if(k < c - 1)
          {
            conman.connect(b*c*i + c*j + k, b*c*i + c*j + (k+1), agentCube.loc, 5, 0);
            //loc[b*c*i + c*j + k].setupNeighbours(b*c*i + c*j + (k+1));
          }
          //k-1 neighbour
          if(k > 0)
          {
            conman.connect(b*c*i + c*j + k, b*c*i + c*j + (k-1), agentCube.loc, 0, 5);
            //loc[b*c*i + c*j + k].setupNeighbours(b*c*i + c*j + (k-1));
          }
        }  
      }
    }
    
    for(int i=0; i<a; ++i)
    {
      for(int j=0; j<b; ++j)
      {
        for(int k=0; k<c; ++k)
        {
          loc[b*c*i + c*j + k].neighbourVecs();        
        }  
      }
    }
  }
  
  
  void drawPatch()
  {
    //draw all nodes - 3D for loop
    //draw all connections - 3D for loop
    
    for(int i=0; i<a; ++i)
    {
      for(int j=0; j<b; ++j)
      {
        for(int k=0; k<c; ++k)
        {
            loc[b*c*i + c*j + k].avOccupancy();
            loc[b*c*i + c*j + k].draw();
            //loc[b*c*i + c*j + k].drawVecs();
        }  
      }
    }
  }
}
Location nodeSpace(int nodeNum)
{
   return agentCube.loc[nodeNum];
}


