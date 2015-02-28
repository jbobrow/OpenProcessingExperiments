

/**
 * 
 * @author thomas diewald
 * @web    http://thomasdiewald.com/blog/?p=1994
 * @date   30.08.2013
 *  
 *  Distance Transform, interface
 *
 */

import java.util.Arrays;

static public interface DistanceTransformAble {
  
  void init(PApplet p, PImage src, int COL_BG);
  
  void createDistanceMap();
  void createImage(boolean NN_color, float normalize_distances);
  
  PImage getImage();
  String getName();
  int    getNumObstacles();
  float  getMaxDistance();
  int    getNN_pos(int i);
  float  getNN_dis(int i);
  
}









static public abstract class DistanceTransform implements DistanceTransformAble{

  protected int COL_BG;
  
  protected PImage src;
  protected int w, h;

  
  protected PImage  dst;           // final image
  protected float   nd_max;        // maximum nn-distance
  protected int     num_obstacles; // number of voronoi centroids
  
  public DistanceTransform(){
  }
  
  // @Override
  public PImage getImage(){
    return dst;
  }
  
  // @Override
  public void init(PApplet p, PImage src, int COL_BG){

    this.src = src;
    this.w   = src.width;
    this.h   = src.height;
    this.COL_BG = COL_BG;
    
    dst = p.createImage(w, h, PConstants.ARGB);
    
    clearImage();
  }
  
  private void clearImage(){
    dst.loadPixels();
    Arrays.fill(dst.pixels, 0xFF000000);
    dst.updatePixels();
  }
  
  
  // @Override
  public void createImage(boolean NN_color, float normalize_distances){
    
    if(getNumObstacles()==0){
      clearImage();
      return;
    }
    
    // compose final image... could run in parallel
    dst.loadPixels();
    src.loadPixels();
    int[] srcpx = src.pixels;
    int[] dstpx = dst.pixels;
    
    
    if( !NN_color ){
      
      // use distances for shading
      final float norm = 1f/getMaxDistance();
      
      for(int y = 1; y < h-1; y++ ){
        for(int x = 1; x < w-1; x++ ){
          int i = y*w+x;
    
          // shading/distance factor
          float s = getNN_dis(i) * norm;
          if( normalize_distances < 0 ){
            s = 1-s;
          }
          s*=s;
          int g = (int)(s*255);
          if( g > 255 ) g = 255;  else if( g <   0 ) g = 0;
          dstpx[i] = 0xFF000000 | g<<16 | g<<8 | g;
        }
      }
      
    } else {

      // use nearest-neighbor color for shading.
      final float norm = normalize_distances;
//      final float norm = 1f/getMaxDistance();
      for(int y = 1; y < h-1; y++ ){
        for(int x = 1; x < w-1; x++ ){
          int i = y*w+x;
  
          // shading/distance factor
          float s = getNN_dis(i) * norm;
          s = 1-s;
          s *= s;
          s *= s;
          s *= s;
          
          // get color from nearest neighbor and shade by distance to it
          int rgb = srcpx[ getNN_pos(i) ];
          dstpx[i] = shadeRGB(rgb, s);
  //        dstpx[i] = shadeGray( s);
        }
      }
      dst.updatePixels();
    }
    

  }
  

  
  
  private int shadeRGB(int rgb, float s){
    int r = (int)(((rgb>>16)&0xFF) * s);
    int g = (int)(((rgb>> 8)&0xFF) * s);
    int b = (int)(((rgb>> 0)&0xFF) * s);
    
    // clamp rgb
    if( r > 255 ) r = 255;  else if( r <   0 ) r = 0;
    if( g > 255 ) g = 255;  else if( g <   0 ) g = 0;
    if( b > 255 ) b = 255;  else if( b <   0 ) b = 0;
    
    return 0xFF000000 | r<<16 | g<<8 | b;
  }
  
  // @Override 
  public float getMaxDistance(){
    return nd_max;
  }
  
  // @Override
  public int getNumObstacles(){
    return num_obstacles;
  }
  
  // @Override abstract public void   createDistanceMap();
  // @Override abstract public int    getNN_pos(int i);
  // @Override abstract public float  getNN_dis(int i);
  // @Override abstract public String getName();
}













/**
 * 
 * @author Thomas Diewald
 * @web    http://thomasdiewald.com/blog/?p=1994
 * @date   30.08.2013
 * 
 * CDT - Chamfer Distance Transform
 * 
 * http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.102.7988&rep=rep1&type=pdf
 * 
 */



static public class CDT extends DistanceTransform{
  
  private float[] dis;  // nn-distances
  private int[]   pos;  // nn-positions, 32 bit index

  // @Override
  public void init(PApplet p, PImage src, int COL_BG){
    super.init(p,src,COL_BG);

    dis = new float[w*h];
    pos = new int[w*h];

  }
  

