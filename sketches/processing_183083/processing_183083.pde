
//variables
int sz;
float posicioX;
float posicioY;
float velocitatX;
float velocitatY;
float colorLluna;
float colorSol1;
float colorSol2;
float colorSol3;

void setup() {
  size(800, 500);
  posicioX = width/2;
  posicioY = height/2;
  velocitatX = random(1,5);
  velocitatY = random(1,5);
  sz = 120;
}

void draw() {
  noStroke();
  
  //fons dia
  fill(230,240,250);
  rect(0,0,width/2,height);
    //núvols dia
    fill(255);
    ellipse(width/3,height/1.75,sz+50,sz-20);
    ellipse(width/4.5,height/1.75,sz+50,sz-20);
    ellipse(width/5,height/5,sz+10,sz/2);
    ellipse(width/9.5,height/5,sz+10,sz/2);
  
 //fons nit
  fill(5,15,90);
  rect(width/2,0,width/2,height);
    //estrelles nit
    fill(255,245,175);
    ellipse(width/1.5,height/4,sz/7,sz/7);
    ellipse(width/1.8,height/2,sz/9,sz/9);
    ellipse(width/1.2,height/7,sz/6,sz/6);
    ellipse(width/1.90,height/6,sz/11,sz/11);
    ellipse(width*0.9,height*0.8,sz/5,sz/5);
    ellipse(width*0.7,height*0.9,sz/10,sz/10);
    ellipse(width*0.6,height*0.65,sz/8,sz/8);
    ellipse(width/1.25,height*0.5,sz/12,sz/12);
   noFill();

  //moviment
  posicioX = posicioX + velocitatX;
  posicioY = posicioY + velocitatY;

  if (posicioX < 0 + sz/2 || posicioX > width - sz/2) {
    velocitatX = -velocitatX;
  }
  
  if (posicioY < 0 + sz/2 || posicioY > height - sz/2) {
    velocitatY = -velocitatY;
  }

  
  if(posicioX < width/2){ //sol
    fill(colorSol1,colorSol2,colorSol3);
    stroke(colorSol1,colorSol2,colorSol3);
    strokeWeight(3);
    line(posicioX+sz,posicioY,posicioX-sz,posicioY);
    line(posicioX,posicioY+sz,posicioX,posicioY-sz);
    line(posicioX-sz/2,posicioY-sz/2,posicioX+sz/2,posicioY+sz/2);
    line(posicioX+sz/2,posicioY-sz/2,posicioX-sz/2,posicioY+sz/2);

  } else { //lluna
   fill(colorLluna);
    noStroke();
  }
  
  ellipse(posicioX, posicioY, sz, sz);
  
  if(posicioX > width/2){ //cràters
    fill(100);
    ellipse(posicioX-20,posicioY-20,sz/4,sz/4);
    ellipse(posicioX+5,posicioY+10,sz/6,sz/7);
  }
}

void mousePressed(){
  //posicions
  posicioX = mouseX;
  posicioY = mouseY;
  //velocitats
  velocitatX = random(2,7);
  velocitatY = random(2,7);
  //colors 
  colorLluna = random(50,200);
  colorSol1 = 250;
  colorSol2 = random (0,100);
  colorSol3 = random (0,30);
}

//void mouseReleased(){ -- intent fallit

