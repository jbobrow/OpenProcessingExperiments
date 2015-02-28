
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
  public void update(){
    int currentBlock;     //Storage for the current block id
    //Start on the first layer, and work up.
    for(int y = 0; y < yCount; y++){
      for(int x = 0; x < xCount; x++){
        for(int z = 0; z < zCount; z++){
          currentBlock = blocks[x][y][z];
          if(currentBlock > 0){
            pushMatrix();
                       //Local position, accounting for origin position
            translate( xOrigin + (x*blockSize) +(blockSize/2),
                       yOrigin - (y*blockSize) -(blockSize/2),
                       zOrigin + (z*blockSize) +(blockSize/2));
            
                      //<snip> RIP old code.
                      /*(x*blockSize) + (xOrigin+blockSize*blockCount),
                       -(y*blockSize) + (yOrigin+blockSize*chunkHeight),
                       (z*blockSize) + (zOrigin+blockSize*blockCount));*/
            box(blockSize);
            //box(blockSize/10);
            //box(random(10,blockSize));
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
          if(xCount/2 == x || zCount/2 == z){
            blocks[x][1][z]= -1;
            blocks[x][2][z]= -1;
          }
        }
      }
      //Create "walls"
      fillWalls(-1,1);
    }
  }
  
  /*
    FillWalls
    */
  public void fillWalls(int air, int wall){
    for(int x = 0; x < xCount; x++){
        for(int z = 0; z < zCount; z++){
          for(int y = 0; y < yCount; y++){
            //X Walls=======================================================
            if(x > 0 && blocks[x-1][y][z] == air && blocks[x][y][z] != air)
              blocks[x][y][z] = wall;
            if(x < xCount-1 && blocks[x+1][y][z] == air && blocks[x][y][z] != air)
              blocks[x][y][z] = wall;
            //Z Walls=======================================================
            if(z > 0 && blocks[x][y][z-1] == air && blocks[x][y][z] != air)
              blocks[x][y][z] = wall;
            if(z < zCount-1 && blocks[x][y][z+1] == air && blocks[x][y][z] != air)
              blocks[x][y][z] = wall;
            //Y Walls=======================================================
            if(y < yCount-1 && blocks[x][y+1][z] == air && blocks[x][y][z] != air)
              blocks[x][y][z] = wall;
            if(y > 0 && blocks[x][y-1][z] == air && blocks[x][y][z] != air)
              blocks[x][y][z] = wall;
          }
        }
      }
  }
  
  
  /*==================================================================================FINDDOORS
    Method FindDoors
    */
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
            
  /*==================================================================================OUTBOUNDS
    Method OutBounds
    */  
    boolean outBounds(int x, int y, int z){
      if(x>=xOrigin+(xCount*blockSize) || y >= yOrigin+(blockSize*yCount) || z >= zOrigin + (zCount*blockSize) || x < xOrigin || y < yOrigin || z < zOrigin)
        return true;
      return false;
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
    
    //Generate pathways
    for(int x = 0; x < xCount; x++){
      for(int z = 0; z < zCount; z++){
        //North + South Doors
        for(int i = 0; i < xCount; i++){
          if(doors[i][0] == 1)
            newPath(i,0);
          if(doors[i][zCount-1] == 1)
            newPath(i,zCount-1);
        }
        //West + East Doors
        for(int i = 0; i < zCount; i++){
          if(doors[0][i] == 1)
            newPath(0,i);
          if(doors[xCount-1][i] == 1)
            newPath(xCount-1,i);
        }
      }
    }      
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
    
  /*==================================================================================NEWPATH***
    newPath
    Creates a new random path through the terrain
*** Revise for two points(start,end)
*** Walls are added in later?
    ===*/
  public void newPath(int x, int z){
    //Does nothing for now.
  }
  
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
}


