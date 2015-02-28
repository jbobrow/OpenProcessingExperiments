
int w=800;
int h=450;
int Nshapes=1000;
float[] point1x = new float[Nshapes];    // create the arrays
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
point1x[i]= random(w*4/8,w*6/8);
point1y[i]= random(h*1/8,h*3/8);
point2x[i]= random(w*4/8,w*7/8);
point2y[i]= random(h*3/8,h*5/8);
point3x[i]= random(w*4/8,w*6/8);
point3y[i]= random(h*5/8,h*7/8);
point4x[i]= random(w*2/8,w*4/8);
point4y[i]= random(h*5/8,h*7/8);
point5x[i]= random(w*1/8,w*4/8);
point5y[i]= random(h*3/8,h*5/8);
point6x[i]= random(w*2/8,w*4/8);
point6y[i]= random(h*1/8,h*3/8);
  }
}



void draw(){

//background(0);
fill(79,100,100,50);
rect(0,0,w,h);
noStroke();
fill(255);

translate(w/2,h/2);    // move origin to center of screen

for (int i=0; i < Nshapes; i++) {
  pushMatrix();
  translate(positionX[i]-w/2,positionY[i]-h/2);
  scale(random(0.01,0.04));
  rotate(random(TWO_PI));
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
                
                                                                                
