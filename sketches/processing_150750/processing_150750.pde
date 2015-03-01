
int posix, aj = 0; // posição x
int posiy; // posição y
boolean funcionando, inicio, st = false, pause = false, ent = false; // início do jogo
QuebraCabeca historico; 
PImage fundo; 
PImage ajuda;
PImage fim;
PImage informar;
PFont font;
int cont = 0, ajd = 0;
int tempoInicial, tempoAtual, tempoFinal;

void setup(){ // função que prepara a área de trabalho do jogo
  size(600,600); // tamanho do quebra-cabeça
  inicio = true; 
  funcionando = false; 
  st = false;
  ajuda = loadImage("help.png"); // carrega imagem de ajuda
  fim = loadImage("fim.png");
  fundo = loadImage("1.png");// carrega a imagem inicial
  informar = loadImage ("informar.png");
  image (fundo ,0,0); // fundo
  rect (480,500, 100, 60);  // botão, escritos, cor, traço, etc..
   
  fill(255);
  rect (480,500, 100, 60);// tamanho do botão, posição
  fill(40,20,100); 

 
  if(ent){  // Voltar play
       
       stroke (176,176,176); // contorno
       font = loadFont ("SansSerif.plain-48.vlw");
       textFont (font,18);
       fill (176,176,176); // cor do botão
       rect (480,500,100,60); //tamanho do botão
       fill (64,64,64); // cor da letra
       text ("Jogar", 527,545);    // texto 
       fill (176,176,176);
       rect (20,500, 100, 60);// tamanho do botão, posição
       fill (64,64,64); // cor da letra
       text ("Como Jogar", 75,545);
     
       
       
  
  } else { // Inicial


       if(ajd == 0){
         
         stroke (176,176,176);
         font = loadFont ("SansSerif.plain-48.vlw");
         textFont (font,18);
         fill(176,176,176);
         rect (480,500, 100, 60);// tamanho do botão, posição
         fill (64,64,64); // cor da letra
         text ("Jogar", 517,545);    // texto
         fill(176,176,176);
         rect (20,500, 100, 60);// tamanho do botão, posição
         fill (64,64,64); // cor da letra
         text ("Como Jogar", 35,545);
       
  
       } else {
         
         stroke (176,176,176);
         font = loadFont ("SansSerif.plain-48.vlw");
         textFont (font,18);
         fill(176,176,176);
         rect (480,500, 100, 60);// tamanho do botão, posição
         fill (64,64,64); // cor da letra
         text ("Jogar", 529,545);    // texto
         fill(176,176,176);
         rect (20,500, 100, 60);// tamanho do botão, posição
         fill (64,64,64); // cor da letra
         text ("Como Jogar", 75,545); 
      
  
       }
     
  }

  
  
}


