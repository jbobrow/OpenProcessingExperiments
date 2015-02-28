
// DemoCam
class DemoCam
{
  float timeOffset;
  float panSpeed;
  float lookatSpeed;
  DemoCam() { setState(); }
   void setState() {
    panSpeed=max(random(-0.3,1.),0.);
    timeOffset=random(60.);
    lookatSpeed=max(random(-0.3,3.),0.);
  }
 
  float setCamera() {
     float time=(float)millis()/10000.f + timeOffset;
     float px=Noise.fbm(time*2,4)*60.*lookatSpeed;
     float py=(Noise.fbm(time*2+12890.56,4))*60.*lookatSpeed;
     float pz=(Noise.fbm(time*2+2390.56,4))*60.*lookatSpeed;          
     float outofFocus =  max((Noise.fbm(time*8+6690.56,4)-.3)*2.,0.);       
     float camsc=  Noise.fbm(time*2*panSpeed+6690.56,2);
     float rx=Noise.fbm(time*4*panSpeed+12890.56,2);
     float ry=Noise.fbm(time*4*panSpeed,2);     
   
    cam.lookAt(px,py,pz,230*(1.+camsc*.95),0);
    cam.setRotations(max(rx*PI*0.7,-PI/16), ry*2*PI,0.);
    return outofFocus;
  } 
}
 

