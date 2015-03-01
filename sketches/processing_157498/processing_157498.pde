
import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;

PImage plate;


float[][] points;
int numpoints;
HE_Mesh container;
HE_Mesh copymesh;
HE_Mesh[] cells;
int numcells;
int[][] colorArray;

WB_Render render;

boolean jiggleState; //turns on jiggle 

void setup() {
  size(800,800,P3D);
  smooth(4);
  
  plate = loadImage("plate.png");
  
  //create a container mesh
  createMesh();
  
  //draw Voronoi cells
  createCells();
  
  if(jiggleState==true){
    HEM_Noise modifier=new HEM_Noise();
    modifier.setDistance(10);
    copymesh.modify(modifier);
  }
  
  int faces = numcells;
  colorArray = generateColorArray(faces);
  
  render=new WB_Render(this);
}

void draw() {
  background(plate);
  //directionalLight(255, 255, 255, 1, 1, -1);
  //directionalLight(127, 127, 127, -1, -1, 1);
  translate(400, 400, 0);
  rotateY(mouseX*1.0f/width*TWO_PI);
  rotateX(mouseY*1.0f/height*TWO_PI);
  

  if(jiggleState==true){
  HEM_Noise modifier=new HEM_Noise();
  copymesh=container.get();
  modifier.setDistance(10);
  copymesh.modify(modifier);
  
  render.drawFaces(copymesh);
  drawFaces();
  } else {
  drawFaces();
    
  }


}

//flips jiggle on or off when you press the mouse
void mousePressed(){
  jiggleState =! jiggleState;
}






void createCells(){
  numpoints=100;
  points=new float[numpoints][3];
  for(int i=0;i<numpoints;i++) {
    points[i][0]=random(-250,250);
    points[i][1]=random(-250,250);
    points[i][2]=random(-250,250);
  }
  
  // generate voronoi cells
  HEMC_VoronoiCells multiCreator=new HEMC_VoronoiCells();
  multiCreator.setPoints(points);
  // alternatively points can be WB_Point[], any Collection<WB_Point> and double[][];
  multiCreator.setN(numpoints);//number of points, can be smaller than number of points in input. 
  multiCreator.setContainer(container);// cutoff mesh for the voronoi cells, complex meshes increase the generation time
  multiCreator.setOffset(0);// offset of the bisector cutting planes, sides of the voronoi cells will be separated by twice this distance
  multiCreator.setSurface(false);// is container mesh a volume (false) or a surface (true)
  multiCreator.setCreateSkin(false);// create the combined outer skin of the cells as an additional mesh? This mesh is the last in the returned array.

  // can help speed up things for complex container and give more stable results. Creates the voronoi cells for a simple box and
  // uses this to reduce the number of slicing operations on the actual container. Not fully tested yet.
  
  cells=multiCreator.create();
  numcells=cells.length;
  
  int faces = numcells;
  
  if(jiggleState==false){
    colorArray = generateColorArray(faces);
  } 
  
  
}
void createMesh(){
  container=new HE_Mesh(new HEC_Dodecahedron().setEdge(200));
  if(jiggleState==true){
    copymesh=container.get();
  }
  
}
void drawFaces(){
  noStroke();
   
  for(int i=0;i<numcells;i++) {
    fill(color(colorArray[i][0], colorArray[i][1],colorArray[i][2], colorArray[i][3]));
    render.drawFaces(cells[i]);
  }   
}
public int[][] generateColorArray(int faces){
  int[][] colorArray;
  colorArray = new int[faces][4];
  for(int i = 0; i < faces; i++) {
    colorArray[i][0] = (int)random(150, 255);
    colorArray[i][1] = (int)0;
    colorArray[i][2] = (int)random(50, 100);
    colorArray[i][3] = (int)150;
  }
  return colorArray;
}
void jiggleState(){
  
  HEMC_VoronoiCells multiCreator=new HEMC_VoronoiCells();
      multiCreator.setPoints(points);
      // alternatively points can be WB_Point[], any Collection<WB_Point> and double[][];
      multiCreator.setN(numpoints);//number of points, can be smaller than number of points in input. 
      multiCreator.setContainer(container);// cutoff mesh for the voronoi cells, complex meshes increase the generation time
      float time = millis()*0.01;
      float noise = noise(time)*10;
      println("noise: " + noise);
      multiCreator.setOffset(10);// offset of the bisector cutting planes, sides of the voronoi cells will be separated by twice this distance
      multiCreator.setSurface(false);// is container mesh a volume (false) or a surface (true)
      multiCreator.setCreateSkin(false);
  
      cells=multiCreator.create();
      numcells=cells.length;
      
      int faces = numcells;
      colorArray = generateColorArray(faces);
      
      render=new WB_Render(this);
  
  
}


