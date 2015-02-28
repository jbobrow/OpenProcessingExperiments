
class Building {
  float posX, posY, wid, len, hei, id, gene;
  
  Building(float PosX, float PosY, float Wid, float Len, float Hei, float ID) {
  posX=PosX;
  posY=PosY;
  wid=Wid;
  len=Len;
  hei=Hei;
  id=ID;
  gene=random(1);
  }
  void setHeight(float Hei) {
    hei=Hei*gene;
  }
  
  void render() {
    pushMatrix();
    //translate(-width*0.5,-height*0.5,-50);
    translate(posX, posY,hei*0.5);
    fill(255);
    box(wid,len,hei);
    popMatrix();  
  }


}

class Block {
  
  int posX, posY, numBuildingsX, numBuildingsY, numBuildings;
  float sizX, sizY;
  Building[] iBuildings;
  
  Block(int PosX, int PosY, float SizX, float SizY, int NumBuildingsX, int NumBuildingsY) {
    numBuildingsX=NumBuildingsX;
    numBuildingsY=NumBuildingsY;
    numBuildings=numBuildingsX*numBuildingsY;
    posX=PosX;
    posY=PosY;
    sizX=SizX;
    sizY=SizY;
    iBuildings = new Building[numBuildings];
    for(int i=1;i<numBuildings;i++) {
      iBuildings[i] = new Building(i*5+posX,posY,random(10,blockX),random(10,blockY),0,i);
    }
  }
  
  void setHeight(float Hei) {
    for(int i=1;i<numBuildings;i++) {
      iBuildings[i].setHeight(Hei);
    }
  }
  
  void display() {
    for(int i=1;i<numBuildings;i++) {
      iBuildings[i].render();
    }
  }

}

