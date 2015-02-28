
public class Box {
  private final int[][] MATRIX = new int[][]{
    {
      -1, -1, -1                    }
    ,
    {
      -1, -1,  1                    }
    ,
    {
      -1,  1, -1                    }
    ,
    {
      -1,  1,  1                    }
    ,
    { 
      1, -1, -1                    }
    ,
    { 
      1, -1,  1                    }
    ,
    { 
      1,  1, -1                    }
    ,
    { 
      1,  1,  1                    }
  };

  float x, y, z, size;
  float rotX, rotY, rotZ;
  float stepX, stepY, stepZ;
  Box[] children;
  int numBoxes;

  public Box(float s) {
    this(0,0,0,s);
  }

  public Box(float a, float b, float c, float s) {
    x=a;
    y=b;
    z=c;
    size=s;

    children = new Box[8];
    rotX=rotY=rotZ=0;
    stepX=random(0,0.05);
    stepY=random(0,0.05);
    stepZ=random(0,0.05);
  }

  public void tick() {
    if(numBoxes == children.length) {
      for(int i = 0; i < children.length; i++) {
        children[i].tick();
      }
    } 
    else {
      int[] row = MATRIX[numBoxes];
      children[numBoxes] = new Box(row[0]*size/2, row[1]*size/2, row[2]*size/2, size/3f);
      numBoxes++;
    }
  }

  public void draw() {
    pushMatrix();
    translate(x,y,z);
    rotateX(rotX);
    rotateY(rotY);
    rotateZ(rotZ);
    box(size);

    for(int i = 0; i < children.length; i++) {
      if(children[i] != null) {
        children[i].draw();
      }
    }

    popMatrix();

    rotX+=stepX;
    rotY+=stepY;
    rotZ+=stepZ;
  }
}

