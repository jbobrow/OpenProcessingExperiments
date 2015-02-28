
//jack a perkins - 2009 - jackaperkins.com
// Bless this mess!



int cols,rows;

float grid,depth,boxSize;

float[] waves;
float[] inc;
float[][] scape ;

float amp;



void setup() {
amp=1;

  waves=new float[4];
  inc=new float[4];
  inc[0]=0.014;
  inc[1]=0.03946;
  inc[2]=0.002;
  inc[3]=0.009;
  // stroke(255);
  noStroke();
  // noFill();
  size(800,650,P3D);
  colorMode(HSB,255);

  cols=30;
  rows=40;
  grid=120;
  noCursor();

  scape = new float[cols][rows];
  for(int i=0;i<cols;i++){
    for(int j=0;j<rows;j++) {

      scape[i][j]=random(1)/2;

    } 
  }

}

void draw() {
  
  if(depth<300*amp) {
  depth+=0.5*(300*amp-depth);
  } else {
  depth+=0.5*(300*amp-depth);    
  }

  //  mm.addFrame();
  background(0,0,0,20);
  lights();
  reset();

  for(int i=0;i<waves.length;i++) {
    if(waves[i]+inc[i]>TWO_PI) {
      waves[i]+=inc[i]-TWO_PI;
    } 
    else {
      waves[i]+=inc[i];
    }
  }

  translate(width/2,height/2,-4000);
   rotateX(sin(waves[3])*0.3);
 // rotateX((mouseY*1.0/width)*PI-HALF_PI);
   rotateY(waves[2]);
 // rotateY((mouseX*1.0/width)*TWO_PI);
   noFill();
  stroke(100);


  translate(-(cols/2.0)*grid,0,-(rows/2.)*grid);


  reset();
  for(int i=0;i<cols-1;i++){
    for(int j=0;j<rows-1;j++) {
      fill(10,(map(abs(sin(i/2.0+waves[0])+sin(j/4.0+waves[1])),0,2.0,0,240))*(depth/300.0),255,(map(abs(sin(i/2.0+waves[0])+sin(j/4.0+waves[1])),0,2.0,200,255)));
       stroke(40,180,255,(map(abs(sin(i/2.0+waves[0])+sin(j/4.0+waves[1])),0,2.0,0,255))*(depth/200.0));
      beginShape(QUADS);

      vertex(i*grid,(scape[i][j]*depth/20.0+sin(i/2.0+waves[0])*depth+sin(j/4.0+waves[1])*depth),j*grid);
      vertex(i*grid,scape[i][j+1]*depth/20.0,(j+1)*grid);
    
      vertex((i+1)*grid,scape[i+1][j+1]*depth/20.0,(j+1)*grid);
      vertex((i+1)*grid,scape[i+1][j]*depth/20.0,j*grid);    
 
      endShape();

    } 
  }




}

void reset() {
  for(int i=0;i<cols;i++){
    for(int j=0;j<rows;j++) {
      scape[i][j]=random(1);

    } 
  }

}







