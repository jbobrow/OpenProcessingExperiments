
void renderArms(){
  //pushMatrix();
  int r = int(random(5));
  if(r == 0){
    shape(v0, posX, posY, width, height);
  }
  if(r == 1){
    shape(v1, posX, posY, width, height);
  }
  if(r == 2){
    shape(v2, posX, posY, width, height);
  }
  if(r == 3){
    shape(v3, posX, posY, width, height);
  }
  if(r == 4){
    shape(v4, posX, posY, width, height);
  }
  //popMatrix();
}

void renderBody(){
  //pushMatrix();
  int r = int(random(5));//se pinta uno de los 5 cuerpos al azar
  if(r == 0){
    shape(s0, posX, posY, width, height);
  }
  if(r == 1){
    shape(s1, posX, posY, width, height);
  }
  if(r == 2){
    shape(s2, posX, posY, width, height);
  }
  if(r == 3){
    shape(s3, posX, posY, width, height);
  }
  if(r == 4){
    shape(s4, posX, posY, width, height);
  }
  //popMatrix();
}

void renderLegs(){
  //pushMatrix();
  int r = int(random(5));
  if(r == 0){
    shape(w0, posX, posY, width, height);
  }
  if(r == 1){
    shape(w1, posX, posY, width, height);
  }
  if(r == 2){
    shape(w2, posX, posY, width, height);
  }
  if(r == 3){
    shape(w3, posX, posY, width, height);
  }
  if(r == 4){
    shape(w4, posX, posY, width, height);
  }
  //popMatrix();
}

void renderMouth(){
  //pushMatrix();
  int r = int(random(5));
  if(r == 0){
    shape(t0, posX, posY, width, height);
  }
  if(r == 1){
    shape(t1, posX, posY, width, height);
  }
  if(r == 2){
    shape(t2, posX, posY, width, height);
  }
  if(r == 3){
    shape(t3, posX, posY, width, height);
  }
  if(r == 4){
    shape(t4, posX, posY, width, height);
  }
  //popMatrix();
}

void renderEyes(){
  //pushMatrix();
  int r = int(random(5));
  if(r == 0){
    shape(u0, posX, posY, width, height);
  }
  if(r == 1){
    shape(u1, posX, posY, width, height);
  }
  if(r == 2){
    shape(u2, posX, posY, width, height);
  }
  if(r == 3){
    shape(u3, posX, posY, width, height);
  }
  if(r == 4){
    shape(u4, posX, posY, width, height);
  }
  //popMatrix();
}


void moveEyes(){
  //translate(posX/2,posY/2);
  fill(0);
  float r= random(2,15);
  ellipse(posX+width/2-width/10,posY+height/2-height/11,r,r);
  ellipse(posX+width/2+width/10,posY+height/2-height/11,r,r);
}







