

public class Environment{
  
  int[][][] blocks; //blocks[x][y][z]
  int[][][] colors; //Color IDS
  int areaSize;
  int boxSize;
  int xOrigin, yOrigin, zOrigin;
  boolean useColor;
  int r, g ,b;
  
  public Environment(int nAreaSize,int nBoxSize){
    areaSize = nAreaSize;
    boxSize = nBoxSize;
    blocks = new int[areaSize][areaSize][areaSize];
    colors = new int[areaSize][areaSize][areaSize];
    for (int x = 0; x < areaSize; x++){
      for (int y = 0; y < areaSize; y++){
        for (int z = 0; z < areaSize; z++){
          if(z == 0 && y == 1 && x == 0)
            blocks[x][y][z] = 0;
          else if(y == 0)
            blocks[x][y][z] = 1;
          else if (y == 1)
            blocks[x][y][z] = (int)random(0,3);
          else if (y > 1 & random(0,3) > 1)
            blocks[x][y][z] = blocks[x][y-1][z];
          else if (y > 1 && blocks[x][y-1][z] != 1 && (int)random(0,10) == 4)
            blocks[x][y][z] = 1;
          else
            blocks[x][y][z] = 0;
          colors[x][y][z] = (int)random(1,10);
        }
      }
    }
    xOrigin = 0;//(areaSize*100/2);
    yOrigin = 0;//height/2;
    zOrigin = 0;//(areaSize*100/2);
    r = (int)random(100,200);
    g = (int)random(100,200);
    b = (int)random(100,200);
    useColor = false;
  }
  
  public void update(){
    color temp;
    for(int x = 0; x < areaSize; x++){
      for(int y = 0; y < areaSize; y++){
        for(int z = 0; z < areaSize; z++){
          if(blocks[x][y][z] == 1){
            pushMatrix();
              translate(x*boxSize-xOrigin,yOrigin-y*boxSize,z*boxSize-zOrigin);
              if(useColor){
                temp = setColor(colors[x][y][z]);
                fill(red(temp),green(temp),blue(temp));
              }
              else
                fill(r,g,b);
              box(boxSize);
            popMatrix();
          }
        }
      }
    }
  }
  
  public boolean checkBlock(float x, float y, float z){    
    x = (x+boxSize/2)/(boxSize);
    y = (y+boxSize/2)/(boxSize);
    z = (z+boxSize/2)/(boxSize);

    if(x>=areaSize || y >= areaSize || z >= areaSize || x < 0 || y < 0 || z < 0)
      return false;
    if(blocks[(int)x][(int)y][(int)z] == 1)
      return true;
    return false;
  }
    
  
  public color setColor(int option){
    color filler;
    if(option == 1)
      filler = color(255,255,255);
    else if(option == 2)
      filler = color(255,0,0);
    else if(option == 3)
      filler = color(0,255,0);
    else if(option == 4)
      filler = color(0,0,255);
    else if(option == 5)
      filler = color(20,20,20);
    else if(option == 6)
      filler = color(255,255,0);
    else if(option == 7)
      filler = color(255,0,255);
    else if(option == 8)
      filler = color(0,255,255);
    else if(option == 9)
      filler = color(100,100,100);
    else
      filler = color(0,100);
    return filler;
  }
  
  public boolean collision(int x, int y, int z){
    if(blocks[x][y][z] != 0)
      return true;
    return false;
  }
  
  public void toggleColor(){
    useColor = !useColor;
  }
            
}
  
  

