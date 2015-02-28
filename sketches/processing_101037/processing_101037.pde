
    float[][] cameraMat;
    float[][] worldMat;
     
    int N_STACK = 20;         
    float[][][] matricesStack; 
    int sp;                     
     
    PVector xCam;
    PVector yCam;
    PVector zCam;
     
    PVector tmp;
    int ballCount=10;
     Ball[] b;
    PVector start;
    PVector end; 
    String mainText="Pseudo\n3D";
     PGraphics stringTex;
    int texRes=128;
         float cam_dist  = 250;



    public void setup() {
      size(300, 300);
      frameRate(30);
      rectMode(CENTER);
      b=new Ball[ballCount];  for(int i=0;i<ballCount;i++)b[i]=new Ball();
      setupStringTex();    drawStringTex();

//      addMouseWheelListener(new java.awt.event.MouseWheelListener() {  public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { mouseScroll=  -evt.getWheelRotation();  mouseScrolled();    }}); 

      xCam  = new PVector();      yCam  = new PVector();      zCam  = new PVector();
      tmp = new PVector();       
      start = new PVector();   end   = new PVector();
       
      worldMat  = new float[4][4];      cameraMat = new float[4][4];
      for(int i = 0; i < 4; i++)   for(int j = 0; j < 4; j++)  worldMat[i][j] = cameraMat[i][j] = i == j ? 1.0f : 0.0f;
      matricesStack = new float[N_STACK][4][4];
      sp = 0;  }
    


    public  void draw() {
      fill(0,0,0,120); rect(width/2,height/2,width*10,height*10);//draw a background with motion blur
      pushMat();
        float angle = radians(frameCount);
        cam(cam_dist,   -cam_dist, cam_dist, 0, 0, 0, 0, 1, 0);
        
        pushMat();
     rotY(camrotY);
  rotX(camrotX);
          rotZ(sin(angle) * PI / 12.0f);
                  trans(0,0,-stringTex.height);

          pushMat();
           angle += radians(camrotX+camrotY);
  int mCol= color(255-sin(angle)*60,sin(angle)*60,sin(angle)*60);

            float scale=1.0f;

           
           scale=2f;
           drawFace(scale);
  loadPixels();

           for(int x=0;x<stringTex.width;x++){
             for(int y=0;y<stringTex.height;y++){
               int i=y*stringTex.height+x;
           if( red(stringTex.pixels[i])+ green(stringTex.pixels[i])+ blue(stringTex.pixels[i])==0)   { //  drawLine((x-lettergt.width/2)*scale, (y-lettergt.height/2)*scale, 0, (x-lettergt.width/2)*scale, (y-lettergt.height/2)*scale, depth);
                drawPoint((x-stringTex.width/2)*scale, (y-stringTex.height/2)*scale, 0,mCol);  //   fill(lettergt.pixels[i]);
           } }}
           scale=1f;
                  updatePixels();
     popMat();
            pushMat();       
          trans(0,0,stringTex.height);
          stroke(255,0,0,255);
    drawEllipsoid(55, 55, 55,12,12);
    popMat();
      stroke(0,0,255,255);

      for(int i=0;i<ballCount;i++){b[i].update();        b[i].draw();}
//for(Ball tb:b){      tb.update();        tb.draw();}
                 loadPixels();
  pushMat();       

          trans(0,stringTex.height,stringTex.height);
          rotX(90*PI/4);
           mCol= color(255-sin(angle+90)*30,sin(angle+90)*30,sin(angle+90)*60);

                 for(int x=0;x<stringTex.width;x++){
                   for(int y=0;y<stringTex.height;y++){
                     int i=y*stringTex.height+x;
                 if( red(stringTex.pixels[i])+ green(stringTex.pixels[i])+ blue(stringTex.pixels[i])==0)   { //  drawLine((x-lettergt.width/2)*scale, (y-lettergt.height/2)*scale, 0, (x-lettergt.width/2)*scale, (y-lettergt.height/2)*scale, depth);
                      drawPoint((x-stringTex.width/2)*scale, (y-stringTex.height/2)*scale, 0,mCol);  //   fill(lettergt.pixels[i]);
                 } }}
   popMat();
                             
    pushMat();
    trans(0,-stringTex.height,stringTex.height);
    rotX(90*PI/4);
     mCol= color(255-sin(angle+90)*30,sin(angle+90)*30,sin(angle+90)*60);

           for(int x=0;x<stringTex.width;x++){
             for(int y=0;y<stringTex.height;y++){
               int i=y*stringTex.height+x;
           if( red(stringTex.pixels[i])+ green(stringTex.pixels[i])+ blue(stringTex.pixels[i])==0)   { //  drawLine((x-lettergt.width/2)*scale, (y-lettergt.height/2)*scale, 0, (x-lettergt.width/2)*scale, (y-lettergt.height/2)*scale, depth);
                drawPoint((x-stringTex.width/2)*scale, (y-stringTex.height/2)*scale, 0,mCol);  //   fill(lettergt.pixels[i]);
           } }}
                       popMat();                         
                             
                             
                   pushMat();
                   trans(-stringTex.height,0,stringTex.height);
                   rotY(90*PI/4);
                    mCol= color(255-sin(angle+90)*30,sin(angle+90)*30,sin(angle+90)*60);

                          for(int x=0;x<stringTex.width;x++){
                            for(int y=0;y<stringTex.height;y++){
                              int i=y*stringTex.height+x;
                          if( red(stringTex.pixels[i])+ green(stringTex.pixels[i])+ blue(stringTex.pixels[i])==0)   { //  drawLine((x-lettergt.width/2)*scale, (y-lettergt.height/2)*scale, 0, (x-lettergt.width/2)*scale, (y-lettergt.height/2)*scale, depth);
                               drawPoint((x-stringTex.width/2)*scale, (y-stringTex.height/2)*scale, 0,mCol);  //   fill(lettergt.pixels[i]);
                          } }}
  popMat();  

  pushMat();
  trans(stringTex.height,0,stringTex.height);
  rotY(90*PI/4);
   mCol= color(255-sin(angle+90)*30,sin(angle+90)*30,sin(angle+90)*60);

         for(int x=0;x<stringTex.width;x++){
           for(int y=0;y<stringTex.height;y++){
             int i=y*stringTex.height+x;
         if( red(stringTex.pixels[i])+ green(stringTex.pixels[i])+ blue(stringTex.pixels[i])==0)   { //  drawLine((x-lettergt.width/2)*scale, (y-lettergt.height/2)*scale, 0, (x-lettergt.width/2)*scale, (y-lettergt.height/2)*scale, depth);
              drawPoint((x-stringTex.width/2)*scale, (y-stringTex.height/2)*scale, 0,mCol);  //   fill(lettergt.pixels[i]);
         } }}
     popMat();         

        
        
        
        
        
      pushMat();
      trans(0,0,stringTex.height*2);
    //  rotY(90*PI/4);
       mCol= color(255-sin(angle+90)*30,sin(angle+90)*30,sin(angle+90)*60);
      updatePixels();

       for(int x=0;x<stringTex.width;x++){
           for(int y=0;y<stringTex.height;y++){
             int i=y*stringTex.height+x;
         if( red(stringTex.pixels[i])+ green(stringTex.pixels[i])+ blue(stringTex.pixels[i])==0)   { //
           drawLine((x-stringTex.width/2)*scale, (y-stringTex.height/2)*scale, 0, (x-stringTex.width/2)*scale, (y-stringTex.height/2)*scale, -15);
    //          drawPoint((x-lettergt.width/2)*scale, (y-lettergt.height/2)*scale, 0,mCol);  //   fill(lettergt.pixels[i]);
         } }}
       loadPixels();
         for(int x=0;x<stringTex.width;x++){
             for(int y=0;y<stringTex.height;y++){
               int i=y*stringTex.height+x;
           if( red(stringTex.pixels[i])+ green(stringTex.pixels[i])+ blue(stringTex.pixels[i])==0)   { //
      //       drawLine((x-lettergt.width/2)*scale, (y-lettergt.height/2)*scale, 0, (x-lettergt.width/2)*scale, (y-lettergt.height/2)*scale, 22);
                drawPoint((x-stringTex.width/2)*scale, (y-stringTex.height/2)*scale, 0,mCol);  //   fill(lettergt.pixels[i]);
           } }}
         popMat();         

           
            
            
        updatePixels();

        pushMat();
     stroke(255,255,255,255);

  trans(0,0,stringTex.width); rotY(90*PI/8);      drawCuboid(stringTex.width*2,stringTex.height*2);
      popMat();  

        popMat();
      popMat();
    }
    
    
    
    
    
    
    
       float camrotX,camrotY;
      public void mouseDragged(){camrotY-=radians(pmouseX-mouseX);camrotX+=radians(pmouseY-mouseY);}   
    float mouseScroll;
    void mouseScrolled() {    cam_dist-=this.mouseScroll*10;  }
    
    public void keyReleased() { if(key!=BACKSPACE)handleKey(key); }// send key to the String. BACKSPACE should be triggered if pressed, other letters only should be pressed once per release
    public void keyPressed() { if(key==BACKSPACE)handleKey(key); }// send key to the String

    public void handleKey(char rkey) {if ((rkey == BACKSPACE)&&mainText.length()>0) {mainText = mainText.substring(0, mainText.length() - 1);
    drawStringTex(); }
    else if(rkey == SHIFT){}  else if(rkey == ENTER){mainText+="\n ";drawStringTex();  } else {mainText=mainText+
 // String.valueOf
(rkey).toString();   drawStringTex();   }   }
    
