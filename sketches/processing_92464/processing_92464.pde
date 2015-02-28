
Icosahedron ico;
static int ICOSUBDIVISION = 0;

void setup() {
  size( 800,600, OPENGL );
  ico = new Icosahedron();
  noStroke();
  fill( 255,0,0 );
}

void draw() {
  
  float rx = frameCount / 800.f;
  float ry = frameCount / 430.f;
    
  background( 255 );
  
  
  fill( 255,0,0 );
  PVector f1 = new PVector();
  PVector f2 = new PVector();
  PVector f3 = new PVector();
  int col = 0;
  stroke( 0 );
  pushMatrix();
    translate( width * 0.5, height * 0.5, 0 );
    rotateX( rx );
    rotateY( ry );
    for ( int i = 0; i < ico.vertexList.size(); i+=9 ) {
      f1.x = ico.vertexList.get(i) * 200;
      f1.y = ico.vertexList.get(i+1) * 200;
      f1.z = ico.vertexList.get(i+2) * 200;
      f2.x = ico.vertexList.get(i+3) * 200;
      f2.y = ico.vertexList.get(i+4) * 200;
      f2.z = ico.vertexList.get(i+5) * 200;
      f3.x = ico.vertexList.get(i+6) * 200;
      f3.y = ico.vertexList.get(i+7) * 200;
      f3.z = ico.vertexList.get(i+8) * 200;
      if (col == 0) {
        fill( 255,60,0 );
        col++;
      } else if (col == 1) {
        fill( 100,255,0 );
        col++;
      } else if (col == 2) {
        fill( 255,180,0 );
        col++;
      } else {
        fill( 0,255,255 );
        col = 0;
      }
      beginShape();
        vertex( f1.x, f1.y, f1.z );
        vertex( f2.x, f2.y, f2.z );
        vertex( f3.x, f3.y, f3.z );
      endShape( CLOSE );
      
    }
  popMatrix(); 
  
  fill( 0,0,0 );
  text("icosahedron division: "+int( ICOSUBDIVISION ),20,40);
  text("vertices: "+int( ico.vertexList.size() ),20,60);
  text("fps: "+int(frameRate),20,80);
  text("press up & down to change division",20,100);
  
}

void keyPressed() {
  if ( keyCode == 38 ) { // [up]
    if ( ICOSUBDIVISION == 5 )
      return;
    ICOSUBDIVISION++;
    ico = new Icosahedron();
  } else if ( keyCode == 40 ) {  // [down]
    if ( ICOSUBDIVISION == 0 )
      return;
    ICOSUBDIVISION--;
    ico = new Icosahedron();
  } else {
    println( keyCode );
  }
}


// copied and adapted from http://code.google.com/p/webgltimer/source/browse/src/net/icapsid/counter/client/Icosahedron.java?r=170e4fcc41bf20700dcb6dc67272073af112c65c

import java.util.List;

public class Icosahedron {
        
        public List<Float> vertexNormalsList = new ArrayList<Float>();
        public List<Float> vertexList = new ArrayList<Float>();
        
        final float X = 0.525731112119133606f;
        final float Z = 0.850650808352039932f;

        final float vdata[][] = { 
                        { -X, 0.0f, Z }, 
                        { X, 0.0f, Z },
                        { -X, 0.0f, -Z }, 
                        { X, 0.0f, -Z }, 
                        { 0.0f, Z, X },
                        { 0.0f, Z, -X }, 
                        { 0.0f, -Z, X }, 
                        { 0.0f, -Z, -X },
                        { Z, X, 0.0f }, 
                        { -Z, X, 0.0f }, 
                        { Z, -X, 0.0f },
                        { -Z, -X, 0.0f }
                      };

        final int tindices[][] = { { 0, 4, 1 }, { 0, 9, 4 }, { 9, 5, 4 },
                        { 4, 5, 8 }, { 4, 8, 1 }, { 8, 10, 1 }, { 8, 3, 10 },
                        { 5, 3, 8 }, { 5, 2, 3 }, { 2, 7, 3 }, { 7, 10, 3 },
                        { 7, 6, 10 }, { 7, 11, 6 }, { 11, 0, 6 }, { 0, 1, 6 },
                        { 6, 1, 10 }, { 9, 0, 11 }, { 9, 11, 2 }, { 9, 2, 5 },
                        { 7, 2, 11 } };
        
        public Icosahedron() {
        
                List<Float> texCoordsList = new ArrayList<Float>();
                List<Integer> indicesList = new ArrayList<Integer>();

                // Iterate over points
                for (int i = 0; i < 20; ++i) {
                        subdivide(
                          vdata[tindices[i][0]], 
                          vdata[tindices[i][1]],
                          vdata[tindices[i][2]], ICOSUBDIVISION );
                }

                // verticesArray = floatListToFloatArray(vertexList);
                // texCoordsArray = floatListToFloatArray(texCoordsList);
                // vertexNormalsArray = floatListToFloatArray(vertexNormalsList);
                // indices = integerListToIntegerArray(indicesList);
                // vertexCount = vertexList.size() / 3;
        }
        
        private void norm(float v[]){
                
                float len = 0;
                
                for(int i = 0; i < 3; ++i){
                        len += v[i] *  v[i];
                }
                
                len = (float) Math.sqrt(len);
                
                for(int i = 0; i < 3; ++i){
                        v[i] /= len;
                }
        }
        
        private void add(float v[]){
                for (int k = 0; k < 3; ++k) {
                        vertexList.add(v[k]);
                        vertexNormalsList.add(v[k]);
                }
        }
        
        private void subdivide(float v1[], float v2[], float v3[], int depth) {
                
                if (depth == 0) {
                        add(v1);
                        add(v2);
                        add(v3);
                        return;
                }
                
                float v12[] = new float[3];
                float v23[] = new float[3];
                float v31[] = new float[3];

                for (int i = 0; i < 3; ++i) {
                        v12[i] = (v1[i] + v2[i]) / 2f;
                        v23[i] = (v2[i] + v3[i]) / 2f;
                        v31[i] = (v3[i] + v1[i]) / 2f;
                }

                norm(v12);
                norm(v23);
                norm(v31);
                                
                subdivide(v1, v12, v31, depth - 1);
                subdivide(v2, v23, v12, depth - 1);
                subdivide(v3, v31, v23, depth - 1);
                subdivide(v12, v23, v31, depth - 1);
        }
}


