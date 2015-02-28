
import processing.opengl.*;

float rot = 0;
float az = -1000;
float bz = -1000;
float cz = -1000;
float dz = -1000;
float ez = -1000;
float fz = -1000;
float hz = -1000;
float iz = -1000;
float jz = -1000;
float kz = -1000;
float lz = -1000;
float mz = -1000;
float r = random(255);
float g = random(255);
float b = random(255);
int cx;
float cy;
int cr = 200;
float rx = 0;
float ry = 0;

void setup(){
  size(800,600,OPENGL);
  background(0);
  rectMode(CENTER);
  frameRate(60);
  translate(0,0,-1000);
  for (int i = 1;i < 13;i++) {
    cx = i*200 - 100;

    if (i <= 4) {
      cy = height / 2 - cr;
    }
    else if (i <= 8) {
      cy = height / 2;
      cx = cx - 800;
    }
    else {
      cy = height / 2 + cr;
      cx = cx - 1600;
    }
    noFill();
    stroke(209, 204, 185);
    rect(cx, cy, cr, cr);
  }
}

void draw(){
 
 
  
  
  noStroke();
  fill(255);
  rect(50,50,50,50);
  if((mouseX < 75)&&(mouseY < 75)){
  if(mousePressed == true){
    background(0);
    r = 255;
    g = 255;
    b = 255;
      translate(0,0,-1000);
  for (int i = 1;i < 13;i++) {
    cx = i*200 - 100;

    if (i <= 4) {
      cy = height / 2 - cr;
    }
    else if (i <= 8) {
      cy = height / 2;
      cx = cx - 800;
    }
    else {
      cy = height / 2 + cr;
      cx = cx - 1600;
    }
    noFill();
    stroke(209, 204, 185);
    rect(cx, cy, cr, cr);
  }
  }
  }
 
  
  if((mouseX > 465)&&(mouseY > 335)){
  if(mousePressed == true){
    
     r = random(255);
     g = random(255);
     b = random(255);
  translate(700,500,lz);
  
    rotateX(rot);
    rot += r / 2550;
    rotateY(rot);
    rot += g / 2550;
    rotateZ(rot);
    rot += b / 2550;
    noStroke();
    fill(r,g,b);
    rect(0,0,200,200);
    lz = lz + 5;
    if(lz >= 100){
      lz = -1000;
    }
  }else if(mousePressed == true){
    lz = 0;
  }
  }else if((mouseX > 465)&&(mouseY > 268)){
  if(mousePressed == true){
    
     r = random(255);
     g = random(255);
     b = random(255);
  translate(700,300,mz);
 
    rotateX(rot);
    rot += r / 2550;
    rotateY(rot);
    rot += g / 2550;
    rotateZ(rot);
    rot += b / 2550;
    noStroke();
    fill(r,g,b);
    rect(0,0,200,200);
    mz = mz + 5;
    if(mz >= 100){
      mz = -1000;
    }
  }else if(mousePressed == true){
    mz = 0;
  }
  }else if((mouseX > 465)&&(mouseY > 200)){
  if(mousePressed == true){
    
     r = random(255);
     g = random(255);
     b = random(255);
  translate(700,100,kz);
 
    rotateX(rot);
    rot += r / 2550;
    rotateY(rot);
    rot += g / 2550;
    rotateZ(rot);
    rot += b / 2550;
    noStroke();
    fill(r,g,b);
    rect(0,0,200,200);
    kz = kz + 5;
    if(kz >= 100){
      kz = -1000;
    }
  }else if(mousePressed == true){
    kz = 0;
  }
  }else if((mouseX > 400)&&(mouseY > 335)){
  if(mousePressed == true){
    
     r = random(255);
     g = random(255);
     b = random(255);
  translate(500,500,jz);
 
    rotateX(rot);
    rot += r / 2550;
    rotateY(rot);
    rot += g / 2550;
    rotateZ(rot);
    rot += b / 2550;
    noStroke();
    fill(r,g,b);
    rect(0,0,200,200);
    jz = jz + 5;
    if(jz >= 100){
      jz = -1000;
    }
  }else if(mousePressed == true){
    jz = 0;
  }
  }else if((mouseX > 400)&&(mouseY > 268)){
  if(mousePressed == true){
    
     r = random(255);
     g = random(255);
     b = random(255);
  translate(500,300,iz);
 
    rotateX(rot);
    rot += r / 2550;
    rotateY(rot);
    rot += g / 2550;
    rotateZ(rot);
    rot += b / 2550;
    noStroke();
    fill(r,g,b);
    rect(0,0,200,200);
    iz = iz + 5;
    if(iz >= 100){
      iz = -1000;
    }
  }else if(mousePressed == true){
    iz = 0;
  }
  }else if((mouseX > 400)&&(mouseY > 200)){
  if(mousePressed == true){
    
     r = random(255);
     g = random(255);
     b = random(255);
  translate(500,100,hz);
 
    rotateX(rot);
    rot += r / 2550;
    rotateY(rot);
    rot += g / 2550;
    rotateZ(rot);
    rot += b / 2550;
    noStroke();
    fill(r,g,b);
    rect(0,0,200,200);
    hz = hz + 5;
    if(hz >= 100){
      hz = -1000;
    }
  }else if(mousePressed == true){
    hz = 0;
  }
  }else if((mouseX > 320)&&(mouseY > 335)){
  if(mousePressed == true){
    
     r = random(255);
     g = random(255);
     b = random(255);
  translate(300,500,bz);
 
    rotateX(rot);
    rot += r / 2550;
    rotateY(rot);
    rot += g / 2550;
    rotateZ(rot);
    rot += b / 2550;
    noStroke();
    fill(r,g,b);
    rect(0,0,200,200);
    bz = bz + 5;
    if(bz >= 100){
      bz = -1000;
    }
  }else if(mousePressed == true){
    bz = 0;
  }
  }else if((mouseX > 320)&&(mouseY > 268)){
  if(mousePressed == true){
    
     r = random(255);
     g = random(255);
     b = random(255);
  translate(300,300,fz);
 
    rotateX(rot);
    rot += r / 2550;
    rotateY(rot);
    rot += g / 2550;
    rotateZ(rot);
    rot += b / 2550;
    noStroke();
    fill(r,g,b);
    rect(0,0,200,200);
    fz = fz + 5;
    if(fz >= 100){
      fz = -1000;
    }
  }else if(mousePressed == true){
    fz = 0;
  }
  }else if((mouseX > 320)&&(mouseY > 200)){
  if(mousePressed == true){
    
     r = random(255);
     g = random(255);
     b = random(255);
  translate(300,100,ez);
 
    rotateX(rot);
    rot += r / 2550;
    rotateY(rot);
    rot += g / 2550;
    rotateZ(rot);
    rot += b / 2550;
    noStroke();
    fill(r,g,b);
    rect(0,0,200,200);
    ez = ez + 5;
    if(ez >= 100){
      ez = -1000;
    }
  }else if(mousePressed == true){
    ez = 0;
  }

  }else if((mouseX > 250)&&(mouseY > 335)){
  if(mousePressed == true){
    
     r = random(255);
     g = random(255);
     b = random(255);
  translate(100,500,dz);
 
    rotateX(rot);
    rot += r / 2550;
    rotateY(rot);
    rot += g / 2550;
    rotateZ(rot);
    rot += b / 2550;
    noStroke();
    fill(r,g,b);
    rect(0,0,200,200);
    dz = dz + 5;
    if(dz >= 100){
      dz = -1000;
    }
  }else if(mousePressed == true){
    dz = 0;
  }
  }else if((mouseX > 250)&&(mouseY > 268)){
  if(mousePressed == true){
    
     r = random(255);
     g = random(255);
     b = random(255);
  translate(100,300,cz);
 
    rotateX(rot);
    rot += r / 2550;
    rotateY(rot);
    rot += g / 2550;
    rotateZ(rot);
    rot += b / 2550;
    noStroke();
    fill(r,g,b);
    rect(0,0,200,200);
   cz = cz + 5;
    if(cz >= 100){
      cz = -1000;
    }
  }else if(mousePressed == true){
    cz = 0;
  }
  }else  if((mouseX > 250)&&(mouseY > 200)){
  if(mousePressed == true){
    
     r = random(255);
     g = random(255);
     b = random(255);
  translate(100,100,az);
 
    rotateX(rot);
    rot += r / 2550;
    rotateY(rot);
    rot += g / 2550;
    rotateZ(rot);
    rot += b / 2550;
    noStroke();
    fill(r,g,b);
    rect(0,0,200,200);
    az = az + 5;
    if(az >= 100){
      az = -1000;
    }
  }else if(mousePressed == true){
    az = 0;
  } 
  }
  
  
 

}



  


