
ArrayList boxCollection;


void setup() {
  size(600, 600, P3D); //OPENGL is not functional on mac so we use P3D
  
  boxCollection = new ArrayList();
}

void draw() {
  background(255);
  
  Box myBox = new Box(width/2, height/2);
  boxCollection.add(myBox);
  
  for(int j = 0; j < boxCollection.size(); j+=15) {
    Box mb = (Box) boxCollection.get(j);
    mb.run();
  }
}
 




class Box {
  float inc = 0.0;
  int i = 0;
  float size = 0;
  float x = 0;
  float y = 0;


  Box(float _x, float _y){

    x = _x;
    y = _y;
}




void run() {
  display();
}

void display() {
  inc += 0.05;
  size+=0.5;
  i++;
  pushMatrix();
  translate(width/2, height/2);
  rotateZ(i*0.01);
  noFill(); 
  stroke(215, 150, 150);
  strokeWeight(.75);
  box(size);
  popMatrix();
}
}


