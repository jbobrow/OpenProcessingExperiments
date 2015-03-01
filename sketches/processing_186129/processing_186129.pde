
tree myTree;
PVector startPoint;
PVector drection;
int count;

void setup() 
{
  size(800, 600);
  background(230, 250, 220, 250);
  ellipseMode(CENTER);
  stroke(80, 0, 50, 200);
  fill(250, 80, 120, 120);
  ellipseMode(CENTER);
  smooth();
  startPoint = new PVector(width/2, height);
  drection = new PVector(0, -height);
  myTree = new tree(startPoint, drection);
  count = myTree.treeSize;
}
void draw() 
{
  background(230, 250, 220, 250);
  myTree.swing();
  
  stroke(80, 0, 50, 200);
  int tempIndex;
  for(int i = 1; i < count; i ++)
  {
    strokeWeight(myTree.twig[(int)myTree.map[i].x].thickness[(int)myTree.map[i].y]);
    line(myTree.twig[(int)myTree.map[i].x].location[(int)myTree.map[i].y - 1].x, myTree.twig[(int)myTree.map[i].x].location[(int)myTree.map[i].y - 1].y,
         myTree.twig[(int)myTree.map[i].x].location[(int)myTree.map[i].y].x, myTree.twig[(int)myTree.map[i].x].location[(int)myTree.map[i].y].y);
  }
  
  noStroke(); 
  for(int i = 0; i < myTree.twig.length; i++)
  {
    int num = myTree.twig[i].location.length - 1;
    ellipse(myTree.twig[i].location[num].x, myTree.twig[i].location[num].y, 12, 12);
  }
  
}

void mousePressed() {
  background(230, 250, 220, 250);
  stroke(80, 0, 50, 200);
  myTree = new tree(startPoint, drection);
  count = myTree.treeSize;

//  println("================================");

}
class branch 
{
  PVector[] location;
  float[] thickness;
  int[][] baseIndex = new int[2][];
//  float[] baseDtheta;
  boolean isCandidate = false;
  float[] dTheta;
  
  branch(PVector loc, float thic, int id, int branchIndex)
  {
    location = new PVector[1];
    thickness = new float[1];
    location[0] = new PVector(loc.x, loc.y);
    thickness[0] = thic;
    
    baseIndex[0] = new int[1];
    baseIndex[1] = new int[1];
    baseIndex[0][0] = id;
    baseIndex[1][0] = branchIndex;
    
  }
  void branchRotate(int index, float theta, PVector reference)
  {
      location[index].sub(reference);
      rotate2D(location[index], theta);
      location[index].add(reference);
  }
  
  void rotate2D(PVector v, float theta)
  {
    float xTemp = v.x;
    v.x = v.x * cos(theta) - v.y * sin(theta);
    v.y = xTemp * sin(theta) + v.y * cos(theta);
  }
}
class frontier 
{
  PVector location;
  PVector velocity;
  float thickness;
  boolean finished;
  
  
  frontier(PVector startPoint, PVector direction)
  {
    location = new PVector(startPoint.x, startPoint.y);
    velocity = new PVector(direction.x, direction.y);
    thickness = random(10, 20);
    finished = false;
  }
  
  frontier(frontier parent) 
  {
    location = parent.location.get();
    velocity = parent.velocity.get();
    thickness = parent.thickness;
    parent.thickness = thickness;
    finished = parent.finished;
  }
  
  void update(float factor) 
  {
    if(  location.x > -10 
       & location.y > -10
       & location.x < width + 10
       & location.y < height + 10 
       & thickness > factor)  
    {
      velocity.normalize();
      PVector uncertain = new PVector(random(-1, 1), random(-1, 1));
      uncertain.normalize();
      uncertain.mult(0.2);
      velocity.mult(0.8);
      velocity.add(uncertain);
      velocity.mult(random(8, 15));
      location.add(velocity);
    }
    
    else
    {
      finished = true;
    }
   
  } // void update()
  
}
class tree 
{
  PVector[] map;
  branch[] twig;
  int treeSize;
  float BranchLengthFactor = 0.3;
  float BranchLocationFactor = 0.3;

  float dt = 0.025;
  float time = 0;
  float[] dtheta;
  
  int candNum = 3;
  int[] candidateIndex = new int[candNum];
  float[] amplitude = new float[candNum];
  float[] phaseFactor = new float[candNum];
  float freq;
  float period;
   
