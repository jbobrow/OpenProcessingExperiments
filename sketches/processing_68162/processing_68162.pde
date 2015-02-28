
/* terry gyde - endo.gen.nz */ /* circle shake */
/* based on: */
/* "Sphere Deformations" by Kof @ //Work: http://openprocessing.org/visuals/?visualID= 64339 */
/* "Sine Wave" by Daniel Shiffman @ processing.org/learning/basics/sinewave.html */

int xAry, centX, centY;
int shakeDist = 182;
ArrayList lookUp;
int colStroke = 0;
float wavTheta = 0.0;  /* initial angle zero */
float wavAmp = 15.0;
float wavLength = 500.0;
float[] wavYAry;

void setup(){
  size(666,666);
  smooth();
  strokeWeight(4);   
  lookUp = new ArrayList();    
  for(int i = 0 ; i < shakeDist ; i ++){
    lookUp.add(new FrameShake(i,random(1,2),random(4,200)));
    } 
  wavYAry = new float[width];
}

void draw(){
  background(0);
  int x = (int)random(3);
  centX = int(width/2+int(mouseY*0.01));
  centY = int(height/2+int(mouseX*0.01));  
    for(int i = 0; i < lookUp.size();i++){
      FrameShake tempShake = (FrameShake)lookUp.get(i);
      tempShake.frameShake();
    }  
  CalcSine();
  xAry = int(wavYAry[x]);
  DrawEllipse();
}

void DrawEllipse() {
    noFill();
    stroke(colStroke); 
    ellipse(centX+(xAry/4), centY, width/1.4+xAry, height/1.4+xAry/2);    
    ellipse(centX, centY, width/1.4+xAry, height/1.4+xAry);       
    if(colStroke >= 112)       {
        colStroke=int(random(42,(mouseX/4)));
        strokeWeight(int(random(1,4)));        
        ellipse(centX, centY, width/1.4-xAry, height/1.4-xAry);        
        if(colStroke == 92) {
          line(0+(xAry), centY, width-xAry, centY);
            }
         }
    else {
    colStroke+=1;
    }
}

void CalcSine() { /* Daniel Shiffman - Sine Wave */
  wavTheta += 0.018;
  float x = wavTheta;
  for (int i = 0; i < wavYAry.length; i++) {
    wavYAry[i] = sin(x)*wavAmp;
    x+=TWO_PI/wavLength;
    }
}

class FrameShake { /* Kof - Sphere Deformations */
    float amp, speed;
    int id;
    FrameShake(int id, float _amp, float _speed) {
        amp = _amp;
        speed = _speed;
    }
    void frameShake() {
        translate(
                (0.5 - noise((id * 1.0 + frameCount) / speed, 0, 0)) * amp,
                (0.5 - noise(0, (id * 1.0 + frameCount) / speed, 0)) * amp);
    }
}
