
float posX;
float posY;
int strokeMin;
int strokeMax;
int nLines;
int opacity;

int[] cores;

//Definindo as cores
color amarelo; 
color vermelho;  
color verde;
color roxo;
color magenta;
color verdeClaro;
color ciano;
color laranja;  

void setup(){
 
  //Definindo as cores
  amarelo = color(253, 184, 19); 
  vermelho = color(201, 37, 44);  
  verde = color(0, 169, 157);
  roxo = color(126, 73, 156);
  magenta = color(236, 0, 140);
  verdeClaro = color(166, 206, 57);
  ciano = color(0, 189, 242);
  laranja = color(243, 112, 33);  

  size(600, 800, JAVA2D);
  background(0);
  smooth();

  //Armazenando as cores em um array
  cores = new int[8];
  cores[0] = magenta;
  cores[1] = amarelo;
  cores[2] = verde;
  cores[3] = roxo;
  cores[4] = verdeClaro;
  cores[5] = vermelho;
  cores[6] = ciano;
  cores[7] = laranja;
  
  strokeMin = 5;
  strokeMax = 40;
  nLines = 120;
  
  noLoop();
}

void draw(){
  noFill();
  for(int i = 0; i < nLines; i++){
    opacity = int(random(0, 100));
    strokeWeight(int(random(strokeMin, strokeMax)));
    stroke(cores[int(random(cores.length-1))], opacity);
    posX = int(random(0, 8));
    posY = int(random(0, 10));
  
    pushMatrix();
      translate(map(posX, 0, 8, 0, width), map(posY, 0, 10, 0, height));
      rotate(PI/3);
      line(-2000, 0, 2000, 0);
      rotate(-2*PI/3);
      line(-2000, 0, 2000, 0);
     popMatrix();
  }
}