  // @Override
  public void createDistanceMap(){

    src.loadPixels();
    int[] srcpx = src.pixels;
    
    // initialize
    Arrays.fill(dis, Float.MAX_VALUE);
//    Arrays.fill(pos, 0xFFFFFFFF); // not necessary
    
    // find obstacles
    num_obstacles = 0;
    for(int y = 1; y < h-1; y++ ){
      for(int x = 1; x < w-1; x++ ){
        int i = y*w+x;
        if(srcpx[i] != COL_BG){
          dis[i] = 0;
          pos[i] = i;
          num_obstacles++;
        }
      }
    }
    if( num_obstacles == 0 ) return; // nothing found
    
    
    final float d1 = 1;
    final float d2 = (float)Math.sqrt(d1*d1 + d1*d1);
    
    float nd, nd_tmp; 
    int i,in,x,y, np;
    
    //    1  2  3 
    //    0  i  4 
    //    7  6  5 

    // first pass: forward -> L->R, T-B
    for(y = 1; y < h-1; y++ ){
      for(x = 1; x < w-1; x++ ){
        i = y*w+x;
        
        nd = dis[i];  
        np = pos[i];
        if( nd != 0 ){
          in = i;
          
          in += -1; // 0
          if( (nd_tmp = d1 + dis[in]) < nd ){
            nd = nd_tmp;
            np = pos[in];
          }
          
          in += -w; // 1
          if( (nd_tmp = d2 + dis[in]) < nd ){
            nd = nd_tmp;
            np = pos[in];
          }
          
          in += +1; // 2
          if( (nd_tmp = d1 + dis[in]) < nd ){
            nd = nd_tmp;
            np = pos[in];
          }
          
          in += +1; // 3
          if( (nd_tmp = d2 + dis[in]) < nd ){
            nd = nd_tmp;
            np = pos[in];
          }
          
          dis[i] = nd;
          pos[i] = np;
        }
      }
    }
    

    // second pass: backwards -> R->L, B-T
    // exactly same as first pass, just in the reverse direction
    nd_max = 0;
    for(y = h-2; y >= 1; y-- ){
      for(x = w-2; x >= 1; x-- ){
        i = y*w+x;

        nd = dis[i]; 
        np = pos[i];
        if( nd != 0 ){
          in = i;

          in += +1; // 4
          if( (nd_tmp = d1 + dis[in]) < nd ){
            nd = nd_tmp;
            np = pos[in];
          }
          
          in += +w; // 5
          if( (nd_tmp = d2 + dis[in]) < nd ){
            nd = nd_tmp;
            np = pos[in];
          }
          
          in += -1; // 6
          if( (nd_tmp = d1 + dis[in]) < nd ){
            nd = nd_tmp;
            np = pos[in];
          }
          
          in += -1; // 7
          if( (nd_tmp = d2 + dis[in]) < nd ){
            nd = nd_tmp;
            np = pos[in];
          }

          dis[i] = nd;
          pos[i] = np;

        }
        if( nd_max < dis[i] ) nd_max = dis[i];
      }
    }
  }
  
  // @Override
  public final int getNN_pos(int i){
    return pos[i];
  }
  // @Override
  public final float getNN_dis(int i){
    return dis[i];
  }
  
  // @Override
  public String getName() {
    return "CDT - Chamfer Distance Algorithm";
  }
}



/**
 * 
 * @author Thomas Diewald
 * @web    http://thomasdiewald.com/blog/?p=1994
 * @date   30.08.2013
 * 
 * DRA - Dead Reckoning Algorithm
 * 
 * http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.102.7988&rep=rep1&type=pdf
 * 
 */




static public class DRA extends DistanceTransform{
  
  private float[] dis; // nn-distances
  private int[]   pos; // nn-positions, XY-16bit

  
  // @Override
  public void init(PApplet p, PImage src, int COL_BG){
    super.init(p,src,COL_BG);
    
    dis = new float[w*h];
    pos = new int[w*h];
  }
  

