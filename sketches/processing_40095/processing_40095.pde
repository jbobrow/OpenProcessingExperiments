
void AI() {
  
  int ranDirection;
  
  ranDirection = (int)random(10);
  //println(ranDirection + " " + theArena[x2][y2-2] + " " + x2 + " " + y2);
  
  
  
  if (NORTH2) {
    
    for (int i = 1; i < 2; i++){
      
      //println(x2 + " " + (y2-i));
      if (theArena[x2][y2-i] == 1 || theArena[x2][y2-i] == 2 || y2 == 3 || x2 == 2 || x2 == 97) {
        
        //if going to hit top boarder and the right is a trail
        if (y2 == 3 && theArena[x2+i][y2] == 2 || y2 == 3 && theArena[x2+i][y2] == 1) {
          println("North 1");
          NORTH2 = false;
          WEST2 = true;
          EAST2 = false;
          SOUTH2 = false;
        }
        
        //if going to hit top boarder and the left is a trail
        else if (y2 == 3 && theArena[x2-i][y2] == 2 || y2 == 3 && theArena[x2-i][y2] == 1) {
          println("North 2");
          NORTH2 = false;
          EAST2 = true;
          SOUTH2 = false;
          WEST2 = false;
        }
        
        //if going to hit top boarder and no trails left or right
        else if (y2 == 3 && theArena[x2-i][y2] == 0 && theArena[x2+i][y2] == 0) {
          println("North 3");
          if (ranDirection < 5) {
            NORTH2 = false;
            EAST2 = true;
            SOUTH2 = false;
            WEST2 = false;
          }
          
          else if (ranDirection > 4) {
            NORTH2 = false;
            WEST2 = true;
            SOUTH2 = false;
            EAST2 = false;
          }
        }  
        
        
        //if going hit another trail and there's a trail to the right
        else if (theArena[x2][y2-i] == 1 && theArena[x2+i][y2] == 1 || theArena[x2][y2-i] == 1 && theArena[x2+i][y2] == 2 || theArena[x2][y2-i] == 2 && theArena[x2+i][y2] == 1 || theArena[x2][y2-i] == 2 && theArena[x2+i][y2] == 2) {
          println("North 4");
          NORTH2 = false;
          WEST2 = true;
          SOUTH2 = false;
          EAST2 = false;
        }
        
        //if going hit another trail and there's a trail to the left
        else if (theArena[x2][y2-i] == 1 && theArena[x2-i][y2] == 1 || theArena[x2][y2-i] == 1 && theArena[x2-i][y2] == 2 || theArena[x2][y2-i] == 2 && theArena[x2-i][y2] == 1 || theArena[x2][y2-i] == 2 && theArena[x2-i][y2] == 2) {
          println("North 5");
          NORTH2 = false;
          EAST2 = true;
          SOUTH2 = false;
          WEST2 = false;
        }
        
        //if going hit another trail and there's no trail
        else if (theArena[x2][y2-1] == 1 && theArena[x2-i][y2] == 0 && theArena[x2+i][y2] == 0 || theArena[x2][y2-1] == 2 && theArena[x2-i][y2] == 0 && theArena[x2+i][y2] == 0) {
          println("North 6");
          if (ranDirection < 5) {
            NORTH2 = false;
            EAST2 = true;
            WEST2 = false;
            SOUTH2 = false;
          }
          
          else if (ranDirection > 4) {
            NORTH2 = false;
            WEST2 = true;
            SOUTH2 = false;
            EAST2 = false;
          }
        }
        
        //turn away from the side
        else if (x2 <= 3 && theArena[x2][y2-1] == 0 || x2 <= 3 && y2 <= 3) {
          println("North 7");
          NORTH2 = false;
          EAST2 = true;
          WEST2 = false;
          SOUTH2 = false;
        }
        
        else if (x2 == 97 && theArena[x2][y2-1] == 0 || x2 == 97 && y2 == 97) {
          println("North 8");
          NORTH2 = false;
          WEST2 = true;
          EAST2 = false;
          SOUTH2 = false;
        }
        
      }
    }

  }
  
  
  else if (SOUTH2) {
    
    for (int i = 1; i < 2; i++){
      
      //println(x2 + " " + (y2+i));
      if (theArena[x2][y2+i] == 1 || theArena[x2][y2+i] == 2 || y2 == 97 || x2 == 97 || x2 == 2) {
        
        //if going to hit top boarder and the right is a trail
        if (y2 == 97 && theArena[x2+i][y2] == 2 || y2 == 97 && theArena[x2+i][y2] == 1) {
          println("South 1");
          SOUTH2 = false;
          WEST2 = true;
          NORTH2 = false;
          EAST2 = false;
        }
        
        //if going to hit top boarder and the left is a trail
        else if (y2 == 97 && theArena[x2-i][y2] == 2 || y2 == 97 && theArena[x2-i][y2] == 1) {
          println("South 2");
          SOUTH2 = false;
          EAST2 = true;
          WEST2 = false;
          NORTH2 = false;
        }
        
        //if going to hit top boarder and no trails left or right
        else if (y2 == 97 && theArena[x2-1][y2] == 0 && theArena[x2+1][y2] == 0) {
          println("South 3");
          if (ranDirection < 5) {
            NORTH2 = false;
            EAST2 = true;
            WEST2 = false;
            SOUTH2 = false;
          }
          
          else if (ranDirection > 4) {
            NORTH2 = false;
            WEST2 = true;
            SOUTH2 = false;
            EAST2 = false;
          }
        }  
        
        
        
        //if going hit another trail and there's a trail to the right
        else if (theArena[x2][y2+i] == 1 && theArena[x2+i][y2] == 1 || theArena[x2][y2+i] == 1 && theArena[x2+i][y2] == 2 || theArena[x2][y2+i] == 2 && theArena[x2+i][y2] == 1 || theArena[x2][y2+i] == 2 && theArena[x2+i][y2] == 2) {
          println("South 4");
          SOUTH2 = false;
          WEST2 = true;
          NORTH2 = false;
          EAST2 = false;
        }
        
        //if going hit another trail and there's a trail to the left
        else if (theArena[x2][y2+i] == 1 && theArena[x2-i][y2] == 1 || theArena[x2][y2+i] == 1 && theArena[x2-i][y2] == 2 || theArena[x2][y2+i] == 2 && theArena[x2-i][y2] == 1 || theArena[x2][y2+i] == 2 && theArena[x2-i][y2] == 2) {
          println("South 5");
          SOUTH2 = false;
          EAST2 = true;
          NORTH2 = false;
          WEST2 = false;
        }
        
        //if going hit another trail and there's no trail
        else if (theArena[x2][y2+1] == 1 || theArena[x2][y2+1] == 2) {
          println("South 6");
          if (ranDirection < 5) {
            NORTH2 = false;
            EAST2 = true;
            WEST2 = false;
            SOUTH2 = false;
          }
          
          else if (ranDirection > 4) {
            NORTH2 = false;
            WEST2 = true;
            SOUTH2 = false;
            EAST2 = false;
          }
        }
        
        //turn away from the side
        else if (x2 == 2 && theArena[x2][y2+1] == 0 || x2 == 2 && y2 == 97) {
          println("South 7");
          NORTH2 = false;
          EAST2 = true;
          SOUTH2 = false;
          WEST2 = false;
        }
        
        else if (x2 == 97 && theArena[x2][y2+1] == 0 || x2 == 97 && y2 == 97) {
          println("South 8");
          NORTH2 = false;
          WEST2 = true;
          EAST2 = false;
          SOUTH2 = false;
        }
      }
    }

  }
  
  
  
  else if (EAST2) {
    
    for (int i = 1; i < 2; i++){
      
      //println((x2+i)  + " " + y2);
      if (theArena[x2+i][y2] == 1 || theArena[x2+i][y2] == 2 || x2 == 97 || y2 == 97 || y2 == 2) {
        
        //if going to hit boarder and theres a trail down
        if (x2 == 97 && theArena[x2][y2+1] == 1 || x2 == 97 && theArena[x2][y2+1] == 2) {
          println("East 1");
          EAST2 = false;
          NORTH2 = true;
          WEST2 = false;
          SOUTH2 = false;
        }
        
        //if going to hit boarder and theres a trail up
        else if (x2 == 97 && theArena[x2][y2-1] == 1 || x2 == 97 && theArena[x2][y2-1] == 2) {
          println("East 2");
          EAST2 = false;
          SOUTH2 = true;
          WEST2 = false;
          NORTH2 = false;
        }
        
        //if going to hit top boarder and no trails left or right
        else if (x2 == 97) {
          println("East 3");
          if (ranDirection < 5) {
            EAST2 = false;
            NORTH2 = true;
            WEST2 = false;
            SOUTH2 = false;
          }
          
          else if (ranDirection > 4) {
            EAST2 = false;
            SOUTH2 = true;
            WEST2 = false;
            NORTH2 = false;
          }
        } 
        
        
        //if going to hit another trail and there's a trail down
        else if (theArena[x2+1][y2] == 1 && theArena[x2][y2+1] == 1 || theArena[x2+1][y2] == 1 && theArena[x2][y2+1] == 2 || theArena[x2+1][y2] == 2 && theArena[x2][y2+1] == 1 || theArena[x2+1][y2] == 2 && theArena[x2][y2+1] == 2) {
          println("East 4");
          EAST2 = false;
          NORTH2 = true;
          SOUTH2 = false;
          WEST2 = false;
        }
        
        //if going to hit another trail and there's a trail up
        else if (theArena[x2+1][y2] == 1 && theArena[x2][y2-1] == 1 || theArena[x2+1][y2] == 1 && theArena[x2][y2-1] == 2 || theArena[x2+1][y2] == 2 && theArena[x2][y2-1] == 1 || theArena[x2+1][y2] == 2 && theArena[x2][y2-1] == 2) {
          println("East 5");
          EAST2 = false;
          SOUTH2 = true;
          NORTH2 = false;
          WEST2 = false;
        }
        
        //if going to hit another trail and no trails beside
        else if (theArena[x2+1][y2] == 1 || theArena[x2+1][y2] == 2) {
          println("East 6");
          if (ranDirection > 5) {
            EAST2 = false;
            NORTH2 = true;
            SOUTH2 = false;
            WEST2 = false;
          }
          
          else if (ranDirection > 4) {
            EAST2 = false;
            SOUTH2 = true;
            NORTH2 = false;
            WEST2 = false;
          }
        }
        
        //turn away from the side
        else if (y2 == 3 && theArena[x2+1][y2] == 0 || x2 == 97 && y2 == 3) {
          println("East 7");
          NORTH2 = false;
          EAST2 = false;
          SOUTH2 = true;
          WEST2 = false;
        }
        
        else if (y2 == 97 && theArena[x2+1][y2] == 0 || x2 == 97 && y2 == 97) {
          println("East 8");
          NORTH2 = true;
          WEST2 = false;
          EAST2 = false;
          SOUTH2 = false;
        }
      }
    }

  }
  
  
  
  else if (WEST2) {
    
    for (int i = 1; i < 2; i++){
      
      //println((x2-i)  + " " + y2);
      if (theArena[x2-i][y2] == 1 || theArena[x2-i][y2] == 2 || x2 == 2 || y2 == 97 || y2 == 2) {
        
        //if going to hit boarder and theres a trail down
        if (x2 == 2 && theArena[x2][y2+1] == 1 || x2 == 2 && theArena[x2][y2+1] == 2) {
          println("West 1");
          WEST2 = false;
          NORTH2 = true;
          SOUTH2 = false;
          EAST2 = false;
        }
        
        //if going to hit boarder and theres a trail up
        else if (x2 == 2 && theArena[x2][y2-1] == 1 || x2 == 2 && theArena[x2][y2-1] == 2) {
          println("West 2");
          WEST2 = false;
          SOUTH2 = true;
          EAST2 = false;
          NORTH2 = false;
        }
        
        //if going to hit top boarder and no trails left or right
        else if (x2 == 2) {
          println("West 3");
          if (ranDirection < 5) {
            WEST2 = false;
            NORTH2 = true;
            EAST2 = false;
            SOUTH2 = false;
          }
          
          else if (ranDirection > 4) {
            WEST2 = false;
            SOUTH2 = true;
            NORTH2 = false;
            EAST2 = false;
          }
        }
        
        //if going to hit another trail and there's a trail down
        else if (theArena[x2-1][y2] == 1 && theArena[x2][y2+1] == 1 || theArena[x2-1][y2] == 1 && theArena[x2][y2+1] == 2 || theArena[x2-1][y2] == 2 && theArena[x2][y2+1] == 1 || theArena[x2-1][y2] == 2 && theArena[x2][y2+1] == 2) {
          println("West 4");
          WEST2 = false;
          NORTH2 = true;
          SOUTH2 = false;
          EAST2 = false;
        }
        
        //if going to hit another trail and there's a trail up
        else if (theArena[x2-1][y2] == 1 && theArena[x2][y2-1] == 1 || theArena[x2-1][y2] == 1 && theArena[x2][y2-1] == 2 || theArena[x2-1][y2] == 2 && theArena[x2][y2-1] == 1 || theArena[x2-1][y2] == 2 && theArena[x2][y2-1] == 2) {
          println("West 5");
          WEST2 = false;
          SOUTH2 = true;
          NORTH2 = false;
          EAST2 = false;
        }
        
        //if hitting another trail with no trail beside
        else if (theArena[x2-1][y2] == 1 || theArena[x2-1][y2] == 2) {
          println("West 6");
          if (ranDirection < 5) {
            WEST2 = false;
            NORTH2 = true;
            EAST2 = false;
            SOUTH2 = false;
          }
          
          else if (ranDirection > 4) {
            WEST2 = false;
            SOUTH2 = true;
            NORTH2 = false;
            EAST2 = false;
          }
        }
        
        //turn away from the side
        else if (y2 == 3 && theArena[x2-1][y2] == 0 || x2 == 3 && y2 == 3) {
          println("West 7");
          NORTH2 = false;
          EAST2 = false;
          SOUTH2 = true;
          WEST2 = false;
        }
        
        else if (y2 == 97 && theArena[x2-1][y2] == 0 || x2 == 3 && y2 == 3) {
          println("West 8");
          NORTH2 = true;
          WEST2 = false;
          EAST2 = false;
          SOUTH2 = false;
        }
      }
    }

  }
  
  
}

