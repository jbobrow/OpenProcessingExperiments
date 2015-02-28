
//import processing.opengl.*;

float h,s,b;

float posActualX,posActualY;
float tamanho1,tamanho2,transparencia1,transparencia2;

int i,j,k;


void setup() { 
  //size(600,600,OPENGL);
  size(600,600,P3D); 
  colorMode(HSB,100);

  // posActualX=width/2;
  // posActualY=height/2;

}

void draw(){
  background(0,70); 
  translate(random(width),random(height)); 
  //translate(width/2,height/2);
  h = random(55);  
  s = random(255); 
  b = random(155); 
  //smooth();
  frameRate(100);
  noFill();
  //delay(5);
  posActualX=width/2;
  posActualY=height/2;


  //posActualX=posActualX + random(10);
  //posActualY=posActualY + random(5);
  for(j=0;j<90;j++){
      particula();
  }
}

void particula(){
  
  tamanho1=random(5);
  tamanho2=random(random(10));
  transparencia1=random(tamanho1);
  transparencia2=random(tamanho2);
  for(i=0;i<100;i++){
    strokeWeight(2);
    stroke(h,s,b,transparencia1);
    fill(h,s,b,transparencia2);
    for (int k = 0;k<30;k++) { 
    //rotate(PI/4);  
    rotate (radians (360/15));
    ellipse(posActualX,posActualY,tamanho1,tamanho2);
    }
  }
  posActualX=posActualX - random(10);
  posActualY=posActualY - random(5);
}