  // @Override
  public void createDistanceMap(){

    src.loadPixels();
    int[] srcpx = src.pixels;
    
    // initialize
    Arrays.fill(dis, Float.MAX_VALUE);
//    Arrays.fill(pos, 0xFFFFFFFF); // not necessary
    
    // find obstacles
    num_obstacles = 0;
    for(int y = 1; y < h-1; y++ ){
      for(int x = 1; x < w-1; x++ ){
        int i = y*w+x;
        if(srcpx[i] != COL_BG){
          dis[i] = 0;
          setN(i, x, y);
          num_obstacles++;
        }
      }
    }
    if( num_obstacles == 0 ) return; // nothing found
    
    
    final float d1 = 1;
    final float d2 = (float)Math.sqrt(d1*d1 + d1*d1);
    
    float nd; 
    int i,in,x,y,nx,ny;
    
    //    1  2  3 
    //    0  i  4 
    //    7  6  5 

    // first pass: forward -> L->R, T-B
    for(y = 1; y < h-1; y++ ){
      for(x = 1; x < w-1; x++ ){

        i = y*w+x;
        in = i;
        
        nd = dis[i];
        if( nd !=0 ){ 
          
          nx = NX(i);
          ny = NY(i);

          in += -1;
          if( d1 + dis[in] < nd ){ // 0
            nx   = NX(in);       
            ny   = NY(in);       
            nd   = dist(x-nx, y-ny);         
          }
          
          in += -w;
          if( d2 + dis[in] < nd ){ // 1
            nx   = NX(in);       
            ny   = NY(in);           
            nd   = dist(x-nx, y-ny);   
          } 
          
          in += +1;                               
          if( d1 + dis[in] < nd ){ // 2
            nx   = NX(in);       
            ny   = NY(in);             
            nd   = dist(x-nx, y-ny);   
          } 
          
          in += +1;                             
          if( d2 + dis[in] < nd ){ // 3
            nx   = NX(in);       
            ny   = NY(in);           
            nd   = dist(x-nx, y-ny);   
          }                            
                                       
          setN(i, nx, ny); 
          dis[i] = nd;
        }
      }
    }
    

    // second pass: backwards -> R->L, B-T
    // exactly same as first pass, just in the reverse direction
    nd_max = 0;
    for(y = h-2; y >= 1; y-- ){
      for(x = w-2; x >= 1; x-- ){
        i = y*w+x;
        
        nd = dis[i];
        if( nd !=0 ){   
          nx = NX(i);
          ny = NY(i);
          
          in = i;
          
          in += +1;
          if( d1 + dis[in] < nd ){ // 0
            nx   = NX(in);       
            ny   = NY(in);       
            nd   = dist(x-nx, y-ny);         
          }
          
          in += +w;
          if( d2 + dis[in] < nd ){ // 1
            nx   = NX(in);       
            ny   = NY(in);           
            nd   = dist(x-nx, y-ny);   
          } 
          
          in += -1;                               
          if( d1 + dis[in] < nd ){ // 2
            nx   = NX(in);       
            ny   = NY(in);             
            nd   = dist(x-nx, y-ny);   
          } 
          
          in += -1;                             
          if( d2 + dis[in] < nd ){ // 3
            nx   = NX(in);       
            ny   = NY(in);           
            nd   = dist(x-nx, y-ny);   
          }                            
                                       
          setN(i, nx, ny); 
          dis[i] = nd;
        }
        if( nd_max < dis[i] ) nd_max = dis[i];
      }
    }

//    createImage();
  }
  


  private final void setN(int i, int vx, int vy){
    pos[i] = vx<<16 | vy;
  }

  private final int NX(int i){ return (pos[i]>>16)&0xFFFF; }
  private final int NY(int i){ return (pos[i]    )&0xFFFF; }
  
  
  private static final float dist(float dx, float dy){
    return (float) Math.sqrt(dx*dx + dy*dy);
  }
  
  
  
  // @Override
  public final int getNN_pos(int i){
    return NY(i)*w + NX(i);
  }
  // @Override
  public final float getNN_dis(int i){
    return dis[i];
  }
  // @Override
  public String getName() {
    return "DRA - Dead Reckoning Algorithm";
  }
}












/**
 * 
 * @author (c) Thomas Diewald
 * @web    http://thomasdiewald.com/blog/?p=1994
 * @date   30.08.2013
 * 
 * DDT - Diewald Distance Transform
 * 
 * 
 */




// a cause for errors is:
// due to propagation, a pixel may have one or more neighbors with equal distance. 
// But since only one is kept, this neighbor might not be the true nearest neighbor for a later pixel.
// therefore the banding


static public class DDT extends DistanceTransform{
  
  private static final int INF = 0xFFFFFFFF;
     
  private int[]   pos; // nn-positions, XY-16bit
  private float[] dis; // nn-distances, not really needed here but comfortable.

                  
  
  // @Override
  public void init(PApplet p, PImage src, int COL_BG){
    super.init(p, src, COL_BG);

    dis = new float[w*h];
    pos = new int[w*h];
  }
  

