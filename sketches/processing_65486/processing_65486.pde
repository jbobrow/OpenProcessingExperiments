
class Chuxel{
  
  //percieved constants
  float  Pr = .299;
  float  Pg = .587;
  float  Pb = .114;
  
  float x, y, w, h, r;
  int num;
  int value;
  color c;
  
  PVector[] cPoints;
  
  Chuxel(){
    x = 0;
    y = 0;
    r = 0;
    num = 20;
    value = 100;
    cPoints = new PVector[4];   
  }
  
  void setPosition(float _x, float _y){
    x = _x;
    y = _y;
  }
  
  void setRotation(float _r){
    r = _r;
  }
  
  void setNum(int _num){
    num = _num;
  }
  
  void setValue(int _value){
    value = _value;
  }
  
  void setColor(color _c){
    c = _c;
    setValue((int)brightness(c));
  }
  
  void setSize(float _w, float _h){
    w = _w;
    h = _h;
  }
  
  void create(){
    
  }
  
  void display(){
    pushMatrix();
      translate(x,y);
      rotate(radians(r));
      drawChuxel();
    popMatrix();
  }
  
  void drawChuxel(){
    
    initPoints();
    
    for(int i=0; i<num; i++){
      noStroke();
      int R, G, B;
      int percievedBrightness = -255;
      R = G = B = -255;
      while( abs(R - red(c)) > variance || abs(G - green(c)) > variance || abs(B - blue(c)) > variance ){ //||abs(percievedBrightness - value) > variance ||){
        R = (int)random(255);
        G = (int)random(255);
        B = (int)random(255);
        percievedBrightness=int(sqrt(R*R*Pr+G*G*Pg+B*B*Pb));
      }
      //println(percievedBrightness);
      fill(R, G, B);
      if(i == 0)
        rect(-w/2, -h/2,  w * (float)(num-i)/num, h * (float)(num-i)/num);
      else{
        //simple shape ellipse
        //ellipse( 0, 0, w * (float)(num-i)/num, h * (float)(num-i)/num);
        
        //more complex shape than an ellipse
        beginShape();
          float f = random((float)(num-i-1)/num, (float)(num-i)/num);
          curveVertex(f * cPoints[3].x, f * cPoints[3].y);
          for(int j=0; j<cPoints.length; j++){
            f = random((float)(num-i-1)/num, (float)(num-i)/num);
            curveVertex(f * cPoints[j].x, f * cPoints[j].y);
          }
          f = random((float)(num-i-1)/num, (float)(num-i)/num);
          curveVertex(f * cPoints[0].x, f * cPoints[0].y);
        endShape(CLOSE);
      }
    }
  }
  
  void initPoints(){
    for(int i=0; i<cPoints.length; i++){
      switch(i){
        case 0:  cPoints[i] = new PVector(-w/2, -h/2);  break;
        case 1:  cPoints[i] = new PVector(w/2, -h/2);  break;
        case 2:  cPoints[i] = new PVector(w/2, h/2);  break;
        case 3:  cPoints[i] = new PVector(-w/2, h/2);  break;
      }
    }
  }
}

