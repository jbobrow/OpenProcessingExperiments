
// Animation of superquadratic figures
    // Created by Everardo Reyes
    // Paris, 2013
    // Based on an original algorithm by K. Terzidis
    // Some suggestions were made by Eleanor Dare

    // http://programalaplaza.medialab-prado.es/sketch/view/8d08ef63fec65842d90f196b8f9d9551

    int samples = 50;
    float a1 = 10., a2 = 10., a3 = 10.;
    float u1 = 0., u2 = 20., v1 = 0., v2 = 20.;
    float dU = (u2 - u1) / samples;
    float dV = (v2 - v1) / samples;
    float n = 0.5; // test values from 0.1 to 0.9 
    float e = 1; // 0 = two-sided, 1 = one-sided, 
    float u = u1;
    int cases;
    
    
    void setup() {
      size(800, 800, P3D); //setup the screen
      smooth();
      frameRate(10);
    }
    
    void draw() {
      
      background(0);


      lights();
    
      translate(width/2, height/2, 500);
      rotateX(frameCount * PI/100);
      rotateY(frameCount * PI/100);
      

      stroke(random(100,255),random(100,255),0,200);
      strokeWeight(3);


         if (frameCount == 1) cases=1;
         if (frameCount == 100) {
            translate(width/2, height/2, 1000);     
            cases=2;
         }
         if (frameCount == 200) {
             translate(width/2, height/2, 300); 
             cases=3;   
         }
         if (frameCount == 300) {
             frameCount = 200;
             e = random(-0.3,0.9);
             n = random(-0.5,3);
         }
        
    

     

  
      switch(cases) {
        case 1:
        sphereDotted();
        break;
        case 2:
        quads();
        break;
        case 3:
        boloids();
        break;
      }
      
    
    }   
    
        
    void sphereDotted() {
      
      //regular sphere:
      for(int i=0; i<360; i+=10) {
       for(int j=0; j<360; j+=10){
         float x = samples * cos(radians(i)) * cos(radians(j));
         float y = samples * cos(radians(i)) * sin(radians(j));
         float z = samples * sin(radians(i));
         point(x,y,z);
       }
      } 
    }
    
    void quads() {
      for (int i=0; i<samples; i++) {
        //float v = v1;
        for (int j=0; j<samples; j++) {
          
          float x = a1 * sqCos (u, n) * sqCos (v1, e);
          float y = a2 * sqCos (u, n) * sqSin (v1, e);
          float z = a3 * sqSin (u, n);
          float xn = a1 * sqCos (u+0.4, n) * sqCos (v1, e);
          float yn = a2 * sqCos (u+0.4, n) * sqSin (v1, e);
          float zn = a3 * sqSin (u+0.4, n);
          float xu = a1 * sqCos (u, n) * sqCos (v1 + 0.4, e);
          float yu = a2 * sqCos (u, n) * sqSin (v1 + 0.4, e);
          float zu = a3 * sqSin (u, n); 
          
          point(x,y,z);
          //line(x, y, z, xn,yn,zn);
          //line(x, y, z, xu,yu,zu);
          
          v1 += dV;
        }
        u += dU;
      }
    }
    
    void boloids() {   
       for (int i=0; i<samples; i++) {
        float v = v1;
        for (int j=0; j<samples; j++) {
          float x = a1 * sec(u, n) * sqCos(v, e);
          float y = a2 * sec(u, n) * sqSin(v, e);
          float z = a3 * sqTan(u, n);
          point(x, y, z);
          v += dV;
        }
        u += dU;
    
       }
    }
    
    
    
    float sign ( float x ) {
      if ( x < 0 )return -1;
      if ( x > 0 )return 1;
      return 0;
    }
    float sqSin( float v, float n ) {
      return sign(sin(v)) * pow(abs(sin(v)), n);
    }
    float sqCos( float v, float n ) {
      return sign(cos(v)) * pow(abs(cos(v)), n);
    }
    
    float sec( float v, float n ) {
      return 1/cos(v) * pow(abs(cos(v)),n);
    }
    
    float sqTan( float v, float n ) {
      return sign(tan(v)) * pow(abs(tan(v)), n);
    }
