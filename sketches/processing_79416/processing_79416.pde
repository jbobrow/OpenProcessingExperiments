
/*2 personajes distintos
con 4 variables modificablers distintas entre uno i otro
*/

void setup(){
size(400, 300); 
background(255);
}

void draw(){
  aceituno(20, 60, color(128, 128, 0), 4);
  huevo(200, 60, color(255, 165, 0));
  
}

void aceituno(int x, int y, color c, int borde){
  pushMatrix();
   translate(x, y);
   fill(c);
   stroke(borde);
   ellipse(40, 40, 80, 100);
   fill(0);
   ellipse(40, 25, 10, 10);
   ellipse(70, 25, 10, 10);
  popMatrix();
}

void huevo(int x, int y, color yema){
 pushMatrix();
 translate(x, y);
 fill(255);
 ellipse(80, 40, 150, 140);
 fill(yema);
 ellipse(80, 40, 50, 50);
 
 popMatrix(); 
}
