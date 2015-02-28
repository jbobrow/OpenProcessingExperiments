
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioOutput out;
drum D;// user defined signal
int drumSize = 18;
float[][] amp;// amplitude
float[][] vel;// velocity
float[][] imp;// impulse
boolean bng = false;// drum bang
float bngImp = 500;// bang impulse
float spr = 0.02;// spring rate
float dam = 0.01;// damping
void setup(){
  amp = new float[drumSize][drumSize];
  vel = new float[drumSize][drumSize];
  imp = new float[drumSize][drumSize];
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO);
  D = new drum();
  out.addSignal(D);
}
void draw(){
  PImage drw = createImage(drumSize,drumSize,RGB);
  for(int i=0;i<drumSize;i++){
    for(int j=0;j<drumSize;j++){
      drw.set(i,j,color(amp[i][j]*128+128));
    }
  }
  image(drw,0,0,width,height);
  filter(BLUR);
}
void keyPressed(){
  bng=true;
}
float update(){
  float val = 0;
  float del;// a place to store one number
  // find all X forces
  for(int i=0;i<drumSize-1;i++){
    for(int j=0;j<drumSize;j++){
      // determine the spring force
      del=spr*(amp[i+1][j]-amp[i][j]);
      // add the damping force
      del+=dam*(vel[i+1][j]-vel[i][j]);
      // deliver an equal and opposite impulse
      imp[i][j]+=del;
      imp[i+1][j]-=del;
    }
  }
  // find all Y forces
  for(int i=0;i<drumSize;i++){
    for(int j=0;j<drumSize-1;j++){
      del=spr*(amp[i][j+1]-amp[i][j]);
      del+=dam*(vel[i][j+1]-vel[i][j]);
      imp[i][j]+=del;
      imp[i][j+1]-=del;
    }
  }
  // update all nodes which are not on the drum rim
  for(int i=1;i<drumSize-1;i++){
    for(int j=1;j<drumSize-1;j++){
      // accelerate by an impulse
      vel[i][j]+=imp[i][j];
      // reset the impulse sum
      imp[i][j]=0;
      // translate by a velocity
      amp[i][j]+=vel[i][j];
      // sum the amplitudes of the drum
      val+=amp[i][j];
    }
  }
  // normalize to an average amplitude
  val /= sq(drumSize);
  // clip audio
  return constrain(val,-1,1);
}
class drum implements AudioSignal{
  void generate(float[] samp){
    // You may not make changes in
    // the data outside of this routine.
    if(bng){
      bng=false;
      // get a random point on the drum
      int a=floor(random(1,drumSize-1.001));
      int b=floor(random(1,drumSize-1.001));
      // deliver a big impulse
      amp[a][b]=bngImp;
    }
    for(int i=0;i<samp.length;i++){
      // get an amplitude while updating the simulation
      samp[i]=update();
    }
  }
  void generate(float[] left, float[] right){
    // this is a mono drum
    // this routine returns a zero signal
  }
}
void stop(){
  // you must close minim resources on exit
  out.close();
  minim.stop();
  super.stop();
}

