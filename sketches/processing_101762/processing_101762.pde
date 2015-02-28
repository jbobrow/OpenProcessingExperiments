
Onibus MeuOnibus1;
Onibus MeuOnibus2;
Onibus MeuOnibus3;
PImage img;
void setup(){
  size(900, 300);
  MeuOnibus1 = new Onibus(1 , 1); 
  MeuOnibus2 = new Onibus(2 , 1);
  MeuOnibus3 = new Onibus(3 , 0);   
  img = loadImage("rua.png");
}

void draw(){
  background(255);
  image(img, 0 , 0);
  MeuOnibus1.dirigir();
  MeuOnibus1.mostrar();
  MeuOnibus2.dirigir();
  MeuOnibus2.mostrar();
  MeuOnibus3.dirigir();
  MeuOnibus3.mostrar();
  fill(40);
  rect(0, 270, 900, 270);
}
class Onibus {
  float x_pos;
  float num_bus;
  float articulacao;
  float speed;
  float ultimo;
  
  
  Onibus(float bus, float art) {
    x_pos = 0;
    speed = -4;
    num_bus = bus;
    articulacao = art;
    
  }
  
  void mostrar(){
    fill(30,59,247);
    rect(60 + num_bus * 250 + x_pos, 120, 210, 120);
    ellipseMode(RADIUS);
    fill(0);
    ellipse(120 + num_bus * 250 + x_pos, 240, 30, 30);
    ellipse(210 + num_bus * 250 + x_pos, 240, 30, 30);
    fill(255,255,255);
    rect(90 + num_bus * 250 + x_pos, 150, 150, 30);
    line(120 + num_bus * 250 + x_pos, 150, 120 + num_bus * 250 + x_pos, 180);
    line(210 + num_bus * 250 + x_pos, 150, 210 + num_bus * 250 + x_pos, 180);
    line(165 + num_bus * 250 + x_pos, 150, 165 + num_bus * 250 + x_pos, 180);
    //articulacao
    if (articulacao == 1){
      fill(50);
      rect(270 + num_bus * 250 + x_pos, 125, 40, 110);  
    }
    if (num_bus == 1){
      fill(255);
      rect(60 + num_bus * 250 + x_pos, 135, 20, 75);
    }
    
  }
  
  void dirigir(){
    x_pos = x_pos + speed;
    if (x_pos < -1000){
      x_pos = 0;
    }
    text(x_pos, 10, 20); 
  }
}

//----------------------------------------------------------

//Jordy e Julia. Ligeirao andando




