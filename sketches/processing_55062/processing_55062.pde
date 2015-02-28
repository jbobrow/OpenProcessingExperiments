
//passar planos para objectos
//definir as variáveis para carregar as imagens
PImage backroundImg;//guardar imagem de background "lake"
PImage rainImg;//guardar imagem de elemento "rain"
rain[]listRain;//fontes da imagem "rain"
swans swansImg;//fontes da imagem "swans"
ducks ducksImg;//fontes da imagem "ducks"

//início da função setup
//definir propriedades do ambiente inicial
void setup(){

  size (700,490);//tamanho da tela
  backroundImg = loadImage("lake.jpg");//carregar imagem de background
  rainImg = loadImage("rain.png");//carregar imagem do elemento "rain"
  
  swansImg = new swans();//definir a imagem "swans"
  ducksImg = new ducks();//definir a imagem "ducks"
  listRain = new rain[100];//definir o tamanho (quantidade de objectos) da lista
 
  //repetir o objecto "rain"
  for (int i = 0; i<100; i++){
    listRain[i] = new rain(); 
  }
}//fim da função setup

//função draw
//definições do background
void draw (){
  background(255);//cor de fundo
  imageMode(CORNERS);//localização da imagem dentro dos limites da tela
  image(backroundImg,0,0);//definir posição da imagem de background 

      for (int i = 0; i<100; i++){//loop da queda da imagem "rain"
        listRain[i].update();//actualização da animação do conjunto de imagens
        listRain[i].drawing();//desenha o conjunto repetitivo da imagem "rain"
      }   
      
      swansImg.updateswans();//actualização da animação da imagem "swans"
      swansImg.drawingswans();//desenhar a imagem "swans"
      ducksImg.updateducks();//actualização da animação da imagem "ducks"
      ducksImg.drawingducks(); //desenhar a imagem "ducks"
 }

