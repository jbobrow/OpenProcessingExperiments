
//Carla Barrenechea: dibuix que rebota amb nombres aleatoris i que ho fa a partir d'apretar el ratolí.

float posX, posY, velX, velY;// definim les variables de posició i velocitat

//al setup les coses fixes

void setup(){
  size(700,700);
  posX = width/2;
  posY = height/2;
  velX = random(1,4);
  velY = random(1,4);
}

//per a que tot el perfonatge sigui un únic element fem un void, un "conjunt"
void personatge (float _X, float _Y){
    //cabell
  strokeWeight(10);
  stroke(98,39,0);
  line(posX-60,posY-110,posX,posY);
  line(posX,posY-125,posX,posY);
  line(posX+60,posY-110,posX,posY);
  
  //cara
  stroke(162,87,11);
  strokeWeight(3);
  fill(224,132,34);
  ellipse(posX,posY-10,200,170); //cara
  fill(255,0,68,90+velX);
  stroke(165,23,61);
  ellipse(posX,posY,25,25);//nas
  
  stroke(0);
  strokeWeight(2);
  noFill();
  arc(posX,posY+50,50,25,0.5,HALF_PI);//boca

  //ulls
  noStroke();
  fill(0);
  ellipse(posX-50,posY-30,50,50);
  ellipse(posX+50,posY-30,50,50);
  fill(255);
  ellipse(posX+40,posY-30,15,15);
  ellipse(posX-60,posY-30,15,15);  
  
  //ulleres
  strokeWeight(5);
  stroke(47,67,77);
  line(posX-15,posY-30,posX+15,posY-30);//pont de les ulleres
  fill(0,168,255,97);
  ellipse(posX-60,posY-30,100,100);//ullera dreta
  ellipse(posX+60,posY-30,100,100);//ullera esquerra
}

//i finalment les coses que estan constantment redibuixant-se:

void draw(){
  background(posX,posY,50);

  //s'actualitzen les posicions per a que cada vegada vagi agafant una posicio difent i pugui avançar
  posX = posX+velX;
  posY = posY+velY;

  //es posa el personatge amb les variables de posX i pos Y
  personatge (posX,posY);

  //fem la comprovació per si surt dels marges per X
  if((posX<110)||(posX>width-110)){
    velX = -velX;
  } 
  //comprovació per si surt dels marges per Y
  if((posY<130)||(posY>height-80)){
    velY = -velY;
  } 
  
}

void mousePressed(){
  
  posX = mouseX;
  posY = mouseY;
  velX = random(1,15);
  velY = random(1,15);
}


