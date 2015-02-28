
class Ball {
  float mx, my;
  int s = 8;
  float speed; 
  boolean plink = false;
  int dir = 0;
  int count = 0;

  // Contructor (required)
  Ball(float imx, float imy, float ispeed) {
    mx = imx;
    my = imy;
    speed = ispeed;

  }

  // Custom method for updating the variables
  void update() {
    for(int i = 0; i <numPegs; i++){
      
      if(dist(pegs[i].mx,pegs[i].my, mx, my)<6){
        dir = int(random(2));
        if(dir == 0) dir = -1;
        plink = true;
      }
      
    }

    my++;
  }

  void move(){
    if(count<=10){
      mx+= dir;
      count++;
      my++;
    }
    else{
      plink = false;
      count = 0; 
    }

  }

  // Custom method for drawing the object
  void display() {
    fill(200,100,0);
    ellipse(mx, my, s, s);
    if(my==100) println(mx);
    
  }
}

