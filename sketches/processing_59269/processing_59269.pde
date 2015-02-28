
import wblut.hemesh.modifiers.*;
import wblut.geom.frame.*;
import wblut.hemesh.composite.*;
import wblut.core.processing.*;
import wblut.hemesh.tools.*;
import wblut.hemesh.simplifiers.*;
import wblut.hemesh.subdividors.*;
import wblut.geom.nurbs.*;
import wblut.core.random.*;
import wblut.geom.triangulate.*;
import wblut.hemesh.creators.*;
import wblut.geom.tree.*;
import wblut.hemesh.core.*;
import wblut.geom.grid.*;
import wblut.core.structures.*;
import wblut.core.math.*;
import wblut.geom.core.*;


 
 
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
 
 
HE_Mesh mesh;
HE_Mesh holes;
PeasyCam cam;
HE_Selection selection;
WB_Render render;
HEM_Extrude modifier;
ArrayList<WB_Polygon> removedPolys = new ArrayList<WB_Polygon>();

 
void setup()
{
    size(450, 450, P3D);
 
    cam = new PeasyCam(this, 90);
    HEC_Creator cube = new HEC_Box().setWidth(50).setWidthSegments(2).setHeight(50).setHeightSegments(2).setDepth(50).setDepthSegments(2);
    mesh = new HE_Mesh(cube);
 
    selection=new HE_Selection(mesh);

    Iterator<HE_Face> fItr=mesh.fItr();
    HE_Face f;
    while(fItr.hasNext()){
     f=fItr.next();
 
     if(random(100) < 55){
       selection.add(f);
       removedPolys.add(f.toPolygon());
     }
    }
 
 
 
   HEM_Lattice lattice = new HEM_Lattice().setDepth(3).setWidth(1);
   mesh.modifySelected(lattice, selection);
   

 
  //F. Vanhoutte via eMail
   WB_Point3d[] vertices = new WB_Point3d[removedPolys.size()* 4];
   int[][] faces = new int[removedPolys.size()][4];
   for (int i = 0; i < removedPolys.size(); i++) {
     vertices[4 * i] = removedPolys.get(i).getPoint(0);
     vertices[4 * i + 1] = removedPolys.get(i).getPoint(1);
     vertices[4 * i + 2] = removedPolys.get(i).getPoint(2);
     vertices[4 * i + 3] = removedPolys.get(i).getPoint(3);
     faces[i][0] = 4 * i;
     faces[i][1] = 4 * i + 1;
     faces[i][2] = 4 * i + 2;
     faces[i][3] = 4 * i + 3;
   }
   HEC_FromFacelist ffl = new HEC_FromFacelist().setVertices(vertices).setFaces(faces).setDuplicate(false);
   holes = new HE_Mesh(ffl);  
  
   modifier = new HEM_Extrude();
   modifier.setDistance(0.1);
   holes.modify(modifier);

   HES_CatmullClark subdividor=new HES_CatmullClark();
   subdividor.setKeepBoundary(false);
   subdividor.setKeepEdges(false);
 
   mesh.subdivide(subdividor,3);
   holes.subdivide(subdividor,3);

   render=new WB_Render(this);
}
 
void draw()
{
    background(240);
    lights();
    rotateY(radians(35));
    noStroke();
    fill(170);
    render.drawFaces(mesh);
    fill(#B90202, 70);
    render.drawFaces(holes);
 
}

void keyPressed()
{
    //HET_Export.saveToSTL(mesh,sketchPath("building.stl"),1.0);
    //HET_Export.saveToSTL(holes,sketchPath("glass.stl"),1.0);
   saveFrame("rounded.jpg");
}

