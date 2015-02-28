
void setup() {
  size(400, 400, P3D);
  lights();
  smooth();
}
/*rotateY();
 rotateX();*/

//beginShape(TRIANGLE_STRIP);
//fill(20,50,150,90);
//int x, y, z;
//  for (x=20; x<280; x+=5){
//     for(y=70; y<height; y+=10){
//        for(z=-10; z<-180; z-=20){
//          vertex(x,y,z);
//        }
//     }
//  }
//  endShape();

void draw() {
  background(220);

  pushMatrix();
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, 0, 0.8*PI));
  rotateX(map(mouseY, 0, width, 0, 0.8*PI));


  beginShape(TRIANGLE_STRIP);
  vertex(20, 10, 0); //tip
  vertex(10, 40, 0); //lower left
  vertex(30, 40, 0); //lower right

  vertex(20, 10, -40); 
  vertex(10, 40, -40); 
  vertex(30, 40, -40); 

  vertex(20, 10, -80); 
  vertex(10, 40, -80); 
  vertex(30, 40, -80); 

  vertex(20, 10, -120); 
  vertex(10, 40, -120); 
  vertex(30, 40, -120); 

  endShape();

  //////////////////////////////////////////
  beginShape(TRIANGLE_STRIP);
  fill(105, 120, 40, 200);
  vertex(80, 10, -40); 
  vertex(70, 40, -40); 
  vertex(90, 40, -40); 

  vertex(80, 10, -10); 
  vertex(70, 40, -10); 
  vertex(90, 40, -10); 

  vertex(80, 10, 20); 
  vertex(70, 40, 20); 
  vertex(90, 40, 20); 

  endShape();

  ///////////////////////////////////////
  beginShape(QUAD_STRIP);
  fill(190, 59, 30, 120);
  int x = 100;
  int y = 150;
  int z = 0;
  vertex(x, x, z);
  vertex(x, y, z);
  vertex(y, x, z);
  vertex(y, y, z);
  x+=25;
  y+=25;
  z-=20;
  vertex(x, x, z);
  vertex(x, y, z);
  vertex(y, x, z);
  vertex(y, y, z);
  x+=25;
  y+=25;
  z-=20;
  vertex(x, x, z);
  vertex(x, y, z);
  vertex(y, x, z);
  vertex(y, y, z);
  x+=25;
  y+=25;
  z-=20;
  vertex(x, x, z);
  vertex(x, y, z);
  vertex(y, x, z);
  vertex(y, y, z);
  x+=25;
  y+=25;
  z-=20;
  vertex(x, x, z);
  vertex(x, y, z);
  vertex(y, x, z);
  vertex(y, y, z);

  endShape();


  popMatrix();
}
