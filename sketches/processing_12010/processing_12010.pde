
public class CastManager extends Thread {
  float bump = 0.5;  // height of bump
  float noiseScale = 0.008;
  Caster cR, cG, cB;
  float boxW = 300;
  float boxH = 300;
  float z = 0;
  boolean reset = false;
  boolean reseed = false;
  boolean clear = false;
  long loopCount;
  int fpsGranularity = 10000;
  float fps;
  
  final int RANDOM_ALGO = 0;
  final int SPIRAL_ALGO = 1;
  final int SPIRAL_CLEAR_ALGO = 2;
  final int num_algos = 2;
  int algo = SPIRAL_ALGO;
 
  public CastManager() {
    loopCount = 0;
    cR = new Caster();
    cR.n = 1.4;
    cG = new Caster();
    cG.n = 1.42;
    cB = new Caster();
    cB.n = 1.44;
    
    cG.intensity = 20;
    cR.intensity = 20;
    cB.intensity = 22;
  }
  public void cycleAlgo() {
    algo = (algo+1)%num_algos;
  }
  public void start() {
    super.start();
  }
  public void reset() {
    reset = true;
  }
  public void reseed() {
    reseed=true;
  }
  public void clear() {
    clear = true;
  }
  public void run() {
    long timeStart = millis();
    float r = 10; float t = 0;
    int rDir = 1;
    while (true) {
      if (loopCount % fpsGranularity == 0) {
        long delta = millis()-timeStart;
        if (delta != 0) {
          fps = fpsGranularity*1000.f/delta;
        }
        timeStart = millis();
      }
      if (reseed) {
        noiseSeed(millis());
        reseed=false;
      }
      if (reset) {
        cR.reset();
        cG.reset();
        cB.reset();
        reset = false;
      }
      if(clear) {
        cR.reset();
        cG.reset();
        cB.reset();
        clear = false;
      }
      float x, y;
      switch (algo) {
        case RANDOM_ALGO:
          x = random(boxW)+width/2-boxW/2;
          y = random(boxH)+height/2-boxH/2;
          break;
        case SPIRAL_ALGO: case SPIRAL_CLEAR_ALGO:
          r = (r+0.0001*rDir);
          if (abs(r) > boxW/2) {
            rDir *=-1; 
          }
          t = (t+0.001)%TWO_PI;
          x = r*cos(t) + width/2;
          y = r*sin(t) + height/2;
          break;
        default:
          x=0; y=0;
          println("Unkown algo: " + algo + "!");
          exit();
      }
      // Calculation of gradient
      float dzdx = (noise(x*noiseScale+noiseScale,y*noiseScale,z*noiseScale) - noise(x*noiseScale-noiseScale,y*noiseScale,z*noiseScale))*bump/(noiseScale*2);
      float dzdy = (noise(x*noiseScale,y*noiseScale+noiseScale,z*noiseScale) - noise(x*noiseScale,y*noiseScale-noiseScale,z*noiseScale))*bump/(noiseScale*2);
      
      // More accurate calculation of gradient.
      //float dzdx = (noise(x*noiseScale-2*noiseScale,y*noiseScale, z*noiseScale)*-0.5 
      //            + noise(x*noiseScale-noiseScale, y*noiseScale, z*noiseScale)*-1
      //            + noise(x*noiseScale+noiseScale, y*noiseScale, z*noiseScale)*1
      //            + noise(x*noiseScale+2*noiseScale, y*noiseScale, z*noiseScale)*0.5)*bump/(noiseScale*2);
                  
      //float dzdy = (noise(x*noiseScale,y*noiseScale-2*noiseScale, z*noiseScale)*-0.5 
      //      + noise(x*noiseScale, y*noiseScale-noiseScale, z*noiseScale)*-1
      //      + noise(x*noiseScale, y*noiseScale+noiseScale, z*noiseScale)*1
      //      + noise(x*noiseScale, y*noiseScale+2*noiseScale, z*noiseScale)*0.5)*bump/(noiseScale*2);
      
      float m = mag(dzdx,dzdy,1);

      // Normal to surface
      float nX = dzdx/m;
      float nY = dzdy/m;
      float nZ = 1/m;
      //println(nZ);
      float thetaI = acos(nZ);

      cR.cast(x,y,nX,nY,nZ,thetaI);
      cG.cast(x,y,nX,nY,nZ,thetaI);
      cB.cast(x,y,nX,nY,nZ,thetaI);

      loopCount++;
    }
  }
}