  // @Override
  public void createDistanceMap(){
  
    src.loadPixels();
    int[] srcpx = src.pixels;
    
    // reset nearest neighbors
    Arrays.fill(pos, INF);

    // find obstacles
    num_obstacles = 0;
    for(int y = 1; y < h-1; y++ ){
      for(int x = 1; x < w-1; x++ ){
        int i = y*w+x;
        if(srcpx[i] != COL_BG){
          setN(i, x, y);
          dis[i] = 0;
          num_obstacles++;
        }
      }
    }
    if( num_obstacles == 0 ) return; // nothing found


    // first pass: forward -> L->R, T-B
    for(int y = 1; y < h-1; y++ ){
      for(int x = 1; x < w-1; x++ ){

        int i = y*w+x;
        int nn_dis = ND(i, x, y); // NN-distance of i

        if( nn_dis !=0 ){
          int in = i;            // kernel-neighbor-index of i
          int nn_pos = pos[i];   // NN-position of i
          int nn_tmp;            // NN-distance from i to NN of in
          
          if( pos[i] == INF ) nn_dis = Integer.MAX_VALUE; // i has no NN yet
          
          in += -1; // 0
          if(pos[in] != INF && (nn_tmp = ND(in, x, y)) < nn_dis ){
            nn_pos = pos[in]; 
            nn_dis = nn_tmp;
          }

          in += -w; // 1
          if(pos[in] != INF && (nn_tmp = ND(in, x, y)) < nn_dis ){
            nn_pos = pos[in]; 
            nn_dis = nn_tmp;
          }
          
          in += +1; // 2
          if(pos[in] != INF && (nn_tmp = ND(in, x, y)) < nn_dis ){
            nn_pos = pos[in]; 
            nn_dis = nn_tmp;
          }
          
          in += +1; // 3
          if(pos[in] != INF && (nn_tmp = ND(in, x, y)) < nn_dis ){
            nn_pos = pos[in]; 
            nn_dis = nn_tmp;
          }
          
          pos[i] = nn_pos;
          dis[i] = nn_dis;

        } 
      }
    }
    
    
    // second pass: backwards -> R->L, B-T
    // exactly same as first pass, just in the reverse direction
    nd_max = 0; // maximum nn-distance
    for(int y = h-2; y >= 1; y-- ){
      for(int x = w-2; x >= 1; x-- ){

        int i = y*w+x;
        int nn_dis = ND(i, x, y); // distance to NN
        
        if( nn_dis !=0 ){
          int in = i;
          int nn_pos = pos[i];
          int nn_tmp;
          
          if( pos[i] == INF ) nn_dis = Integer.MAX_VALUE;
          
          in += 1;
          if(pos[in] != INF && (nn_tmp = ND(in, x, y)) < nn_dis){
            nn_pos = pos[in]; 
            nn_dis = nn_tmp;
          }

          in += w;
          if(pos[in] != INF && (nn_tmp = ND(in, x, y)) < nn_dis){
            nn_pos = pos[in]; 
            nn_dis = nn_tmp;
          }
          
          in += -1;
          if(pos[in] != INF && (nn_tmp = ND(in, x, y)) < nn_dis){
            nn_pos = pos[in]; 
            nn_dis = nn_tmp;
          }
          
          in += -1;
          if(pos[in] != INF && (nn_tmp = ND(in, x, y)) < nn_dis){
            nn_pos = pos[in]; 
            nn_dis = nn_tmp;
          }
          
          pos[i] = nn_pos;
          dis[i] = nn_dis;
        }
        
        if( nd_max < nn_dis ) nd_max = nn_dis;
      }
    }
    
    nd_max = (float)Math.sqrt(nd_max);

  }
  

  private final int NX(int ii){ return (pos[ii]>>16)&0xFFFF; } // iis' NN x-pos
  private final int NY(int ii){ return (pos[ii]    )&0xFFFF; } // iis' NN y-pos
//  private int NI(int ii){ return NY(ii)*w+NX(ii); }      // iis' NN index, ii ... encoded x/y
  
  private final int ND(int in, int ix, int iy){
//    int dx = NX(in) - ix; // dx: ins' NN -> ix
//    int dy = NY(in) - iy; // dy: ins' NN -> iy
//    return dx*dx + dy*dy; // distance: ins' NN -> ixy
    return dist(NX(in) - ix, NY(in) - iy); // returns distance (ix,iy) -> (in.nn.x, in.nn.y)
  }
  
  private static final int dist(int dx, int dy){
    return dx*dx + dy*dy;
  }
  
  // encode given x/y position
  private final void setN(int i, int ix, int iy){ pos[iy*w+ix] = ix<<16 | iy; } // encode given x/y position

  
  
  
  
  // @Override
  public final int getNN_pos(int i){
    return NY(i)*w+NX(i);
  }
  // @Override
  public final float getNN_dis(int i){
//    int y = i/w;
//    int x = i-w*y;
//    return (float)Math.sqrt( ND(i,x,y) );
    
    return (float)Math.sqrt( dis[i] );
  }
  
  // @Override
  public String getName() {
    return "DDT - My Own Version";
  }
  
 
}

