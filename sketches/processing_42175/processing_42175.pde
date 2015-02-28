

// SETUP VARIABLES:
// ----------------------

// for trees
float growthSpeed = 4;
int maxTrees = 20;
int treeSpawnRate = 1;      // Spawns per second, higher is more often, default 1

// for waves
float waveMaxRadius = 420;
float waveSpeed = waveMaxRadius*0.64;
int maxWaves = 150;
float waveSpawnRate = 12;   // Spawns per second, higher is more often, default 1

int mode = 1;

//Class Arrays

Tree[] motherTree;
float clickCounter=0;
int treeCounter=0;
int treeSpawn=0;      // decides in which position in the array a tree gets saved, cyclically overwriting another

Wave[] waves;
float waveClickCounter=0;
int waveCounter=0;
int waveSpawn=0;




void setup() {
  //size(screenWidth, screenHeight, P2D); 
  size(800,600,P2D);
  background(30, 50, 60); //initializes background
  noStroke();
  fill(255);
  motherTree = new Tree[maxTrees]; // sets up the Arrays to handle the objects.
  waves = new Wave[maxWaves];
  smooth();

}


void draw() 
{                
    background(250,253,200);  //redraws the background every frame
    stroke(255);              //resets stroke and fill properties
    fill(255);
    strokeWeight(1);

    if(mousePressed ==true && mouseButton == LEFT) 
    {   
      if (clickCounter == 0) // only acts when the time since the last click is sufficient, determined by treeSpawnRate.
      {
        for(int i=0; i<int(random(2,3.1)); i++) //determines the number of main branches of a tree with a 1/11 chance of there being 3 branches.
        {
          if(treeCounter==maxTrees)  // this is the case if the maximum number of trees has already been surpassed.
          {
            motherTree[treeSpawn] = new Tree(10, mouseX, mouseY, -HALF_PI, 10);
            clickCounter = clickCounter+1/frameRate;
            treeSpawn++;
          }
          
          if(treeCounter!=maxTrees) // this is the case if the maximum number of trees has not yet been surpassed.
          {
            motherTree[treeCounter] = new Tree(10, mouseX, mouseY, -HALF_PI, 10);
            clickCounter = clickCounter+1/frameRate;
            treeCounter++;
            treeSpawn++;
          }
          
          
          if(treeSpawn > maxTrees-1) // resets the treeSpawn variable so new trees will again be allocated in motherTree[0], overwriting old ones.
          {
            treeSpawn=0;
          }
        }
      }
    }
  
    if(clickCounter > 0)    // prevents trees from spawning too fast, counting up
    {
      clickCounter = clickCounter+1/frameRate;
      if(clickCounter > 1/treeSpawnRate)  // resets after the time determined by the Spawn Rate has passed.
      {
        clickCounter = 0;  
      }
    }
    
    // the following draws the trees every frame, the calculation is cascading through the classes, 
    // see Tree.update(), Branch.grow(), Branch.update() for more...
    
    if(treeCounter != 0) 
    {
      for(int i=0; i<treeCounter; i++)
      {
        if(motherTree[i].fade != 255)  // only draws trees that are visible to save processing power.
        { //draws only visible trees
          motherTree[i].update();
        }
      }
    }



// ---------------------------- WAVES
// ----------------------------------
    
  if(mousePressed ==true) //this spawns waves every time the mouse is pressed, with differing properties depending on the button
    {   
      float roundness = 1;
      waveSpawnRate = 12;
      if(mouseButton == LEFT) // this is only for when a tree is also spawned.
      {
        roundness = 0.16;      //makes the waves look like they had perspective
        waveSpawnRate = 1;      //makes sure only a single wave spawns with every tree
      }
      if (waveClickCounter == 0) // this actually spawns the wave...
      {
       if(waveCounter==maxWaves)   //... in this case the array is refilled from the bottom after it's already full
        {
          waves[waveSpawn] = new Wave(mouseX, mouseY, waveSpeed, roundness);
          waveClickCounter = waveClickCounter+1/frameRate;
          waveSpawn++;
        }
        
        if(waveCounter!=maxWaves) //... in this case the initially empty array is filled from the bottom up.
        {
          waves[waveCounter] = new Wave(mouseX, mouseY, waveSpeed, roundness);
          waveClickCounter = waveClickCounter+1/frameRate;
          waveCounter++;  //note that the waveCounter is being increased in this loop only, as it's already at its max in the previous one
          waveSpawn++;
        }
        
        
        if(waveSpawn > maxWaves-1)        
        {
          waveSpawn=0;  // resets the writing process so the array is refilled from the bottom up once it's full, overwriting the oldest entries.
        }
      }
    }
  
    if(waveClickCounter > 0)    // prevents waves from spawning too fast
    {
      waveClickCounter = waveClickCounter+1/frameRate;
      if(waveClickCounter > 1/waveSpawnRate)
      {
        waveClickCounter = 0;  // resets the counter if the time is reached.
      }
    }
    
    
    if(waveCounter != 0) // counts the time to next spawn
    {
      for(int i=0; i<waveCounter; i++)
      {
        if(waves[i].fade <254)  //draws only visible waves, increasing performance
        { 
          waves[i].drawWave();
          waves[i].propagate();
        }
      }
    }    

}


