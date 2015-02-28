
Plane landscape;
int planeW = 600;
int planeH = 300;

void setup(){
  size(900, 400, P3D);
  smooth();
  //noFill();
  //stroke(255);
  noStroke();
  
  initLand();
}

void initLand(){
  landscape = new Plane(planeW, planeH, 40, 40);
  
  float xoff = 0;
  float yoff = 0;
  float zoff = 0;
  int nVertices = landscape.nVertices * 3;
  int row = 0;
  int col = 0;
  
  for (int i = 0; i < nVertices; i++)
  {
    if (i % 3 == 0){
      landscape.vertices[i  + 2] = map(noise(xoff, yoff, zoff), 0, 1, -120, 120);
      
      xoff += 0.1;
      
      if (++col > landscape.segmentsW){
        col = 0;
        row++;
        xoff = 0;
        yoff += 0.1;
      }
    }
    
  }
}

void drawLand(){
  int index;
  float z;
  float[] vertices = landscape.vertices;
  int nIndices = landscape.nIndices;
  int[] indices = landscape.indices;
  float colorRatio;
    
    beginShape(QUADS);
    for (int i = 0; i < nIndices; i++){
      index = indices[i] * 3;
      z = vertices[index + 2];
      colorRatio = map(z, -120, 120, 0, 1);
      
      fill(29 + 220 * colorRatio, 14 + 56 * colorRatio, 241 - 229 * colorRatio);
      
      vertex(vertices[index], vertices[index + 1], z);
    }
    endShape();
}

void keyReleased(){
  if (keyCode == ENTER){
    String fileName = "capture" + "-" + millis() + "-" + second() + "-" + minute() + "-" + hour() + "-" + day() + "-" + month() + "-" + year() + ".png";
    save(fileName);
  }
}

void draw(){
  
  background(0);
  lights();
  
  pushMatrix();
  
  translate((width - planeW) * .5, (height - planeH) * .5 + 70, -planeH * .5);
  rotateX(radians(45));
  //scale(.8);
  
  //landscape.display();
  drawLand();
  
  popMatrix();
}
class Plane{
  int segmentsW = 1, segmentsH = 1;
  float myWidth = 100, myHeight = 100;
  float quadW, quadH;
  int nVertices;
  float[] vertices;
  int[] indices;
  int nIndices;
  
  Plane(float myWidth, float myHeight, int segmentsW, int segmentsH){
    this.myWidth = myWidth;
    this.myHeight = myHeight;
    this.segmentsW = segmentsW;
    this.segmentsH = segmentsH;
    
    init();
  }
  
  Plane(){
    //empty constructor
    init();
  }
  
  void init(){
    nVertices = (segmentsW + 1) * (segmentsH + 1);
    vertices = new float[nVertices * 3];
    quadW = myWidth / segmentsW;
    quadH = myHeight / segmentsH;
    nIndices = segmentsW * segmentsH * 4;
    indices = new int[nIndices];
    
    int numIndices = 0;
    int numVertices = 0;
    int baseIndices;
    int tw = segmentsW + 1;
    
    for (int yi = 0; yi <= segmentsH; yi++)
    {
      for (int xi = 0; xi <= segmentsW; xi++)
      {
        vertices[numVertices++] = xi * quadW;
        vertices[numVertices++] = yi * quadH;
        vertices[numVertices++] = 0;
        
        if (xi != segmentsW && yi != segmentsH){
          baseIndices = xi + yi * tw;
          indices[numIndices++] = baseIndices;
          indices[numIndices++] = baseIndices + 1;
          indices[numIndices++] = baseIndices + tw + 1;
          indices[numIndices++] = baseIndices + tw;
        }
      }
    }
  }
  
  void display(){
    int index;
    
    beginShape(QUADS);
    for (int i = 0; i < nIndices; i++){
      index = indices[i] * 3;
      
      vertex(vertices[index], vertices[index + 1], vertices[index + 2]);
    }
    endShape(CLOSE);
  }
}


