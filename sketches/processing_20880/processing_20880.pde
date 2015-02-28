
import wblut.hemesh.*;
import wblut.hemesh.creators.*;
import wblut.hemesh.modifiers.*;
import wblut.hemesh.subdividors.*;
import wblut.hemesh.kdtree.*;
import wblut.hemesh.tools.*;
import wblut.geom.*;
import wblut.math.*;


import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;


HE_Mesh mesh, holes;
PeasyCam cam;
HE_Selection selection;

ArrayList<WB_Polygon> removedPolys = new ArrayList<WB_Polygon>();
ArrayList<WB_Quad> qua = new ArrayList<WB_Quad>();

void setup()
{
    size(650, 650, P3D);

    cam = new PeasyCam(this, 450);
    HEC_Creator cube = new
    HEC_Box(this).setWidth(100).setWidthSegments(5).setHeight(100).setHeightSegments(5).setDepth(100).setDepthSegments(6);
    mesh = new HE_Mesh(cube);

    selection=new HE_Selection();



    Iterator<HE_Face> fItr=mesh.fItr();
    HE_Face f;
    while(fItr.hasNext()){
     f=fItr.next();

     if(random(100) < 40){
       selection.add(f);
       removedPolys.add(f.toPolygon());
     }
    }



   HEM_Lattice lattice = new HEM_Lattice().setDepth(6).setWidth(3);
   mesh.modifySelected(lattice, selection);

   for (WB_Polygon wb:removedPolys){
      for(int i = 0; i < wb.points.length; i+=4){
        WB_Quad wbq = new WB_Quad(wb.points[i], wb.points[i+1], wb.points[i+2], wb.points[i+3]);
        qua.add(wbq);
      }
   }

   HEC_FromQuads hfq = new HEC_FromQuads(this).setQuads(qua);
   holes = new HE_Mesh(hfq);

   HEM_Extrude extrude = new HEM_Extrude().setDistance(4);
   holes.modify(extrude);
}

void draw()
{

    background(240);
    lights();
    noStroke();
    rotateY(radians(35));
    fill(170);
    mesh.drawFaces();
    fill(#B90202, 70);
    holes.drawFaces();

}



