



Sine sine1;
Sine sine2;
Sine sine3;
Sine sine4;

void setup() {
  size(400,400);

  //Sine(no. of divisions, Speed, Max amplitude, Start amplitude, Gradient color ['R', 'B', 'G' or 'W'])

  sine1 = new Sine(100, 2, height/2-20, 0, 'R');  
  sine2 = new Sine(100, 2, height/2-20, (height/2)/3, 'G');          
  sine3 = new Sine(100, 2, height/2-20, height/3, 'B');  
  sine4 = new Sine(100, 2, height/2-20, height/2, 'W');  
}                                          

void draw() {
  noFill();
  background(0);
  strokeWeight(5);
  sine1.display();
  sine2.display();
  sine3.display();
  sine4.display();
  sine1.update();
  sine2.update();
  sine3.update();
  sine4.update();

}

class Sine {

  int nXPos;
  float fYPos;
  int nDivisions;
  float nSpeed;
  float fAmplitude;
  float gray;
  float fAmplitudeMax;
  boolean check;
  char cGradientColor;
  float fDistance;


  Sine(int nDivisions_,float nSpeed_, float fAmplitudeMax_, float fAmplitudeStart_, char cGradientColor_) {

    nDivisions = nDivisions_;
    nSpeed = nSpeed_;
    fAmplitudeMax = fAmplitudeMax_;
    check = true;
    fAmplitude = fAmplitudeStart_;
    cGradientColor = cGradientColor_;
    fDistance = width/nDivisions;

  }

  void setColor() {

    float fRGBValue = abs((255*(1-(1-this.fAmplitude/(this.fAmplitudeMax)))));

    switch(cGradientColor) {
    case 'R':
      stroke(fRGBValue,0,0);
      break;
    case 'G':
      stroke(0,fRGBValue,0);
      break;
    case 'B':
      stroke(0,0,fRGBValue);
      break;
    case 'W':
      stroke(fRGBValue); 
      break;
    }
  }

  void display() {
    setColor();
    beginShape(); 
    for (int i = 0; i <= width; i += fDistance) {
      nXPos = i;
      fYPos = this.fAmplitude*sin(nXPos*PI/(width/2))+height/2;
      vertex(nXPos,fYPos);
    }
    endShape();
  }

  void update() {
    if((fAmplitude >= -fAmplitudeMax) && (check)) {
      fAmplitude -= nSpeed;
    } 
    else {
      fAmplitude += nSpeed;
      check = false;
      if (fAmplitude >= fAmplitudeMax) {
        check = true;
      }
    }
  }
}















