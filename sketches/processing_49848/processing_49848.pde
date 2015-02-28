
float[] stress;
float[] strain;
float[][] relation;
float Young = 64/0.05;// pixels/elongation
float Poisson = 0.3;
float blockWidth = 64;
void setup(){
  size(400,300);
  stress = new float[3];
  strain = new float[3];
  relation = new float[3][3];
  relation[0][0] = 1/Young;
  relation[0][1] = -Poisson/Young;
  relation[0][2] = 0;
  relation[1][0] = -Poisson/Young;
  relation[1][1] = 1/Young;
  relation[1][2] = 0;
  relation[2][0] = 0;
  relation[2][1] = 0;
  relation[2][2] = 2*(1+Poisson)/Young;
}
void draw(){
  background(128+64);
  translate(width/2,height/2);
  if(mousePressed){
    stress[0] = mouseX-width/2;
    stress[1] = 0;
    stress[2] = 0;
  }else{
    stress[0] = 0;
    stress[1] = mouseY-height/2;
    stress[2] = mouseX-width/2;
  }
  strain = multM(relation,stress);
  float[][] strainM = new float[3][3];
  strainM[0][0] = strain[0]+1;
  strainM[1][1] = strain[1]+1;
  strainM[2][2] = 1;
  strainM[1][0] = strain[2]/2;
  strainM[0][1] = strain[2]/2;
  beginShape();
  float[] vert = {blockWidth,blockWidth,0};
  float[] vert2 = new float[2];
  vert2 = multM(strainM,vert);
  vertex(vert2[0],vert2[1]);
  vert[0] *= -1;
  vert2 = multM(strainM,vert);
  vertex(vert2[0],vert2[1]);
  vert[1] *= -1;
  vert2 = multM(strainM,vert);
  vertex(vert2[0],vert2[1]);
  vert[0] *= -1;
  vert2 = multM(strainM,vert);
  vertex(vert2[0],vert2[1]);
  endShape(CLOSE);
}
float[] multM(float[][] a,float[] b){
  float[] val = new float[3];
  for(int i=0;i<3;i++){
    val[i] = 0;
    for(int j=0;j<3;j++){
      val[i] += a[i][j]*b[j];
    }
  }
  return val;
}

