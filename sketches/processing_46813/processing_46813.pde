
void setup()
{
  size(500,500);
  smooth();
  noLoop();
}
 
void draw()
{
  background(0,120,2,0);   
  strokeWeight(4);//grosor de la línea
  translate(width/2,height-20);//ubicación en la ventana
  branch(1);//como se desprende laas ramas de la rama principal
}
 
void branch(int depth){
  if (depth < 12) {
    line(0,0,0,-height/5);
    {
      translate(0,-height/8);
      rotate(random(-0.01,0.1)); //inclinación 
 
      if (random(1.0) < 0.9){ // enfoque ramas
        rotate(0.3);
        scale(0.7);
        pushMatrix();
        branch(depth + 1);
        popMatrix();    
        rotate(-0.6);
        pushMatrix();
        branch(depth + 1);   
        popMatrix();        
      }
      else { // continue  
        branch(depth);
      }
    }
  }
}
 
 
void mouseReleased(){
  redraw(); 
}

