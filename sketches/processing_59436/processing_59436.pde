


void boxFace(int sizeNum, int r, int g, int b) {
  
  rotateX(theta);
  
  rotateY(theta*2);
  
  fill(r,g,b);
  pushMatrix();
  translate(5*sizeNum,5*sizeNum,0);
  box(sizeNum);
  popMatrix();
  
  //eyes
  
  fill(0);
  pushMatrix();
  translate(5*sizeNum-(sizeNum/4),5*sizeNum-(sizeNum/4),(sizeNum/2));
  box((sizeNum/4));
  popMatrix();
  
  pushMatrix();
  translate(5*sizeNum+(sizeNum/4),5*sizeNum-(sizeNum/4),(sizeNum/2));
  box((sizeNum/4));
  popMatrix();
  
}

