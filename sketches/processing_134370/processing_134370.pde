

float distance = 30;
int dState = 0;
oriBox[][][] cubes = new oriBox[10][10][10];

void setup() {
  size(1280, 720, P3D);
  noStroke();
  background(50);
  
  for (int k = 0; k < 10; k++){
    for (int j = 0; j < 10; j++){
      for (int i = 0; i < 10; i++) {
        cubes[i][j][k] = new oriBox();
      }
    }
  }  
}

void draw() {
  
  //-----set basic condition of stage 
  lights();
  //background(50);
  smooth();
  
  //-----move obeject to center of stage
  translate(width/2, height/2);
  
  //-----rotate object with mouse
  rotateX(radians(-mouseY+(height/2)));
  rotateY(radians(mouseX-(width/2)));
  
  //-----change dState
  if(distance < 30){
    dState = 0;
  }else if(distance > 100){
    dState =1;
  }
  
  //-----change distance
  if(dState == 0){
    distance = distance + 0.05;
  }else if(dState ==1){
    distance = distance - 0.05;
  }
  
  //-----draw objects
  pushMatrix();
  translate(-(distance*10)/2, -(distance*10)/2, -(distance*10)/2);
  for (int k = 0; k < 10; k++){
    for (int j = 0; j < 10; j++){
      for (int i = 0; i < 10; i++) {
        pushMatrix();
        translate(i*distance, j*distance, k*distance);
        fill(i*25, j*25, k*25);
        cubes[i][j][k].draw();
        popMatrix();
      }
    }
  }
  popMatrix();
  
  
}

