


//Initiate Cell class
class Cell
{
  int id;
  int type;
  int strength;
  int intel;
  
  // define how to call Cell
  Cell(int idf, int cellType, int strngth, int intelligence)
  {
    id = idf;
    strength = strngth;
    intel = intelligence;
    type = cellType;
  }


  //-----------------------------------------------------------------------------//


  void run()
  {

    if (frameCount > 1 &&!this.dead() ) {
      
        int[] cellNeighbors = findNeighbors(this.id);


        for (int i=0; i < 6; i++) {
          Cell neighborCell = (Cell) cells.get(cellNeighbors[i]);
          
          if (this.type == 0){
              if(neighborCell.strength == 0){
                  if(random(1000) < wallDecayRate*10){
                    this.strength = 0;
                  }
              } else if(neighborCell.type != 0){
                  if(random(1000) < wallDecayRate/2){
                    this.strength = 0;
                  }
              }
          } else if (canEat(this.type, neighborCell.type, neighborCell.strength)) {
            if (random(200) < this.intel) {
              if(random(this.intel*4) > neighborCell.intel){
                neighborCell.setType(this.type);
              }
            }
          }
        }
        
    }
      
  }

  //-----------------------------------------------------------------------------//

  void setType(color newType) {

    if (newType == 1) {
      type = 1;
      strength = bases;
      intel = basesi;
    }
    else if (newType == 2) {
      type = 2;
      strength = secondarys;
      intel = secondaryi;
    }
    else if (newType == 3) {
      type = 3;
      strength = tertiarys;
      intel = tertiaryi;
    }else if (newType == 0) {
      type = 0;
      strength = wallss;
    }
  }


  //-----------------------------------------------------------------------------//


void display() {            //draw the actual dots to represent lifeforms
    
    if(this.dead()){
      noFill();
      stroke(0);
    }else{
      
      if(this.type == 0){
        fill(wallsc);
      }else if(this.type == 1){
        fill(basec);
      }else if(this.type == 2){
        fill(secondaryc);
      }else if(this.type == 3){
        fill(tertiaryc);
      }
      if(cellShape == -1 || cellShape == 2){
        stroke(0);
      }else{
        noStroke();
      }
    }
    
    
      if (cellShape == 0) {
        ellipse(simX+0.5*s+(this.id % rowSize)*s, simY+0.3*s+floor(this.id/rowSize)*s, s, s);
      }else if (cellShape == 1) {
        rectMode(CORNER);
        rect(simX+0.5*s+(this.id % rowSize)*s, simY+0.3*s+floor(this.id/rowSize)*s, s, s);
      }else if(cellShape == -1){
        
        
        float triHeight = (sqrt(3)/2)*s;
        
          if(floor(id/rowSize) % 2 == 0){
            triangle(simX+s/2+(id % rowSize)*s-s/2, simY+floor(id/rowSize)*triHeight-(triHeight*floor(floor(id/rowSize)/2)), simX+s/2+(id % rowSize)*s+s/2, simY+floor(id/rowSize)*triHeight-(triHeight*floor(floor(id/rowSize)/2)), simX+s/2+(id % rowSize)*s, simY+floor(id/rowSize)*triHeight-(triHeight*floor(floor(id/rowSize)/2))+triHeight);
          }else {
            triangle(simX+s/2+(id % rowSize)*s, simY+floor(id/rowSize)*triHeight-(triHeight*floor(floor(floor(id/rowSize)/2))), simX+s/2+(id % rowSize)*s+s, simY+floor(id/rowSize)*triHeight-(triHeight*floor(floor(id/rowSize)/2)), simX+s/2+(id % rowSize)*s+s/2, simY+floor(id/rowSize)*triHeight-(triHeight*floor(floor(id/rowSize)/2))-triHeight); 
          }
        
      } else if(cellShape == 2){
           polygon(6, simX+0.5*s+(0.75*s)*((this.id/rowSize)%2 + 2*(this.id%rowSize)), simY+s*0.5+(s*0.433)*(this.id/rowSize), s*0.5);
           
           if(debugOn){
             if((this.id/rowSize)%2 == 0){
               fill(255);
             }else{
               fill(100);
             }
             textAlign(CENTER);
             text(this.id, simX+0.5*s+(0.75*s)*((this.id/rowSize)%2 + 2*(this.id%rowSize)), simY+s*0.5+(s*0.433)*(this.id/rowSize));
         }
       
    }
    
    
    strokeWeight(1);
  }



  //-----------------------------------------------------------------------------//


  boolean canEat(color cellType, color eatType, int eatStr) {


    if (cellType == 3) {

      if (eatType == 2 && eatStr > 0) {
        return true;
      } else {
        return false;
      }
      
    } else if (cellType == 2) {

      if (eatType == 1 && eatStr > 0) {
        return true;
      } else {
        return false;
      }
      
    } else if (cellType == 1) {

      if (eatStr < 1) {
        return true;
      } else {
        return false;
      }
      
    } else {
      return false;
    }
  }


  //-----------------------------------------------------------------------------//



  boolean dead() {             // check to see if cell is alive or not
    if (this.strength < 1) { 
      return true;
    } 
    else {
      return false;
    }
  }
}


