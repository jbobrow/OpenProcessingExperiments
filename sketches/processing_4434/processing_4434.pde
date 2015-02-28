
/* 
//CrystalCubes 
  by Stinging Eyes, 19 Sep 08 (Processing 0135) 
  http://www.openprocessing.org/visuals/?visualID=1440
  use mouse movement to zoom 
   */ 
 
//import processing.opengl.*; 
 
float ang; 
int maxCubes = 1000; // number of spheres, value change 
int cubeSize = mouseY; // size of spheres 
Cube[]cubes = new Cube[maxCubes]; 
 
void setup() { 
  size(600,600,P3D); 
  stroke(102,51,204);
 //stroke change 
 
 for (int i = 0; i < cubes.length; i++){ 
    cubes[i] = new Cube(int(random(-30,30)), int(random(-30,30)), int(random(-30,30))); 
      // x, y, depth 
  } 
} 
 
void draw() { 
 
  background(0);  
  shininess(5.0); 
  lightSpecular(100,100,100); 
  directionalLight(mouseX*0.4,mouseY*42,mouseY*10,-1,0,0); 
  pointLight(50,50,200,65,60,100);  
  ambientLight(mouseX*54,42,mouseY*232); 
  specular(mouseX *10,mouseX *255,255); 
  translate(width/2, height/2, -200 + mouseX);  
  rotateY(radians(ang)); 
  rotateX(radians(ang));
 loop(); 
 /* ambient light, directional light and light specular 
 changed values to include mouse input as a variable of changing colours
 to that of a gem
 */
 
  for (int i=0; i < cubes.length; i++){ 
    cubes[i].drawCube();   
  } 
 
  ang++;  
} 
 
class Cube { 
 
  int x; 
  int y; 
  int d; 
 
  Cube(int x, int y, int d){ 
    this.x = x; 
    this.y = y; 
    this.d = d; 
  } 
 
  void drawCube(){ 
    translate(this.x, this.y, this.d); 
    sphereDetail(cubeSize);
    sphere (30); 
    rotateY(radians(20)); 
    rotateX(radians(20)); 
    rotateZ(radians(20)); 
      // edited to sphere and change from cube to sphereDetail, allowing the shape to be formed into a gem like prism
  } 
} 

