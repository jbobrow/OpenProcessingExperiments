
float sundia;
int sphdt;
int ordia[] = new int[7];
int placX[] = new int[7];
int placY[] = new int[7];
int orinc[] = new int[7];
int starX[] = new int[100];
int starY[] = new int[100];
int starZ[] = new int[100];
float rotX,rotY,rotZ;
float cameraX, cameraY, cameraZ;



void setup(){
  frameRate(20);
  size(666, 666, P3D);
 

  smooth();
   
}
   
void draw(){
  lightSpecular(255,255,255);    
    directionalLight(mouseX, mouseY, 102, 0, 1, -1);   
  ambientLight(255,255,255); 
  translate(width/2,height/2);
  background(0);
  //sun
  stroke(random(200,255));
  fill(0);
  sundia = /*int(random(20,25));*/30;
  sphdt = /*int(random(20));*/2;
  sphereDetail(sphdt);
  sphere(sundia);
   
   // orbit
  noFill();
  for(int i = 0;  i < 7; i++){
   ordia[i] = (int)random(100,600);
   placX[i] = (int)random(100,333);
   placY[i] = (int)random(100,333);
   rotateX(rotX);
   stroke(random(200,255),20);
    ellipse(0,0,ordia[i],ordia[i]);
    rotateX(ordia[i]);
    rotateY(ordia[i]);
    
    //planet
    pushMatrix();
    translate(placX[i],placY[i]);
    fill(random(255),0,random(255),200);
    sphere(10);
    popMatrix();
    
    for(int p = 0; p < 100; p++){
    pushMatrix();
    starX[p] = (int)random(-666,666);
    starY[p] = (int)random(-666,666);
    starZ[p] = (int)random(-666,666);
    stroke(random(200,255),random(255),random(200,255));
    point(starX[p],starY[p],starZ[p]);
    popMatrix();
  }
}
  
  
  
  
  cameraX = radians(map(mouseX, 0, width, -135, 45));
  cameraY = radians(map(mouseY, 0, height, 180, 0));
  cameraZ = radians(map(mouseY, 0, height, 180, 0));
   
  println(cos(cameraX));
   
  camera(500 * cos(cameraX * 2), 0, 500 * sin(cameraX * 2), width/2, height/2, 0, 0, 1, 0);
 
  
   }
   
   void fade(){
   fill(0);
   rect(0,666,666, 2);
} 


