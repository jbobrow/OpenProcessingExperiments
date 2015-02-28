
float [][] distancias;
float lasDistancias;


void setup(){
  size(600, 600);
}

void draw(){
  background(0);
  lasDistancias = dist(width/16, height/16, width/2, height/2);
  distancias = new float[width][height];
  for(int i=0; i<height; i++) {
    for(int j=0; j<width; j++) {
      float dist = dist(width/2, height/2, j, i);
      distancias[j][i] = dist/lasDistancias*1000;
    }
  }
  for(int i=0; i<height; i+=1) {
    for(int j=0; j<width; j+=1) {
      stroke(distancias[j][i]);
      point(j++,i);
    }
  }
}

