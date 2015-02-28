
Spot [][] mySpot = new Spot[30][30];  

void setup() {
  size(600, 600);
  smooth();

   for (int i=0; i<mySpot.length; i++) {
     for(int j=0; j<mySpot[i].length; j++) {
    mySpot [i][j] = new Spot(30*i, 30*j, 20);
    }
  }
}


void draw() {
  background(0);

    for (int i=0; i<mySpot.length; i++) {
    for(int j=0; j<mySpot[i].length; j++) {
       fill(200,mySpot[i][j].mouseDist,100);
      mySpot[i][j].update(mouseX, mouseY);
      mySpot[i][j].display();
    }
  }
}



class Spot {
  
  float x;
  float y;
  float mx;
  float my;
  float sz;
  float mouseDist;
  float mouseDistMapped;
  
  
    Spot(float xPos, float yPos, float spotSize){
    x = xPos;      
    y = yPos;      
    sz = spotSize; 
  }
  
  

  void update(float mousePosX, float mousePosY){
    mx = mousePosX;
    my = mousePosY;
    mouseDist = dist(x, y, mx, my);
    mouseDist = constrain(mouseDist, 0, 200);
    mouseDistMapped = map(mouseDist, 0, 200, 1.5, 0.3);
  }
  

  void display(){

    ellipse(x, y, sz * mouseDistMapped, sz * mouseDistMapped); 
  }  
}
