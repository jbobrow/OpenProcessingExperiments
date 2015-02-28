



PImage Ualfa;


float angle=0.1;
float radius=10;


void setup() {
 Ualfa=loadImage("Ualfa.png");
  //size(Ualfa.width,Ualfa.height,OPENGL);
  size(480,320);
  smooth();
  frameRate(10);
  
    
  //  noLoop();
}

void draw() {
  background(0);
  for(int i=0; i<20; i++) {
    float x=500*sin(angle)+500;
    float y=500*cos(angle)+height/2;
    angle++;
    noStroke();
    fill(0,random(0,255),0);
    ellipse(x,y,radius,radius+10);
  }

  for(int i=0; i<mouseX; i++) {
    float x=200*sin(angle)+600;
    float y=20*cos(angle)+400;
    angle++;
    noStroke();
    fill(255,i,i);
    ellipse(x,y,radius,radius+10);
  }
  
  
//  for(int i=0; i<1000; i++) {
//    float x=200*sin(angle)+width/2;
//    float y=60*cos(angle)+200;
//    angle++;
//    noStroke();
//    fill(255,0,0);
//    ellipse(x,y,radius+x,radius); The color ring. 
  

  for(int i=0; i<100; i++) {
    float x=200*sin(angle)+width/2;
    float y=i*cos(angle)+200;
    angle++;
    noStroke();
    fill(255);
    ellipse(x,y,radius,radius);
  }

  for(int i=0; i<300; i++) {
    float x=200*sin(angle)+width/2;
    float y=200*cos(angle)+200;
    angle++;
    noStroke();
    fill(255,i,i);
    ellipse(x,y,radius,radius);
  }
  for(int i=0; i<1000; i++) {
    float x=i+mouseY  *sin(angle)+600;
    float y=i+cos(angle)+200;
    angle++;
    noStroke();
    fill(i,i,255);
    ellipse(x,y,radius,radius);
   }image(Ualfa,0,0);
      
  }



  
  //After the 



