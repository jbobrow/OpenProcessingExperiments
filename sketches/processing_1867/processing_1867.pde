




class LifeBlock {
  int x,y;
  boolean alive;
  boolean fate;
  boolean updated=false;
  int t;
  LifeBlock[] neighbors=new LifeBlock[8];
  int fateCounter=-1;
  int aliveCounter=-1;
  float randDirection=0;
  //int randDirectionY=0;
  int randColor=0;
  float pulse=0;
  float lifeDirX=0;
  float lifeDirY=0;


  LifeBlock (int ix, int iy) {
    this.x=ix;
    this.y=iy;
    this.alive=false;
  }

  void setupNeighbors(LifeBlock[][] world, int x, int y, int sx, int sy) {
    
    //this order is finicky. every block /3 is its y coord, %3 have same x coord
    neighbors[6]=world[x][(y + 1) % sy];
    neighbors[7]=world[x][(y + sy - 1) % sy];

    
    neighbors[0]=world[(x + 1) % sx][(y + 1) % sy]; 
    neighbors[1]=world[(x + 1) % sx][(y + sy - 1) % sy]; 
    neighbors[2]=world[(x + 1) % sx][y];


    
    neighbors[3]=world[(x + sx - 1) % sx][(y + 1) % sy]; 
    neighbors[4]=world[(x + sx - 1) % sx][(y + sy - 1) % sy];
    neighbors[5]=world[(x + sx - 1) % sx][y];


  }


  //  addForce(x/float(sx), y/float(sy), 1/float(SPEED), 1/float(SPEED));

  void draw() {
    //if we die....
    if (fate == false && alive==true) {
      fateCounter=0;
      randDirection=random(-1,1);
      randColor=(int)random(0,255);
    }
    
    //if we're dying...
    if (fateCounter >= 0) {
      float off=scale/(fateCounter/8.0+1);
      float center=(scale-off)/2;
      stroke(0,128);
      fill(randColor/(fateCounter/4+1),0,0,70);
      rect(x*scale+center,y*scale+center,off,off);
      
      fateCounter++;
      if (fateCounter>=SPEED*2) fateCounter=-1;
    }
    
    
    //if we just came to life...
    if (fate == true && alive == false) {
      aliveCounter=SPEED;
      randDirection=random(-1,1);
      /**This is the only time new forces are added... for now**/
      addForce(x/float(sx), y/float(sy), lifeDirX, lifeDirY);
    }
    
    //if we're coming alive...
    else if (aliveCounter >= 1) {
      stroke(255/aliveCounter,128);
      fill(red(colorWheel[t])/aliveCounter,green(colorWheel[t])/aliveCounter,blue(colorWheel[t])/aliveCounter,70);
      int off=scale-aliveCounter;
      int center=(scale-off)/2;
      rect(x*scale+center,y*scale+center,off,off);    
      stroke(255,128);
      fill(0,0,0,0);
      rect(x*scale+center,y*scale+center,off,off);    
      aliveCounter--;
      if (aliveCounter<=0) aliveCounter=-1;
    }
    
    //if we're stuck alive...
    else if (alive) {    
      stroke(240,128);
      fill(red(colorWheel[t])+(int)pulse*3,green(colorWheel[t])+(int)pulse*6,blue(colorWheel[t])+(int)pulse*6,70);
      rect(x*scale+pulse/2.0,y*scale+pulse/2.0,scale-pulse,scale-pulse);
      if (pulse>=4) pulse=0;
    }  
    
    //and if the game is paused.
    else if (!enabled) {
      stroke(255);
      //fill(100);
      point(x*scale+scale/2,y*scale+scale/2);
      //rect(x*scale+scale/2,y*scale+scale/2,1,1);
    }
    
    //now we flip the state it Was in with the state its going to be in
    alive=fate;
  }




  boolean alive() {
    return alive;
  }

  void enable() {
    this.fate=true;
  }

  void disable() {
    this.fate=false;
  }

  void setAlive(boolean t) {
    this.fate=t;
  }

  void flipLife() {
    if (!updated) {
      this.fate ^= true;
      updated=true;
    }
  }

  int aliven() {
    if (this.alive)
      return 1;
    else
      return 0;
  }

  void update() {
    updated=false;
    this.t=neighbors(x,y);
    if (this.alive) {
      if (t<2 || t>3) {
        this.disable();
      }
    }
    else if (this.t == 3) {
      this.enable();
      
      /** This below calculates the force we send the MSAFluid out **/
      /** tinkering with this will get you different patterns. but this one is even **/
      lifeDirX=0;
      lifeDirY=0;
      for (int i=0;i<8;i++) {
        if (neighbors[i].aliven()==1) {
          if (i%3==0) {
             lifeDirX+=1;
          }
          else if (i%3==1) {
            lifeDirX-=1;
          }
          if (i/3==0) {
            lifeDirY+=1;
          }
          else if (i/3==1) {
            lifeDirY-=1;
          }
        }
      }
      lifeDirX+=random(-1,1);
      lifeDirY+=random(-1,1);
      lifeDirX*=0.1;
      lifeDirY*=0.1;
      //lifeDirX*=abs(SPEED-10);
      //lifeDirY*=abs(SPEED-10);
      /** end calculating forces **/
    }
  }


  int neighbors(int x, int y) 
  { 
    int asdf=0;
    for (int i=0;i<8;i++) {
      asdf=asdf+neighbors[i].aliven();
    }
    return asdf; 
  } 

}





