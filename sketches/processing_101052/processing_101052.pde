
  float[][] cameraMat;
    float[][] worldMat;
      
    int N_STACK = 20;        
    float[][][] matricesStack;
    int sp;                    
      
    PVector xCam;
    PVector yCam;
    PVector zCam;
      
    PVector tmp;
    PVector start;
    PVector end;

         float cam_dist  = 250;
 
 
 
    public void setup() {
      size(300, 300);
      frameRate(6);
      rectMode(CENTER);
 
//      addMouseWheelListener(new java.awt.event.MouseWheelListener() {  public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { mouseScroll=  -evt.getWheelRotation();  mouseScrolled();    }});
 
      xCam  = new PVector();      yCam  = new PVector();      zCam  = new PVector();
      tmp = new PVector();      
      start = new PVector();   end   = new PVector();
        
      worldMat  = new float[4][4];      cameraMat = new float[4][4];
      for(int i = 0; i < 4; i++)   for(int j = 0; j < 4; j++)  worldMat[i][j] = cameraMat[i][j] = i == j ? 1.0f : 0.0f;
      matricesStack = new float[N_STACK][4][4];
      sp = 0;  
      setupMC();
    }
     
 
 
    public  void draw() {
      fill(0,0,0,120); rect(width/2,height/2,width*10,height*10);//draw a background with motion blur
      pushMat();
        float angle = radians(frameCount);
        cam(cam_dist,   -cam_dist, cam_dist, 0, 0, 0, 0, 1, 0);
         
        pushMat();
     rotY(camrotY);
  rotX(camrotX);
          rotZ(sin(angle) * PI / 12.0f);
                 trans(0,0,-width);
 
           angle += radians(camrotX+camrotY);

//  loadPixels();
//        updatePixels();
        pushMat();
        trans(-width*1.6f,-height*.9f,width*2); 
        drawMC();
        popMat(); 
        pushMat();
     stroke(255,255,255,255);
 
  trans(0,0,width); rotY(90*PI/8);      drawCuboid(width,height);
      popMat(); 
 
        popMat();
      popMat();
    }
     
     
     
     
     
     
     
       float camrotX,camrotY;
      public void mouseDragged(){camrotY-=radians(pmouseX-mouseX);camrotX+=radians(pmouseY-mouseY);}  
    float mouseScroll;
    void mouseScrolled() {    cam_dist-=this.mouseScroll*10;  }
     

     


 
     
     
     
     
     
     
     
     
     
     
     
     
     
     
        
    // =============================================================
    void apply(float m11, float m12, float m13, float m14,
               float m21, float m22, float m23, float m24,
               float m31, float m32, float m33, float m34,
               float m41, float m42, float m43, float m44) {
      float elm11 = worldMat[0][0] * m11 + worldMat[0][1] * m21 + worldMat[0][2] * m31 + worldMat[0][3] * m41;
      float elm12 = worldMat[0][0] * m12 + worldMat[0][1] * m22 + worldMat[0][2] * m32 + worldMat[0][3] * m42;
      float elm13 = worldMat[0][0] * m13 + worldMat[0][1] * m23 + worldMat[0][2] * m33 + worldMat[0][3] * m43;
      float elm14 = worldMat[0][0] * m14 + worldMat[0][1] * m24 + worldMat[0][2] * m34 + worldMat[0][3] * m44;
        
      float elm21 = worldMat[1][0] * m11 + worldMat[1][1] * m21 + worldMat[1][2] * m31 + worldMat[1][3] * m41;
      float elm22 = worldMat[1][0] * m12 + worldMat[1][1] * m22 + worldMat[1][2] * m32 + worldMat[1][3] * m42;
      float elm23 = worldMat[1][0] * m13 + worldMat[1][1] * m23 + worldMat[1][2] * m33 + worldMat[1][3] * m43;
      float elm24 = worldMat[1][0] * m14 + worldMat[1][1] * m24 + worldMat[1][2] * m34 + worldMat[1][3] * m44;
        
      float elm31 = worldMat[2][0] * m11 + worldMat[2][1] * m21 + worldMat[2][2] * m31 + worldMat[2][3] * m41;
      float elm32 = worldMat[2][0] * m12 + worldMat[2][1] * m22 + worldMat[2][2] * m32 + worldMat[2][3] * m42;
      float elm33 = worldMat[2][0] * m13 + worldMat[2][1] * m23 + worldMat[2][2] * m33 + worldMat[2][3] * m43;
      float elm34 = worldMat[2][0] * m14 + worldMat[2][1] * m24 + worldMat[2][2] * m34 + worldMat[2][3] * m44;
        
      float elm41 = worldMat[3][0] * m11 + worldMat[3][1] * m21 + worldMat[3][2] * m31 + worldMat[3][3] * m41;
      float elm42 = worldMat[3][0] * m12 + worldMat[3][1] * m22 + worldMat[3][2] * m32 + worldMat[3][3] * m42;
      float elm43 = worldMat[3][0] * m13 + worldMat[3][1] * m23 + worldMat[3][2] * m33 + worldMat[3][3] * m43;
      float elm44 = worldMat[3][0] * m14 + worldMat[3][1] * m24 + worldMat[3][2] * m34 + worldMat[3][3] * m44;                 
          
      worldMat[0][0] = elm11; worldMat[0][1] = elm12; worldMat[0][2] = elm13; worldMat[0][3] = elm14;
      worldMat[1][0] = elm21; worldMat[1][1] = elm22; worldMat[1][2] = elm23; worldMat[1][3] = elm24;
      worldMat[2][0] = elm31; worldMat[2][1] = elm32; worldMat[2][2] = elm33; worldMat[2][3] = elm34;
      worldMat[3][0] = elm41; worldMat[3][1] = elm42; worldMat[3][2] = elm43; worldMat[3][3] = elm44;
    }
        
    void trans(float x, float y, float z) {
      apply(1.0f, 0.0f, 0.0f, x,
            0.0f, 1.0f, 0.0f, y,
            0.0f, 0.0f, 1.0f, z,
            0.0f, 0.0f, 0.0f, 1.0f);
    }
        
    void rotX(float angle) {
      apply(1.0f, 0.0f,         0.0f,        0.0f,
            0.0f, cos(angle), -sin(angle), 0.0f,
            0.0f, sin(angle),  cos(angle), 0.0f,
            0.0f, 0.0f,         0.0f,        1.0f);
    }
        
    void rotY(float angle) {
      apply( cos(angle), 0.0f,  sin(angle), 0.0f,
             0.0f,        1.0f,  0.0f,        0.0f,
            -sin(angle), 0.0f,  cos(angle), 0.0f,
             0.0f,        0.0f,  0.0f,        1.0f);
    }
        
    void rotZ(float angle) {
      apply(cos(angle), -sin(angle), 0.0f, 0.0f,
            sin(angle),  cos(angle), 0.0f, 0.0f,
            0.0f,         0.0f,        1.0f, 0.0f,
            0.0f,         0.0f,        0.0f, 1.0f);
    }
        
    // =============================================================
    void cam(float eyeX, float eyeY, float eyeZ, float centerX, float centerY, float centerZ, float upX, float upY, float upZ) {
             
      zCam.set(eyeX-centerX, eyeY-centerY, eyeZ-centerZ);
      yCam.set(upX, upY, upZ);
      xCam.set(yCam.y * zCam.z - yCam.z * zCam.y,
               yCam.z * zCam.x - yCam.x * zCam.z,  // = yCam.cross(zCam);
               yCam.x * zCam.y - yCam.y * zCam.x);
      yCam.set(zCam.y * xCam.z - zCam.z * xCam.y,
               zCam.z * xCam.x - zCam.x * xCam.z, // = zCam.cross(xCam);
               zCam.x * xCam.y - zCam.y * xCam.x);
             
      xCam.normalize();
      yCam.normalize();
      zCam.normalize();
             
          
      cameraMat[0][0] = xCam.x;
      cameraMat[0][1] = xCam.y;
      cameraMat[0][2] = xCam.z;
      cameraMat[0][3] = -(eyeX * xCam.x + eyeY * xCam.y + eyeZ * xCam.z);
             
      cameraMat[1][0] = yCam.x;
      cameraMat[1][1] = yCam.y;
      cameraMat[1][2] = yCam.z;
      cameraMat[1][3] = -(eyeX * yCam.x + eyeY * yCam.y + eyeZ * yCam.z);
             
      cameraMat[2][0] = zCam.x;
      cameraMat[2][1] = zCam.y;
      cameraMat[2][2] = zCam.z;
      cameraMat[2][3] = -(eyeX * zCam.x + eyeY * zCam.y + eyeZ * zCam.z);
             
      cameraMat[3][0] = 0.0f;
      cameraMat[3][1] = 0.0f;
      cameraMat[3][2] = 0.0f;
      cameraMat[3][3] = 1.0f;
    }
        
    // =============================================================
    void wvp(PVector v, PVector dst) {
      mul(worldMat, v, tmp);
      mul(cameraMat, tmp, tmp);
      projection(tmp, dst);
    }
        
    // =============================================================
    void projection(PVector v, PVector dst) {
      float distanceToCamera = (height/2.0f) / tan(PI*60.0f / 360.0f);
      float x = distanceToCamera * v.x / -v.z + 0.5f * width;
      float y = distanceToCamera * v.y / -v.z + 0.5f * height;
      dst.set(x, y, 0);
      //dst.z = 0;
    }
        
    // =============================================================
    void pushMat() {
      sp++;
      if(sp >= matricesStack.length) return; 
      //float[][] mat = new float[4][4];
      for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 4; j++) {
          matricesStack[sp][i][j] = worldMat[i][j];
        }
      }
    }
    void popMat() {
      if(sp < 0) return; 
      for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 4; j++) {
          worldMat[i][j] = matricesStack[sp][i][j];
        }
      }
      sp--;
    }
        
    // =============================================================
    void mul(float[][] m, PVector v, PVector dst) {
      float x = m[0][0] * v.x + m[0][1] * v.y + m[0][2] * v.z + m[0][3];
      float y = m[1][0] * v.x + m[1][1] * v.y + m[1][2] * v.z + m[1][3];
      float z = m[2][0] * v.x + m[2][1] * v.y + m[2][2] * v.z + m[2][3];
      dst.set(x, y, z);
    }
        
    float[][] matMul(float[][] a, float[][] b) {
      float[][] ret = new float[4][4];
      for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 4; j++) {
          ret[i][j] = 0.0f;
          for(int k = 0; k < 4; k++) {
            ret[i][j] += a[i][k] * a[k][j];
          }
        }
      }
      return ret;
    }
       
    void drawLine(float startX, float startY, float startZ, float endX,   float endY,   float endZ) {
        start.set(startX, startY, startZ);
        end.set(endX, endY, endZ);
        wvp(start, start);
        wvp(end, end);
        line(start.x, start.y, end.x, end.y);
    }
     
    void drawPoint( float endX,   float endY,   float endZ) {     drawPoint(  endX,   endY,   endZ, 255);  }
      void drawPoint( float endX,   float endY,   float endZ,int mcol) {
        int distFromLight=(int) dist(endX,endY,endZ,0,0,0);
        end.set(endX, endY, endZ);
        wvp(end, end);
     if(end.x<0||end.x>width||end.y<0||end.y>height)return;
        int i=(int)(end.x)+ (int)(end.y)*width;      pixels[i]=color(distFromLight/2+100);//      set((int)(end.x), (int)(end.y),color(255));
    }
       
       
       
    void drawEllipsoid(float a, float b, float c) {     pushMat();   drawHalfEllipsoid(a, b, c,4,4);      rotZ(radians(180));   drawHalfEllipsoid(a, b, c,4,4);    popMat();}
    void drawEllipsoid(float a, float b, float c,int N,int M) {     pushMat();   drawHalfEllipsoid(a, b, c,N,M); 
    rotZ(radians(180));    rotY(radians(180));   drawHalfEllipsoid(a, b, c,N,M);    popMat();}
    void drawCuboid(float r, float h) { drawCylinder(r/1.5f, h,5,2);}
    void drawCylinder(float r, float h) {drawCylinder(r, h,10,10);}
    void drawCylinder(float r, float h,int mn, int mm) {    int N = mn;     int M = mm;      int n = N-1;        int m = M-1;
         
      for(int t1 = 1; t1 <= n; t1++) {       float ptheta = TWO_PI * (t1 - 1) / n;      float theta  = TWO_PI *  t1      / n;
        float px = r * cos(ptheta);       float pz = r * sin(ptheta);
           
        float  x = r * cos(theta);       float  z = r * sin(theta);
       
        for(int t2 = 0; t2 <= m; t2++) {         float y = h *  t2      / m - 0.5f * h;
          drawLine(px, y, pz, x, y, z);          }
        drawLine(x, -h/2, z, x, h/2, z);     }
    }
    void drawHalfEllipsoid(float a, float b, float c) {      int N =  4;       int M = 4;      drawHalfEllipsoid( a,  b,  c, N, M); }
 
    void drawHalfEllipsoid(float a, float b, float c,int N,int M) {
      int n = N -3;
      int m = M ;
      for(int t1 = 1; t1 <= n; t1++) {
        float theta  = HALF_PI * (t1    ) / n;
        float ptheta = HALF_PI * (t1 - 1) / n;
        float sintheta = sin(theta);
        float costheta = cos(theta);
        float sinptheta = sin(ptheta);
        float cosptheta = cos(ptheta);
        for(int t2 = 1; t2 <= m; t2++) {
          float phi  = TWO_PI * (t2    ) / m;
          float pphi = TWO_PI * (t2 - 1) / m;
             
          float sinphi = sin(phi);
          float cosphi = cos(phi);
          float sinpphi = sin(pphi);
          float cospphi = cos(pphi);
       
          float px = a * sintheta * cospphi;
          float pz = c * sintheta * sinpphi;
          float py = b * costheta;
             
          float x = a * sintheta * cosphi;
          float z = c * sintheta * sinphi;
          float y = b * costheta;
             
          drawLine(px, py, pz, x, y, z);
             
          px = a * sinptheta * cosphi;
          pz = c * sinptheta * sinphi;
          py = b * cosptheta;
             
          x = a * sintheta * cosphi;
          z = c * sintheta * sinphi;
          y = b * costheta;
             
          drawLine(px, py, pz, x, y, z);
        }
      }
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


    boolean fps=false;

    boolean play=true;
    public void setupMC() {  


    xpoints[0]=new PVector(-11,-11,-11);
    linebuff[0]=new PVector(-11,-11,-11);
  //  initFiles();
    capturedFrames=mocap0.length;
     load();


    }








    boolean updateshape = true, mirrorf = false;
    PVector[][] formbuff = new PVector[15][60];
    PVector[] rotbuff=new PVector[] { new PVector(0,0,0), new PVector(0,0,0),new PVector(0,0,0), new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0), new PVector(0,0,0),new PVector(0,0,0), new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0), new PVector(0,0,0),new PVector(0,0,0), new PVector(0,0,0),new PVector(0,0,0)};
    PVector[] xpoints = new PVector[1]; 
    PVector[] pos = {  new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0) };
    float ry=.04f,rz=-.4f;
     
     PVector[] linebuff = new PVector[1];
     int bpsel=14,pbpsel=15, drawmode=1, M_FREE = 1, M_DRAGGED = 2, camZ = -100, textureNo = 4, mx, my, overPoint = -1, dx, dy, mode = M_FREE, axisCol, stepsx=16, stepsy=16, offsetx=300,offsety=200;PMatrix3D baseMat;















     
    int frameNumber=0;
    boolean motionlines=false;
    boolean force=false;
    float mrotX=0,mrotY=0,mrotZ=0, skelsmooth=.6f,  targetX, targetY, easing = 0.005f, anglez, anglex, angley,zsx=100,zsy=-30;

          int forcerad = 100;
          float forc = .02f;



    public void drawMC(){ 
      
      
    if(play){ if(frameCount>=capturedFrames)frameCount=0; frameNumber=frameCount;load();}            

    if(force){if(mousePressed){    
    for(int i=0;i<pos.length;i++){
       float radiusxyc = dist(mouseX,mouseY, pos[i].x, pos[i].y); 
    if (radiusxyc < forcerad) { float anglexyc = atan2(mouseY-pos[i].y, mouseX-pos[i].x); 
    if(mouseButton==RIGHT) {pos[i].x += ((forcerad) - radiusxyc) * forc * cos(anglexyc); pos[i].y += ((forcerad) - radiusxyc) * forc * sin(anglexyc);} 
    else if(mouseButton==LEFT) {pos[i].x -= ((forcerad) - radiusxyc) * forc * cos(anglexyc); pos[i].y -= ((forcerad) - radiusxyc) * forc * sin(anglexyc);} 
     }
    }}}
      
    pushMat();

    drawIIID();


    popMat();

    }













     
       public void drawIIID(){ 
    pushMat();


    rotZ(mrotZ);
       for(int i=0;i<pos.length;i++){
       strokeWeight(0); stroke(0); pushMat();
    trans(pos[i].x,pos[i].y,pos[i].z);

    {          stroke(0,0,255,255);
  if(i==0)  drawEllipsoid(15, 15, 20,12,12); else   drawEllipsoid(10, 10, 10,4,4);
    
    }
    popMat();
      }
      
      stroke(255); 
     drawLine(pos[0].x,pos[0].y,pos[0].z, pos[1].x,pos[1].y,pos[1].z);
     drawLine(pos[2].x,pos[2].y,pos[2].z, pos[1].x,pos[1].y,pos[1].z);
     drawLine(pos[2].x,pos[2].y,pos[2].z, pos[3].x,pos[3].y,pos[3].z);
     drawLine(pos[4].x,pos[4].y,pos[4].z, pos[3].x,pos[3].y,pos[3].z);
     drawLine(pos[5].x,pos[5].y,pos[5].z, pos[1].x,pos[1].y,pos[1].z);
     drawLine(pos[5].x,pos[5].y,pos[5].z, pos[6].x,pos[6].y,pos[6].z);
     drawLine(pos[6].x,pos[6].y,pos[6].z, pos[7].x,pos[7].y,pos[7].z);
     drawLine(pos[2].x,pos[2].y,pos[2].z, pos[8].x,pos[8].y,pos[8].z);
     drawLine(pos[5].x,pos[5].y,pos[5].z, pos[8].x,pos[8].y,pos[8].z);
     drawLine(pos[9].x,pos[9].y,pos[9].z, pos[8].x,pos[8].y,pos[8].z);
     drawLine(pos[9].x,pos[9].y,pos[9].z, pos[10].x,pos[10].y,pos[10].z);
     drawLine(pos[11].x,pos[11].y,pos[11].z, pos[10].x,pos[10].y,pos[10].z);
     drawLine(pos[12].x,pos[12].y,pos[12].z, pos[8].x,pos[8].y,pos[8].z);
     drawLine(pos[12].x,pos[12].y,pos[12].z, pos[13].x,pos[13].y,pos[13].z);
     drawLine(pos[14].x,pos[14].y,pos[14].z, pos[13].x,pos[13].y,pos[13].z);
     popMat();
     }





       
       
       



