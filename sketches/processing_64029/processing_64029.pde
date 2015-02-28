

class GenerateClass
{
  ArrayList boxArray;
  BaseClass base;
  int num = 1;
  PVector camTargetPos = new PVector(0, 0, 0);

  GenerateClass()
  {
    boxArray = new ArrayList();
    boxArray.add(new BaseClass(0, 0));
  }

  //-------------------------------------------
  //Public Method
  //-------------------------------------------
  public void render()
  {
    pushMatrix();
    for (int i = 0; i < boxArray.size(); i++)
    {
      BaseClass b = (BaseClass) boxArray.get(i);
      b.render();
    }

    PMatrix3D mp = (PMatrix3D)getMatrix();
    camTargetPos.set(mp.m03, mp.m13, mp.m23);

    popMatrix();
  }

  public void addBox()
  {
    int growNum = round(random(0, 3));
    boxArray.add(new BaseClass(num, growNum) ); 
    num++;

    switch(growNum)
    {
    case 0:  //growRight    
      camTargetPos.add(GLOW_LENGTH, .0, .0);
      break;
    case 1:  //growTop
      camTargetPos.add(.0, -GLOW_LENGTH, 0);
      break;
    case 2:  //growLeft
      camTargetPos.add(-GLOW_LENGTH, .0, .0);
      break;
    case 3:  //growBottom
      camTargetPos.add(.0, GLOW_LENGTH, 0);
      break;
    }
  }

  PVector getCamTergetPos()
  {
    return camTargetPos;
  }
}


