
/*
  Chunk Class
  ---
  A single "Room"/"Area" of a dungeon
  Redesigned to be less dependant on Player object
  ---
  Block Types:
  0 - Air
  1 - Solid
  ---
*/

public class Chunk{
  
  //Member Variables
  int[][][] blocks;   //3D array of blocks, individual values store the type of block.
  int blockSize;      //How big the blocks will be drawn.

  int xCount;         //How many blocks there will be in the X dimension
  int zCount;         //How many blocks there will be in the Z dimension
  int yCount;         //How many blocks there will be in the Y dimension

  int xOrigin;        //Point of origin for drawing and reference
  int yOrigin;        //See above
  int zOrigin;        //See above
  
  int xCoord;         //"Location" of the chunk for easier sorting/searching
  int yCoord;         //See above
  int zCoord;         //See above
  
  /*==================================================================================CONSTRUCTOR A
    Complex Constructor
    No default values.
    ===*/
  public Chunk(int nBlockSize, int nxCount, int nzCount, int nyCount, int xc, int yc, int zc){

    //Initialize static variables
    blockSize = nBlockSize;
    xCount = nxCount;
    zCount = nzCount;
    yCount = nyCount;
    xOrigin = xc * (blockSize*xCount);
    yOrigin = yc * (blockSize*yCount);
    zOrigin = zc * (blockSize*zCount);
    xCoord = xc;
    yCoord = yc;
    zCoord = zc;
    
    //Initialize Block Array
    blocks = new int[xCount][yCount][zCount]; //XYZ, not XZY or YZX or XZY.
    
    //At this point the array is still empty, and must be initialized.  
  }
  
  /*===================================================================================UPDATE(draw)
    Update(Default)
    Draws the chunk on the screen.
    Recycled and revised from DungeonDriverV2
    ===*/
  public void update(int drawMode){
    int currentBlock;     //Storage for the current block id
    //Start on the first layer, and work up.
    for(int y = 0; y < yCount; y++){
      for(int x = 0; x < xCount; x++){
        for(int z = 0; z < zCount; z++){
          currentBlock = blocks[x][y][z];
          if(currentBlock != 0){
            pushMatrix();
                       //Local position, accounting for origin position
            translate( xOrigin + (x*blockSize) +(blockSize/2),
                       yOrigin - (y*blockSize) -(blockSize/2),
                       zOrigin + (z*blockSize) +(blockSize/2));
            
                      //<snip> RIP old code.
                      /*(x*blockSize) + (xOrigin+blockSize*blockCount),
                       -(y*blockSize) + (yOrigin+blockSize*chunkHeight),
                       (z*blockSize) + (zOrigin+blockSize*blockCount));*/
            //Walls
            if(currentBlock == 1){
              fill(255,255,255);
              //Regular Walls==============================Regular Walls
              if(drawMode == 1)
                box(blockSize);
              //*///=======================================
              //Pillar Walls :D===========================Pillars
              if(drawMode == 2){
                if(y > 1 && y < yCount-2)
                  box(blockSize/10,blockSize,blockSize/10);
                else
                  box(blockSize);                 
              }
              //*///=======================================
              //Windows!==================================Windows
              if(drawMode == 3){
                if(y > 1 && y < yCount-2)
                  fill(255,255,255,50);
                else
                  fill(255,255,255);
                box(blockSize);
              }
              //*///=======================================  
            }//*///========================================End
            /*/Doors
            else if(currentBlock == -1){
              fill(200,200,0);
              box(blockSize);
            }//*/
            //Windows (Vertical)
            else if(currentBlock == -3){
              fill(200,255,200,75);
              stroke(1);
              box(blockSize,0,blockSize);
              noStroke();
            }//*/
            popMatrix();
          }         
        }
      }
    }
  }  
  
  /*==================================================================================GENERATE
    Generate Chunk(Default)
    Will generate a default chunk with arbitrary walls and doors, based on "mode"
    ===*/
  public void generate(int mode){
    
    //Starting Block
    if(mode == 1){
      for(int x = 0; x < xCount; x++){
        for(int z = 0; z < zCount; z++){
          blocks[x][0][z] = 1;  //The floor will be solid.
          if(xCount/2 != x && zCount/2 != z)
            blocks[x][1][z] = 1;
          else
            blocks[x][1][z] = 0; //Is this neccesary?
          for(int y = 2; y < yCount; y++)
            blocks[x][y][z] = blocks[x][1][z];
        }
      }
    }
    if(mode == 2){
      //Create "air"
      for(int x = 0; x < xCount; x++){
        for(int z = 0; z < zCount; z++){
          for(int y = 1; y < yCount-1; y++){
            if(xCount/2 == x || zCount/2 == z){
              blocks[x][y][z]= -1;
            }
          }
        }
      }
      //Create "walls"
      fillWalls(-1,1);
      //Replace inner walls with air
      for(int x = 1; x < xCount-1; x++){
        for(int z = 1; z < zCount-1; z++){
          for(int y = 1; y < yCount-1; y++){
            if(blocks[x][y][z] == -1)
              blocks[x][y][z] = 0;
          }
        }
      }
    }
  }
  
