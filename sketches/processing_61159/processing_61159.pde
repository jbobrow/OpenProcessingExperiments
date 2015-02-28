
void setup() {// função que define o set up
size(500,500);//tamanho do ecran
background(255);//fundo do ecran
noStroke();//sem contorno
smooth();//suaviza o desenho
}

void draw() {//função que define o desenho
    for (int x = 1; x < 10; x = x+1) {//ciclo da ellipse e do quadrado que gera um número até 9 objectos 
      
      fill(random(255),random(255),random(255));//gera uma cor aleatória
      ellipse( x * 50 , width/2, 30,30);//desenho uma ellipse neste caso em que '50' é o espaçamento, digo que quero no centro do ecran, e '30', '30' corresponde ao tamanho da ellipse
      rect( x * 50 , width/2, 20,20);//desenho um quadrado neste caso em que '50' é o espaçamento, digo que quero no centro do ecran, e '20', '20' corresponde ao tamanho do quadrado
      
    }
    
}