//****************************************************
void jogo(){
//JOGO
  if ( funcionando == true) // se o jogo funciona
  {
    ent = true;
    menu();
    
    if (mouseX>0 && mouseX <137 && mouseY > 0 && mouseY < 30 && mousePressed) {
      image(fundo,0,0);   
    }
    
    if(st == false){
       historico = new QuebraCabeca(150,150,16); // tamanho do quebra-cabeça, número de peças
       st = true;   
    } 
  
  if( mousePressed == true ){ // se o botão for pressionado pelo mouse
      posix = int(floor(mouseX/historico.tamanho_pecax)); // posição em que o botão foi pressionado
      //print("posix "+posix+"\n");
      posiy = int(floor(mouseY/historico.tamanho_pecay));
      //print("posiy "+posiy+"\n");     
      historico.movimento(posiy,posix);   

      //*********************************
      //*********************************      
  }   
 
 if (mouseX>0 && mouseX <137 && mouseY > 0 && mouseY < 30 && mousePressed) { // Verifica se botão de ajuda foi clicado
  image(fundo,0,0);   
  } else{
  historico.printQC(); // Pinta as peças
  }
 
Tempo(); // Chama função para calcular tempo
}

}
//****************************************************
void Tempo(){ // Calcula tempo de jogo

     if ( !historico.premiacao() ) {
      tempoAtual = millis() - tempoInicial; // Retira o tempo na tela inicial do jogo
      tempoAtual = tempoAtual / 1000;
      menu();
     } else {
       tempoFinal = tempoAtual;
       image(fim, 0, 0);
       fill(255); // Cor do fundo do menu
      rect(540, 0, 60, 30); // Posição do Botão de Sair
      fill(27,20,100); // Cor da fonte no menu
      textAlign(CENTER);
      text("< Voltar ", 569, 20); // Texto do Menu
      
       fill(255);
       fill(27,20,100); 
       stroke(249,209,200);
       text ("Tempo gasto:", 290,20);
       text (tempoFinal+" seg", 290,35);    // textFont (PFont("TimesNewRoman"),40); 
       fill(255);
     }
     
}
//******************************************************
void menu() { // Menu de ajuda
 // MENU 
    fill(255); // Cor do fundo do menu
    rect(0, 0, 220, 30); // Posição do Menu
    fill(27,20,100); // Cor da fonte no menu
    textFont (font,12);
    textAlign(CENTER);
    text("AJUDA - CLIQUE AQUI", 70, 20); // Texto do Menu
    text("| ", 138, 20);
    
    fill(255); // Cor do fundo do menu
    rect(540, 0, 60, 30); // Posição do Botão de Sair
    fill(27,20,100); // Cor da fonte no menu
    textFont (font,12);
    textAlign(CENTER);
    text("SAIR (X)", 569, 20); // Texto do Menu
    // FIM DO MENU
    
  text("Tempo:  " + tempoAtual,175, 20); 
}
//****************************************************
// Ajuda
void ajuda(){
    if(mouseX < 120 && mouseX > 20 && mouseY < 560 && mouseY > 500 && mousePressed){
      inicio = false;
      image(ajuda,0,0);
      ajd++;  
      fill(255); // Cor do fundo do menu
      rect(540, 0, 60, 30); // Posição do Botão de Sair
      fill(27,20,100); // Cor da fonte no menu
      textFont (font,12);
      textAlign(CENTER);
      text("< Voltar ", 569, 20); // Texto do Menu
    }   

}

//****************************************************


//****************************************************
void draw(){ // executa em looping criando o jogo
  
   if (mousePressed)  //se o botão for pressionado
    {
  if (mouseX < 600 && mouseX > 540 && mouseY < 30 && mouseY>0 )// coordenadas do botão sair
      {
        setup();
      } 
   }  
  
   if (inicio == true) //  primeira tela inicio do jogo
  {

    if (mousePressed )  //se o botão for pressionado
    {
      if (mouseX < 580 && mouseX > 480 && mouseY < 560 && mouseY>500 )// coordenadas
      {
        tempoInicial = millis();
        inicio = false; // duas condições
        funcionando = true; // se funcionando for igual a verdadeiro
      }
     
     }
    
      
  ajuda(); 
  }
  //**************************************
  if (inicio == true) //  primeira tela inicio do jogo
  {

    if (mousePressed )  //se o botão for pressionado
    {
      if (mouseX < 580 && mouseX > 480 && mouseY < 560 && mouseY>500 && mousePressed)// coordenadas
      {
        tempoInicial = millis();
        inicio = false; // duas condições
        funcionando = true; // se funcionando for igual a verdadeiro
        
      }
      
      
    }
    
  }
  //**************************************
jogo();



}//  determina abertura da imagem inicial
//****************************************************
 
//******************************************************

class Peca {            // cria uma nova classe (representa o objeto peça) - Definição da estrutura peça              
    PImage peca_estampa; //PImage - tipo da classe; peça_estampa - objeto que agrega uma imagem  (Propriedades da peça)
    int xpos, ypos, numero;  // indica variáveis inteiras, posição (coordenadas) e número da peça   
    boolean e_quadrado; // variavel lógica condicionante / verdadeiro ou falso 
    String nomepeca;
    Peca(int xp,int yp,int num, String estampa){ // Argumento, método definido dentro da classe, condição inicial da figura carregada
      this.xpos = xp; //posição na coordenada x
      this.ypos = yp; // posição na coordenada y
      this.numero = num; // número da peça
      this.peca_estampa = loadImage(estampa); // carrega a imagem da peça
      this.e_quadrado = false; // ocupado, se e_quadrado for falso a imagem da peça será carregada (indicação)
      this.nomepeca = estampa;
    }
    
