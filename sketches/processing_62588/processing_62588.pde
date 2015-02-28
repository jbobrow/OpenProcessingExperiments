
// Exercício Bounding Boxes (Áreas limitadas) - Anabel Santos




int totalObjectos; // numero total de objectos ou seja circulos

float posX, posY; // variaveis para a posição horizontal e vertical dos objectos, neste caso circulos
float diametro; // variavel para o diâmetro do objecto
float r,g,b; // variaveis para a cor do circlo (r, g ,b)
float s; //  espessura do contorno da linha (outline)

float LHoriz, LVertical; // vai definir as variáveis dos limites horizontais e verticais


// definições setup
void setup() {
  
    size (800,400);
    background(237,237,237); // cor do fundo
    smooth(); // suavidade 
    noLoop(); // sem repetição de código (estático), este código tem de estar em último no void setup
    
    
    totalObjectos = 200;// numero total objectos, neste caso círculos
    LHoriz = 250; // Limite dos círculos na horizontal
    LVertical = 10; // Limite dos círculos na vertical

}


// parte ilustrativa (desenhos)
void draw(){ 
  
     for ( int i = 0; i <totalObjectos; i++) // primeira camada
    {
       posX = random (width/7, width/2); // numero aleatório para posição horizontal 
       posY = random (height/7, height/2 + LVertical); // numero aleatório para posição vertical 
       diametro = random (5, 50); // tamanho aleatório entre 5 e 50
       s = random (2,5); //espessura do outline (outline) de 1 a 5
       
       strokeWeight(s); // espessura da linha de contorno do circulo (outline)
       fill(4,198,141); // // cor dos quadrados
       rect(posX+2, posY, diametro, diametro);// cria os circulos com os valores escolhidos
    }  
  
  
  //saveFrame ("Areas_limitadas.png");
}




