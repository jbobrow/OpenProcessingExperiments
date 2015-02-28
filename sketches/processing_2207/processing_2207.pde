
float ojoX;  
float ojoY;
float ojoX2; 
float ojoY2; 
float ojoSz; 
float ojoSz2; 

////////////////////////////////////////////////////////////////////////////// 

void setup(){ 
  size(400, 400); 
  smooth(); 
  colorMode(HSB, 255); 
 
  ojoY = height/2; 
  ojoX = width/2-15;
  ojoSz = 30; 
  ojoX2 = width/2+15; 
  ojoY2 = height/2; 
  ojoSz2 = 30; 

} 
 
void draw(){ 
  background(255); 
  dibujaOjo();   
  dibujaOjo2();  
} 

//////////////////////////////////////////////////////////////////////////////
 
void dibujaOjo(){ 
  strokeWeight(2); 
  pushMatrix();
  translate(ojoX, ojoY); 
  noStroke (); //cola
  fill (100);
  ellipse (0,50, 8,8);
  stroke (255);
  ellipse (0,40, 14,12);
  ellipse (0,30, 20,18);
  noStroke ();
  fill (160);
  ellipse(15, 0, 60, 60); //cuerpo
  
  fill(255); 
  stroke (220);
  ellipse(0, 0, ojoSz, ojoSz); 
   
  rotate(atan2(mouseY-ojoY, mouseX-ojoX)); 
   
  float distancia = dist(mouseX, mouseY, ojoX, ojoY); 
  float iris = constrain(distancia, 0, ojoSz/4); 
  
  translate(iris, 0); 
  fill(200, 200, 200); 
  strokeWeight(3); 
  ellipse(0, 0, ojoSz/2, ojoSz/2); 
   // println (ojoX);
  popMatrix();
}

//////////////////////////////////////////////////////  

void dibujaOjo2(){ 
  strokeWeight(2); 

  translate(ojoX2, ojoY2); 
  fill(255); 
  stroke (220);
  ellipse(0, 0, ojoSz2, ojoSz2); 
  
   
  rotate(atan2(mouseY-ojoY2, mouseX-ojoX2)); 
   
  float distancia2 = dist(mouseX, mouseY, ojoX2, ojoY2); 
  float iris2 = constrain(distancia2, 0, ojoSz2/4); 
  
  
  translate(iris2, 0); 
  fill(200, 200, 200); 
  strokeWeight(3); 
  ellipse(0, 0, ojoSz2/2, ojoSz2/2); 
   // println ( ojoX2);
  
}
//////////////////////////////////////////////////////

void mousePressed(){ 
  ojoX = mouseX-15; 
  ojoY = mouseY; 
  ojoX2 = mouseX+15; 
  ojoY2 = mouseY; 
} 
 
void mouseDragged(){ 
  ojoX = mouseX-15; 
  ojoY = mouseY; 
  ojoX2 = mouseX+15; 
  ojoY2 = mouseY; 
} 

void keyPressed(){ 
  saveFrame("screen.png"); 
}

