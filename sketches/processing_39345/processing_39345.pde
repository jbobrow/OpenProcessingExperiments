
class Cube {
 
    //Properties
    int cubePosX;
    int cubePosY;
    int cubePosZ;
    int cubeWidth;
    int cubeHeight;
    int cubeDepth;
    color cubeColor;
     
    //Constructor
    Cube(int x, int y, int z, int w, int h, int l, color c){
       
      this.cubePosX = x;
      this.cubePosY = y;
      this.cubePosZ = z;
      this.cubeWidth = w;
      this.cubeHeight = h;
      this.cubeDepth = l;
      this.cubeColor = c;     
    }
     
    //Methods
    void drawCube(){
      pushMatrix();
      translate(this.cubePosX, this.cubePosY, this.cubePosZ);
      
      fill(this.cubeColor);

      box(this.cubeWidth, this.cubeHeight, this.cubeDepth);

      popMatrix();
  
  }
}


