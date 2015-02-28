


float margen, sp;

void setup(){
  margen = 20;
  sp = 25;
  size(500, 500);
  smooth();
  //noStroke();
}


void draw(){
  background(0);
  for(float y =margen; y <= height-margen; y += sp){
    for(float x = margen; x <= width-margen; x += sp){
      float d; //esta es la distancia
      d = 100 - sqrt((mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY - y));
    
    noStroke();
      fill(x,y, 250, 100);
ellipse(mouseX,y, 50/d, 50/d); 
ellipse(x,mouseY, 50/d, 50/d); 

    }
  }
}
void mousePressed(){ 
  println("vertex("+mouseX+", "+mouseY+");"); 
} 
void keyPressed(){ 
  saveFrame("paulinaorellana.jpg"); 
  println("fotograma grabado"); 
} 