class BranchPoint // these are the points in space used to calculate the trees
{
  float pX;
  float pY;
  float age;
  boolean done = false;
  float thickness;
  
  BranchPoint(float X, float Y)
  {
    pX=X;
    pY=Y;
    age=0;
  }
  
  float returnX()
  {
    return pX;
  }
  
  float returnY()
  {
    return pY;
  }
  
  void beDone()
  {
     done = true; 
  }
  
  void age() // if the branch hasn't been told to stop, this will age the points, thereby they will grow thicker over time.
  {
    if (done == false)
    {
      age = age+1/frameRate;
    }
  }
  
  void setThickness(float newThickness)
  {
    thickness = newThickness;
  }
}

class Branch  // this class handles an array of points, calculates growth and draws the actual branches.
{
  public int maxPoints;  // controls how long the branch is
  BranchPoint[] branchPoints;  // sets up the array of branchpoints used to store the points that will later be calculated by the grow method
  int count = 0; //counting variable to monitor how many points have already been calculated/stored in the array.
  float dir;     //direction of growth
  float speed;    //speed of growth
  float thickness; //thickness of the base of the branch
  
  Branch(int iniMaxLength, float startX, float startY, float direction, float baseThickness)
  {
    maxPoints = iniMaxLength;
    branchPoints = new BranchPoint[iniMaxLength]; //initializes the arra based on the values given in the constructor
    branchPoints[0] = new BranchPoint(startX, startY);  //sets up the first point in the array, also based on values from the constructor
    count=0; 
    speed=growthSpeed;
    dir = direction;
    thickness = baseThickness;
  }
  
  void grow(float ndir, float speed) // stores the next point in the array based on growth information given in the parameters (from the class Tree)
  {
    if(count < maxPoints-1)  //sets next point if array isn't full
    {
      float nX = this.returnLatestX()+cos(ndir)*1/frameRate*speed*30;
      float nY = this.returnLatestY()+sin(ndir)*1/frameRate*speed*30;
      branchPoints[count+1] = new BranchPoint(nX, nY);
      count++;
      dir = ndir;

    }
    else  // stops aging of all points in the array, so the branch won't grow thicker after it's finished growing.
    {
      for(int i= 0; i<maxPoints; i++)
      {
        branchPoints[i].beDone();
      }
    }
  }
 
  
  void drawBranch(int fader) //draws the branch with a parameter for transparency, controlled in the class Tree, based on time/age.
  {
    if(count>1) //doesn't draw if there are no two points to connect yet.
    {
      for(int i=0; i<count; i++) // goes through pairs of points and connects them with a line. The weight of said line is determined by the thickness value stored in the branchPoint class.
      {
        stroke(50,20,0,255-fader);      
        branchPoints[i].setThickness(branchPoints[i].age*thickness);
        strokeWeight(branchPoints[i].thickness);    
        line(branchPoints[i].returnX(),branchPoints[i].returnY(),branchPoints[i+1].returnX(),branchPoints[i+1].returnY());
        branchPoints[i].age();  //ages the points after everything is done.     
      }   
    } 
  }
  
  // some redundant methods for returning variables, to be simplified
  
  float returnLatestX()
  {
    return branchPoints[count].pX;
  }
  
  float returnLatestY()
  {
    return branchPoints[count].pY;
  }
  
  float returnLatestDir()
  {
    return dir;
  }
  
  int returnMaxPoints()
  {
    return maxPoints;
  }
  
  int returnCount()
  {
    return maxPoints;
  }
  
  void setDir(float newDir)  // method for changing the direction of growth
  {
    dir = newDir;
  }
  
  
}

class Tree  // this class controls an Array of Branches and is responsible for the actual branching and length of all branches and the main stems.
{
  Branch[] branches;
  float age;
  int branchNumber = 1;
  float straightness = 1;
  float splitChance = 0;
  float D = 1;
  int fade = 0;
  int maxBranches = 1;
  int treeHeight = 1;
  
