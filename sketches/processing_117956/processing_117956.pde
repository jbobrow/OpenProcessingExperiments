
// my cell class
// class(x) ve defined cell
class cell {
  float xloc;
  float yloc;
  float zloc;   // z location should be defined for 3rd dimension
  float diam;
  float cellred, cellgreen, cellblue;
 // instead of writing float x   float y it could be float x,y
  
  cell(){
   xloc=random(0,600);
    yloc=random(0,600);
    zloc=random(0,600);
    diam=random(15);   //radius of sphere
    cellred=random(55);   //fill color 0-200
    cellgreen=random(255);//fill color 0-50
    cellblue=random(50);//fill color 0-150
  }
 void display(){
   noStroke();  //stroke takes too much time when the script is running and usually crash on the web
   fill(cellred,cellgreen, cellblue); 
   pushMatrix();   //since, sphere command does not contain any coordinate option, pop,push matrix used to distrubute spheres
   translate(xloc,yloc,zloc);
   sphere(diam);  //sphere only have diameter option
     if (mousePressed) {
    lights(); }  //in order to turn lights on press mouse button
   popMatrix(); }}
float cameraM1=500;
float cameraM2=500;
float cameraM3=500;
float cameraM4=1;
cell[]  mycells = new cell[500];   //cell[x]   x times cell
 
void setup(){
 
size (700,700,P3D);  // P3D 3rd dimension
for (int i=0; i<mycells.length; i++){
mycells[i] = new cell();  }}
  
 void draw(){
   cameraM1=cameraM1;
   cameraM2=cameraM2;
   cameraM3=cameraM3;
   cameraM4=cameraM4;
    
   camera(-mouseY, -mouseX, 0, width/2,width/2,width/2, 0, 0, 1);  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
   //Tracking camera location by moving mouse
   background(255);
for (int i=0; i<mycells.length; i++){     
   mycells[i].display();   }}

void keyPressed() {if (key == 'q' || key == 'Q') {
      save("sphere cube.png");loop(); } }

