
// my cell class
// class(x) ve defined cell

class cell {

  float xloc;
  float yloc;
  float zloc;   // z location should be defined for 3rd dimension
  float diam;
  float cellred, cellgreen, cellblue,cellalpha;
 // instead of writing float x   float y it could be float x,y
  float lineweight;
  boolean isseed;
 
  cell(){
   xloc=random(0,500);
    yloc=random(0,500);
    zloc=random(0,500);
    diam=random(30);   //radius of sphere
    cellred=random(100,250);   //fill color 0-200
    cellgreen=0;
    cellblue=0;
    cellalpha=random(300);
    lineweight=0.5;
  }
 void display(){
   noStroke();  //stroke takes too much time when the script is running
   fill(cellred,cellgreen, cellblue,cellalpha);  
   pushMatrix();   //since, sphere command does not consist any coordinate option, i used pop,push matrix to distrubute spheres
   translate(xloc,yloc,zloc);
   sphere(diam);  //sphere only have diameter option
   
   if (mousePressed) {
    lights();
  }  //in order to turn lights on press mouse button
   popMatrix();  
 }

 
 
}
float cameraM1=500;
float cameraM2=500;
float cameraM3=500;
float cameraM4=1;

cell[]  mycells = new cell[1000];   //cell[x]   x times cell 

void setup(){ 

size (500,500,P3D);  // P3D 3rd dimension
for (int i=0; i<mycells.length; i++){
mycells[i] = new cell();  } 

}
 
 void draw(){
   cameraM1=cameraM1+1;
   cameraM2=cameraM2-1;
   cameraM3=cameraM3-1;
   cameraM4=cameraM4+1;
   if(cameraM1>=600){cameraM1=500;}
      if(cameraM2>=600){cameraM2=500;}
         if(cameraM3>=600){cameraM3=500;}
            if(cameraM4>=630){cameraM4=400;}
   camera(cameraM1, cameraM2, cameraM3, 0,0,0, 0, 0, 1);  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
   background(255);
for (int i=0; i<mycells.length; i++){   
   
   mycells[i].display();    
  
  frameRate(10); 
 }}
