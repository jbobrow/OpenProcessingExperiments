
PImage ocean;
PImage [] nemo;
float x = 0;
float x2 = 0;
float x3 = 0; 
float x4 = 0;
float x5 = 0;
float x6 = 0; 
float y = 250;
float y2 = 150;
float y3 = 100; 
float y4 = 450; 
float y5 = 50; 
float y6 = 300; 
int frame = 0; 
int frame2 = 2; 
int frame3 = 3; 
int frame4 = 1; 
int frame5 = 4; 
int frame6 = 5; 
int W = 100; 
int H = 75; 
int A = 3;
float B = 3.5; 
int C = 4; 
float D = 4.5;
int E = 1;
float F = 1.5; 
int counter=0;


void setup() {
  frameRate(30); 
  size(640,480);
  nemo = new PImage[3];
  for(int i = 0; i< nemo.length; i ++) {
    nemo[i] = loadImage("nemo" + (i+1) + ".png");
  }
  ocean = loadImage("oceanfloor1.JPG");
}

void draw() {
  if (frame > 2) frame = 0; //fish 1 
  if (frame2 >2) frame2 = 0; //fish 2
  if (frame3 > 2) frame3 = 0; // fish 3 
  if (frame4 >2) frame4 = 0; //fish 4
  if (frame5 >2) frame5 = 0; //fish 5
  if (frame6 >2) frame6 = 0; //fish 6
  image(ocean,0,0,800,600);
  //////////////////////////////////////////////////////////////

  pushMatrix();//fish 1
  translate(x,y);
  image(nemo[frame], -50,-37.5, W, H);
  popMatrix();
  x += A;
  y += B; 
  if(counter%15==0) {
    frame++;
  }
  if(x>500 || x<=0) { 
    A *= -1;
  }
  if(y>480 || y<=0) {
    B *= -1;
  }
  /////////////////////////////////////////////////////////
  pushMatrix();//fish 2
  translate(x2,y2);
  image(nemo[frame2], -30,-37, 100,75);
  popMatrix();
  x2 += C;
  y2 += D;

  if(counter%5==0) {
    frame2++;
  }
  if(x2>640 || x2<=0) { 
    C *= -1;
  }
  if(y2>480 || y2<=0) {
    D *= -1;
  }
  ///////////////////////////////////////////////////////
  pushMatrix();//fish 3
  translate(x3,y3);
  image(nemo[frame3], -30,-37, 100,75);
  popMatrix();
  x3 += E;
  y3 += F; 

  if(counter%10==0) {
    frame3++;
  }

  if(x2>640 || x2<=0) { 
    E *= -1;
  }
  if(y3>480 || y3<=0) {
    F *= -1;
  }
  /////////////////////////////////////////////////////
  pushMatrix();//fish 4
  translate(x4,y4);
  image(nemo[frame4], -30,-37, 100,75);
  popMatrix();
  x4 += A;

  if(counter%20==0) {
    frame4++;
  }

  if(x4>640 || x4<=0) { 
    A *= -1;
  }
  if(y4>480 || y4<=0) {
    B *= -1;
  }
  ///////////////////////////////////////////////////
  pushMatrix();//fish 5
  translate(x5,y5);
  image(nemo[frame5], -30,-37, 100,75);
  popMatrix();
  x5 += A;

  if(counter%25==0) {
    frame2++;
  }

  if(x5>640 || x5<=0) { 
    A *= -1;
  }
  if(y5>480 || y5<=0) {
    B *= -1;
  }
  /////////////////////////////////////////////////
  pushMatrix();//fish 6
  translate(x6,y6);
  image(nemo[frame6], -30,-37, H,W);
  popMatrix();
  x6 += A;


  if(counter%35==0) {
    frame6++;
  }

  if(x6 >640 || x6 <=0) { 
    A *= -1;
  }
  if(y6>480 || y6<=0) {
    B *= -1;
  }
  counter++;
}

void keyPressed(){
  if(key == '1'){
    ocean = loadImage("oceanfloor1.JPG");
  }
  if(key == '2'){
      ocean = loadImage("oceanfloor2.jpg");
    }
  if(key == '3'){
       ocean = loadImage("oceanfloor3.jpg");
  }
  if(key == 'b'){
    H++;
    W++; 
  }

    
  
  
}



