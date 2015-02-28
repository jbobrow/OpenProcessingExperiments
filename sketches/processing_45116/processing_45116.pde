
/*

Test Four: 3rd November 2011
Adding another modifier to the subdivided gemoetry and  
extrude modifier in test 3

*/
import wblut.processing.*;
import wblut.hemesh.creators.*;
import wblut.hemesh.subdividors.*;
import wblut.hemesh.core.*;
import wblut.hemesh.modifiers.*;


HE_Mesh mesh;
WB_Render render;

//this is added for a modifier
HEM_Extrude modifier;

void setup() {
    size(800, 800, P3D);
    
  // added a variable of fill - this can be a property of the artifact
  fill (120);
createMesh();
  
  /*
  I could create each of the things like subdivider, 
  modifiers as classes, it might be much easier
  
 */
   
  // load the subdividor type
   HES_PlanarMidEdge subdividor=new HES_PlanarMidEdge();
   mesh.subdivide(subdividor,2);
  
  //load the modifier
  
  //create a new modifier of extrude type
  modifier=new HEM_Extrude();
  
  //extrude modifier parameters
  modifier.setDistance(30);// extrusion distance, set to 0 for inset faces - (I could contrle this and add a mathematical equation to it MS)
  modifier.setRelative(false);// treat chamfer as relative to face size or as absolute value
  modifier.setChamfer(4);// chamfer for non-hard edges
  modifier.setHardEdgeChamfer(100);// chamfer for hard edges
  modifier.setThresholdAngle(1.5*HALF_PI);// treat edges sharper than this angle as hard edges
  modifier.setFuse(true);// try to fuse planar adjacent planar faces created by the extrude
  modifier.setFuseAngle(0.05*HALF_PI);// threshold angle to be considered coplanar
  modifier.setPeak(true);//if absolute chamfer is too large for face, create a peak on the face
  mesh.modify(modifier);
  
  //noise modifier
  
  HEM_Noise modifier=new HEM_Noise();
  modifier.setDistance(10);
  mesh.modify(modifier);
  
  
  
  
  
  //render
 render=new WB_Render(this);
}

void draw() {
  background(255);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  translate(400, 400, 100);

  // rotating the egometry is a good way to preview the tangible artifact
  rotateY(mouseX*1.0f/width*TWO_PI);
  rotateX(mouseY*1.0f/height*TWO_PI);
  stroke(0);
  render.drawEdges(mesh);
  noStroke();
  render.drawFaces(mesh);
}
 //creating the initial geometry
void createMesh(){
  
  //calling the function create a dodecahedron
  HEC_Dodecahedron creator=new HEC_Dodecahedron();
  //the parameters of the edge - number relates to size
  creator.setEdge(150); 
   // at a guess, this creates the mesh between the lines
  mesh=new HE_Mesh(creator); 

}