   // Peca(){}
   
    Peca(int xp,int yp,int num){ //argumento condição inicial sem carregar a figura
      this.xpos = xp; //posição na coordenada x
      this.ypos = yp; // posição na coordenada y
      this.numero = num; // numero
      this.e_quadrado = true; // se e_quadrado for verdadeiro a peça não será carregada - imagem sem estampa (indicação)
    }  
    
    void mostrar(){ // se o quadrado estiver ocupado mostra a imagem
      if (this.e_quadrado == false){ //se não for quadrado preto, mostra a peça em sua posição
          // println(this.nomepeca+" xpos "+this.xpos+" ypos "+this.ypos);
          image(this.peca_estampa,this.xpos,this.ypos);} // mostrar a imagem na posição adequada (coordenadas)
      else{ // de outra forma:
          fill(99,31,36); //cor preta
          rect(this.xpos,this.ypos,150,150); // posição e tamanho do quadrado
      }      
    }
    
    void modificarPos(int x,int y){ // função que modifica a coordenada da peça
        this.xpos = x; // posição na coordenada x
        this.ypos = y; // posição na coordenada y
    }
        
}

class QuebraCabeca { //nova classe - Definição de quebra cabeça
  
   int numero_de_pecas, tamanho_pecax, tamanho_pecay, pos_preta; // parâmetros do quebra cabeça
   int tamanhoqc = 4; //sqrt(numero_de_pecas);  tamanho linear do quebra cabeca
   Peca[] pecas, pecasfim; //caixa [] com vários objetos do tipo peça
   int[][] posicao = new int[tamanhoqc][tamanhoqc]; // cria uma matrix [] [] de posições
   //String[] qcp;
  
  
  
  
  
   
   QuebraCabeca(int x, int y, int numero){ // arqumento f(x) método definido dentro da classe quebra-cabeça
       int i = 0,j = 0,positx,posity,tmp,num; // i, positx são números inteiros (variáveis inteiras)
       int[] sorteados = new int[16]; // sorteados - é uma caixa [] com 16 objetos: números inteiros
       boolean encontrado = false; // variável lógica 
       
       for(int w = 0; w < 16; w++){ // looping - repete 16 vezes; w=0 condição de começo, w<16 condição para encerrar a repetição, w++ (w=w+1) adiciona 1 ao w
           sorteados[w] = 0; // cada elemento da caixa igualado a zero
           //this.qcp[w] = " ";
       }
       
        
        
        
       for (int w = 0; w < 16; w++){ // looping repete 16 vezes; w=0 condição de começo, w<16 condição para encerrar a repetição, w++ adiciona 1 ao w
           num = sorteio(1,16); // sorteio é uma função que retorna um número inteiro, sorteia os números da peça
           for(int s=0; s < 16; s++){ // pega os números sorteados 
               if(num == sorteados[s])encontrado = true;// se número sorteado dentro da caixa ja foi sorteado, esse número foi encontrado
           }
           
           while( encontrado == true){ // quando o número for encontrado roda o código até garantir que o número não sera repetido
               
               num = sorteio(1,16); // sorteia de novo
               encontrado = false; // não se sabe se esse número foi ou não encontrado
               for(int q=0; q < w+1; q++){ // q tem que ser menor que w+1
                   
                   if(num == sorteados[q])encontrado = true; // se o número foi sorteado será encontrado
                   
               }          
           }
           sorteados[w] = num; // adquire um número se encontrado
       } 
    
       this.numero_de_pecas = numero; // atribuição de um número
       this.tamanho_pecax = x; // atribuição de um valor x ao tamanho da peça
       this.tamanho_pecay = y;  // atribuição de um valor y ao tamanho da peça     
       this.pecas = new Peca[numero];// especificando uma nova caixa de peças
       
       
       
       positx = 0; // posição x
       posity = 0; // posição y
       while(i < numero - 1){ // argumento, quando 1 for menor que n-1
           tmp = this.tamanhoqc; // Tamanho do quebra-cabeça = tmp, criação de uma variável temporária
           positx = 0; // posição 
           while (tmp > 0 && i < numero ){   // quando tmp for maior que O e i for menor que número
               if (sorteados [i] == 16  ){ // se sorteado i (especifica posição da caixa) for igual a 16
                 this.pos_preta = i; // posição preta será igual i
                 this.pecas[i] = new Peca(positx ,posity ,-1); // especifica nova posição para peça, cria a peça
                 this.pecas[i].mostrar(); // função que mostra a peça
                 this.posicao[j][this.tamanhoqc-tmp] = -1; //  especifica para essa posição o -1, se for a última
               }
                 else{ // enquanto
                 //String[] qcp = {"a", "a"};
                 //i++;
                 String qcp = String.valueOf("qc"+sorteados[i]+".png"); //i--;
                 this.pecas[i] = new Peca(positx,posity,i,qcp);  //i++;// cria a peça
                 this.pecas[i].mostrar(); //i++;// mostra a peça
                 this.posicao[j][this.tamanhoqc - tmp] = i; // se não for a última
                 
                 //**********************************************************************************
                 //println("pteste["+j+"]["+(tamanhoqc - tmp)+"] = "+i+"\n"); //imprime a posição da peça
                 //println(qcp); // Imprime nome da imagem
                 //**********************************************************************************
                 
               }
               positx += this.tamanho_pecax; 
               
               tmp--; // decresce 1
               i++;
           }           
           j++;          
           posity += this.tamanho_pecay;      
       }       
       
   }

