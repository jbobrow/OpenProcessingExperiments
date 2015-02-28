
void setup(){
  size(600,600);
  background(255);
  stroke(0);
  for(int i=1;i<10;i++){
    for(int j=1; j<10;j++){
   
      float s=random(0.01,0.5);
      float c1=random(0,255);
      float c2=random(0,255);
      float c3=random(0,255);
      lamp(i*60-10,j*60-10,s,c1,c2,c3);
    }
  }
}


void lamp(float x, float y, float s, float c1, float c2, float c3){
  pushMatrix();
  translate(x,y);
  
  fill(c1,c2,c3);
  beginShape();
  vertex(41*s,1*s);
  vertex(41*s,6*s);
  bezierVertex(21*s,11*s,21*s,14*s,11*s,28*s);
  bezierVertex(1*s,20*s,1*s,20*s,1*s,6*s);
  bezierVertex(26*s,13*s,21*s,1*s,41*s,1*s);
  endShape();

  beginShape();
  vertex(37*s,8*s);
  bezierVertex(89*s,194*s,89*s,201*s,89*s,219*s);
  vertex(82*s,222*s);
  bezierVertex(82*s,197*s,83*s,191*s,34*s,9*s);
  endShape(CLOSE);
  
  popMatrix();
}

