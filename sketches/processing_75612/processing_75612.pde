
void setup(){
  size(440, 440, P3D);
  noStroke();
}

void coloredCube(int i,int j,int n, float alpha){
  pushMatrix();
    scale(.5, .5, .5);
    beginShape(QUADS);
      fill(i, j, n, alpha); vertex(1, -1, -1); vertex(1, -1, 1); vertex(1, 1, 1); vertex(1, 1, -1); 
      fill(i, j, n, alpha); vertex(1, 1, 1); vertex(-1, 1, 1); vertex(-1, 1, -1); vertex(1, 1, -1); 
      fill(i, j, n, alpha); vertex(-1, 1, 1); vertex(1, 1, 1); vertex(1, -1, 1); vertex(-1, -1, 1); 
      fill(i, j, n, alpha); vertex(-1, -1, -1); vertex(-1, -1, 1); vertex( 1, -1, 1); vertex( 1, -1, -1); 
      fill(i, j, n, alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
      fill(i, j, n, alpha); vertex(1, 1, -1); vertex(-1, 1, -1); vertex(-1, -1, -1); vertex(1, -1, -1);
    endShape();
  popMatrix();
}

void draw(){
  background(255);
  pushMatrix();
    translate(width/2, height/2, 0);
    rotateX(map(mouseY, 0, height, PI, -PI));
    rotateY(map(mouseX, 0, width, -PI, PI));
    scale(10, 10, 10);
    translate(-12, -12,-12);
    int i=0; int j=0; int n=0;
    
    for(n=0;n<11;n++){
      translate(0,0,2);
      pushMatrix();
      for(j=0;j<11;j++){
        translate(0,2,0);
        pushMatrix();
        for(i=0;i<11;i++){
          translate(2, 0,0);
          coloredCube(255/11*i,255/11*j,255/11*n,255);
        }
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
}


