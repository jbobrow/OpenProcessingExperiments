
class Branch{
  
  PVector origin;
  float id;
  PVector end;
  Trunk trunk;
  float trunkMaxNum;
  float trunkNum;

  void init(PVector originTemp, float idTemp){
    origin = originTemp;
    id = idTemp;

    create();

    trunkMaxNum = 5 - id;    
    if(trunkMaxNum > 0){
      trunkNum = random(1, trunkMaxNum/2);
      createSubTrunkes(id);
    }
  }

  void create(){
    trunk = new Trunk();
    trunk.init(origin, id);
    end = trunk.getEnd();
  }

  void createSubTrunkes(float idTemp){
    for (int i = 0; i < trunkNum; i++){
      Branch subBranch = new Branch();
      subBranch.init(end, idTemp + 1);
    }
  }
}




