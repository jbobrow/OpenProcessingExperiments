


float posX = 0;
float posY = 0;

float tmpX = 0;
float tmpY = 0;
float tmpZ = 0;

float rdmR = 0;
float rdmG = 0;
float rdmB = 0;
float rdmA = 0;

int DTL = 0;

void setup(){

  size(500, 500, P3D);
  background(255);
  colorMode(RGB,255);
  frameRate(30);
  
}

void draw(){
  
  background(200,200,200,50);
  
  rdmR = random(0,255);
  rdmG = random(0,255);
  rdmB = random(0,255);
  rdmA = random(0,255);

  DTL = int(random(10,100));

  translate( width / 2, height / 3, 0);

  fill(rdmR,rdmG,rdmB,rdmA);
//  directionalLight(255, 255, 255, tmpX, tmpY, tmpZ);
  rotateX(mouseY * 0.05);
  rotateY(mouseX * 0.05);
  sphereDetail(DTL);
  sphere(int(random(50,100)));
    
    
  translate( 0, -100, 0);
  
  posX = random(1,5);
  posY = random(1,5);
  
  tmpX = random(10,20);
  tmpY = random(10,20);
  tmpZ = random(10,12);
  
  for(int i=1; i < 100; i++){
    for(int j=1; j < 100; j++){
      stroke(0);
      fill(rdmR,rdmG,rdmB,rdmA);
      translate( posX + j *-0.5, posY + i *0.5-10, 0);
      rotateY(0.2);
      box(tmpX,tmpY,tmpZ);

    }
  }
  
  
  for(int i=1; i < 100; i++){
    for(int j=1; j < 100; j++){
      stroke(0);
      fill(255-rdmR, 255-rdmG, 255-rdmB, 255-rdmA);
      translate( j*10, i*10, 0);
      rotateY(0.2);
      box(20-tmpX, 20-tmpY, 20-tmpZ);

    }
  }
  
  


}


