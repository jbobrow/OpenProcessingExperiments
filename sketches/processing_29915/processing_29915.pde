
/* Random Shape Noise for After (Moby)
by Roman Random, 2011*/

// resolution
int w=800;
int h=450;
float shapeShiftSpeed=0.1;
float  shapeShift=0;
int Nshapes=1000;
int sizeVar=5;          // Maximum variation of size of shapes (1-20)

// create arrays for curve points
float[] point1x = new float[Nshapes];    
float[] point1y = new float[Nshapes];
float[] point2x = new float[Nshapes];    
float[] point2y = new float[Nshapes];
float[] point3x = new float[Nshapes];    
float[] point3y = new float[Nshapes];
float[] point4x = new float[Nshapes];    
float[] point4y = new float[Nshapes];
float[] point5x = new float[Nshapes];    
float[] point5y = new float[Nshapes];
float[] point6x = new float[Nshapes];    
float[] point6y = new float[Nshapes];

// create arrays for shape positions
float[] positionX= new float[Nshapes];  
float[] positionY= new float[Nshapes];  

void setup(){
size(800,450);
smooth();
frameRate(24);

for (int i=0; i < Nshapes; i++) {        // Fill with random positions
  positionX[i]= random(w);
  positionY[i]= random(h);
}

for (int i=0; i < Nshapes; i++) {        // Fill with random points
point1x[i]= random(0,w*2/4);
point1y[i]= random(-h*3/4,-h*1/4);
point2x[i]= random(0,w*3/4);
point2y[i]= random(-h*1/4,h*1/4);
point3x[i]= random(0,w*2/4);
point3y[i]= random(h*1/4,h*3/4);
point4x[i]= random(-w*2/4,0);
point4y[i]= random(h*1/4,h*3/4);
point5x[i]= random(-w*3/4,0);
point5y[i]= random(-h*1/4,h*1/4);
point6x[i]= random(-w*2/4,0);
point6y[i]= random(-h*3/4,-h*1/4);
  }
}

void draw(){
fill(0,50);
rect(0,0,width,height);
noStroke();
fill(255,10);

//translate(w/2,h/2);                      // move origin to center of screen
shapeShift+=shapeShiftSpeed;             // increment noise position
float[] scaleDown= new float[Nshapes];   // create array for initial scale downs
float[] angleStart= new float[Nshapes];   // create array for initial rotations

// draw shapes
for (int i=0; i < Nshapes; i++) {
  pushMatrix();
  positionX[i]+=noise(shapeShift/3000*i)*10-5;    // cambio de posicion MAL
  positionY[i]+=noise(shapeShift/3200*i)*10-5;
  translate(positionX[i],positionY[i]);    // Translate to random position
  
  if (frameCount==1){
    scaleDown[i]=random(0.0001,0.02);
    angleStart[i]=random(TWO_PI);
    scale(scaleDown[i]);                      // Scale and rotate randomly the first time
    rotate(angleStart[i]);                        
  }else{
    scaleDown[i]+=noise(shapeShift)/(100/sizeVar);
    angleStart[i]+=noise(shapeShift/10)*TWO_PI;
    scale(scaleDown[i]);
    rotate(angleStart[i]);
  }
  
    point1x[i]+=noise(shapeShift/50*i)*w/10-w/20;    // cambio de forma MAL
    point1y[i]+=noise(shapeShift/60*i)*h/10-h/20;
    point2x[i]+=noise(shapeShift/70*i)*w/10-w/20;
    point2y[i]+=noise(shapeShift/80*i)*h/10-h/20;
    point3x[i]+=noise(shapeShift/90*i)*w/10-w/20;
    point3y[i]+=noise(shapeShift/100*i)*h/10-h/20;
    point4x[i]+=noise(shapeShift/101*i)*w/10-w/20;
    point4y[i]+=noise(shapeShift/120*i)*h/10-h/20;
    point5x[i]+=noise(shapeShift/130*i)*w/10-w/20;
    point5y[i]+=noise(shapeShift/140*i)*h/10-h/20;
    point6x[i]+=noise(shapeShift/150*i)*w/10-w/20;
    point6y[i]+=noise(shapeShift/160*i)*h/10-h/20;
    
    beginShape();
    curveVertex(point1x[i],point1y[i]);
    curveVertex(point1x[i],point1y[i]);
    curveVertex(point2x[i],point2y[i]);
    curveVertex(point3x[i],point3y[i]);
    curveVertex(point4x[i],point4y[i]);
    curveVertex(point5x[i],point5y[i]);
    curveVertex(point6x[i],point6y[i]);
    curveVertex(point1x[i],point1y[i]);
    curveVertex(point1x[i],point1y[i]);
    endShape();
  popMatrix();
}
}
                
                                
