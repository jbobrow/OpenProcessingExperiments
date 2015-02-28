
class polyhedron{
  
  float[][] polyhedronVertices; // liste des sommets par leur coordonnées.
  int[][] polyhedronFaces; // liste des faces par le numero des sommets.
  
  polyhedron(float[][] vertices, int[][] faces){
    polyhedronVertices = vertices;
    polyhedronFaces = faces;
    }
  // return the list of a given face
  int[][] facesList(){
    return polyhedronFaces;
    }
  
  // display polyhedron with gradient's faces color
  void display(color color1,color color2){
     
    for(int p = 0;p<polyhedronFaces.length;p++){
    fill(lerpColor(color1,color2,p/float(polyhedronFaces.length)));
      pushMatrix();
      
      stroke(75);
      //strokeWeight(1.25);
      //fill(0);
      beginShape();
      for(int k=0;k<polyhedronFaces[p].length;k++){
         vertex(polyhedronVertices[polyhedronFaces[p][k]][0],polyhedronVertices[polyhedronFaces[p][k]][1],polyhedronVertices[polyhedronFaces[p][k]][2]);
      }
      vertex(polyhedronVertices[polyhedronFaces[p][0]][0],polyhedronVertices[polyhedronFaces[p][0]][1],polyhedronVertices[polyhedronFaces[p][0]][2]);
      endShape();
      popMatrix();
    }
    
    }
    // display polyhedron's vertices
    void verticesDisplay(float rayon){
      for(int i=0;i<polyhedronVertices.length;i++){
        pushMatrix();
        translate(polyhedronVertices[i][0],polyhedronVertices[i][1],polyhedronVertices[i][2]);
        noStroke();
        fill(0);
        sphere(rayon);
        popMatrix();
        }
        }
  
    // return vertice's coordinate.
    float[] toCoordonnees(int sommet){
      return polyhedronVertices[sommet];
    }
  
    // return vertex list of a face
    float[][] faceVertex(int faceNumber){
      float[][] facevertex;
      facevertex = new float[polyhedronFaces[faceNumber].length][3];
      for(int k=0;k<facevertex.length;k++){
        facevertex[k] = toCoordonnees(polyhedronFaces[faceNumber][k]);
      }
      return facevertex;
      }
    }

