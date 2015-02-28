
int[][] intMap;
int cols, rows, phase;

void setup(){
  size(400,400);
  cols = round(height/20);
  rows = round(width/20);
  phase = 0;
  intMap = new int[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      intMap[i][j] = round(random(0,1));
   
    }
   
  }
  stroke(0);
  strokeWeight( 1 );
  strokeCap ( PROJECT );
  fill(120);

}

void draw(){
  background(255);
  phase ++;
  if(phase > cols ){
      phase -= cols;
     
  }
  updateMap();

}

void updateMap(){

  pushMatrix();
  scale( 1 + (random(0,0.3)-0.15) );
  
  beginShape();
  for (int i = cols-1; i > 0; i--) {
    for (int j = 0; j < rows; j++) {
      if(round(random(0,1)) == 0 ) vertex( random(j)*cols, random(i)*rows);
    }
  }
  endShape( QUADS );
  
  popMatrix();
}
