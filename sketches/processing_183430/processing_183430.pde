
float mida = random(20,50);
float velocitatX = random(0,100);
float velocitatY = random(0,50);
float posicioX = 100;
float posicioY = 200;

 
void setup () {
 size (500,500);
 background(0);

}
 
 
void draw () {
 strokeWeight(mouseY/2+mouseX/2);
 stroke(random(255),random(255),random(255),random(255)); 
 fill (random (255), random (255), random(255));
 ellipse(posicioX, posicioY, mida, mida);
  
 posicioX = posicioX +velocitatX;
 posicioY = posicioY+velocitatY;
 
 //rebot
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
  velocitatX = random(-10,10);
  velocitatY = random (-10,10);
  mida = random (10, 60);
   
}
