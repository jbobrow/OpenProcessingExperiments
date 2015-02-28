
public class boingyringer extends OscillatorLFOADSR
{
  float vco;
  float op=0.; 
  float durb = 0;
  float vel = 0.; 
  float acc = 0.;
  float ovel =0.0; 
  float avel = 0.0;
  float filterMush =0.;
  float filt2=0.0;
  float filt3=0.0;

  public boingyringer(float frequency, float amplitude, float sampleRate)
  {
    //filterMush = 0.0;
    // a=0.0;
    super(frequency, amplitude, sampleRate);
    //detuna = 0.0;last=0.0;
  }

  protected float value(float step){
    if((step>-0.78 && step<-0.53)||(step>0.6 && step<0.66)){
      vco = 0.7;

    } 
    else{
      vco = -0.46; 
    }


    durb = sin(radians(30*durb+50*vco/3))+vco/30;
    acc += -(acc-vel)/64 + durb-op*1.01;
    acc *=0.9;
    vel -=acc +(vel/4);
    vel *=0.3521;
    ovel +=vel +(ovel/4);
    ovel *=0.22521;
    avel +=ovel +(avel/5.7);
    avel *=0.12521;
    op -= avel+((vel/8)-ovel/8)+sin(vel/2+step)/3.5; 


    filt2 = ((17*filt2+op)/18); 
    filt3 = (1000*filt3 +filt2)/1001;
    filterMush=(filt2-filt3);

    //op = durb;
    updateLFO();
    return(filterMush*gain*tremLFO*4);
  }//method value
} //class

public class noisyringer3 extends OscillatorLFOADSR
{
  float vco;
  float op=0.; 
  float durb = 0;
  float vel = 0.; 
  float acc = 0.;
  float ovel =0.0; 
  float avel = 0.0;
  float filterMush =0.;
  float filt2=0.0;
  float filt3=0.0;

  public noisyringer3(float frequency, float amplitude, float sampleRate)
  {
    //filterMush = 0.0;
    // a=0.0;
    super(frequency, amplitude, sampleRate);
    //detuna = 0.0;last=0.0;
  }

  protected float value(float step){
    if((step>-0.78 && step<-0.53)||(step>-0.3 && step<0.76)){
      vco = 0.7;

    } 
    else{
      vco = -0.46; 
    }


    durb = sin(radians(30*durb+50*vco/3))+vco/30;
    acc += -(acc-vel)/64 + durb-op*1.01;
    acc *=0.9;
    vel -=acc +(vel/4);
    vel *=0.2521;
    ovel +=vel +(ovel/4);
    ovel *=0.22521;
    avel +=ovel +(avel/5.7);
    avel *=0.12521;
    op -= avel+((cos(vel/256)/256)-ovel/8)-cos(vel/2.6+step/(((avel/12)%0.27)/32))/64.; 



    filt2 = ((17*filt2+op)/18); 
    filt3 = (300*filt3 +filt2)/301;
    filterMush=(filt2-filt3);

    //op = durb;
    updateLFO();
    return(filterMush*gain*tremLFO*4);
  }//method value
} //class

public class nedsyringer extends OscillatorLFOADSR
{
  float vco;
  float op=0.; 
  float durb = 0;
  float vel = 0.; 
  float acc = 0.;
  float ovel =0.0; 
  float avel = 0.0;
  float filterMush =0.;
  float filt2=0.0;
  float filt3=0.0;

  public nedsyringer(float frequency, float amplitude, float sampleRate)
  {
    //filterMush = 0.0;
    // a=0.0;
    super(frequency, amplitude, sampleRate);
    //detuna = 0.0;last=0.0;
  }

