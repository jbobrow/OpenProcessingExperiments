

PVector[] obtainLimits(color bgCol, color obsCol){

  color[] img;
  ArrayList leftRightLimits = new ArrayList();
  ArrayList upDownLimits = new ArrayList();
  color col, prevCol;

  loadPixels(); 
    img = pixels;
  updatePixels();

  for(int y = 0; y < height; y++){
    prevCol = img[0+y*width];
    for(int x = 0; x < width; x++){
      col = img[x + y*width];
      if(col != prevCol){
        if(col == obsCol){
          leftRightLimits.add(new PVector(float(x),float(y)));
        }
        else{
          leftRightLimits.add(new PVector(float(x-1),float(y)));
        }
      }
      prevCol = col;
    }
  }

  for (int x = 0; x < width; x++){
    prevCol = img[x+0*width];
    for (int y = 0; y < height; y++){
      col = img[x + y*width];
      if(col != prevCol){
        if(col == obsCol){
          upDownLimits.add(new PVector(float(x),float(y)));
        }
        else{
          upDownLimits.add(new PVector(float(x),float(y-1)));
        }
      }
      prevCol = col;
    }
  }

  ArrayList combinedLimits = new ArrayList();
  PVector l1, l2;
  boolean repeated;

  for (int i = 0; i < leftRightLimits.size(); i++){
    repeated = false;
    l1 = (PVector) leftRightLimits.get(i);
    for (int j = 0; j < combinedLimits.size(); j++){
      l2 = (PVector) combinedLimits.get(j);
      if(l1.dist(l2) == 0){
        repeated = true;
      }
    }
    if(!repeated){
      combinedLimits.add(l1);
    }
  }  

  for (int i = 0; i < upDownLimits.size(); i++){
    repeated = false;
    l1 = (PVector) upDownLimits.get(i);
    for (int j = 0; j < combinedLimits.size(); j++){
      l2 = (PVector) combinedLimits.get(j);
      if(l1.dist(l2) == 0){
        repeated = true;
      }
    }
    if(!repeated){
      combinedLimits.add(l1);
    }
  }  

  PVector[] limits = new PVector[combinedLimits.size()];
  combinedLimits.toArray(limits);

  return limits;
}