//     String inputFileName; String inputFileNames[];
       int currentFileIndex, capturedFrames=0
     ;
float loadScale=.8f;
    void load() {
      if (capturedFrames == 0)
        return;
//      String[] loadsting;
//      loadsting = loadStrings("/mocap/" + frameNumber + "motionUser" + 1
//          + ".txt");
      
      for (int i = 0; i < mocap0[frameNumber].length; i++) {
//        String[] pieces = split(loadsting[i], '\t');
//        if (pieces.length == 3) {
          pos[i].set(mocap0[frameNumber][i].x*loadScale,
              mocap0[frameNumber][i].y*loadScale,
              mocap0[frameNumber][i].z*loadScale);
        }}//}  
     
     
    
    
    
    
    
    
    PVector[][] mocap0=new PVector[][]{
        (  new PVector[]{
            new PVector( 547.0039f, 222.2832f, -334.54208f ),
             new PVector( 561.6699f, 266.53906f, -347.46008f ),
             new PVector( 594.1738f, 260.95312f, -350.65778f ),
             new PVector( 647.1504f, 277.10938f, -348.35193f ),
             new PVector( 688.25f, 261.0f, -323.65042f ),
             new PVector( 529.16016f, 272.13086f, -344.2624f ),
             new PVector( 484.51562f, 296.61328f, -331.98694f ),
             new PVector( 486.9082f, 247.25195f, -321.47375f ),
             new PVector( 568.2383f, 306.81836f, -350.97028f ),
             new PVector( 589.5332f, 344.56836f, -355.9385f ),
             new PVector( 623.99414f, 423.95703f, -362.432f ),
             new PVector( 645.73047f, 500.1582f, -392.87567f ),
             new PVector( 560.09375f, 349.625f, -353.02234f ),
             new PVector( 564.2676f, 437.01562f, -350.789f ),
             new PVector( 561.44336f, 517.9258f, -379.0871f )}),
     (  new PVector[]{
    new PVector( 547.0039f, 222.2832f, -334.54208f ),
     new PVector( 561.6699f, 266.53906f, -347.46008f ),
     new PVector( 594.1738f, 260.95312f, -350.65778f ),
     new PVector( 645.3628f, 281.58203f, -348.35193f ),
     new PVector( 693.5f, 271.25f, -323.65042f ),
     new PVector( 529.16016f, 272.13086f, -344.2624f ),
     new PVector( 484.51562f, 296.61328f, -331.98694f ),
     new PVector( 486.9082f, 247.25195f, -321.47375f ),
     new PVector( 568.2383f, 306.81836f, -350.97028f ),
     new PVector( 589.5332f, 344.56836f, -355.9385f ),
     new PVector( 623.99414f, 423.95703f, -362.432f ),
     new PVector( 645.73047f, 500.1582f, -392.87567f ),
     new PVector( 560.09375f, 349.625f, -353.02234f ),
     new PVector( 564.2676f, 437.01562f, -350.789f ),
     new PVector( 561.44336f, 517.9258f, -379.0871f )})  };
    
     




