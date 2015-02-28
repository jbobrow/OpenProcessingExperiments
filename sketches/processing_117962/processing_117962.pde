
// my cell class
// class(x) ve defined cell
class cell {
  
  float xloc;
  float yloc;
  float zloc;   // z location should be defined for 3rd dimension
  float diam;
  float H, S, B,A;
 // instead of writing float x   float y it could be float x,y
  
  cell(){
   xloc=random(0,600);
    yloc=random(0,600);
    zloc=random(0,600);
    diam=random(20);   //radius of sphere
    H=random(200);   //fill color 0-200
    S=random(20);//fill color 0-50
    B=random(20);//fill color 0-150
    A=random(200,360);  
}
 void display(){
   noStroke();  //stroke takes too much time when the script is running and usually crash on the web
   fill(H,S,B,A); 
   pushMatrix();   //since, sphere command does not contain any coordinate option, pop,push matrix used to distrubute spheres
   translate(xloc,yloc,zloc);
   sphere(diam);  //sphere only have diameter option
     if (mousePressed) {
    lights(); }  //in order to turn lights on press mouse button
   popMatrix(); }}

float cameraM1=0;

float fade1=50;

cell[]  mycells = new cell[900];   //cell[x]   x times cell

 
void setup(){
size (700,700,P3D);  // P3D 3rd dimension
for (int i=0; i<mycells.length; i++){
mycells[i] = new cell();  }}

 void draw(){
noStroke();  

   background(0);  
    cameraM1=cameraM1+0.0001;
  
  camera(1000, 1000,1000, 0,0,0, 0, 0, 1);  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
   //Tracking camera location by moving mouse

  sun();
  translate(0,0,0);
  
for (int i=0; i<mycells.length; i++){     
   mycells[i].display();  
 rotateY(cameraM1); }}
   
   void keyPressed() {if (key == 'q' || key == 'Q') {
      save("sphere cube.png"); loop(); }
      

       }

void sun(){
 if (mousePressed) {
    lights(); }
  noStroke();
pushMatrix();
translate(0,300,0);

fade1=fade1+20;
if(fade1>=250) {fade1=50;}

fill(255,0,50,fade1);
sphere(100);
popMatrix();

  }
