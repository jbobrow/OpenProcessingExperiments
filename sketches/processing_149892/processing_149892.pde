
float Rx,Ry, Rsize,Rcount;




void setup() {
  smooth();
  Rcount=100;
 size(800,600);
 background(#ffffff);
  frameRate(10);
  
  float Squeeze= random( 500);
  int numPoints=300;
float angle=TWO_PI;


for(int j=0; j<3;j++){ // how many balls
  
  float Rwid=random(width);
  float Rheight=random(height);
 float Rradius=random(700);  //random the size of each ball 
 
 
for(int i=0;i<Rradius;i++) //germ ball rendering
{
  float radius=random(Rradius)  ;
 float Rangle= (angle*random(50)%TWO_PI);
     
  Rx=(radius*sin( Rangle))+Rwid;
  Ry=(radius*cos( Rangle))+Rheight;
 Rsize=random(radius/4);
  strokeWeight(Rsize/20%0.7);
   ellipse(Rx,Ry,Rsize,Rsize);
    strokeWeight(Rsize/20%0.2);
    ellipse(Rx+random(-14,14),Ry+random(-14,14),Rsize/2,Rsize/2);
} 
}


 /*
 
  for (int i=1; i<Rcount;i++){
 Rx=random((width+10)/20-i);
 Ry=random((height+10)/20-i);
  

  Rsize=i;
  strokeWeight(0.3);
   ellipse(Rx,Ry,Rsize,Rsize);
  }
  */
  
  
  
  
}
/*
void draw(){
  fill(#ffffff);
  rect (0,0,width,height);
  
  int numPoints=200;
float angle=TWO_PI/100;
for(int i=0;i<numPoints;i++)
{
   float radius=random(150);
 float Rangle= (angle*random(200)%TWO_PI);
  
  Rx=(radius*sin( Rangle))+width/2;
  Ry=(radius*cos( Rangle))+height/2;
 Rsize=random(radius/10+2);
  strokeWeight(0.3);
   ellipse(Rx,Ry,Rsize,Rsize);
   
} 
  
}*/

