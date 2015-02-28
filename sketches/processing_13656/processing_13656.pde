
class Bit{
  float[] loc;
  float[] ang;
  color col;
  float[][] activeAxons;
  int activeCount;
  
  Bit(float[] initLoc, color initCol){
    this.loc = initLoc;
    this.ang = new float[]{0,0,0};
  }
  
  void draw(){
    fill(col);
    pushMatrix();
    translate(loc[0],loc[1],loc[2]);

  }
}

class Eyeball extends Bit{
  float radius;
  float[][] dendrites;
  float[][] axons;
  float[][] ends;
  int axonCount;
  //float[][] activeAxons;
  //int activeCount;
  
  Eyeball(float[] initLoc, color initCol, float initRadius, int initAxonCount, float[][] retinaLoc, float[][] matrixLocA, float[][] matrixLocB){
    super(initLoc, initCol);
    this.radius = initRadius;
    this.col = initCol;
    this.axons = matrixLocA;
    this.ends = matrixLocB;
    this.dendrites = retinaLoc;
    this.axonCount = initAxonCount;
  }
  
  void draw(){
    super.draw();
    for(int i = 0; i < this.axonCount; i++){
        stroke(0);
        for(int j = 0; j < this.activeCount; j++){
          //print("i: "+i+", activeAxons[j][0]: "+activeAxons[j][0]);
          if(i == activeAxons[j][0]){
            //print(" <- this\n");
            stroke(map(activeAxons[j][1],0,0.5,0,255));
            break;
            
          }
          
        }
      //}
      line(dendrites[i][0],dendrites[i][1],axons[i][0],axons[i][1]);
      line(axons[i][0],axons[i][1],ends[i][0],ends[i][1]);
    }
    rotateX(ang[0]);
    rotateY(ang[1]);
    rotateZ(ang[2]);
    stroke(0);
    fill(0);
    translate(0,-radius,0);
    ellipse(0,0,this.radius/5,this.radius/5);
    translate(0,radius,0);
    fill(255);
    ellipse(0,0,radius*2,radius*2);

    popMatrix();
  }
}

/*class Matrix extends Bit{
  int colCount;
  float[][] vert;//ical
  float[][] hori;//zontal
  
  Matrix(float[] initLoc, int initCols, float[][] h, float[][] v){
    super(initLoc, color(0));
    this.colCount = initCols;
    this.vert = v;
    this.hori = h;
  }
  
  void draw(){
    super.draw();
    for(int i = 0; i < this.colCount; i++){
      line(vert[i][0]-100,vert[i][1]+250,vert[i][0]+390,vert[i][1]+250);
      line(hori[i][0]+250,hori[i][1]-100,hori[i][0]+250,hori[i][1]+390);
    }
    popMatrix();
  }
}*/

