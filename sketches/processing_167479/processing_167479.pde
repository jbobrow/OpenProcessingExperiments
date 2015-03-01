
// code architecture inspired  by Jonathan Bobrow
VectorField vField;
 int unitPerSide=128;
 int sizeCanvas=512;
 float counter=0;
 float convolveFactor;

void setup(){
  size(sizeCanvas,sizeCanvas);
  smooth();
  vField = new VectorField(unitPerSide,unitPerSide );
  vField.drawVectorField();
}
  
void draw(){
  fill(0,100);
  rect(0,0,width,height);                      // fade the background
  vField.updateField();
  vField.drawVectorField();
}
class VectorField{
    PVector[][] field;
    PVector gridSize;
    float pStep;
    float pStepSize;
    float scaling= 2*sizeCanvas/unitPerSide;
    float decoherence =0.00001;
      VectorField(int x, int y){
      gridSize = new PVector(x,y);
      field = new PVector[x][y];
      pStep = 0.f;
      pStepSize = .01;
     updateField();
    }
  void updateField(){
      //counter=counter+ 0.0005; //sqrt(convolveFactor/10000)
      //pStep+=pStepSize;
   for(int i=0; i<gridSize.x; i++){
      for(int j=0; j<gridSize.y; j++){
        // float noisy= noise(i*decoherence + pStep, j*decoherence + pStep);
        float spacefun=sqrt (i * (gridSize.x-i) +  j *(gridSize.y-j) );
          float theta = (spacefun*  (convolveFactor)) ; //*noisy;// * sin(counter);// * (0.8 + noisy/5);
          float ampx =  sin(theta);
          field[i][j] = new PVector(ampx*scaling,ampx*scaling);
      }
    }
  }
    void drawVectorField(){
          for(int i=0; i<gridSize.x; i++){
            for(int j=0; j<gridSize.y; j++){
              //pushMatrix();
              //translate((i+.5)*width/gridSize.x, (j+.5)*height/gridSize.y); //
              float myx=(i+.5)*width/gridSize.x;
              float myy=(j+.5)*height/gridSize.y;
                noStroke(); //(255);
                fill(100*field[i][j].x, 50*field[i][j].y, 100*field[i][j].y, 100);
                strokeWeight(.1);
                ellipse(myx, myy, field[i][j].x, field[i][j].y); //velocityAtLocation(i,j).x , velocityAtLocation(i,j).y
             // popMatrix();
            }
          }
       }
}
public void mouseDragged() {
    if(keyCode == UP) { convolveFactor=convolveFactor*0.8 ; }
    if(keyCode == DOWN) { convolveFactor=convolveFactor/0.8;   }
          float   limitMouse=  sq(sq(height) + sq(width));
              convolveFactor= map( sq(sq(mouseX) + sq(mouseY)) ,1, limitMouse, 0.00001, 100000); // map( log(mouseY),1,log(height), 300, 0.0000001);
}


