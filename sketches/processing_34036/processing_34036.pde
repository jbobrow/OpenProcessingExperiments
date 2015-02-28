
float cor, tamanho; //grava um comando, se chama variavel

color cor1, cor2, cor3, cor4, cor5;
color corAtual;

void setup() { //faz o movimento repetir somente uma vez
  size(1000,1000); //largura*altura)(horizontal,vertical)
  smooth(); // suaviza o traço
  cor=110;

  background(0,0,0); //cor do fundo
  tamanho=200;
  
  cor1 = color(0,250,200,30);
  cor2 = color(150,130,255,10);
  cor3 = color(200,200,200,20);

  corAtual = cor1;
}

void draw() { 
smooth();
stroke(255,255,255,20);
  if (mousePressed) {

    //if(mouseButton == LEFT) {
      strokeWeight(2);
      stroke(corAtual);
      line(mouseX,mouseY,tamanho,tamanho);
    //}

    //if (mouseButton == RIGHT) {
      //strokeWeight (2);
      //fill(cor2);
      //ellipse(mouseX,mouseY,tamanho,tamanho);
    //}
  }
}

  void keyPressed() {
    
    if (key == '1') {
      corAtual = cor1;
    }
    if (key == '2') {
      corAtual = cor2;
    }
    if (key == '3') {
      corAtual = cor3;
    }

    
    if (key == 's') {
      save("samara" + int(random(200))+".JPG");
    }
  }






                
                
