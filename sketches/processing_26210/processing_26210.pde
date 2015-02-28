
int ancho=2*screen.width/3;
int alto=2*screen.height/3;
punto3D [] p3D;
void setup() {
  size (ancho, alto, P3D);
  p3D = new punto3D [4];
  p3D[0]= new punto3D (4,3,3);
  p3D[1]= new punto3D (5,4,-3);
  p3D[2]= new punto3D (2,0,3);
  p3D[3]= new punto3D (1,4,5);
}

float XX=-500;

void draw() {
  background(200,200,200);
  
  pushMatrix();
  rotateX(PI);
  
  fill (255,0,0);
  rect(XX,0,20,20);
  fill (0,255,0);
  rect(0,XX,20,20);
  XX=XX+1;

  camera(mouseX+30.0, mouseY, mouseX+220.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
         
  stroke (255,0,0);
  line(-500,0,0,500,0,0);
  stroke (0,255,0);
  line(0,-500,0,0,500,0);
  stroke (0,0,255);
  line(0,0,-500,0,0,500);
  //-------------------- Dibujar Coordenadas iniciales --------------------
  
  int col=200;
  
  for(int b=0;b<p3D.length;b++)
  {
    stroke (255,col,col);
    strokeWeight(5);
    point(p3D[b].x*20, p3D[b].y*20, p3D[b].z*20);
    col=col-50;
  }
  
  for(int b=0;b<p3D.length;b++)
  {
    stroke(0);
    strokeWeight(1);
    line(0, 0, 0, p3D[b].x*20, p3D[b].y*20, p3D[b].z*20);
  }
  popMatrix();
}


