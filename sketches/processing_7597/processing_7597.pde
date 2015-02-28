
void setup(){
  size (1000,1000) ;
  background (0,0,0);
  smooth();
}


void draw(){
  background (0,0,0);
  //fill( random (100),200,200,100);
  //rect (random(900),200,random (400),random(80));
  
  //fill( random (100),200,200,100);
  //rect (500,random(400),random (400),random(80));
  
 // stroke(random(255),random(255),random(255));
  //fill( random (100),200,200,100);
  //rect (500,random(400),random (400),random(80));
  
  translate(500,500);
  rotate (mouseY);
  
  fill( random (250),200,random(200),100);
  triangle(random(500),random(500),random(500),random(500),random(500),random(400));
}





