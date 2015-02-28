

float roda=0;
float anda=100;

PVector vertices[];
PVector soma[];
int pts = 400; 


int direcao = -1;

void setup(){
  size  (800,600, P3D);
  frameRate(12);
  
 stroke (255,random(100)+100,0,50);
 noFill();
  
  background(0);
  smooth();
  
  vertices = new PVector[pts+1];
    soma = new PVector[pts+1];

  for(int i=0; i<=pts; i++){
    vertices[i] = new PVector();
    vertices[i].x = random(400)-200;
  vertices[i].y = random(400)-200;
vertices[i].z = random(400)-200;
  }
  
    for(int i=0; i<=pts; i++){
    soma[i] = new PVector();
    soma[i].x = random(4)-2;
  soma[i].y = random(4)-2;
soma[i].z = random(4)-2;
  }
  
  
}



void draw(){
  background(0);  
  
 camera(0, 0, anda, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         1.0, 0.0, 0.0); // upX, upY, upZ
         rotateX (roda);
  
  beginShape(QUAD_STRIP);
  for(int i=0; i<=pts; i++){
    vertices[i].x+=soma[i].x;
    if(vertices[i].x>200){
      soma[i].x=soma[i].x*-1;
    }
    if(vertices[i].x<-200){
      soma[i].x=soma[i].x*-1;
    }
  
    vertices[i].y+=soma[i].y;
    if(vertices[i].y>200){
      soma[i].y=soma[i].y*-1;
    }
    if(vertices[i].y<-200){
      soma[i].y=soma[i].y*-1;
    }
 
    vertices[i].z+=soma[i].z;
    if(vertices[i].z>200){
      soma[i].z=soma[i].z*-1;
    }
    if(vertices[i].z<-200){
      soma[i].z=soma[i].z*-1;
    }
    stroke(255,random(150)+50,0,50);
    vertex(vertices[i].x, vertices[i].y, vertices[i].z);
  }
  endShape();


  if (anda>250){
    anda+=((600-anda)/10)*direcao;
  }
  if (anda<250){
    anda+=((10-anda)/10)*-direcao;
  }

  roda+=PI/1000;
  
  if (anda>598){
    direcao=-1;
  } 
  if (anda<11){
    direcao=1;
  }
}

