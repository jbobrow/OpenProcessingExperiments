
 
class SceneState
{
  boolean useHandHeld=false;
  boolean useAutoPan=false;
  boolean updateMB=true;
  boolean useRotate=false;//false;
  boolean useNoiseRotate=false;
  boolean useRandomSpaz=false;
  float rotationSpeed=1.;
  float timeOffset;
  float time;
  float dt;
  float lastcut=0.;
  float lasttime=0;
  float outofFocus=0.f;
  float panSpeed=1.f;
  float pillisec=0.f;
  float backDof=1.f;
  int numSamples=0;
  int numIterations=150;
  float angFlip=1;
  int initalDisplay=0;
boolean usedef=false;
 
 // distort anim
 int   distOctaves=2;
 float distAmt=0.0;
 float distSpeed=1.;
 
  void setState() {
    if (usedef)
      return;
    useHandHeld=random(1.)<.3f;
    if (!useHandHeld) {
      useAutoPan=true;
      panSpeed=random(0.1,1.);
      backDof=1.f + random(1.)<.2 ? 1. : 0.;
    }
    timeOffset=random(60.);
    if (initalDisplay<ifss.length){
      g_targetScene = initalDisplay;
      initalDisplay++;
      return;
    }
    updateMB = random(1.)>.3;
 
    
    useRotate=random(1.)<.5;
    if (!useRotate){
      useNoiseRotate=random(1.)<.5;
    }
    distAmt=random(1.)<0.4 ? random(0.01,0.25) : 0.;
    distOctaves=(int)random(1.,3.99);
    distSpeed=random(0.3,2.);

    useRandomSpaz=random(1.)<0.15;
    rotationSpeed=random(0.1,3.);
    angFlip = random(1.)<0.3 ? -1 : 1;
    if (random(1.)<.3)
      g_targetScene = (int)random(ifss.length);
 
    if (random(1.)<0.1 ){ // fade in
      numSamples=-1600;
      numIterations=150;
    }
  }
  SceneState() {
    setState();
  }
 
  boolean update() {   
    boolean iscut=false;
    float ctime=(float)millis()/10000.f;
    if ( random(1.)<0.025 && (ctime-lastcut)>0.4 ) {
      setState();
      iscut=true;
      lastcut=ctime;
      println("update ");
    }
    dt=ctime-lasttime;
    lasttime=ctime;
    time=ctime + timeOffset;
    return iscut;
  }
  float getAngle() {
    float angrange=PI*angFlip;  
    float ang=0.;    
    if ( useRotate ) {
      float stime=(sin(PI*time*rotationSpeed))*.5+.5;//*dir;
      ang+=stime*angrange;
    }
   
     if ( useNoiseRotate ) {
      float stime=(Noise.fbm(time*rotationSpeed*2,3))*.5+.5;//*dir;
      ang+=stime*angrange;
    }
    if ( useRandomSpaz && false) {
     float spaz=  min((Noise.fbm(time*32+6690.56,4)*.5+.5)*1.3,1.);
      spaz = pow(spaz,16);
      ang+= spaz*PI/2;
    }
    return ang;
  }
  float[] setCamera() {
 
    float[] bt= new float[6];
    arrayCopy(basetransform,bt);
    outofFocus=0.;
    backDof=1.;
    if (useHandHeld ) {
      noiseDetail(6,0.6); 
      float camsc=  Noise.fbm(time,4)*0.8;
      bt[2]+=(Noise.fbm(time*4,4))*0.1;
      bt[5]+=(Noise.fbm(time*4+12890.56,4))*0.2;
     
      bt[5]-=bt[0]*camsc*.5;
      bt[2]-=bt[4]*camsc*.5;
      bt[0]*=(1+camsc);
      bt[4]*=(1+camsc);
      outofFocus =  max(Noise.fbm(time*8+6690.56,4)*1.5,0.);
      backDof= 1.+max(1.-outofFocus*3.,0)*1.;
      //     outofFocus=outofFocus.;
    }
    if ( useAutoPan ) {
      float camsc=  (Noise.fbm(time*1*panSpeed+6690.56,2));
      camsc=camsc*1.5;
      bt[2]+=Noise.fbm(time*4*panSpeed+12890.56,2)*.5;
      bt[5]+=Noise.fbm(time*4*panSpeed,2)*.5;
      bt[5]-=bt[0]*camsc*.5;
      bt[2]-=bt[4]*camsc*.5;
     
      bt[0]*=(1+camsc);
      bt[4]*=(1+camsc);
    }
    return bt;
  } 
  void setPerf(float millisecs) {
    //if ( true)      return;
    float m=pillisec*0.7+millisecs*0.3;
    float target=29;//29;
    if ( m>(target+2)) {
      numSamples-=100;
      numIterations-=1;
  //    println("("+m+")"+" down "+numSamples + " " +numIterations);
    }
    else if ( m<(target-4)) {
      numSamples+=100;
      numIterations+=1;
//      println("("+m+")"+" up "+numSamples + " " +numIterations);
    }
    pillisec=m;
  }
};


