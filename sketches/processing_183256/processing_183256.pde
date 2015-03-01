
float posicioX = 300;
float posicioY = 300;
float velocitatX = 8;
float velocitatY = 2;
float velocitat = 5;
int sz = 40;


void setup(){
 size(600,450); 
 fill(255,100,100);
 rectMode(CENTER);
 }

void draw(){
  background(62,214,230);
  fill(26,124,31);
  rect(0,420,1200,200);
  posicioX = posicioX + velocitatX;
  posicioY = posicioY + velocitatY;
  if (posicioX + sz/2 >= width||posicioX - sz/2 <= 0) {
    velocitatX = -velocitatX;
  }
  
  if (posicioY + sz/2 >= height||posicioY - sz/2 <= 0) {
    velocitatY = -velocitatY;
  }
  
  fill(84,84,84);
  rect(200,220,25,300);
  
  fill(242,242,242);
  rect(200,100,150,100);
  
  fill(0);
  rect(200,100,75,50);
  
  fill(242,242,242);
  rect(200,100,60,38);
  
  fill(216,110,22);
  rect(200,125,20,10);
  ellipse(200,130,50,10);
    
  

  fill(216,110,22);
  ellipse (posicioX, posicioY, sz, sz);


}

void mousePressed() {
  velocitatX = random (-20,20);
  velocitatY = random (-20,20);
  posicioX = mouseX;
  posicioY = mouseY;
}
