
class Ring{
  
  float x;
  float y;
  float len;
  float spacing;
  float opa;
  float opaChange;
  float eSizeone;
  float eSizetwo;
  
  Ring(float tempX, float tempY, float tempLen, float tempSpacing, float tempOpa, float tempOpaChange, float tempEsizeone, float tempEsizetwo){
    x = tempX;
    y = tempY;
    len = tempLen;
    spacing = tempSpacing;
    opa = tempOpa;
    opaChange = tempOpaChange;
    eSizeone = tempEsizeone;
    eSizetwo = tempEsizetwo;
  }
  
  void display(){
  noFill();
  stroke(opa,opa,opa,opa);
  ellipseMode(CENTER);
  ellipse(x,y,eSizeone,eSizetwo);
}

  void move(){
    x = x + spacing;
  opa = opa - opaChange;
  if((opa > 255) || (opa < 0))
  opaChange *= -1;
  
  if((x > width) || (x < 0))
  spacing *= -1;
  
  if((y > height) || (y < 0))
  spacing *= -1;
  }
}