  /*==================================================================================GENERATE(c)
    Generate Chunk(Complex)
    Will generate a chunk based on the doors of the adjacent chunks.
    Example of sample doors array for 5x5 chunk ([x][z])
      0 1 2 3 4     Indices
    *     N         * = reference corner for drawing.
  0   0 0 0 1 0     Each '1' will mark the point of a path to be generated
  1   0 0 0 0 0     Actual function may vary depending on mode.
  2 W 1 0 0 0 0 E   Calculation of neighboring doors handled by Dungeon object
  3   0 0 0 0 1
  4   0 0 0 1 0
          S
    ===*/
  public void generate(int[][] doors){
    
    //Make more doors if neccecary
    
    /*Fill The chunk in first.  -Not efficient for drawing.
    for(int x = 0; x < xCount; x++){
      for(int z = 0; z < zCount; z++){
        for(int y = 0; y < yCount; y++){
          blocks[x][y][z] = 1;
        }
      }
    }*/      
    
    //Generate Clip Walls
    for(int x = 0; x < xCount; x++){
      for(int z = 0; z < zCount; z++){
        blocks[x][1][z] = doors[x][z];
      }
    }
    
    
    //Generate pathways    
    for(int x = 0; x < xCount; x++){
      for(int z = 0; z < zCount; z++){
        //print(doors[x][z] + " ");
        if(doors[x][z] == -1)
          newPath(x,z);
      }
      //println();
    }
    fillWalls(-1,1); 
    print("Making a new room:"); 
    newRoom();  
    fillWalls(-1,1);
    
    //Replace inner walls with air
    for(int x = 1; x < xCount-1; x++){
      for(int z = 1; z < zCount-1; z++){
        for(int y = 1; y < yCount-1; y++){
          if(blocks[x][y][z] == -1)
            blocks[x][y][z] = 0;
        }
      }
    }///
  }
  
  /*==================================
    FillWalls
    */
  public void fillWalls(int air, int wall){
    println("Filling in walls");
    for(int x = 0; x < xCount; x++){
      for(int z = 0; z < zCount; z++){
        for(int y = 0; y < yCount; y++){
          if(blocks[x][y][z] == 0){
            //X Walls=======================================================
            if(x > 0 && blocks[x-1][y][z] == air)
              blocks[x][y][z] = wall;
            if(x < xCount-1 && blocks[x+1][y][z] == air)
              blocks[x][y][z] = wall;
            //==============================================================//*/
            //Z Walls=======================================================
            if(z > 0 && blocks[x][y][z-1] == air)
              blocks[x][y][z] = wall;
            if(z < zCount-1 && blocks[x][y][z+1] == air)
              blocks[x][y][z] = wall;
            //==============================================================//*/
            //Y Walls=======================================================
            if(y < yCount-1 && blocks[x][y+1][z] == air)
              blocks[x][y][z] = wall;
            if(y > 0 && blocks[x][y-1][z] == air)
              blocks[x][y][z] = wall;
          }
        }
      }
    }
  }
  
  /*===
  Replace
  Replaces all blocks of type a with type b
  ===*/ 
  public void replace(int a, int b){
    println("Replacing block type "+a+" with "+b);
    for(int x = 0; x < xCount; x++){
      for(int z = 0; z < zCount; z++){
        for(int y = 0; y < yCount; y++){
          if(blocks[x][y][z] == a)
            blocks[x][y][z] = b;
        }
      }
    }
  }
  
  
  /*==================================================================================FINDDOORS
    Method FindDoors - NOT USED RITE NAOW
    ===/
  public int[] findDoors(char dir){
    int[] doors;
    if(dir == 'n' || dir == 'N' || dir == 's' || dir == 'S')
      doors = new int[xCount];
    else
      doors = new int[zCount];
    
    
    //North Wall================================N
    if(dir == 'n' || dir == 'N')
      for(int x = 0; x < xCount; x++)
        doors[x] = blocks[x][1][1];
    //South Wall================================S
    if(dir == 's' || dir == 'S')
      for(int x = 0; x < xCount; x++)
        doors[x] = blocks[x][1][zCount-1];
    //East Wall=================================E
    if(dir == 'e' || dir == 'E')
      for(int z = 0; z < zCount; z++)
        doors[z] = blocks[1][1][z];
    //West Wall=================================W
    if(dir == 'w' || dir == 'W')
      for(int z = 0; z < zCount; z++)
        doors[z] = blocks[xCount-1][1][z];
    
    return doors;
  }
  //================================*/ 
            
