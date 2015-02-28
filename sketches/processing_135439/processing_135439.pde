
float[] xGrass=new float[950];
float[] yGrass=new float[950];
float[] yGrass2=new float[950];

float x=0;
float y=0;
float trunkX=0;
float trunkY=0;
float interval=0;
float branchX=0;
float branchY=0;
float r1=0;
float b1=0;
float g1=0;
float rad1=0;

int counter=0;

void setup(){
   size(900,600);
   colorMode(HSB);
   background(255,255,255);
   frameRate(3);
     //prep grass
    for(int i=0;i<950;i++){
      xGrass[i]=i;
      yGrass[i]=random(475,500); 
      yGrass2[i]=random(100,125);
    }
   trunkX=25/10;
   trunkY=650/65;
   branchX=15/3;
   branchY=150/10;
 
}

void draw(){
  background(255,255,255);
  //draw grass
  for(int i=0;i<950;i++){
      stroke(random(25),random(25),random(155));
    //  line(xGrass[i],900,xGrass[i],yGrass[i]); 
    //  line(xGrass[i],0,xGrass[i],yGrass2[i]);
    }
  
   
   //draw tree
   
   //trunk cells
   for(int k=0;k<120;k++){
     pushMatrix();
     translate(430,250);
     rotate(k*radians(3));
   for(int i=0;i<11;i++){
    for(int j=0;j<65;j++){
    //  colorMode(HSB);
      color one=color(random(15),random(15),random(255),155);
      fill(one);
       x=trunkX*i;
       y=trunkY*j;
        rect(x,y,trunkX,trunkY);
   }}
   colorMode(RGB);
   
popMatrix();
}


//draw lines to form a central vertex.
for(int i=0;i<361;i++){
pushMatrix();
color one=color(random(155),random(15),random(255),155);
      fill(one);
translate(430,250);
rotate(i*radians(1));
line(0,0,0,random(0,1)*yGrass[i]);

popMatrix();


}
color one=color(random(15),random(15),random(15),255);
pushMatrix();
translate(430,250);
 r1=random(0,255);
 g1=random(0,255);
 b1=random(0,255);
 rad1=50;
 fill(one);
 ellipse(0,0,rad1*sin(counter),rad1*sin(counter));
 counter++;

popMatrix();


}
 
