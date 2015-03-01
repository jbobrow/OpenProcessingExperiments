
void setup(){
  size(900,900);
}

void draw(){
  background(255);
  
  float p1[]={-mouseY,0,1};
  float p2[]={0,mouseY,1};
  float p3[]={mouseY,0,1};
  
  float matrix[][]=new float [3][3];
  for(int r=0; r<3; r++){
    for(int c =0; c<3; c++){
    if(r==c) matrix[r][c] = 1;
    else matrix[r][c] = 0;
    }
  }
  
  matrix[0][2] = mouseX;
  matrix[1][2] = mouseY;
  
  float new_p1[] = {0,0,0};
  float new_p2[] = {0,0,0};
  float new_p3[] = {0,0,0};
  for (int r=0; r<3; r++){
    for (int c=0;c<3;c++){
      new_p1[r] += matrix[r][c]*p1[c];
      new_p2[r]+=matrix[r][c]*p2[c];
      new_p3[r] += matrix[r][c]*p3[c];
    }
  }
  
  beginShape();
  vertex(new_p1[0], new_p1[1]);
  vertex(new_p2[0], new_p2[1]);
  vertex(new_p3[0], new_p3[1]);
  endShape(CLOSE);
}