  /*==================================================================================OUTBOUNDS
    Method OutBounds
    */  
    boolean outBounds(int x, int y, int z){
      if(x>=xOrigin+(xCount*blockSize) || y >= yOrigin+(blockSize*yCount) || z >= zOrigin + (zCount*blockSize) || x < xOrigin || y < yOrigin || z < zOrigin)
        return true;
      return false;
    }
  
  
  
  //=====================================================================================================================================    Checkblock Method
  // METHOD: CHECKBLOCK Checks to see if x y z is colliding with an occupied space 
  // Also uses the player object for unique block events.
  //True if: XYZ point is within the area of an occupied block
  //False if: XYZ point is not in any occupied block, or it is outside of the chunk, or if it manages to default otherwise, which shouldn't happen.
  //=====================================================================================================================================
  public boolean checkBlock(float x, float y, float z, Player player){    
    //print("Checkblock = ");
    if(x>=xOrigin+(xCount*blockSize) || y >= yOrigin+(blockSize*yCount) || z >= zOrigin + (zCount*blockSize) || x < xOrigin || y < yOrigin || z < zOrigin){
      //println("Out of chunk rangeeeeeeeeeeee");
      //println("OoB");
      return false;
    }
    
    //RIP old code. This was to account for an error in the block drawing. (blocks would be drawn from the middle, messing up my coord. system
    //x = (x+blockSize/2)/(blockSize);
    //y = (y+blockSize/2)/(blockSize);
    //z = (z+blockSize/2)/(blockSize);
    
    x = (x - xOrigin)/(blockSize);    //In: xyz unmodified position
    y = (y - yOrigin)/(blockSize);    //Out: xyz digits corresponding to block location
    z = (z - zOrigin)/(blockSize);
    
    //Check if the block is occupied, if it is, return true, and call to contact.
    if(blocks[(int)x][(int)y][(int)z] > 0){
      //contact(player,blocks[(int)x][(int)y][(int)z]);
      //println("TRUE");
      return true;
    }
    
    //False if it is not occupied.
    
    //println("FALSE");
    return false;
  }
  /*==================================================================================
    FindBlock
    Like CHECKBLOCK, but returns type of block
  ==================================================================================*/
  public int findBlock(float x, float y, float z){
    if(x>=xOrigin+(xCount*blockSize) || y >= yOrigin+(blockSize*yCount) || z >= zOrigin + (zCount*blockSize) || x < xOrigin || y < yOrigin || z < zOrigin)
      return -999;
    x = (x - xOrigin)/(blockSize);    //In: xyz unmodified position
    y = (y - yOrigin)/(blockSize);    //Out: xyz digits corresponding to block location
    z = (z - zOrigin)/(blockSize);
    return blocks[(int)x][(int)y][(int)z];
  }
    
