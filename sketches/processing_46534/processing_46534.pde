
// 3D triangles
// Nov 21, 2011
// Ben Light bl1236@nyu.edu
// On mouse X and Y the 3D triangles change position

void setup(){
  size(1000,550, P3D);
  //or
  //size(500,500,OPENGL);  //Open Graphics Library
}

void draw(){
  background(0);
  smooth();
  ambientLight(55,55,105);
  directionalLight(205,235,235,0, 0,-.25);

  beginShape(TRIANGLES);
    
  //Triangle 1, red
  fill(255,0,0);
  vertex(100,300,0);  //FIXED
  vertex(200,200,-mouseX);  //connected to triangle 2
  vertex(300,300,mouseY/3);  //connected to triangle 3 and 4
  
  //Triangle 2, green
  fill(0,255,0);
  vertex(200,200,-mouseX);  //connected to triangle 1
  vertex(300,100,0);  //FIXED
  vertex(400,200,-mouseX);  //connected to triangle 4 and 5
  
  //Triangle 3, blue
  fill(0,0,255);
  vertex(200,400,0);  //FIXED
  vertex(300,300,mouseY/3);  //connected to triangle 1 and 4
  vertex(400,400,0+mouseY/3);  //connected to triangle 6
  
  //Triangle 4, white 
  fill(255,255,255);
  vertex(300,300,mouseY/3);   //connected to triangle 1 and 3
  vertex(400,200,-mouseX);  //connected to triangle 2 and 5
  vertex(500,300,-mouseY);  //connected to triangle 6 and 7
  
  //Triangle 5,
  fill(100,255,100);
  vertex(400,200,-mouseX);  //connected to triangle 2 and 4
  vertex(500,100,0-mouseY/3);  
  vertex(600,200,-mouseX);  //coonected to triangle 7 and 8
  
  //Triangle 6
  fill(255,100,100);
  vertex(400,400,0+mouseY/3);  //connected to triangle 3
  vertex(500,300,-mouseY);  //connected to triangle 4 and 7
  vertex(600,400,0+mouseY/3);  //connected to triangle 9
  
  //Triangle 7
  fill(100,100,255);
  vertex(500,300,-mouseY);  //connected to triangle 4 and 6
  vertex(600,200,-mouseX);  //connected to triangle 5 and 8
  vertex(700,300,mouseY/3);  //connected to triangle 9 and 10
  
  //Triangle 8
  fill(75,75,75);
  vertex(600,200,-mouseX);  //connected to triangle 5 and 7
  vertex(700,100,0);  //FIXED
  vertex(800,200,-mouseX);  //connected to triangle 10
  
  //Triangle 9
  fill(125,125,125);
  vertex(600,400,0+mouseY/3);  //connected to triangle 6
  vertex(700,300,mouseY/3);  //connected to triangle 7 and 10
  vertex(800,400,0);  //FIXED
  
  //Triangle 10
  fill(200,200,200);
  vertex(700,300,mouseY/3);  //connected to triangle 7 and 9
  vertex(800,200,-mouseX);  //connected to triangle 8
  vertex(900,300,0);  //FIXED
  
  endShape();
}