  tree(PVector startPoint, PVector direction)
  { 
    int id = 0;
    boolean growth = false;
    
    frontier[] fr = new frontier[1];
    fr[id] = new frontier(startPoint, direction);
    
    twig = new branch[1];    
    twig[id] = new branch(fr[id].location, fr[id].thickness, id, 0);
    
    map = new PVector[1];
    map[0] = new PVector(id, twig[id].location.length - 1);
    
    while(!growth)
    {
      int growthSum = 0;
      for(id = 0; id < fr.length; id++)
      {
        fr[id].update(BranchLocationFactor);
        if(!fr[id].finished)
        {
          twig[id].location = (PVector[]) append(twig[id].location, new PVector(fr[id].location.x, fr[id].location.y)); 
          twig[id].thickness = (float[]) append(twig[id].thickness, fr[id].thickness);
          map = (PVector[]) append(map, new PVector(id, twig[id].location.length - 1));
          
          if (random(0, 1) < BranchLengthFactor)  // control length of one branch  
          { 
            
            fr[id].thickness *= 0.65;
            twig[id].thickness[twig[id].thickness.length - 1] = fr[id].thickness;
            if( fr[id].thickness > BranchLocationFactor)  // control the number of the locations on all branches, i.e., treeSize.
            {
              fr = (frontier[]) append(fr, new frontier(fr[id]));           
              twig = (branch[]) append(twig, new branch(fr[id].location, fr[id].thickness, id, twig[id].location.length - 1));
              int _id = id;
              if(_id != 0)  for(int _i = 0; _i < 2; _i++)  twig[twig.length - 1].baseIndex[_i] = concat(twig[twig.length - 1].baseIndex[_i], twig[_id].baseIndex[_i]);
            }
            
          } // if (random(0, 1) < 0.2)
          
        }
        else  growthSum += 1;
      }
      if(growthSum == fr.length) 
      {
        dtheta = new float[twig.length];
        treeSize = map.length;
        growth = true;
      }
    } // while(!growth)
    
    ArrayList<Float> _candList = new ArrayList<Float>();
    float[] _candfloat = new float[twig.length];
    for(int i = 0; i < twig.length; i++)
    {
      _candfloat[i] = (float)twig[i].location.length;
      _candList.add(_candfloat[i]);
    }
    candidateIndex[0] = 0;
    twig[0].isCandidate = true;
    twig[0].dTheta = new float[twig[0].location.length];
    _candfloat[0] = -1.0;
    _candList.set(0, -1.0);
    for(int i = 1; i < candNum; i++) 
    {
      float _temp = max(_candfloat);
      candidateIndex[i] = _candList.indexOf(_temp);
      twig[candidateIndex[i]].isCandidate = true;
      twig[candidateIndex[i]].dTheta = new float[twig[candidateIndex[i]].location.length];
      _candfloat[candidateIndex[i]] = -1.0;
      _candList.set(candidateIndex[i], -1.0);
    }
//    println(candidateIndex);
      
    amplitude[0] = random(0.006, 0.012);
    phaseFactor[0] = random(0.6, 1.2);
    freq = random(0.5, 0.8);
    period = 1 / freq;
    for(int i = 1; i < candNum; i++)
    {
      amplitude[i] = amplitude[i-1] * random(0.9, 1.4);
      phaseFactor[i] = phaseFactor[i-1] * random(0.9, 1.4);
    }
  }
  
  void swing()
  {
    for(int i = 0; i < candNum; i++)
    {
      int _num = twig[candidateIndex[i]].location.length;
      for(int j = 0; j < _num; j++)  twig[candidateIndex[i]].dTheta[j] = amplitude[i] * dt * TWO_PI * freq * cos(TWO_PI * freq * time - phaseFactor[i] * PI * (float)j / (float)_num);
    }

    for(int id = 0; id < twig.length; id++)
    {
      if(twig[id].isCandidate)  for(int _id = 1; _id < twig[id].location.length; _id++)  twig[id].branchRotate(_id, twig[id].dTheta[_id], twig[id].location[0]);
 
      for(int j = 0; j < twig[id].baseIndex[0].length; j++)
      {
        if(!twig[twig[id].baseIndex[0][j]].isCandidate | id == 0) continue;
        else
        {
          for(int k = (id == 0) ? 1 : 0; k < twig[id].location.length; k++)
          {
            twig[id].branchRotate(k, twig[twig[id].baseIndex[0][j]].dTheta[twig[id].baseIndex[1][j]], twig[twig[id].baseIndex[0][j]].location[0]);
          }
        }
      }

    } // for(int id = 0; id < twig.length; id++)

    time += dt;
    if(time >= period) time -= period;    
  }
  
}


