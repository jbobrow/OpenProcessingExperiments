
/*Author: Rafaela Somavila Lima*/

PImage d;

void setup(){
  size (600, 600);
  background(0);
  d = loadImage("http://reprog.files.wordpress.com/2010/04/doctors.jpg");
}

void draw() {
  /*map(): map(value, low1, high1, low2, high2)    
  value - float: número para mapear
  start1 - float: mínimo do alcance do valor atual
  stop1 - float: máximo do alcance do valor atual
  start2 - float: valor mínimo do novo alcance
  stop2 - float: valor máximo do novo alcance
  */
  
   //value = X do mouse; low1 = 0; high1 = altura; low2 = 0; high2 = 255
  float red =map(mouseX, 0, width, 0, 255);
   //value = Y do mouse; low1 = 0; high1 = altura/2; low2 = 0; high2 = 255
  float green =map(mouseY, 0, width/2, 0, 255); 
  //bg
  fill(red, green, 150); //azul começa em 150, varia o vermelho e o verde
  rect(0, 0, width, height);

  //centraliza a imagem  
  imageMode(CENTER);
  image (d, 300, 300);

}
void mouseClicked() {

  tint(random(200), random(255), random(230), 130);
  imageMode(CENTER);
  image (d,300, 300);
}