void setupStringTex(){
    stringTex=createGraphics(texRes,texRes);
    stringTex.beginDraw();
    stringTex.textFont(createFont("arial Bold",64,true));
    stringTex.textAlign(CENTER,CENTER);
    stringTex.fill(0);
    stringTex.endDraw(); 
}
    private void drawStringTex() {
    int  lineCounter=0;
     for(int i=0;i<mainText.length();i++){if(
//   String.valueOf
 (mainText.charAt(i)).toString().
 match
// equals
 ("\n"))lineCounter++;}
         stringTex.beginDraw();
         stringTex.textSize(((float)(texRes)/((float)(mainText.length()/(float)(lineCounter+1))))*1.2f+3);
         stringTex.background(255);
         stringTex.text(mainText,stringTex.width/2,stringTex.height/2);
         stringTex.loadPixels();
         stringTex.endDraw();    
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
       
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
      
      
      
    void drawFace(float scale) {  for(int x=0;x<stringTex.width;x++){  drawLine((x-stringTex.width/2)*scale, - (stringTex.height/2)*scale, 0, (x-stringTex.width/2)*scale, (stringTex.height/2)*scale, 0);  }  }
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
    class Ball{
      float x,y,z,/*px,py,pz,*/vx,vy,vz,gravity=.1f,slowDown=.95f,startSpeed=20;
      Ball(){x=0;y=0;z=0;
      /*px=x;py=y;pz=z;*/
      vx=random(-startSpeed,startSpeed);vy=random(-startSpeed,startSpeed);vz=random(-startSpeed,startSpeed);
      }
      void update(){ if (mousePressed) {    float tx = mouseX-width/2;      float ty = mouseY-height/2;
            float radius = dist(x,y,tx,ty);    float angle = atan2(ty-y,tx-x);
               vx += radius * 0.07 * cos(angle);    vy += radius * 0.07 * sin(angle);
                vz += radius * 0.0+random(-startSpeed,startSpeed)*.5f;       }     
        if(x<-stringTex.width/2){vx=-vx;x=-stringTex.width/2;}
        if(x>stringTex.width/2){vx=-vx;x=stringTex.width/2;}
        if(y<-stringTex.height/2){vy=-vy;y=-stringTex.height/2;}
        if(y>stringTex.height/2){vy=-vy;y=stringTex.height/2;}
        if(z<-stringTex.width/2){vz=-vz;z=-stringTex.width/2;}
        if(z>stringTex.width/2){vz=-vz;z=stringTex.width/2;}
        vx*=slowDown;        vy*=slowDown;        vz*=slowDown;      vy+=gravity;
        x += vx;  y += vy;   z += vz;         /* px=x;py=y;pz=z;*/
      }
      void draw(){
            pushMat();       
          trans(x,y,z+stringTex.width);
          stroke(0,0,255,255);
    drawEllipsoid(35, 35, 35,4,4);
    popMat();
      }
    }
    


