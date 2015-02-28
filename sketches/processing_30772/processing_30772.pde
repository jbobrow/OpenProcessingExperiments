
//BigGrid class

class BigGrid {
  float grid_x, grid_y;
  int num_x, num_y, num_z;      //num_z is number of layers
  int n_pos_x, n_pos_y;
  float lx, ly;                  //dimension of each big square
  float floorheight;             //
  BigSquare [][][] bigsquares;
 
  ////////////////////////////////////////////////////////  
  ///constructor
  
  BigGrid(float _grid_x, float _grid_y, float _lx, float _ly, float _floorheight, int _num_z, int _num_x, int _num_y) {
    grid_x = _grid_x;
    grid_y = _grid_y;           //coordinates of top left corner of gird
    lx = _lx;
    ly = _ly;
    floorheight = _floorheight;
    num_x = _num_x;
    num_y = _num_y;
    num_z = _num_z;
    bigsquares = new BigSquare[num_z][num_x][num_y];
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          BigSquare bigsquare = new BigSquare(pos_z, pos_x, pos_y, this);
          bigsquares[pos_z][pos_x][pos_y] = bigsquare;
        }
      }
    }
  }
 
  ////////////////////////////////////////////////////////  
  ///get string data
  
  String getString() {  
    String dataStr = "|";
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          String dataSquare = bigsquares[pos_z][pos_x][pos_y].getString();
          if (dataSquare != null) {
            dataStr = dataStr + pos_z + "*" + pos_x + "*" + pos_y + "*" + dataSquare + "|";
          }
        }
      }
    }
    //if (dataStr.equals("|")) {
    //  return null;
    //}
    return dataStr;
  }
  
  ///set data from string
  void setString(String id, String dataStr) { 
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          this.bigsquares[pos_z][pos_x][pos_y].removeIdAndReset(id);
        }
      }
    }
    String[] data = split(dataStr, '|');
    for (int i = 0 ; i < data.length ; i++) {
      if (! data[i].equals("")) {
        String[] dataValues = split(data[i], '*'); 
        int pos_z = int(dataValues[0]);        
        int pos_x = int(dataValues[1]);
        int pos_y = int(dataValues[2]);
        String dataSquare =  dataValues[3];
        this.bigsquares[pos_z][pos_x][pos_y].setString(id, dataSquare);
      }
    }    
  }
  
  ////////////////////////////////////////////////////////  
  ///display grid
  void display() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          bigsquares[pos_z][pos_x][pos_y].display();
        }
      }
    }
  }
  
  void displaywall3D() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          bigsquares[pos_z][pos_x][pos_y].displaywall3D();
        }
      }
    }
  }
  
  void displayselective3D() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          bigsquares[pos_z][pos_x][pos_y].displayselective3D();
        }
      }
    }
  }
  
  /////////////////////////////////////////////////////////////////
  ///cost calculation
   void displayfloorarea() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          bigsquares[pos_z][pos_x][pos_y].displayfloorarea();
        }
      }
    }
  }
  
  void displayid() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          bigsquares[pos_z][pos_x][pos_y].displayid();
        }
      }
    }
  }
  
  void displayUnitCost() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          bigsquares[pos_z][pos_x][pos_y].displayUnitCost();
        }
      }
    }
  }
  
  void editunitcost() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          bigsquares[pos_z][pos_x][pos_y].editunitcost();
        }
      }
    }
  }
  
  float totalUnitCost() {
    float totalunitcost = 0;
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          BigSquare bigsquare = bigsquares[pos_z][pos_x][pos_y];
          totalunitcost = totalunitcost + bigsquare.getMaxCost();
        }
      }
    }
    return totalunitcost;
  }
  
   float totalFloorArea() {
    float totalfloorarea = 0;
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          BigSquare bigsquare = bigsquares[pos_z][pos_x][pos_y];
          totalfloorarea = totalfloorarea + bigsquare.floorarea();
        }
      }
    }
    return totalfloorarea;
  }
  
  float myFloorArea() {
    float myfloorarea = 0;
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          BigSquare bigsquare = bigsquares[pos_z][pos_x][pos_y];
          if(bigsquare.mine) {
            myfloorarea = myfloorarea + bigsquare.floorarea();
          }
        }
      }
    }
    return myfloorarea;
  }
  
  float myComputedCost() {
    float mylandcost = 0;
    float myconstructioncost = 0;
    
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          BigSquare bigsquare = bigsquares[pos_z][pos_x][pos_y];
          if (bigsquare.mine) {
            mylandcost = mylandcost + (bigsquare.getMaxCost()/totalUnitCost()) * sitecost;   //for each square, thisunitcost/total * * site cost
          }
        }
      }                                                                              
    }
    myconstructioncost = myFloorArea() * 1700/1000000;
    return (mylandcost + myconstructioncost);
  }
  
  //////////////////////////////////////////////////////// 
  ///counting check and cross
   
    int totalCheckedSquares() {
    int counter = 0;
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          BigSquare bigsquare = bigsquares[pos_z][pos_x][pos_y];
          if (bigsquare.checked()) {
            counter ++;
          }
        }
      }
    }
    return counter;
  }
  
   int numCheckedSquares() {
    int counter = 0;
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          BigSquare bigsquare = bigsquares[pos_z][pos_x][pos_y];
          if (bigsquare.checked() && bigsquare.mine) {
            counter ++;
          }
        }
      }
    }
    return counter;
  }
  
  int numcase(int ccase) {
    int counter = 0;
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          BigSquare bigsquare = bigsquares[pos_z][pos_x][pos_y];
          if (bigsquare.checked() && bigsquare.mine && bigsquare.pos_z==level && bigsquare._case ==ccase) {
            counter ++;
          }
        }
      }
    }
    return counter;
  }
  
  
   int numCheckedSquaresONTHISLEVEL() {
    int counter = 0;
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          BigSquare bigsquare = bigsquares[pos_z][pos_x][pos_y];
          if (bigsquare.checked() && bigsquare.mine && bigsquare.pos_z==level) {
            counter ++;
          }
        }
      }
    }
    return counter;
  }
  
  int numCrossedSquares() {
    int counter = 0;
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
          BigSquare bigsquare = bigsquares[pos_z][pos_x][pos_y];
          if (bigsquare.crossed() && bigsquare.mine) {
            counter ++;
          }
        }
      }
    }
    return counter;
  }

  //////////////////////////////////////////////////////// 
  ///get a square object
  
  BigSquare getSquare(int n_pos_z, int n_pos_x, int n_pos_y) {
     if ((n_pos_z < 0) || (n_pos_x < 0) || (n_pos_y < 0) || (n_pos_z >= num_z) || (n_pos_x >= num_x) || (n_pos_y >= num_y )) {
       return null;
     } else {
       return bigsquares[n_pos_z][n_pos_x][n_pos_y];
     }
  }
  
  BigSquare getMYSquare(int n_pos_z, int n_pos_x, int n_pos_y) {
     if ((n_pos_z < 0) || (n_pos_x < 0) || (n_pos_y < 0) || (n_pos_z >= num_z) || (n_pos_x >= num_x) || (n_pos_y >= num_y) || !this.bigsquares[n_pos_z][n_pos_x][n_pos_y].mine) {
       return null;
     } else {
       return bigsquares[n_pos_z][n_pos_x][n_pos_y];
     }
  }
 
 
  ////////////////////////////////////////////////////////
  /// hover over a square
  void hover() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {                          
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {                        
          bigsquares[level][pos_x][pos_y].hover();          //limit the level hover here? same can be done for all??
        }
      }
    }
  }
 
 /*
  //////////////////////////////////////////////////////// 
  ///reset
  void reset_other_users() {
    for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
      for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
        BigSquare bigsquare = bigsquares[pos_x][pos_y];
        bigsquare.reset_other_users();
      }
    }
  }
  */
  //////////////////////////////////////////////////////// 
  ///press
  
  void tocheckcross() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {                          
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {                        
          bigsquares[pos_z][pos_x][pos_y].tocheckcross();
        }
      }
    }
  }
  
  
  //////////////////////////////////////////////////////// 
  ///stage one mehthod
  void displaycheckcross() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {                          
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {                        
          bigsquares[pos_z][pos_x][pos_y].displaycheckcross();
        }
      }
    }
  }
  
  void displaycheck3D() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {                          
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {                        
          bigsquares[pos_z][pos_x][pos_y].displaycheck3D();
        }
      }
    }
  }
  
    void displaynext() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {                          
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {                        
          bigsquares[pos_z][pos_x][pos_y].displaynext();
        }
      }
    }
  }
  

  void changecase() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {                          
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {                        
          bigsquares[pos_z][pos_x][pos_y].changecase();
        }
      }
    }
  }
  

  
   
  void autoshift() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {                          
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {                        
          bigsquares[pos_z][pos_x][pos_y].autoshift();
        }
      }
    }
  }
  /*
  //////////////////////////////////////////////////////// 
  ///stage two mehthod
    */
  void displaysmallgrid() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {                                                   
          bigsquares[pos_z][pos_x][pos_y].displaysmallgrid();
        }
      }
    }
  }
  
  void fillunit() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {                                                   
          bigsquares[pos_z][pos_x][pos_y].fillunit();
        }
      }
    }
  }
  
  void setstate() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {                                                   
          bigsquares[pos_z][pos_x][pos_y].setstate();
        }
      }
    }
  }
  
  void changeoffset() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {                                                   
          bigsquares[pos_z][pos_x][pos_y].changeoffset();
        }
      }
    }
  }
  
  void resetstate() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {                                                   
          bigsquares[pos_z][pos_x][pos_y].resetstate();
        }
      }
    }
  }
  
  //////////////////////////////////////////////////////// 
  ///stage 3 mehthod
  void addwindow() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {                                                   
          bigsquares[pos_z][pos_x][pos_y].addwindow();
        }
      }
    }
  }
  
  void hoversmall() {
    for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
      for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
        for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {                                                   
          bigsquares[pos_z][pos_x][pos_y].hoversmall();
        }
      }
    }
  }

  ////////////////////////////////////////////////////////
  //end of class
  //temp
   void allNotMine() {
     if (key == 'y') {
      for (int pos_z = 0 ; pos_z < num_z ; pos_z++) {
        for (int pos_x = 0 ; pos_x < num_x ; pos_x++) {
          for (int pos_y = 0 ; pos_y < num_y ; pos_y++) {
            if (bigsquares[pos_z][pos_x][pos_y].checked() || bigsquares[pos_z][pos_x][pos_y].crossed()) {
              bigsquares[pos_z][pos_x][pos_y].mine = false;
              user_id = "ong";
            }
          }
        }
      }
     }
   }
  
}

