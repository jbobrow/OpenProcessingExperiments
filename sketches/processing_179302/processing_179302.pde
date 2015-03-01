

Cell[] myCells = new Cell[1000];

void setup() {
  size(750, 750);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }

  myCells[1].location.set(375,375); 

  myCells[1].isseed = true ;
}

void draw() {
  background(255);
  for (int i=0; i< myCells.length; i++) {
    myCells[i].display();
    myCells[i].update();
  }
  myCells[0].isseed = false;    
 



  for (int i=0; i<myCells.length; i++) {
    if (myCells[i].isseed == false) {
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed == true) {
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
          if (d < 8) {  //d=5 neutrons must have a direct hit to cause a fission reaction
            myCells[i].isseed = true;

          }
        }
      }
    }
    

  }
}


class Cell{
  
  PVector location = new PVector();
  PVector velocity = new PVector();
  float dia; //neutron diameter
  public boolean isseed;
  float lineweight;
   float randomx = random(-1,1); // random direction to apply to new neutrons after collision
   float randomy = random(-1,1);
   float atomdia;  //atom diameter larger than neutron

  
  Cell(){
  
    location = new PVector(random(750), random(750));
    dia = 5;
    atomdia = 20;
    isseed = false;
  }
  
  void display(){
    stroke(lineweight);
    if(isseed == true){
          ellipse(location.x, location.y, dia,dia);

      //fill(255,0,0);
    velocity = new PVector(randomx,randomy); //gives neutrons random movement direction
                  location.add(velocity);

    }
    if(isseed == false){
        ellipse(location.x, location.y, atomdia,atomdia); //atoms 
      fill(255);

    }

  }
  void update(){
    if(isseed == false){
    velocity = new PVector(random(-0,0),random(-0,0));
    location.add(velocity);

    }
    
  }
  
  

}




