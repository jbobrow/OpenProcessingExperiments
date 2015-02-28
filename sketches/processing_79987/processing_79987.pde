

class Back extends Layer {
  
  PShape back;

 
//    Back(){
//      back = loadShape("back.svg");
//  }
    void draw() {
//        if(count>5){
//      tree = new Tree(mouseX, height, height-mouseY, 5);
//  tree.render(); 
  }
    
    //shape(back, 0, 16);
  }
  
    
  //}
class EnemyR extends Layer {
  
  PShape enemy;
  float speed = -3;
  
  //new EnemyR();の時に実行される
  EnemyR() {
    enemy = loadShape("enemyR.svg");
    
  }
  
  void draw() {
    
    shape(enemy, 100, 16);
  }
  
}

class EnemyL extends Layer {
  
  PShape enemy;
  float speed = 3;
  
  //new EnemyR();の時に実行される
  EnemyL() {
    enemy = loadShape("enemyL.svg");
  }
  
  void draw() {
    shape(enemy, 0, 16);
  }
  
}

class Self extends Layer {
  
  PShape[] self;
  int num=0;
  
  boolean alive = true;
  
  //new Self();の時に実行される
  Self() {
    self = new PShape[8];
    self[0] = loadShape("0001.svg");
    self[1] = loadShape("0002.svg");
        self[2] = loadShape("0003.svg");
            self[3] = loadShape("0004.svg");
                self[4] = loadShape("0005.svg");
                    self[5] = loadShape("0006.svg");
                        self[6] = loadShape("0007.svg");
                            self[7] = loadShape("0008.svg");
                               
  }
  
  void draw() {
    shape(self[num], 100, 0);
  }
}


