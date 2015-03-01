
PVector mouse,centro,bala,aux;
boolean disparo;
float v;
void setup(){
  size(800,500);
  mouse= new PVector(mouseX,mouseY);
  centro = new PVector(width*0.5,height-100);
  bala = new PVector(0,0); 
  aux = new PVector(0,0); 
  disparo = false;
  v=0.1;
  stroke(190,90,0);
  strokeWeight(2);
  fill(70,180,100);
  smooth();
  
}
void draw(){
  background(0);
  mouse.x=mouseX;
  mouse.y=mouseY;
  
  mouse.sub(centro);
  mouse.normalize();
  mouse.mult(75);

  translate(centro.x, centro.y);
  line(0, 0, mouse.x, mouse.y);
   if (disparo){
     bala.x+= v*aux.x;
     bala.y+= v*aux.y;
   if ( (bala.x > centro.x || bala.x < -centro.x) || -bala.y>centro.y) {
      disparo = false;
    }
   }
   else{
     bala.x = mouse.x;
     bala.y = mouse.y;      
   }
    ellipse(bala.x, bala.y, 40, 40);
    if (mousePressed) {
      if(!disparo)
      {
      disparo=true;
      aux.set(mouse);
      }
      
    }
}



