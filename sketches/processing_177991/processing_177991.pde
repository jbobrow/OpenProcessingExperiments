
void setup () {
  size(600, 600); 
  background(255);
  smooth();
  noCursor();
  stroke (220);
  for (int i = -1; i < width; i = i+width/10+1) {
    line(0, i, width, i);
    line(i, 0, i, height);
  }//referencia espacial cuadrÃ­cula
}//fin setup

void draw () {

  //background(255);
  float dim=random(10, 100), dim2= random(10, 100);//dimensiÃ³n elipse, cuadrado
  float xe=random(dim, width-dim), ye=random(dim, height-dim);//coordenadas elipse
  float xr=random(dim, width-dim), yr=random(dim, height-dim);//coordenadas cuadrado
  float r=random(0, 255);
  float g=random(0, 255);
  float b=random(0, 255);

  frameRate(random(1, 5));//velocidad aleatoria

  stroke(r, g, g);//color de lÃ­nea
  strokeWeight(random(1, 5));//grosor lÃ­nea
  line(xe, ye, xr, yr);//longitud y posiciÃ³n de lÃ­nea

  noStroke();//no hay bordes por defecto
  if (r==255 && g==255 && b==255) {
    stroke(r, g, b);
  }//fin if. Si el relleno es blanco aparece un borde

  if (r>50 && b>50 && g>50) {
    stroke(r, g, b);
  }//fin if. Aveces aparecen los bordes

  strokeWeight(random(1, 3));//grosor borde cÃ­rculo  
  fill(r, g, b, random(0, 255));//relleno cÃ­rculo
  ellipse(xe, ye, dim, dim);//dimensiÃ³n y posiciÃ³n cÃ­rculo

  strokeWeight(random(1, 3));//grosor borde cuadrado
  fill(r, b, g, random(0, 255));//relleno cuadrado
  rectMode(CENTER);
  rect(xr, yr, dim2, dim2);//dimensiÃ³n y posiciÃ³n cuadrado

  fill(255, 10);//transparencia fondo
  rect(width/2, height/2, width+10, height+10);//fondo
}//fin draw

void mousePressed() {
  background(255);
  strokeWeight(1);
  stroke (220);
  for (int i = -1; i < width; i = i+width/10+1) {
    line(0, i, width, i);
    line(i, 0, i, height);
  }//referencia espacial cuadrÃ­cula

}//fin mouse

void keyPressed() {
  saveFrame("map_#####.JPG");
}//fin key