  protected float value(float step){
    if((step>-0.78 && step<-0.73)||(step>0.41 && step<0.86)){
      vco = 0.7;

    } 
    else{
      vco = -0.46; 
    }

    durb = cos(radians(30*durb+50*vco/(this.frequency()/2)))+vco/30;
    acc += -(acc-vel)/64 + durb-op*1.01;
    acc *=0.9;
    vel -=acc +(vel/4);
    vel *=0.3521;
    ovel +=vel +(ovel/4);
    ovel *=0.22521;
    avel +=ovel +(avel/5.7);
    avel *=0.12521;
    op -= avel+((vel/8)-ovel/8)+sin(((op*vel/2+step)+( radians(this.frequency())))*5)/3.5; 


    filt2 = ((10*filt2+op)/11); 
    filt3 = (11000*filt3 +filt2)/11001;
    filterMush=(filt2-filt3);

    //op = durb;
    updateLFO();
    return(filterMush*gain*tremLFO*3);
  }//method value
} //class








public class pulseWidthBP extends OscillatorLFOADSR
{
  float vco;
  float op=0.; 
  float durb = 0;
  float vel = 0.; 
  float acc = 0.;
  float ovel =0.0; 
  float avel = 0.0;
  float filterMush =0.;
  float filt1=0.0;
  float filt2=0.0;
  float filt3=0.0;float bv = 0.;
float bv2 = 0.;
float bg = 0.;
float mass = 5.0;

float warmup = 0.0;

float pulse = 0.5;float lfopulse = 0.5;
float pulseZip=0.5;
float bp = 90;float lfobp=90;
float bpZip=90;

float pwrate =0;float pwdepth =0;float pulseCount=0.0;
float bprate =0;float bpdepth =0;float bpCount=0.0;

  public pulseWidthBP(float frequency, float amplitude, float sampleRate)
  {
    //filterMush = 0.0;
    // a=0.0;
    super(frequency, amplitude, sampleRate);
    //detuna = 0.0;last=0.0;
  }
void setPW(float pw){
pulse = abs(constrain(pw,-1.0,1.0));  
lfopulse=pulse;
}
void setBP(float tBP){
  
tBP *=((tBP+100)/(tBP+10))/10;
bp = abs(constrain(tBP,10,800));  
lfobp=bp;
}
void setPWLFO(float rate, float depth){
  pwrate=rate/100;
  pwdepth=depth;
}
void setBPLFO(float rate, float depth){
 bprate=rate/100;
bpdepth=depth; 
  
}
  protected float value(float step){
 if(step>-0.99&step<pulseZip){
   vco = 0.5;
  
 } else{
  vco = -0.5; 
 }
 filt1 = ((bpZip-9)*filt1+vco)/(bpZip-8);
 filt2 = (((bpZip+80)*filt2+vco)/(bpZip+81));
 
 pulseCount = (pulseCount+pwrate)%360;
 bpCount = (bpCount+bprate)%360;
 if(pwrate>0 && pwdepth<1.1){
    lfopulse = pulse*abs(sin(radians(pulseCount))*pwdepth+1.0)/2.0;
  //pulse *= (((cos(radians(pulseCount))/(1.01-pwdepth))/2)+0.5); 
 }
  if(bprate>0  ){
    lfobp = constrain(0.75*bp*(abs(sin(radians(bpCount))*bpdepth+1.5)),10,900);
  //pulse *= (((cos(radians(pulseCount))/(1.01-pwdepth))/2)+0.5); 
 }
// op=vco;
 pulseZip = (2000*pulseZip+lfopulse)/2001;
bpZip = (2200*bpZip+lfobp)/2201;
 op = filt1-filt2;
//bv = (mass*bv+ (vco-(bg*1.3)))/(mass+1.3);
//bv2 = (mass*bv2+ (bv-(bv2*1.3))+vco/8)/(mass+1.3);
//warmup = (1000*warmup+1.0)/1001;
//bg = (bg+bv2+bv)/(mass)*warmup;
 filt3 = ((500*filt3+(op))/501);
    filterMush=(op-filt3)*3.;

    //op = durb;
    updateLFO();
    return(filterMush*gain*tremLFO);
  }//method value
}



