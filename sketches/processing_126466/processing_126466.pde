
// La Vie en Rose
// Trabalho para Programação para a Arte Digital II
// Mestrado em Tecnologia e Arte Digital
// Angélica Antunes 16366

PImage piaf; // Declaração da variável "piaf", de tipo PImage
int numFlores = 25; // Declaração de uma variável designada de numFlores, com o valor de 25 instâncias
Retrato[] face = new Retrato[numFlores]; // Declaração de um array de instãncias da classe Retrato
float alvo_x; // Declara a variável posição alvo_x
float alvo_y; // Declara a variável posição alvo_y
String transparente = "default"; // Declaração de uma variável que permanecerá dentro da sequência String, neste caso a transparência que enredará algumas instâncias

void setup() {
  size(640, 400); //Define o tamanho do ecrã
  smooth(); //Suavização gráfica
  
  //Criação do ciclo for para o funcionamento do array
  for(int x=0 ; x < numFlores;x++) { // Se o número de instâncias for superior a x, então serão desenhadas no ecrã
    face[x] = new Retrato();

  }
}

void draw(){ // Declaração do ciclo principal do programa Draw
  piaf = loadImage("edith.png"); // Carrega a imagem na variável piaf
  background(piaf); // Fundo com a variável piaf
  
  if (keyPressed){
  if ((key == 'b') || (key == 'B')){
  background(0);
    }
  }
    
    if (keyPressed){ 
    if (key == ' '){
    background(0);
    }
  }
    
  
  //Declaração da função if com fundo preto e da variável transparente
  if (transparente != "black"){ // Se a variável transparente for igual à cor preta, o fundo será preto
     transparente = "black"; 
     background(0);
    }
    
    //Criação do ciclo for para o funcionamento do array, em que se declara que as instãncias terão que seguir o cursor e o seu respectivo desenho e movimento
    for(int x=0 ; x < numFlores;x++) {
    face[x].definir_alvo(mouseX,mouseY);
    face[x].movimento();
    face[x].desenhar();
  }
}

