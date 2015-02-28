

/*
**  Elaborado por Thomas Sanchez Lengeling
 **  Utilizando liberias de mesh para triangulacion de voronoi y delaunay y toxilibs
 */

import megamu.mesh.*;

class Mesh {

  boolean emptyVoronoi  = false;
  boolean emptyDelaunay = false;

  Mesh() {
    fillPoints();
    setVoronoi();
    setDelaunay();
  }

  void update() {
    fillPoints();
    setDelaunay();
    setVoronoi();
  }

  void draw(PApplet pa) {
    if (showVoronoi) {
      drawVoronoi(pa);
    }
    if ( showDelaunay) {
      drawDelaunay();
    }
  }

  void setDelaunay() {
    if ( pointsVD != null && voronoi != null) {  //voronoi != null necesario
      voronoi   = new Voronoi(pointsVD);
      regionsV  = voronoi.getRegions();
      emptyVoronoi= true;
    }

    if ( pointsVD != null) {
      delaunay = new Delaunay(pointsVD);
      edgesD    = delaunay.getEdges();
    }
  }

  void setVoronoi() {
    if ( pointsVD != null) {
      delaunay = new Delaunay(pointsVD);
      edgesD    = delaunay.getEdges();
      emptyDelaunay = true;
    }
  }

  void drawDelaunay() {
    if ( pointsVD != null) {
      stroke(150, 100);
      for (int i=0; i< edgesD.length; i++) {  
        float  startX = edgesD[i][0];  
        float  startY = edgesD[i][1];  
        float  endX =   edgesD[i][2];  
        float  endY =   edgesD[i][3];  
        line(startX - pSize/2, startY - pSize/2, endX - pSize/2, endY - pSize/2);
      }
    }
  }

  void drawVoronoi(PApplet pa) {
    if (regionsV != null) {//pointsVD != null) {
      fill(0);
      for (int i =0; i < regionsV.length; i++) {
        regionsV[i].draw(pa);
      }
    }
  }

  void fillPoints() {
    for (int i =0; i < numPoints/2; i++) {
      VerletParticle2D p = ((VerletParticle2D)physics.particles.get(i));
      pointsVD[i][0] = p.x;
      pointsVD[i][1] = p.y;
    }
  }
}


