
ArrayList rectArr;
ArrayList dirArr;
PVector initDir;
int initX = (int) (random(400,600));;
int initY = (int) (random(200,400));;

void setup() { 
  size(800, 800); 
  smooth();
  //noStroke();
  rectArr = new ArrayList();
  initDir = new PVector(0, (int) random(80)+2 );
  newRect initRect;
  initRect = new newRect(initDir,400 - initX/2,300 - initY/2, initX, initY);
  rectArr.add(initRect);
}

void draw() { 
  background(0);
  for(int i=0;i< rectArr.size();i++) {
    newRect currentRect = (newRect) rectArr.get(i);
    currentRect.move();
    currentRect.display();
    if (currentRect.finished()) {    
      rectArr.remove(i);

      PVector nowDir;
      int sizeX,sizeY;
      float ratial;

      nowDir = getDir(currentRect.dir);
      ratial = random(0,1);

      if(currentRect.dir.x==0) {
        sizeY = currentRect.ySize;
        sizeX = (int) (ratial*currentRect.xSize);

        rectArr.add(new newRect(new PVector(-nowDir.x,nowDir.y), currentRect.xPos, currentRect.yPos, sizeX,sizeY));

        rectArr.add(new newRect(nowDir,
        currentRect.xPos+sizeX,
        currentRect.yPos, 
        (currentRect.xSize-sizeX),
        sizeY));
      }
      else {
        sizeX = currentRect.xSize;
        sizeY = (int) (ratial*currentRect.ySize);
        rectArr.add(new newRect(new PVector(nowDir.x,-nowDir.y), currentRect.xPos,currentRect.yPos, sizeX,sizeY));
        rectArr.add(new newRect(nowDir, currentRect.xPos,currentRect.yPos+sizeY, sizeX, currentRect.ySize - sizeY));
      }
    }
  }
}

PVector getDir(PVector a) {
  PVector oriDir, newDir;
  oriDir = a;
  if(oriDir.x == 0) {
    newDir = new PVector((int) random(80)+2,0);
  }
  else {
    newDir = new PVector(0, (int) random(30)+20);
  } 
  return newDir;
}