  Tree(int nmaxBranches, float x, float y, float direction, float nsplitChance)
  {
    maxBranches = nmaxBranches;
    branches = new Branch[nmaxBranches];
    treeHeight = int((maxBranches-branchNumber)*0.0618*height/8*random(0.5,1));  //sets the length of the main stem based on an archaid formula, this comes solely from experimentation/trial&error
    branches[0] = new Branch(treeHeight, x, y, direction+random(-0.2,0.2), 6); // this spawns the main branch
    branchNumber++;
    splitChance = nsplitChance*4; //the 4 was also added arbitrarily
  }
  
  void spawnBranch(float x, float y, float direction, float branchLength) // this method spawns all branches aside from the main branch and is called from the method updated
  {
    if(branchNumber<=maxBranches)
    {
      int newBranchLength = int((10-branchNumber)*0.0618*height/8*random(0.5,1));
      branches[branchNumber-1] = new Branch(newBranchLength, x, y, direction, 4*newBranchLength/treeHeight);
      branchNumber++;
    }

  }
  
  void update()
  {
    
    for(int i=0; i<branchNumber-1; i++)
    {
      float sunDrive = 0;  //these loops check the direction of all branches and change the sunDrive variable which then is used as a modifier to give the branches a tendency to bend upwards.
      if(branches[i].dir > -HALF_PI && branches[i].dir <= 0)
      {
        sunDrive = -0.013*(branches[i].dir+HALF_PI); //makes the branches curve upward  
      }
      else if(branches[i].dir > 0 && branches[i].dir <= HALF_PI)
      {
        sunDrive = -0.013*(branches[i].dir+HALF_PI); //makes the branches curve upward
      }
      else if((branches[i].dir <= -HALF_PI && branches[i].dir >= -PI))
      {
        sunDrive = 0.013*(-branches[i].dir+PI); //makes the branches curve upward
      }
      else if(branches[i].dir <= -PI && branches[i].dir >= HALF_PI)
      {
        sunDrive = 0.013*(-branches[i].dir+PI); //makes the branches curve upward
      }     
      
      branches[i].grow((branches[i].dir+ sunDrive) *(straightness*(1+random(-.12,.12))), 6*growthSpeed/(1+(age))); //THIS IS THE ACTUAL COMPUTATION OF THE NEXT BRANCH POINT. 
      branches[i].drawBranch(fade); //this draws the branch after its next iteration has been computed.
      age=age+1/frameRate;
    }
    if(random(0,1)<(splitChance*.001) && branches[0].count>5 && branchNumber < maxBranches) // THIS HANDLES THE SPAWNING OF NEW BRANCHES
    {
      int origin = int(random(0,branchNumber-1)); // randomly selects an existing branch to branch off of.
      float direction = random(0.45,0.55);        // sets the deviation from former direction
      D = branches[0].returnMaxPoints() - branches[origin].returnCount(); // sets the base thickness of the new branch
      
      if(random(-1,1) > 0) // 1 in 2 chance to grow either left or right
      {
      this.spawnBranch( branches[origin].returnLatestX(), branches[origin].returnLatestY(), branches[origin].returnLatestDir()+direction*(-1), D);
      branches[origin].setDir(branches[origin].returnLatestDir()-0.8*direction);
      }
      
      else 
      {
      this.spawnBranch( branches[origin].returnLatestX(), branches[origin].returnLatestY(), branches[origin].returnLatestDir()+direction, D);
      branches[origin].setDir(branches[origin].returnLatestDir()-1.8*direction);
      }
    }
    else //if no branch has spawned, increases the chance that one will spawn in the next iteration
    {
      splitChance=splitChance*1.08;
    }
    
    if(age>6 && fade <=254) // this lets the whole tree fade out after 6 seconds
    {
      fade=int(fade+255/2*1/frameRate+1/(age-5)*0.5);
    }
    
    if(fade==254) // failsafe so that if for any reason the step from 254 is too small, it will fully disappear.
    {
      fade=255;
    }    
  }

}

class Wave
{
  float roundness = 1;
  float dim = 0;
  float speed = 10;
  float fade = 0;
  int cX;
  int cY;
  float age = 0;
  
  Wave(int x, int y, float v, float r)
  {
    cX = x;
    cY = y;
    speed = v;
    roundness = r;
  }
  
  void propagate()
  {
    dim=dim+speed/frameRate+random(-15/frameRate,15/frameRate);
    if(fade!=1)
    {
      fade=((dim/waveMaxRadius))*255;
    }
    else
    {
      fade=0;
    }
  }
  
  void drawWave()
  {
    noFill();
    strokeWeight(1);
    stroke(50,20,0,255-fade);
    ellipse(cX,cY,dim,dim*roundness);
  }
  
  
}


  