  /*==================================================================================NEWPATH***
    newPath
    Creates a new random path through the terrain
*** Revise for two points(start,end)
*** Walls are added in later?
    ===*/
    //
  public void newPath(int x, int z){
    println("Making a new path: " +x+ " " +z);
    int xInc = 0;
    int zInc = 0;
    
    if(x == 0)
      xInc = 1;
    else if(z == 0)
      zInc = 1;
    else if(x == xCount - 1)
      xInc = -1;
    else if(z == zCount - 1)
      zInc = -1;
    else{
      println("Defaulting to random choice");
      int chance = (int)random(1,4);
      if(chance == 1)
        xInc = 1;
      else if(chance == 2)
        xInc = -1;
      else if(chance == 3)
        zInc = 1;
      else if(chance == 4)
        zInc = -1;
    }
    
    println("xInc: " + xInc + " zInc: " +zInc);
    
    while(x < xCount && x >= 0 &&
          z < zCount && z >= 0){
    
      //Create Path
      for(int i = 1; i < yCount-1; i++)
        blocks[x][i][z] = -1;
      
      //Apply increments
      int rand = (int)random(1,20);
      if(rand <= 5 && x > 2 && x < xCount-2 && xInc != 0){
        zInc = xInc;
        xInc = 0;
        println("1");
      }
      else if(rand > 15 && z > 2 && z < zCount-2 && zInc != 0){
        xInc = zInc;
        zInc = 0;
        println("2");
      }
      else{
        if(getBlock(x+xInc,1,z) != -2)//if(z != 0 && z != zCount-1 && getBlock(x+xInc,1,z) != -2)
          x+= xInc;
        else{
          int chance = (int)random(1,3);
          int temp = xInc;
          xInc = 0;
          if(chance == 1)
            zInc = 1;
          else if(chance == 2)
            zInc = -1;
          else if(chance == 3)
            xInc = temp;
        }    
          
        if(getBlock(x,1,z+zInc) != -2)//if(x != 0 && x != xCount-1 && getBlock(x,1,z+zInc) != -2)
          z+= zInc;
        else{
          int chance = (int)random(1,3);
          int temp = zInc;
          zInc = 0;
          if(chance == 1)
            xInc = 1;
          else if(chance == 2)
            xInc = -1;
          else if(chance == 3)
            zInc = temp;
        }       
      }
      
      //Chance of randomly generating another path!
      int pathChance = (int)random(1,20);
      println("PathChance: " +pathChance);
      if(pathChance == 7)
        newPath(x,z);
    }
    
    println("xInc: " + xInc + " zInc: " +zInc);
    
  }//*/
  
  /*===
  NewRoom Method
  Makes a new room if the area in the args is air
  ===*/
  public void newRoom(){
    int x = 0;
    int z = 0;
    
    //Find a spot to stick the room
    int timeout = 20;
    while(getBlock(x,1,z) != -1 && timeout > 0){
      x = (int)random(3,xCount-4);
      z = (int)random(3,zCount-4);
      timeout--;
    }
    
    
    if(timeout != 0){
      //Make the room
      int roomSize = (int)random(2,4);
      println("x:" +x+ " z:" +z+" s:"+roomSize);
      for(int a = x-roomSize; a <= x+roomSize; a++){
        for(int b = z-roomSize; b <= z+roomSize; b++){
          for(int y = 1; y < yCount; y++){
            if(!(a == x-roomSize || a == x+roomSize ||
                 b == z-roomSize || b == z+roomSize)){
              blocks[a][y][b] = -1;
              if(y == yCount-1)
                blocks[a][y][b] = -3;
            }
            else if(blocks[a][y][b] != -1) //|| a == 0 || b == 0 || a == xCount-1 || b == zCount-1)
              blocks[a][y][b] = 1;
          }
        }
      }
    }
    /*if(timeout != 0){
      //Make the room
      int roomSize = (int)random(2,4);
      println("x:" +x+ " z:" +z+" s:"+roomSize);
      for(int a = x-roomSize; a <= x+roomSize; a++){
        if(a > 1 && a < xCount-1){
          for(int b = z-roomSize; b <= z+roomSize; b++){
            if(b > 1 && b < zCount-1){
              for(int y = 1; y < yCount; y++){
                if(!(a == x-roomSize || a == x+roomSize ||
                     b == z-roomSize || b == z+roomSize)){
                  blocks[a][y][b] = -1;
                  if(y == yCount-1)
                    blocks[a][y][b] = -3;
                }
                else if(blocks[a][y][b] != -1 || a == 0 || b == 0 || a == xCount-1 || b == zCount-1)
                  blocks[a][y][b] = 1;
              }
            }
            else
              println("OOB ON B: " +b);
          }
        }
        else{
          println("OOB ON A: " +a);
        }
      }///
    }*/   
  }//*/
  
  /*===
    CenterRef Methods
    Returns absoulte center reference point
    ===*/
  public int xCenterRef(){
    return xOrigin + ((xCount/2)*blockSize);
  }
  public int yCenterRef(){
    return yOrigin + ((yCount/2)*blockSize);
  }
  public int zCenterRef(){
    return zOrigin + ((zCount/2)*blockSize);
  }
  
  public int getXOrigin(){ return xOrigin;}
  public int getYOrigin(){ return yOrigin;}
  public int getZOrigin(){ return zOrigin;}
  public int getXCoord() { return xCoord; }
  public int getYCoord() { return yCoord; }
  public int getZCoord() { return zCoord; }
  public int getBlock(int x, int y, int z) { 
    if(x >= 0 && y >= 0 && z >= 0 && x < xCount && y < yCount && z < zCount)
      return blocks[x][y][z];
    return -999;
  }
}


