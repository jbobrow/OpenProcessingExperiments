
//import java.util.ArrayList;
//
//import processing.core.PApplet;
//import processing.core.PConstants;
//import processing.core.PMatrix3D;
//import MAIN_PCA_LLE.DwVector;

//import static processing.core.PApplet.sin;
//import static processing.core.PApplet.cos;
//import static processing.core.PConstants.PI;










/**
 * to creating some point-sets for testing.
 *  
 * @author thomas
 *
 */
static public class DataSet {


  PApplet papplet;
  
  public DataSet(PApplet papplet){
    this.papplet = papplet;
  }
  
  
  
  
  
  
  public DwVector[] genRandomCube(){
    DwVector[] data = new DwVector[200];
    papplet.randomSeed(2);
    for(int i = 0; i < data.length; i++){
      float x = papplet.random(-200, 300);
      float y = papplet.random(-200, 300);
      float z = papplet.random(-200, 300);
      data[i] = new DwVector(x,y,z);
      data[i].idx = i;
    }
    return data;
  }
  

  
  
  
  
  
  
  
  public DwVector[] genWaveSurface(){
    int num_x = 15;
    int num_y = 15;
    
    DwVector[] data = new DwVector[num_x*num_y];
    
    for(int iy = 0; iy < num_y; iy++){
      for(int ix = 0; ix < num_x; ix++){
        float x = ix/(float)(num_x) - 0.5f;
        float y = iy/(float)(num_y) - 0.5f;

        float cosx = 0.5f * (float)Math.cos(Math.PI/2+2*Math.PI*x);
        float siny = 0.5f * (float)Math.sin(Math.PI/2+2*Math.PI*y);
        
        float z = cosx*siny*.5f;

        data[iy*num_x+ix] = new DwVector(x,y,z);
      }
    }
    
    PMatrix3D mat = new PMatrix3D();
    
    mat.translate(100, 100, 100);
    mat.rotateX(95/360f * 2*PConstants.PI);
    mat.rotateZ(45/360f * 2*PConstants.PI);
    mat.rotateY(45/360f * 2*PConstants.PI);
   
    mat.scale(500, 500, 500);


    for(int i = 0; i < data.length; i++){
      float x = data[i].v[0];
      float y = data[i].v[1];
      float z = data[i].v[2];
      
      float x_ = mat.m00*x + mat.m01*y + mat.m02*z + mat.m03;
      float y_ = mat.m10*x + mat.m11*y + mat.m12*z + mat.m13;
      float z_ = mat.m20*x + mat.m21*y + mat.m22*z + mat.m23;
      
      data[i].v[0] = x_;
      data[i].v[1] = y_;
      data[i].v[2] = z_;
    }
    return data;
  }
  
  
  
 
  
  
  
  
  public DwVector[] genIsoSurface(){
    
    float max_size = 500;
    float scalef = 7f;
    float scales = max_size/scalef;
    
    ArrayList<DwVector> list = new ArrayList<DwVector>();
    int num = 29; // num^3 samples
    int numx = num;
    int numy = num;
    int numz = num;

    double v = 0;
    boolean th = false;
    
    for(int iz = 0; iz < numz; iz++){
      for(int iy = 0; iy < numy; iy++){
        for(int ix = 0; ix < numx; ix++){
          float x = ix/(float)numx - 0.5f;
          float y = iy/(float)numy - 0.5f;
          float z = iz/(float)numz - 0.5f;
          
          x *= scalef;
          y *= scalef;
          z *= scalef;

          // see k3d-surf for more formulas
          
//          v = -(Math.cos(x) + Math.cos(y) + Math.cos(z)); // schwarz
//          v = x*x + y*x + z*z +sin(4*x) + sin(4*y) + sin(4*z) -1; // Blobs_2
//          v = 3*(cos(x) + cos(y) + cos(z)) + 4* cos(x) * cos(y) * cos(z); //Holes          
          v = cos(x) * sin(y) + cos(y) * sin(z) + cos(z) * sin(x); // Gyroid
//          v = -(x*x + y*y + z*z) +cos(5*x)*cos(5*y)*cos(5*z)+0.215; // Virus
//          v = sin(4*x) + sin(4*y) + sin(4*z)  + 4*x*y*z; // Holes2
          
          th = v > -.0165 && v < .0165;
          if( th){
            x *= scales; 
            y *= scales; 
            z *= scales; 
            list.add( new DwVector(x, y, z));
          } 
        } 
      }
    }
    
    DwVector[] data = new DwVector[list.size()];
    list.toArray(data);
    return data;
  }
  
  
  
  
  
  
  
  
  
  
  public DwVector[] genButterfly(){
    papplet.randomSeed(2);
    papplet.noiseSeed(2);
    int num_x = 15;
    int num_y = 15;
    
    float ro = .01f;
    
    DwVector[] data = new DwVector[num_x*num_y];
    
    for(int iy = 0; iy < num_y; iy++){
      for(int ix = 0; ix < num_x; ix++){
        float x = ix/(float)(num_x) - 0.5f;
        float y = iy/(float)(num_y) - 0.5f;
        
        x+= papplet.random(-ro,ro);
        y+= papplet.random(-ro,ro);
        
        float cosx = 0.5f * (float)Math.cos(Math.PI/2+2*Math.PI*x);
        float siny = 0.5f * (float)Math.sin(Math.PI/2+2*Math.PI*y);
        float z = cosx*siny*.6f;
       
        x *= 1+sin(z)*2f;
        x += sin(z)*2;
        y *= 1+sin(x*z)*5.2d;
        z *= 1+sin(y+x)*2;
        data[iy*num_x+ix] = new DwVector(x,y,z);
      }
    }
    
    PMatrix3D mat = new PMatrix3D();
    mat.scale(500);
    mat.translate(.2f, .2f, .2f);
    mat.rotateX(95/360f * 2*PI);
    mat.rotateZ(45/360f * 2*PI);
    mat.rotateY(45/360f * 2*PI);
   

    for(int i = 0; i < data.length; i++){
      float x = data[i].v[0];
      float y = data[i].v[1];
      float z = data[i].v[2];
      
      float x_ = mat.m00*x + mat.m01*y + mat.m02*z + mat.m03;
      float y_ = mat.m10*x + mat.m11*y + mat.m12*z + mat.m13;
      float z_ = mat.m20*x + mat.m21*y + mat.m22*z + mat.m23;
      
      data[i].v[0] = x_;
      data[i].v[1] = y_;
      data[i].v[2] = z_;
    }
    return data;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  public DwVector[] genRandomSphere(){
    DwVector[] data = new DwVector[200];
    for (int i = 0; i < data.length; i++ ) {
      float[] point = uniformSampleSphere(200, 400, 200);
      data[i] = new DwVector(point);
    }
    return data;
  }

  private float[] uniformSampleSphere(double sx, double sy, double sz) {
    double phi = papplet.random(0,1) * 2*PI;
    double rnd = papplet.random(0,1) * 2.0 - 1.0;
    double rad = Math.sqrt(1.0 - rnd*rnd);
    double X   = sx * Math.cos(phi) * rad;
    double Y   = sy * Math.sin(phi) * rad;
    double Z   = sz * rnd;
    if( X < 3*-sx/5 ) X = Math.abs(X);
    return float3(X,Y,Z);
  }
  public static float[] float3(double x, double y, double z){
    return new float[]{(float)x, (float)y, (float)z};
  }

  
  
  
  
  
  
  
  public DwVector[] genSpiralSurface(){
    int rows = 40;
    int cols = 5;
    float rinc = 4f;
    
    DwVector[] data = new DwVector[rows*cols];
    float r = 70;
    float theta = 0.0f;
    for(int i = 0; i < rows; i++){

      float x = r * cos(theta);
      float y = r * sin(theta)+sin(r/50)*20;
      float z = (+sin(theta*4))*r/20;

      theta += 60/r;
      r += (float)Math.log(rinc)*(rows-i)/5f;
      
      rinc *= 1.15;
      for(int c = 0; c < cols; c++){
//        data[i*cols+c] = new DwVector(x,y, z + 30*c*(i+1)/8);
//        data[i*cols+c] = new DwVector(x,y, z+50*c + c*r/10f);
        data[i*cols+c] = new DwVector(x,y, z+60*c);
      }
    }
    
    return data;
  }

  
  
  
  
  
  
}

