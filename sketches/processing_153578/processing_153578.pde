
// Vector Field Demo
// by Jonathan Bobrow

VectorField vField;

void setup(){
  size(600,600);
  smooth();
  vField = new VectorField(30,30);
  vField.drawVectorField();
}

void draw(){
//  background(0);
  fill(0,10);
  rect(0,0,width,height);                      // fade the background
  
  vField.updateField();
  vField.drawVectorField();
}

class VectorField{
 
  PVector[][] field; 
  PVector gridSize;
  float pStep;
  float pStepSize;
  
  VectorField(int x, int y){
    gridSize = new PVector(x,y);
    field = new PVector[x][y];
    pStep = 0.f;
    pStepSize = .01;
    
    createField();
  }
  
  void createField(){
    for(int i=0; i<gridSize.x; i++){
      for(int j=0; j<gridSize.y; j++){
        float theta = 2*PI*noise(i*.1, j*.1);
//        println("angle in radians: "+theta);
        float amp = tan(theta);
        field[i][j] = new PVector(amp*0.01,amp*0.01);
      }
    }
  }
  
  void updateField(){
    
    pStep+=pStepSize;
    
    for(int i=0; i<gridSize.x; i++){
      for(int j=0; j<gridSize.y; j++){
        float theta = 2*PI*noise(i*.1 + pStep, j*.1 + pStep);
        float amp = 10*tan(theta);
        field[i][j] = new PVector(amp*1,amp*1);
      }
    }
  }
  
  void setStepSize(float s){
    pStepSize = s;
  }
  
  PVector velocityAtLocation(float x, float y){
    PVector velocity = new PVector();
    int locX = int(x*gridSize.x/width);
    int locY = int(y*gridSize.y/height);
    velocity = field[locX][locY];
    return velocity;
  }
  
  void drawVectorField(){
    for(int i=0; i<gridSize.x; i++){
      for(int j=0; j<gridSize.y; j++){
        pushMatrix();
          translate((i+.5)*width/gridSize.x, (j+.5)*height/gridSize.y);
          stroke(255);
          strokeWeight(.1);
          line(0, 0, field[i][j].x, field[i][j].y);
        popMatrix();
      }
    }
  }
}
