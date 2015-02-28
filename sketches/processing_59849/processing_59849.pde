
import processing.opengl.*;
float x,y,z,angle;

int trailNum = 20;
 
int prevx[];
int prevy[];
int prevz[];
int preva[];
int mode = 1;
int snow;
int w;
int p;
int directionx;
int directiony;

void setup(){
  size(1000,750,OPENGL);
  background(227,254,255);
  
  snow=20;
  w=300;
  p=100;
  directionx=5;
  directiony=5;
  
  x=random(50);
  y=0;
  angle=0;
  smooth();
  
  
    prevx = new int[trailNum];
  prevy = new int[trailNum];
  prevz = new int[trailNum];
  preva = new int[trailNum];
  
}

void draw(){
  

  //background(178,176,176);
  //emissive(30,26,90);
  //lights();
 pushMatrix();
rotateY(map(mouseX,0,width,0,PI*1));
rotateX(map(mouseY,0,height,0,PI*1));
//drawShape();
popMatrix();

for(int i = 1;i < trailNum; i++){
    prevx[i-1] = prevx[i];
    prevy[i-1] = prevy[i];
    prevz[i] = prevx[i];
    preva[i] = prevz[i-1];
//}   
//}

//Void drawShape(){
 
 x = sin(radians(angle)) * 100 + width/20;
 y = cos(radians(angle)) * 100 + height/20;
 z = sin(radians(angle)) + width/20; 
  
 
  
  prevx[trailNum-1] = mouseX;
  prevy[trailNum-1] = mouseY;
  prevz[trailNum-1] = mouseX;
  preva[trailNum-1] = mouseY;
   pushMatrix();
 translate(x,700,y);
 rotateY(tan(z));
 rotateX(z);
  //for(int i = 1; i< trailNum; i++){
   stroke(180);
   fill(252,219,255);
    quad(preva[i],(prevz[i]),prevx[i],(prevy[i]),(preva[i]),prevy[i],cos(preva[i]),prevz[i]);
    fill(191,255,220);
    quad(300,preva[i],101,40,preva[i],prevz[i],(prevy[i]),(prevz[i]));
    fill(201,250,255);
    quad(prevz[i],prevx[i],prevy[i],500,preva[i],prevz[i],300,300);
    fill(251,255,222);
    quad(preva[i],prevx[i],prevy[i],preva[i],prevz[i],prevx[i],600,600);
    fill(216,197,400);
    quad(600,prevz[i],preva[i],preva[i],prevx[i],prevx[i],500,prevz[i]);
    fill(209,255,211);
    quad(x,x,x,y,y,z,z,preva[i]);
    fill(145,178,147);
    quad(150,200,z,200,x,y,y,x);
    
    popMatrix();
    angle ++;
    
    pushMatrix();
 translate(x,200,y);
 rotateY(tan(z));
 rotateX(z);
     fill(199,216,216);
     quad(x,y,z,x,y,z,x,y);
     popMatrix();
    angle ++;
    
     pushMatrix();
 translate(400,z,y);
 rotateY(tan(z));
 rotateX(z);
     fill(216,197,219);
    quad(x,y,y,y,x,x,x,z);
    popMatrix();
    angle ++;
    
     pushMatrix();
 translate(500,z,y);
 rotateY(tan(z));
 rotateX(z);
     fill(216,197,219);
    quad(x,y,y,y,x,x,x,z);
    popMatrix();
    angle ++;
    
    
     pushMatrix();
 translate(z,20,y);
 rotateY(tan(z));
 rotateX(z);
     fill(216,197,400);
    quad(x,y,y,y,preva[i],x,x,z);
    popMatrix();
    angle ++;
    
     pushMatrix();
 translate(x,200,y);
 rotateY(tan(z));
 rotateX(z);
     fill(209,230,255);
    quad(x,y,y,y,x,x,x,z);
    popMatrix();
    angle ++;
    
         pushMatrix();
 translate(x,150,y);
 rotateY(tan(z));
 rotateX(z);
     fill(209,230,255);
    ellipse(y,x,x,z);
    popMatrix();
    angle ++;
    
 
  }
}
//}

