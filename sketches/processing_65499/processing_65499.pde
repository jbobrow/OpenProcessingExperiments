
PImage[] justices = new PImage[9]; //Filled in setup
ArrayList cubes = new ArrayList();
/* @pjs preload="images/american-flag.png"; */

/* @pjs preload="images/justice0.png"; */
/* @pjs preload="images/justice1.png"; */
/* @pjs preload="images/justice2.png"; */
/* @pjs preload="images/justice3.png"; */
/* @pjs preload="images/justice4.png"; */
/* @pjs preload="images/justice5.png"; */
/* @pjs preload="images/justice6.png"; */
/* @pjs preload="images/justice7.png"; */
/* @pjs preload="images/justice8.png"; */

void setup()
{
  size(450, 450, P3D);
  textureMode(NORMALIZED);
  noStroke();
   
  fillJusticeArray();
  makeTexturedCubes();
}
 
void fillJusticeArray()
{
  for(int x=0;x<justices.length;x++)
  {
   justices[x]=loadImage("justice"+x+".png");
  }
}
 
void makeTexturedCubes()
{
  for(int x=0;x<9;x++)
  {
    TexturedCube cube1 = new TexturedCube(x*2,0,0,justices[x%9]);
    TexturedCube cube2 = new TexturedCube(x*2,-2,0,justices[x%9]);
    TexturedCube cube3 = new TexturedCube(x*2,-4,0,justices[x%9]);
    TexturedCube cube4 = new TexturedCube(x*2,-6,0,justices[x%9]);
    TexturedCube cube5 = new TexturedCube(x*2,-8,0,justices[x%9]);
    TexturedCube cube6 = new TexturedCube(x*2,-10,0,justices[x%9]);
    TexturedCube cube7 = new TexturedCube(x*2,-12,0,justices[x%9]);

    
    cubes.add(cube1);
    cubes.add(cube2);
    cubes.add(cube3);
    cubes.add(cube4);
    cubes.add(cube5);
    cubes.add(cube6);
    cubes.add(cube7);
  }
   
}
 
void draw()
{
  backgroundTranslateScaleRotate();
  texturedCubes(); 
}
 
void backgroundTranslateScaleRotate()
{
  background(loadImage("american-flag.png"));
  translate(width/2,height*.75, 0);
  shapeMode(CENTER);
  scale(20);
  
}
 
void texturedCubes()
{
   
 for(int x=0;x<cubes.size();x++)
 {
   rotateY(frameCount/4000.0 );
   pushMatrix();
   rotateY(x*(PI*2)/9 + PI/6 );
   rotateY(frameCount/90.0 );
   ((TexturedCube)cubes.get(x)).drawCube();
   popMatrix();
 }
  
}
 
 
 
class TexturedCube
{
   
  int xDisplacement;
  int yDisplacement;
  int zDisplacement;
  PImage tex;
   
  TexturedCube(int xDisplacement,int yDisplacement,int zDisplacement,PImage tex)
  {
   this.xDisplacement=xDisplacement;
   this.yDisplacement=yDisplacement;
   this.zDisplacement=zDisplacement;
   this.tex=tex;
  }
   
   
   
