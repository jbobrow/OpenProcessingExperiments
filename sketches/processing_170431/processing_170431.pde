
float circulox ;
float circuloy;
int dim; 
float velocidad = 0.9;
int r = 100;
int g = 100;
int b = 200;
 

void setup (){
size (400, 400);
background(255);
circulox = 0;
circuloy = 100;
dim = 50;
velocidad = 0.7;
frameRate (20);

}//fin setup

void draw (){
  //background(255);
  fill (0, 0.1);
  rect (-10,-10, width * 2, height * 2);
  
  
  
 
  
 // ellipse (circulox, circuloy, dim, dim  );
 // ellipse (circulox, circuloy, dim, dim  ); 
  
  noStroke();
  float dim2 = random (100);
  
  fill (random(0,255), random(0,255),random(0,255));
  
  //ellipse (random(width), random (height), dim2 , dim2 );
  ellipse (mouseX + random (100), mouseY + random (100), dim2 , dim2 );
  circulox = circulox + velocidad;
  println(circulox);
  
  
 

}// fin draw

void mousePressed (){
  background(255);
  
}
