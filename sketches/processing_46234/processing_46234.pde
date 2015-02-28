
block x1;
float z;
float ang;
int m;
block[][] grid;

void setup(){
  
  PFont font;
  m = 9;

  font = loadFont("OCRAExtended-24.vlw"); 
  textFont(font); 
  size(500,500,P3D);
  background(0);
  lights();  
  
  grid = new block[m][m];
  for (int i=0;i<m;i++) {
    for (int j=0;j<m;j++) {
      grid[i][j] = new block(50+i*50,50+j*50);
    }
  }
};

void draw() {
  background(0);
  
 pushMatrix();
 fill(#333333);
 translate(250,250,-55);
 box(1000,1000,5);
 popMatrix();
 

  
  //z = ((sin(mouseY / (50*PI)) + sin(mouseX / (50*PI)))*50)-25;
  z = cos((dist(mouseX,mouseY,250,250)/(50*PI)))*50;
  
//  x1.setX(mouseX);
//  x1.setY(mouseY);
//  x1.setZ(z);
//  x1.update();

  for (int i=0;i<m;i++) {
      for (int j=0;j<m;j++) {
        grid[i][j].update();
      }
    }
    
 fill(#660000);
 //text(z, 250, 250,50); 
  
  
  
}

//void mousePressed() {
//  if (x1.mouseOnMe()) {
//    x1.setZ(x1.getZ()+10);
//  }
//  
//}



