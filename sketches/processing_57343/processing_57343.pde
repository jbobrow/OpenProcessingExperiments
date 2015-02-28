
class Flower {

  float stemWidth;
  float stemX;
  float stemY;
  float bloomX;
  float bloomY;
  float bloomRadius;
  int bloomPetals;
  float bloomPetalRadius;
  float stemHeight;
  color bloomColor;
  color stamenColor;
  color stemColor;

  Flower (float _stemWidth, 
  float _stemX, 
  float _stemY, 
  float _bloomX, 
  float _bloomY, 
  float _bloomRadius, 
  int _bloomPetals, 
  float _bloomPetalRadius, 
  float _stemHeight, 
  color _bloomColor,
  color _stamenColor,
  color _stemColor) 

  {
    stemWidth=_stemWidth;
    stemX=_stemX;
    stemY=_stemY;
    bloomX=_bloomX;
    bloomY=_bloomY;
    bloomRadius=_bloomRadius;
    bloomPetals=_bloomPetals;
    bloomPetalRadius=_bloomPetalRadius;
    stemHeight=_stemHeight;
    bloomColor=_bloomColor;
    stamenColor=_stamenColor;
    stemColor=_stemColor;
  }

  void drawFleur(float pct) {
    float workX=frameCount*0.012;
    float waveX=noise(workX,0)*60*sin(workX);
    setStemStyle();
    line(waveX, 0, 0, stemHeight*pct);
    setStemShadow();
    line(waveX, 0, stemWidth/2.0, stemHeight*pct);


    // do petals
    for (float i=0;i<360;i=i+(360.0/bloomPetals)) {
      setBloomStyle();
      pushMatrix();
      translate(waveX,0);
      rotate(radians(i));
      translate(bloomRadius*0.5, 0);
      float bPRpct=bloomPetalRadius*pct;
      bezier(0, 0, bPRpct, bPRpct*-0.65, bPRpct, bPRpct*0.65, 0, 0);
      setPetalEmphasisStyle();
      line(0,0,bPRpct*0.5,0);
      popMatrix();
    }
    setStamenShadow();
    float bRad=bloomRadius*1.75;
    ellipse(waveX, 0, bRad, bRad);
    setStamenStyle();    
    ellipse(waveX, 0, bRad-7, bRad-7);
  }

  void setStemStyle() {
    stroke(stemColor);
    strokeWeight(stemWidth);
    noFill();
  }

  void setStemShadow() {
    stroke(32,96);
    strokeWeight(stemWidth/2.0);
    noFill();
  }
  
  
    void setPetalEmphasisStyle() {
    stroke(232);
    strokeWeight(3);
    noFill();
  }

  void setBloomStyle() {
    stroke(32);
    strokeWeight(2);
    fill(bloomColor);
  }
  void setStamenStyle() {
    stroke(32);
    strokeWeight(2);
    fill(stamenColor);
  }  
  
  void setStamenShadow() {
    noStroke();
    fill(32,96);
  }    
}


