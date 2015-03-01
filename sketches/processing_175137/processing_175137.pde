
float posX, posY, velX, velY;
int sz = 20;

void setup(){
  size(300,200);
  posX = width/2;
  posY = height/2;
  velX = random(5);
  velY = random(5);
}

void draw(){
  background(0);
  stroke(255,0,0); //color linea caja
  fill(0); //fondo caja negro
  rect(50,50,200,100); //dibujamos caja

  //actualizamos posiciones
  posX = posX+velX;
  posY = posY+velY;

  //dibujamos elipse
  fill(255);
  ellipse(posX,posY,sz,sz);

  //comprovem posición X
  if((posX<50+sz/2)||(posX>250-sz/2)){ //Si pos es menor al limite de la caja o mayor
  //aqui añadimos sz/2 para que la bola rebote en el extremo con la caja
    velX = -velX;
  } 
  //comprovem posición Y
  if((posY<50+sz/2)||(posY>150-sz/2)){ //lo mismo para Y
    velY = -velY;
  } 
}

void mousePressed(){
  
  posX = mouseX; //cada vez que "clickemos" cambia de pos, y vel.
  posY = mouseY;
  velX = random(1,10);
  velY = random(1,10);
}



