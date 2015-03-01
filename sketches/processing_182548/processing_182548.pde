
float posicioX = 400;
float posicioY = 300;
float sz = 35;
float velocitatX = 3;
float velocitatY = 4;
PImage foto;
PImage foto2;
PImage foto3;



void setup(){
  
  size(800, 600);
  foto = loadImage("soccer.jpg");
  foto2 = loadImage("Germany.jpg");
  foto3 = loadImage("Brasil.jpg");

}

void draw(){
  background(0);
  image(foto2, 0, 0, width/2, height);
  image(foto3, width/2, 0, width/2, height);
  image(foto, 50, 50, width-100, height-100);
  
  
   //elipse
  ellipse(posicioX, posicioY, sz, sz);
  
  //text
  textSize(26);
  text("GERMANY 7 - 1 BRASIL", 235, 35);
 
  //velocitat
  posicioX = posicioX + velocitatX;
  posicioY = posicioY + velocitatY;
  
  //condicionals
  if(posicioX +sz/2 >= width-55||posicioX -sz/2<= 55){
velocitatX = -velocitatX;
}

if(posicioY + sz/2>= height-55||posicioY -sz/2<= 55){
velocitatY = -velocitatY;
}
  
  
  
}

 //mousePressed
  void mousePressed(){
  velocitatX = random(-25, 10);
  velocitatY = random(-25, 10);
  posicioX = mouseX;
  posicioY = mouseY;
  fill(random(255), random(255), random(255));
  
}

