
//Genera puntos aleatoriamente de tamaños diferentes
//decide si pintar el punto si el numero generado aleatoriamente es 0
//elige la posicion aleatoriamente basado en el consecutivo del punto
//genera una nebula constituida de 6 triangulos con posicion aleatoria
//al dar click se pinta otro "espacio profundo"
 
PImage deepSpace;
 
void setup(){
  size(800, 400);  
  frameRate(1);
  drawSpace();
}
 
void drawSpace(){
  background(0);
  drawStarts(80 , 1, 5);        
  drawStarts(130, 2, 20);
  drawStarts(255, 3, 60);
  deepSpace = get();
}
 
void draw(){        
  image(deepSpace);  
  drawNebula(); 
}
 
void drawStarts(s, sw, r){        
  stroke(s);
  strokeWeight(sw);
  for (int x=0; x<(width/4); x++) {
    for (int y=0; y<(height/4); y++) {
      if (floor(random(r)) == 0){
        point(x*random(10),y*random(10));
      }
    }
  }
}
 
void drawNebula(){  
  color c = color(random(200),random(200),random(200));
  stroke(c,90);
  fill(c,60);
  
  for (i=0; i<6; i++) {
    triangle(  -width + random(70),
                (height/2) - random(70),
                width + random(70),
                (height/2) + random(100),
                width + random(70),
                (height/2) + random(100));
  }
}
 
void mousePressed(){
        drawSpace();
        draw();
}
