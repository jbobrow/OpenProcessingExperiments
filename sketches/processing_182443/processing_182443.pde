
float mida = random(30,100); 
float posicioX = 300; 
float posicioY = 250;
float velocitatX = random(-20,6);
float velocitatY = random(-20,6);


void setup () {
 size (700,500);
 noStroke();  
}


void draw () {
 background(0); 
 
 ellipse(posicioX, posicioY, mida, mida);
 
 posicioX = posicioX + velocitatX;
 posicioY = posicioY + velocitatY; 
 
 if(posicioX-mida/2 <=0 ||posicioX+mida/2 >= width) {
   velocitatX = - velocitatX; 
 }  
   
 if (posicioY-mida/2 <=0 ||posicioY + mida/2 >= height){  
   velocitatY = - velocitatY;
 }  
}
 
 void mousePressed () {
  posicioX = mouseX;
  posicioY = mouseY;
  velocitatX = random(-20,6);
  velocitatY = random (-20,6);
  mida = random (30, 100);
  fill (random (255), random (255), random(255));
  
}