   void movimento(int posx,int posy){ // argumento, modifica a posição da peça
   
     if ( (posx < this.tamanhoqc - 1) && (posx > 0) && (posy < this.tamanhoqc - 1) && (posy > 0) ){ 
         if( (this.posicao[posx + 1][posy] == -1) || (this.posicao[posx - 1][posy] == -1) || (this.posicao[posx][posy + 1] == -1) || (this.posicao[posx][posy - 1] == -1) )
         this.troca(posx,posy);         
     }else
     if (  posx == 0 && posy == 0 ){
         if( (this.posicao[posx + 1][posy] == -1) || (this.posicao[posx][posy + 1] == -1) ) this.troca(posx,posy);
     }else
     if (  posx == 0 && posy == this.tamanhoqc - 1 ){
         if( (this.posicao[posx + 1][posy] == -1) || (this.posicao[posx][posy - 1] == -1) ) this.troca(posx,posy);
     }else
     if (  posx == this.tamanhoqc - 1 && posy == 0 ){
         if( (this.posicao[posx - 1][posy] == -1) || (this.posicao[posx][posy + 1] == -1) ) this.troca(posx,posy);
     }else
     if (  posx == this.tamanhoqc - 1 && posy == this.tamanhoqc - 1 ){
         if( (this.posicao[posx - 1][posy] == -1) || (this.posicao[posx][posy - 1] == -1) ) this.troca(posx,posy);
     }else
     if ( posy == 0 ){
         if( (this.posicao[posx + 1][posy] == -1) || (this.posicao[posx - 1][posy] == -1) || (this.posicao[posx][posy + 1] == -1) ) this.troca(posx,posy);
     }else
     if ( posy == this.tamanhoqc - 1 ){
         if( (this.posicao[posx + 1][posy] == -1) || (this.posicao[posx - 1][posy] == -1)  || (this.posicao[posx][posy - 1] == -1) ) this.troca(posx,posy);
     }else
     if ( posx == 0 ){
         if( (this.posicao[posx + 1][posy] == -1) || (this.posicao[posx][posy + 1] == -1) || (this.posicao[posx][posy - 1] == -1) ) this.troca(posx,posy);
     }else
     if (posx == this.tamanhoqc - 1){
         if( (this.posicao[posx - 1][posy] == -1) || (this.posicao[posx][posy + 1] == -1) || (this.posicao[posx][posy - 1] == -1) ) this.troca(posx,posy);   
     }
   }
   
