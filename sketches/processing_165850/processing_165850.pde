
// inspired by Vector Field Demo
// by Jonathan Bobrow
VectorField vField;
 int unitPerSide=80;
 int sizeCanvas=512;
 float counter=0;
 float convolveFactor=1000;
void setup(){
  size(sizeCanvas,sizeCanvas);
  smooth();
  vField = new VectorField(unitPerSide,unitPerSide );
  vField.drawVectorField();
}
 
void draw(){
//  background(0);
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
    float coherence =0.1;
      VectorField(int x, int y){
      gridSize = new PVector(x,y);
      field = new PVector[x][y];
      pStep = 0.f;
      pStepSize = .01;
     updateField();
    }
  void updateField(){
      counter=counter+ 0.0005; //sqrt(convolveFactor/10000)
      pStep+=pStepSize;
   for(int i=0; i<gridSize.x; i++){
      for(int j=0; j<gridSize.y; j++){
         //float noisy= noise(i*coherence + pStep, j*coherence + pStep); 
        float spacefun=i * (gridSize.x-i) * j *(gridSize.y-j);
          float theta = (spacefun/convolveFactor) * sin(counter);// * (0.8 + noisy/5);
          //100*cos(i*j/10)*sin(counter);
          //((cos(i/1)*sin(j/1)))*100 *sin(counter) ;
          //2*PI**noise(i*coherence + pStep, j*coherence + pStep);
          float ampx =  sin(theta);
          float ampy =  cos(theta);
          field[i][j] = new PVector(ampx*scaling,ampy*scaling);
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
public void keyPressed() {
    if(keyCode == UP) { convolveFactor=convolveFactor*0.8 ; } 
    if(keyCode == DOWN) { convolveFactor=convolveFactor/0.8;   } 

}
   