  void drawCube()
  {
  beginShape(QUADS);
   
  texture(tex);
 
   // +Z "front" face
  vertex(-1+xDisplacement, -1+yDisplacement,  1+zDisplacement, 0, 0);
  vertex( 1+xDisplacement, -1+yDisplacement,  1+zDisplacement, 1, 0);
  vertex( 1+xDisplacement,  1+yDisplacement,  1+zDisplacement, 1, 1);
  vertex(-1+xDisplacement,  1+yDisplacement,  1+zDisplacement, 0, 1);
 
  // -Z "back" face
  vertex( 1+xDisplacement, -1+yDisplacement, -1+zDisplacement, 0, 0);
  vertex(-1+xDisplacement, -1+yDisplacement, -1+zDisplacement, 1, 0);
  vertex(-1+xDisplacement,  1+yDisplacement, -1+zDisplacement, 1, 1);
  vertex( 1+xDisplacement,  1+yDisplacement, -1+zDisplacement, 0, 1);
 
  // +Y "bottom" face
  vertex(-1+xDisplacement,  1+yDisplacement,  1+zDisplacement, 0, 0);
  vertex( 1+xDisplacement,  1+yDisplacement,  1+zDisplacement, 1, 0);
  vertex( 1+xDisplacement,  1+yDisplacement, -1+zDisplacement, 1, 1);
  vertex(-1+xDisplacement,  1+yDisplacement, -1+zDisplacement, 0, 1);
 
  // -Y "top" face
  vertex(-1+xDisplacement, -1+yDisplacement, -1+zDisplacement, 0, 0);
  vertex( 1+xDisplacement, -1+yDisplacement, -1+zDisplacement, 1, 0);
  vertex( 1+xDisplacement, -1+yDisplacement,  1+zDisplacement, 1, 1);
  vertex(-1+xDisplacement, -1+yDisplacement,  1+zDisplacement, 0, 1);
 
  // +X "right" face
  vertex( 1+xDisplacement, -1+yDisplacement,  1+zDisplacement, 0, 0);
  vertex( 1+xDisplacement, -1+yDisplacement, -1+zDisplacement, 1, 0);
  vertex( 1+xDisplacement,  1+yDisplacement, -1+zDisplacement, 1, 1);
  vertex( 1+xDisplacement,  1+yDisplacement,  1+zDisplacement, 0, 1);
 
  // -X "left" face
  vertex(-1+xDisplacement, -1+yDisplacement, -1+zDisplacement, 0, 0);
  vertex(-1+xDisplacement, -1+yDisplacement,  1+zDisplacement, 1, 0);
  vertex(-1+xDisplacement,  1+yDisplacement,  1+zDisplacement, 1, 1);
  vertex(-1+xDisplacement,  1+yDisplacement, -1+zDisplacement, 0, 1);
   
  endShape();
  /*
  beginShape(QUADS);
   
  texture(loadImage("body.png"));
 
   // +Z "front" face
  vertex(-1+xDisplacement, -1+yDisplacement+2,  1+zDisplacement, 0, 0);
  vertex( 1+xDisplacement, -1+yDisplacement+2,  1+zDisplacement, 1, 0);
  vertex( 1+xDisplacement,  1+yDisplacement+2,  1+zDisplacement, 1, 1);
  vertex(-1+xDisplacement,  1+yDisplacement+2,  1+zDisplacement, 0, 1);
 
  // -Z "back" face
  vertex( 1+xDisplacement, -1+yDisplacement+2, -1+zDisplacement, 0, 0);
  vertex(-1+xDisplacement, -1+yDisplacement+2, -1+zDisplacement, 1, 0);
  vertex(-1+xDisplacement,  1+yDisplacement+2, -1+zDisplacement, 1, 1);
  vertex( 1+xDisplacement,  1+yDisplacement+2, -1+zDisplacement, 0, 1);
 
  // +Y "bottom" face
  vertex(-1+xDisplacement,  1+yDisplacement+2,  1+zDisplacement, 0, 0);
  vertex( 1+xDisplacement,  1+yDisplacement+2,  1+zDisplacement, 1, 0);
  vertex( 1+xDisplacement,  1+yDisplacement+2, -1+zDisplacement, 1, 1);
  vertex(-1+xDisplacement,  1+yDisplacement+2, -1+zDisplacement, 0, 1);
 
  // -Y "top" face
  vertex(-1+xDisplacement, -1+yDisplacement+2, -1+zDisplacement, 0, 0);
  vertex( 1+xDisplacement, -1+yDisplacement+2, -1+zDisplacement, 1, 0);
  vertex( 1+xDisplacement, -1+yDisplacement+2,  1+zDisplacement, 1, 1);
  vertex(-1+xDisplacement, -1+yDisplacement+2,  1+zDisplacement, 0, 1);
 
  // +X "right" face
  vertex( 1+xDisplacement, -1+yDisplacement+2,  1+zDisplacement, 0, 0);
  vertex( 1+xDisplacement, -1+yDisplacement+2, -1+zDisplacement, 1, 0);
  vertex( 1+xDisplacement,  1+yDisplacement+2, -1+zDisplacement, 1, 1);
  vertex( 1+xDisplacement,  1+yDisplacement+2,  1+zDisplacement, 0, 1);
 
  // -X "left" face
  vertex(-1+xDisplacement, -1+yDisplacement+2, -1+zDisplacement, 0, 0);
  vertex(-1+xDisplacement, -1+yDisplacement+2,  1+zDisplacement, 1, 0);
  vertex(-1+xDisplacement,  1+yDisplacement+2,  1+zDisplacement, 1, 1);
  vertex(-1+xDisplacement,  1+yDisplacement+2, -1+zDisplacement, 0, 1);
   
  endShape();
  */
  }
   
}


