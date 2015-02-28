
// 3D triangles
// Nov 21, 2011
// Ben Light bl1236@nyu.edu
// ICM
// Triangles will change position based on mouse X and Y

void setup(){
  size(800,400, P3D);
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
  vertex(100,200,0);  //FIXED
  vertex(150,150,-mouseX);  //connected to triangle 2
  vertex(200,200,mouseY/3);  //connected to triangle 3 and 4
  
  //2
  vertex(150,150,-mouseX);  //connected to triangle 1
  vertex(200,100,0);  //FIXED
  vertex(250,150,-mouseX);  //connected to triangle 4 and 5
  
  //Triangle 3, blue
  vertex(150,250,0);  //FIXED
  vertex(200,200,mouseY/3);  //connected to triangle 1 and 4
  vertex(250,250,0+mouseY/3);  //connected to triangle 6
  
  //Triangle 4, white 
  vertex(200,200,mouseY/3);   //connected to triangle 1 and 3
  vertex(250,150,-mouseX);  //connected to triangle 2 and 5
  vertex(300,200,-mouseY);  //connected to triangle 6 and 7
  
  //Triangle 5,
  vertex(250,150,-mouseX);  //connected to triangle 2 and 4
  vertex(300,100,0-mouseY/3);  
  vertex(350,150,-mouseX);  //coonected to triangle 7 and 8
  
  //Triangle 6
  vertex(250,250,0+mouseY/3);  //connected to triangle 3
  vertex(300,200,-mouseY);  //connected to triangle 4 and 7
  vertex(350,250,0+mouseX/3);  //connected to triangle 9
  
  //Triangle 7
  vertex(300,200,-mouseY);  //connected to triangle 4 and 6
  vertex(350,150,-mouseX);  //connected to triangle 5 and 8
  vertex(400,200,mouseY/3);  //connected to triangle 9 and 10
  
  //Triangle 8
  vertex(350,150,-mouseX);  //connected to triangle 5 and 7
  vertex(400,100,0);  //FIXED
  vertex(450,150,-mouseX);  //connected to triangle 10
  
  //Triangle 9
  vertex(350,250,0+mouseX/3);  //connected to triangle 6
  vertex(400,200,mouseY/3);  //connected to triangle 7 and 10
  vertex(450,250,0+mouseX/3);  //FIXED
  
  //Triangle 10
  vertex(400,200,mouseY/3);  //connected to triangle 7 and 9
  vertex(450,150,-mouseX);  //connected to triangle 8
  vertex(500,200,-mouseY);  //FIXED
  
  //11
  vertex(450,150,-mouseX);  //connected to 8 and 10
  vertex(500,100,0-mouseY/3);  //
  vertex(550,150,-mouseX);  //connected to 13 and 14
  
  //12
  vertex(450,250,0+mouseX/3);  //connected to 9
  vertex(500,200,-mouseY);  //connected to 10 and 13
  vertex(550,250,0+mouseY/3);  //connected 15
  
  //13
  vertex(500,200,-mouseY);  //connected to 10 and 12
  vertex(550,150,-mouseX);  //connected to 11 and 14
  vertex(600,200,mouseY/3);  //connected tp 15 and 16
  
  //14
  vertex(550,150,-mouseX);  //connected to 11 and 13
  vertex(600,100,0);  //FIXED
  vertex(650,150,-mouseX);  //connected to 16
  
  //15
  vertex(550,250,0+mouseY/3);  //connected to 12
  vertex(600,200,mouseY/3);  //connected to 13 and 16
  vertex(650,250,0);  //FIXED
  
  //16
  vertex(600,200,mouseY/3);  //connected to 13 and 15
  vertex(650,150,-mouseX);  //connected to 14
  vertex(700,200,0);  //FIXED
  
  endShape();
}

