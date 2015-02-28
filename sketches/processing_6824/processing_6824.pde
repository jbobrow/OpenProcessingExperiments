
class Tree
{
  float treeHeight;
  float baseRadius;
  float x;
  float z;
  float theta = 0.0f;
  ArrayList coords = new ArrayList();
  PVector initPos;
  
  Tree(float _treeHeight, PVector _initPos)
  {
    treeHeight = _treeHeight;
    baseRadius = _treeHeight/4;
    initPos = _initPos;
  }
  
  void render()
  {
    //trunk   
    stroke(#342F02);
    for (int t=0; t<treeHeight; t++){
      float trunkWidth = map(t, 0, treeHeight, treeHeight/16, 0.1);
      strokeWeight(trunkWidth);
      line(initPos.x,initPos.y,initPos.z,initPos.x,-t,initPos.z);
    }
    
    for(float i = 0; i < baseRadius; i++){
      baseRadius -= 1;
      drawBranch(baseRadius);
    }
    

    for(int i = 0; i < coords.size(); i+=2) {
       x = (Float) coords.get(i);
       z = (Float) coords.get(i+1);
       float branchW = map(i, 0, coords.size(), 3, 0.1);
       strokeWeight(branchW);       
       stroke(#054D0B, 150);
       pushMatrix();
         translate(0, (treeHeight/2)-6, 0);
         line(initPos.x,(-i/3)-(treeHeight/2)-2,initPos.z, x,(-i/3)-treeHeight/2,z);
       popMatrix();
    }
    
  }
  //branches
  void drawBranch (float radius)
  {
    for (int i = 0; i < TWO_PI; i++){
      x = initPos.x + radius * cos(theta);
      z = initPos.z + radius * sin(theta);
      coords.add(x);
      coords.add(z);
      theta += 1;
    }
  }


}

