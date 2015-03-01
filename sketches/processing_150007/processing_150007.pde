
// my cell class
// class(x) ve defined cell

class cell {

  float xloc;
  float yloc;
  float zloc;   // z location should be defined for 3rd dimension
  float diam;
  float cellred, cellgreen, cellblue;
 // instead of writing float x   float y it could be float x,y
  float lineweight;
  boolean isseed;
 
  cell(){
   xloc=random(0,500);
    yloc=random(0,500);
    zloc=random(0,500);
    diam=random(10);   //radius of sphere
    cellred=random(200);   //fill color 0-200
    cellgreen=random(200);//fill color 0-200
    cellblue=random(200);//fill color 0-200
    lineweight=0.5;
  }
 void display(){
  if (keyPressed) {
    if (key == 'w') {
     xloc += random(2)-1;
     yloc += random(2)-1;
     zloc += random(2)-1;
    }
  }
     
   noStroke();  //stroke takes too much time when the script is running
   fill(cellred,cellgreen, cellblue);  
   pushMatrix();   //since, sphere command does not consist any coordinate option, i used pop,push matrix to distrubute spheres
   translate(xloc,yloc,zloc);
   sphere(diam);  //sphere only have diameter option
     //if (mousePressed) {
  //  lights();
 // }  //in order to turn lights on press mouse button
   popMatrix();  
 }

 
 
}
float cameraM1=500;
float cameraM2=500;
float cameraM3=500;
float cameraM4=1;

float cameraMove = 0;

cell[]  mycells = new cell[300];   //cell[x]   x times cell 

void setup(){ 

size (500,500,P3D);  // P3D 3rd dimension
for (int i=0; i<mycells.length; i++){
mycells[i] = new cell();  } 

}
 
 void draw(){

    lights();   
    //cameraM1=cameraM1+1;
   //cameraM2=cameraM2-1;
   //cameraM3=cameraM3-1;
   //cameraM4=cameraM4+1;

   
   //camera(cameraM1, cameraM2, cameraM3, 0,0,cameraM4, 0, 0, 1);  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);
   //camera(cameraM1, 0, cameraM3, -mouseX+250, 0, mouseY-250,0, 0, 1);  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);
   camera(300-mouseX/10,300 + cameraMove, 300+mouseY/10,-mouseX+250, 0, mouseY-250,0, 0, 1);  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);
   background(255);
for (int i=0; i<mycells.length; i++){   
   
   mycells[i].display();    

   
 }
 }
 
 
void keyPressed() {
  if (key == 'w') {
    cameraMove++;
  } else if (key == 's') {
    cameraMove--;
  }
}

