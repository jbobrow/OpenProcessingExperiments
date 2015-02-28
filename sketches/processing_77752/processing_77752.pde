
int  result=0;
final  static  int  NORTH = 1;
float dvdrg=60;
float rttx=0, rttz=PI;
int boxSize = 30;
float margin = boxSize*3;
float depth = 200;
PImage imgsky;
PVector [] dice;

//       4---5
//      /|  /|
//     / 7-/-6
//    0---1 /
//    |/  |/
//    3---2  

int [] dtbl= {
  0, 3, 1, 1, 3, 2, 5, 1, 2, 5, 2, 6, 5, 6, 4, 4, 6, 7, 4, 7, 0, 0, 7, 3
};
PVector [] verticies;
PVector  camPos;
PVector  camLok;
PVector  triangleNormal;
PVector  ofset=new  PVector (-20, -20, 0);
float  rotation;

void setup() {
  size(320, 200, P3D);
  imgsky=loadImage("gdata.gif");
  verticies=new PVector [3];
  smooth();

  dice=new  PVector [8];
  for (int j=0;j<2;j++)
    for (int i=0;i<4;i++) {
      int k;
      if (i==1||i==2)k=boxSize/2;
      else k=-boxSize/2;
      dice[j*4+i]=new PVector (k, (i/2)*boxSize-boxSize/2, j*boxSize-boxSize/2);
    }

  noStroke();
  frameRate(30);
  frustum(-0.8, 0.8, -0.5, 0.5, 1, 50);
  fill(100, 255, 100);
  camPos=new PVector (0, 8, 0);
  camLok=new PVector (0, 0, 0);
  fill(100, 255, 100);
}

void draw() {
  background(10);
  rotation += 0.01;
  float dtx, dtz, dzx, dzz;

  dtx=cos(rttx);
  dtz=sin(rttx); 
  dzx=-cos(rttz);
  dzz=sin(rttz);

  if (result==NORTH) {
    camPos.x+=dtx;
    camPos.z+=dtz;
  }

  camLok.x=(dtx*dzx)+camPos.x;
  camLok.y=dzz+8;
  camLok.z= dtz+camPos.z;

  camera( camPos.x, 8, camPos.z, // 原点
  camLok.x, camLok.y, camLok.z, // 対象点
  0.0, 1.0, 0.0); // 


  ambientLight(255, 255, 255);
  pointLight(255, 255, 255, 
  (dtx*dzx)+camPos.x, dzz+8, dtz+camPos.z);


  float scal=boxSize+20;  
  scal/=boxSize;

  for (float j =0; j <5; j ++) {
    pushMatrix();
    for (float k =0; k <5; k ++) {

      pushMatrix();
      translate(k*boxSize, 0, j*boxSize);

      beginShape ( );      
      texture(imgsky);   
      vertex (dice[7].x, dice[7].y, dice[7].z, 24, 0);
      vertex (dice[6].x, dice[6].y, dice[6].z, 47, 0);
      vertex (dice[2].x, dice[2].y, dice[2].z, 47, 24);
      vertex (dice[3].x, dice[3].y, dice[3].z, 24, 24);
      endShape ();

      pushMatrix();
      scale(0.5, 1, 0.5);
      pushMatrix();
      translate(-boxSize/2, 0, -boxSize/2);
      beginShape ( );      
      texture(imgsky);   
      vertex (dice[1].x, dice[1].y, dice[1].z, 0, 0);
      vertex (dice[5].x, dice[5].y, dice[5].z, 23, 0);
      vertex (dice[6].x, dice[6].y, dice[6].z, 23, 23);
      vertex (dice[2].x, dice[2].y, dice[2].z, 0, 23);
      endShape ();
      popMatrix();

      beginShape ( );
      texture(imgsky);      
      vertex (dice[0].x, dice[0].y, dice[0].z, 0, 0);
      vertex (dice[1].x, dice[1].y, dice[1].z, 23, 0);
      vertex (dice[2].x, dice[2].y, dice[2].z, 23, 23);
      vertex (dice[3].x, dice[3].y, dice[3].z, 0, 23);
      endShape ();
      popMatrix();


      popMatrix();
    }
    popMatrix();
  }
}

void mouseDragged() { 
  rttx+=(pmouseX-mouseX)/dvdrg;
  rttz+=(pmouseY-mouseY)/dvdrg;
  if (rttx>TWO_PI)rttx-=TWO_PI;
  if (rttx<0)rttx+=TWO_PI;
  if (rttz>PI+HALF_PI-QUARTER_PI)rttz=PI+HALF_PI-QUARTER_PI;
  if (rttz<PI-QUARTER_PI)rttz=PI-QUARTER_PI;
}

void  keyPressed () {
  //Key or KeyCode
  switch (key) {
    case('w'):
    case('W'):
    result |=NORTH;
    break;
  }
}

void  keyReleased () {  
  switch (key) {
    case('w'):
    case('W'):
    result ^=NORTH;
    break;
  }
}