   boolean premiacao(){ // Verifica se cada peça está no lugar certo 
     int positx = 0, posity = 0, numero = 16, cont = 0;
     
 
        // println("\nfim x "+this.pecasfim[0].xpos+" \n y "+this.pecasfim[0].ypos+" "+this.pecasfim[0].nomepeca);
        for(int i = 0; i < 16; i++){
          
          if(this.pecas[i].nomepeca != null){
            if(cont < 14){ // Parametro usado para chegar na premiação - correto 14
          if(this.pecas[i].nomepeca.equals("qc"+1+".png") || this.pecas[i].nomepeca.equals("qc"+4+".png")){
            if(this.pecas[i].xpos == 0 && this.pecas[i].ypos == 0){ cont++;  println("\n contador: "+cont); }   
          } // Primeiro ponto (0,0) cont = 1
          
          //***********************************
          if(this.pecas[i].nomepeca.equals("qc"+2+".png")){
            if(this.pecas[i].xpos == 150 && this.pecas[i].ypos == 0){  cont++; println("\n contador: "+cont);
            }
          } // ponto (150,0) cont = 2
          //***********************************
           if(this.pecas[i].nomepeca.equals("qc"+3+".png")){
            if(this.pecas[i].xpos == 300 && this.pecas[i].ypos == 0){  cont++;  println("\n contador: "+cont);     
            }
          } // ponto (300,0) cont = 3
          //***********************************
          if(this.pecas[i].nomepeca.equals("qc"+4+".png") || this.pecas[i].nomepeca.equals("qc"+1+".png")){
            if(this.pecas[i].xpos == 450 && this.pecas[i].ypos == 0){  cont++;  println("\n contador: "+cont);
            }
          } // ponto (450,0) cont = 4
          //***********************************
          if(this.pecas[i].nomepeca.equals("qc"+5+".png")){
            if(this.pecas[i].xpos == 0 && this.pecas[i].ypos == 150){  cont++;  println("\n contador: "+cont);  
            }
          } // ponto (0,150) cont = 5
          //***********************************
           if(this.pecas[i].nomepeca.equals("qc"+6+".png")){
            if(this.pecas[i].xpos == 150 && this.pecas[i].ypos == 150){  cont++;   println("\n contador: "+cont); 
            }
          } // ponto (150,150) cont = 6
          //***********************************
           if(this.pecas[i].nomepeca.equals("qc"+7+".png")){
            if(this.pecas[i].xpos == 300 && this.pecas[i].ypos == 150){  cont++; println("\n contador: "+cont);
            }
          } // ponto (300,150) cont = 7
          //***********************************
           if(this.pecas[i].nomepeca.equals("qc"+8+".png")){
            if(this.pecas[i].xpos == 450 && this.pecas[i].ypos == 150){  cont++;    println("\n contador: "+cont);
            }
          } // ponto (450,150) cont = 8
          //***********************************
           if(this.pecas[i].nomepeca.equals("qc"+9+".png")){
            if(this.pecas[i].xpos == 0 && this.pecas[i].ypos == 300){  cont++; println("\n contador: "+cont);
            }
          } // ponto (0,300) cont = 9
          //***********************************
           if(this.pecas[i].nomepeca.equals("qc"+10+".png")){
            if(this.pecas[i].xpos == 150 && this.pecas[i].ypos == 300){  cont++;   println("\n contador: "+cont);
            }
          } // ponto (150,300) cont = 10
          //***********************************
          if(this.pecas[i].nomepeca.equals("qc"+11+".png")){
            if(this.pecas[i].xpos == 300 && this.pecas[i].ypos == 300){  cont++;    println("\n contador: "+cont);   
            }
          } // ponto (300,300) cont = 11
          //***********************************
          if(this.pecas[i].nomepeca.equals("qc"+12+".png")){
            if(this.pecas[i].xpos == 450 && this.pecas[i].ypos == 300){  cont++;    println("\n contador: "+cont);
            }
          } // ponto (450,300) cont = 12
          //***********************************
           if(this.pecas[i].nomepeca.equals("qc"+13+".png")){
            if(this.pecas[i].xpos == 0 && this.pecas[i].ypos == 450){  cont++;    println("\n contador: "+cont);
            }
          } // ponto (0,450) cont = 13
          //***********************************     
           if(this.pecas[i].nomepeca.equals("qc"+14+".png")){
            if(this.pecas[i].xpos == 150 && this.pecas[i].ypos == 450){  cont++;  println("\n contador: "+cont);
            }
          } // ponto (150,450) cont = 14
          //***********************************
          if(this.pecas[i].nomepeca.equals("qc"+15+".png")){
            if(this.pecas[i].xpos == 300 && this.pecas[i].ypos == 450){  cont++;  println("\n contador: "+cont);
            }
          } // ponto (300,450) cont = 15
          //***********************************
            } else{ return true; }
          }
        }
   
     return false;
  }
 
   
   int sorteio(int a,int b){ 
        float x = random (a, b+1); //sorteia números racionais
        return int(floor(x));  //transforma em números inteiros
    }
   void printQC(){ // Repinta quebra cabeça
     int[] preta; 
     preta = this.achaPreta();
      println("\n\n\nInicio ");
     for(int i = 0; i < 16; i++){
      // i++;
       if(this.pecas[i].nomepeca != null){
         println(this.pecas[i].nomepeca+" peca "+i);
       this.pecas[i].mostrar();
       //i--;
       } 
     }
     this.pecas[this.pos_preta].mostrar(); // mostra peca preta
    
   }  
   void troca(int posx,int posy){ 
       int[] preta; 
       int tmpx = this.pecas[ this.posicao[posx][posy] ].xpos , tmpy = this.pecas[ this.posicao[posx][posy] ].ypos; //
       this.pecas[this.posicao[posx][posy]].modificarPos(this.pecas[this.pos_preta].xpos,this.pecas[this.pos_preta].ypos); // troca posicao (x,y) da peca, identificada atraves de sua posicao no quebra cabeca posicao(posx,posy), com posicao (x,y) da peca preta
       preta = this.achaPreta();
       this.posicao[preta[0]][preta[1]] = this.posicao[posx][posy]; // Fazer troca de posicao da peca na matrix do quebra cabeca atraves de identifição do local onde a peca preta esta
       this.posicao[posx][posy] = -1; // preta na posicao da peca trocada       
       this.pecas[this.pos_preta].modificarPos(tmpx,tmpy); // troca posicao (x,y) de peça preta       
       this.pecas[this.posicao[preta[0]][preta[1]]].mostrar(); // mostra peca que foi para o lugar anterior da peca preta
       this.pecas[this.pos_preta].mostrar(); // mostra peca preta
       // Printa posição trocada
       println("\n\n("+this.pecas[this.posicao[preta[0]][preta[1]]].xpos+","+this.pecas[this.posicao[preta[0]][preta[1]]].ypos+") -> "+this.pecas[this.posicao[preta[0]][preta[1]]].nomepeca);      
   }
   
   
   
   int[] achaPreta(){ // encontrar o quadrado preto
     int[] coordenadas = new int[2]; 
     for (int i = 0; i < this.tamanhoqc; i++) 
         for (int j = 0; j < this.tamanhoqc; j++) 
             if (this.posicao[i][j] == -1){ 
                 coordenadas[0] = i; 
                 coordenadas[1] = j; 
                 return coordenadas; 
             } else {
               
              // println("Posicao"+i+" "+j);
               //println(this.posicao[i][j]);
              // println(this.posicao[i][j]);
             }
      return coordenadas; 
   }

}






