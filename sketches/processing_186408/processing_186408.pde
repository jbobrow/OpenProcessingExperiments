
PVector pos, vel, mouse, center, bola, limite;
float dt = 1/60.0;
float mX, mY;
String s = "Pulsa 'espacio' para disparar la bola";

void setup() {
  size(800,400);
  
  mouse = new PVector(0,0);   
  center = new PVector(width/2,height/1.5);
  pos = new PVector(0, 0);
  vel = new PVector(0, 0);
  bola = new PVector(0,0);
  limite = new PVector(0,0);  
 
}

// Cuando se pulsa espacio se utiliza la fórmula x=x+v*t para darle la dirección a la bola
void keyPressed(){
  switch(key){
    case ' ':
      pos.x += vel.x*dt;
      pos.y += vel.y*dt;
    break;
   
  };
}

void draw() { 
  background(255);
  
  fill(0,0,200);
  textSize(20);
  text("Bubble-shooter",25,50);
  
  fill(0);
  textSize(15);
  text(s, 275,350);
  
  stroke(0);
  line(width/2-100, height/1.5, width/2+100, height/1.5); 
  
  //Se recoge la posición del ratón, se resta el centro y se normaliza
  mouse.x = mouseX;
  mouse.y = mouseY;   
  mouse.sub(center); 
  mouse.normalize();  
  mouse.mult(100);
  
  mX = mouse.x;
  mY = mouse.y;
  
  //Se le pasa la posición recogida para que la velocidad vaya en la dirección recogida
  vel.x = mX;
  vel.y = mY;
  
  pushMatrix();
    translate(width/2,height/1.5);
    stroke(0);
    strokeWeight(2);
    line(0,0,mouse.x,mouse.y);  
  popMatrix();
  
  //Se actualiza la posición de la bola con la velocidad recogida cuando se pulsa
  bola.x += pos.x;
  bola.y += pos.y;
  
  //Se dibuja y actualiza la bola
  stroke(0);
  fill(175);
  ellipse(width/2+3*bola.x,height/1.5+3*bola.y,16,16);
  limite.x = width/2+3*bola.x;
  limite.y = height/1.5+3*bola.y;
  
  // Si sale la bola de los márgenes vuelve al inicio
  if (limite.x < 0 || limite.x > width || limite.y > height || limite.y < 0){
    bola.x = 0;
    bola.y = 0;
    pos.x = 0;
    pos.y = 0;
  }
}


