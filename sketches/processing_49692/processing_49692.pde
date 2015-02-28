
//---------------------------------------------------------
// thomas diewald
// hilbert curve 3d, fast and improved version
// date: 19.01.2012
//---------------------------------------------------------

// based on the algorithm in my old sketch (http://www.openprocessing.org/visuals/?visualID=15599)
// but shorter, much more efficient and times faster 
public final class Hilbert3D{
  private Hilbert3D[] childs;
  private float[] center;
      
  public Hilbert3D(float[] center, float size, int depth ){
    this(center, size, depth, 0, 1, 2, 3, 4, 5, 6, 7);
  }
  
  //----------------------------------------------------------------------------------------------------
  // generating the hilbert curve.
  // this constructor is called recursively. it generates the vertices for the hilbert curve.
  private Hilbert3D(float[] center, float size, int depth, int a, int b, int c, int d, int e, int f, int g, int h  ){
    this.center = center;
    
    if( depth-- >= 0){
  
      float nx = center[0] - size; float ny = center[1] - size; float nz = center[2] - size; 
      float px = center[0] + size; float py = center[1] + size; float pz = center[2] + size; 
      
      float[][] cube_corners =  { {nx, py, nz}, {nx, py, pz}, {nx, ny, pz}, {nx, ny, nz },
                                  {px, ny, nz}, {px, ny, pz}, {px, py, pz}, {px, py, nz }};
                        
      size *= form_factor;
      childs = new Hilbert3D[]{
        new Hilbert3D( cube_corners[a],  size,  depth, a, d, e, h, g, f, c, b ) ,
        new Hilbert3D( cube_corners[b],  size,  depth, a, h, g, b, c, f, e, d ) ,
        new Hilbert3D( cube_corners[c],  size,  depth, a, h, g, b, c, f, e, d ) ,
        new Hilbert3D( cube_corners[d],  size,  depth, c, d, a, b, g, h, e, f ) ,
        new Hilbert3D( cube_corners[e],  size,  depth, c, d, a, b, g, h, e, f ) ,
        new Hilbert3D( cube_corners[f],  size,  depth, e, d, c, f, g, b, a, h ) ,
        new Hilbert3D( cube_corners[g],  size,  depth, e, d, c, f, g, b, a, h ) ,
        new Hilbert3D( cube_corners[h],  size,  depth, g, f, c, b, a, d, e, h ) };
    } 
  }
  
  //----------------------------------------------------------------------------------------------------
  // get the ordered vertice list
  public final void getVertices(final ArrayList<float[]> vertices, int depth){
    if( childs == null || depth-- == 0){
      vertices.add(center);
    } else {
      for(Hilbert3D h: childs)
        h.getVertices(vertices, depth);   
    } 
  }
  public final ArrayList<float[]> getVertices(int depth){
    ArrayList<float[]> vertices = new ArrayList<float[]>();
    getVertices(vertices, depth);
    return vertices;
  }
}


