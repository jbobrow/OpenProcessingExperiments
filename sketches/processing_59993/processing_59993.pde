
// Trabalho MTAD3 PAD 2011/04/1
 
// Rui de Carvalho – pg12917
        
// ANORMA
 
/* No Mundo de hoje existe uma preocupação normativa do status quo social, 
mantendo assim a hegemonia das classes governantes. 
Seja na política, na justiça, na saúde como na moda são-nos incutidos símbolos homogeneizadores  , 
vendendo-nos  pelos meios de comunicação de massas um ideal global normativo, 
onde o indivíduo é deterido em prole do interesse colectivo.  
É recusando essa regularização, onde ao indivíduo não lhe é reconhecida importância singular como ser único e pensante,
que levanto aqui essa problemática. 
  Adopto o conceito anorma, como a resposta  contraria, em prol de uma sociedade apoiada na diferença. 
Saliento neste trabalho a importância de se dar voz às minorias, 
reconhecendo-lhes qualidades enriquecedoras do desenvolvimento humano. 
  Esta aplicação inicia-se com um processo de aleatoriedade, facultando uma maior autonomia à maquina. 
A interacção só nos é autorizada quando a aplicação encontra a palavra anorma. 
A partir dai pressione o rato e altere as letras que surgem no ecrã. 
*/
 
PFont tipoLetra; // variavel que vai guardar o tipo de letra a ser usada no texto
String texto="semente para encontrar a palavra anorma"; // string que vai servir de base para trocar as letras todas.
// se o texto nao tiver TODAS as letras da string textoEncontrar, o programa nao faz o pretendido
String textoEncontrar="anorma"; // palavra "chave" que faz parar o programa
String palavras= "abcdefghijklmnopqrrtuwxyz"; // semente abecedario 
String palavra="";
int tamanhoLetra; // vai determinar o tamanho do texto que aparece no ecra
palavraAntinorma palavraKeyPressed1;
TextoAleatorio textoRandom; // textoRAndom vai ter uma instancia da class TextoAleatorio
int vel;
int px;
int py;
boolean continuar, teste;
int num;
//palavraAntinorma[] palavraKeyPressed = new palavraAntinorma[10];
LetrasAndar[] letrasA; // class array de letras
int i; // indice do array 
String letra; // letra que vai andar pelo ecra
int quantidade; // quantidade de letras a andar no ecra
 
 
void setup()
{
  size (640,400); // cria uma janela com o tamanho definido
  background(0); // define a cor de fundo da janela para preto (0)
  frameRate(15); // define quantas vezes por segundo repete a funcao draw(). quanto mais alto mais rapido as letras vao mudar
  tamanhoLetra=12; // alterar esta variavel para mudar o tamanho do texto a andar
  fill(255,255,255); // define a cor das letras para branco (255,255,255)
  tipoLetra=createFont("TIME",24,true); // cria um tipo de letra
  textFont(tipoLetra,tamanhoLetra); // define a fonte e tamanho do texto do ecra. o tamanho depende da variavel tamanhoLetra
  textoRandom = new TextoAleatorio(); // criacao de uma instancia da classe
  vel=10;
  num=0;
  continuar=false;
  px=width/2;
  py=height/2;
  teste=false;
  palavraKeyPressed1 = new palavraAntinorma(px,py,vel);
  quantidade=26; // aqui define o numero de letras que vao andar pelo ecra
  letrasA = new LetrasAndar[quantidade]; // array de classes
  letra=""; // letra vazia
  i=0; // primeira letra a aparecer no ecra vai ser no array na posicao 0
  
  for (int i=0;i<quantidade;i++)
  {
    letrasA[i]= new LetrasAndar(); // cria 26 instancias da class
  }
}
 
void draw()
{
  background(0);
  fill(255);
 
  switch(num)
  {
  case 0:
    background(0); // limpa o ecra antes de chamar o metodo para as letras nao aparecerem umas por cima das outras
    teste=textoRandom.mostrarTexto(); // chama o metodo mostrarTexto() que permite preencher a janela toda de letras aleatorias
    if (teste==true)
    {
      num=2; 
    }
    break; 
    // esta parte do código foi suspensa para funcionar no processing JS 
/*  case 1:
    while(i<60000)
    {
      println("Comma encontrado");
      i++;
    }
    num=2;
    break;
    */
  case 2:    
    palavraKeyPressed1.mostraPalavrasAleatorias();
    //palavraKeyPressed1.mostrarPalavra();
    /*for (int x=0;x<10;x++)
    {
      palavraKeyPressed[x].mostrarPalavra();
    }*/  
  for (int i=0;i<quantidade;i++) 
  {
    letrasA[i].comecar(); // chama o metodo que permite escrever no ecra
  }
  
    break;
  }
}
class LetrasAndar
{
  String letraClass;
  PFont f;
  int tamanhoLetra;
  int x,y, velocidadeX,velocidadeY;
 
  LetrasAndar()
  {
    int tamanhoLetra=12; // aqui podemos alterar o tamanho da letra a aparecer no ecra
    f=createFont("TIME",12,true);  
    textFont(f,tamanhoLetra);
    x=int(random(10,490)); // posicao inicial da letra aleatoria
    y=int(random(10,490)); // posicao inicial da letra aleatoria
    velocidadeX=int(random(5,10)); // velocidade do eixo dos Xs das letras a andar
    velocidadeY=int(random(5,10)); // velocidade do eixo dos Ys das letras a andar
    letraClass="";
  }
 
  //  void comecar(String letra)
  void comecar()
  {  fill(255);
    //    letraClass=letra;
    //    text(letraClass,x,y);
    text(letraClass,x,y); // escreve no ecra na posicao x,y
    x=x+velocidadeX;
    y=y+velocidadeY;
 
    //define as fronteiras de onde a letra nao pode sair
    if (x>width-textWidth(letra))
      velocidadeX=-velocidadeX;
    if (y>height)
      velocidadeY=-velocidadeY;
    if (x<0)
      velocidadeX=-1*velocidadeX;
    if (y<(0+textWidth(letra)))
      velocidadeY=-1*velocidadeY;
  }
}
 
void keyPressed()
{
  letra=""+key;
  // a letra que e' pressionada e' atribuida a uma das instancias
  letrasA[i].letraClass=letra; 
  i=(i+1)%letrasA.length; // se chegar ao fim do array volta ao inicio
}
class palavraAntinorma {    // declaracao da classe
  // variaveis iniciais de cada instacia
  int x,y,px,py,vel;
  String palavrasAleatorias;//nesta linha defino uma variável do tipo String onde vou guardar cada caracter da palavra "COMMA"
  // construtor da classe
  palavraAntinorma (int recebeX,  int recebeY, int recebeVel){
     x = recebeX;
    y = recebeY;
    vel= recebeVel;
    px = vel;
    py = vel;
  }
  
  void mostrarPalavra() // metodo que mostra o texto no ecra
  { //fill(x);
  fill(255);
    text(palavra,x,y);
    x=x+px;
    y=y+py;
    if (x>=width-textWidth(palavra))
      px=-vel;
    if (x<=0)
      px=vel;
    if (y<=0+textWidth(palavras))
      py=vel;
    if (y>=height)
      py=-vel;
  }
 
 
  void mostraPalavrasAleatorias()
  {
  frameRate(6);
  //fill(255,255,255,mouseX);//define o preenhimento do quadrado a branco e com opacidade 255. (mouseX foi para testar qual o melhor nível de opacidade)
  noStroke();//para desenhar o quadrado sem traço
  //rect(0,0,width,height);//desenha um rectagulo nas coordenadas 0,0 do tamanho da janela (este quadrado é um truque para fazer o refresh do ecran)
  background(0); // faz com que o fundo seja branco (esta instrução pode ser usada em vez do truque do fill(255,255,255,255) + a instrução rect(0,0,width,height))
   for (int i=0;i<=width;i+=55) // ciclo "for" para percorrer a altura da janela 
   {
    for(int j=0;j<=height;j+=55) //ciclo "for" para percorrer largura da janela 
    {
      fill(random(100,255)); //para escrever a preto :)
      //println(palavras.length());
      int aux = int(random(palavras.length()));//gera um número aleatório entre 0 e 26 que vai corresponder a uma letra do abecedário  
      palavrasAleatorias=palavras.substring(aux,aux+1); // vamos a string "palavras", a qual corresponde "abecedário", e vamos buscar a substring aux que corresponde ao index do "abecedário"
      textFont(tipoLetra,tamanhoLetra+int(random(0,5))); // define a fonte e tamanho do texto do ecra. o tamanho depende da variavel tamanhoLetra
      text(palavrasAleatorias,i,j); //imprime o texto guardado na variável palavrasAleatorias
    }
   }
  }
}
/*void keyPressed()
{   
     palavra=""+key;
    i++;
}*/
// classe que aceita uma string como parametro de entrada
// tem um metodo que troca a ordem das letras que estao na string e as mostra no ecra
// todo o ecra e' preenchido de letras aleatorias que pertencem 'a string
class TextoAleatorio
{
  String textoEntrada; // string que vai guardar o texto que vem de fora da classe como parametro
  String temp; // array temporaria que vai guardar uma string para comparar com o que esta no ecra para ver se e' a palavra chave. inicializada como vazia ("")
  String letra; // vai ser esta variavel que vai preencher o ecra com caracteres aleatorios
  float x1,y1; // variaveis que vao guardar a posicao do texto no ecra
  int posicaoLetraSorte; // variavel que vai guardar um inteiro. esse inteiro e' a posicao aleatoria de uma letra da string de texto
  boolean intersecting; // variavel que fica a TRUE quando o texto passa pelo circulo definido como zona de escrever cor diferente
  float centrox; // vai guardar a posicao do eixo dos X do circulo
  float centroy; // vai guardar a posicao do eixo dos Y do circulo
  int raio; // raio do circulo
  String palavra="";
  boolean bingo; // quando definida a TRUE o programa para. So fica definida a TRUE quando a string textoEncontrar aparecer no ecra
  
 
  TextoAleatorio() // construtor
  {
    x1=0; // posicao inicial do texto do eixo do X do texto inicializado a 0
    y1=tamanhoLetra; // posicao inicial do texto do eixto do Y do texto inicializado a 16
    raio=120; // se alterado este valor, o circulo aumenta ou diminiu
    temp=""; // inicializado a vazio
    letra=""; // inicializado a vazio
    centrox=width/2; // define um ponto no meio ja janela no eixo dos X
    centroy=height/2; // define um ponto no meio ja janela no eixo dos Y
    bingo=false;
  }
  
// metodo que vai testar se o texto esta dentro da area do circulo definido
// se estiver dentro da area retorna TRUE para mudar de cor
  boolean intersect(float x1, float y1, float x2, float y2, float r1, float r2)
  {   
    float distance = dist(x1,y1,x2,y2); // calcula a distancia do centro do circulo ao texto que esta a ser escrito no momento
    if (distance < r1 + r2) // se a distancia for inferior ao raio definido do circulo 
    {                    
      return true; // esta dentro do circulo
    }   
    else
    {   
      return false; // esta fora do circulo
    }
  }   
  // metodo que dependendo do texto que entrou para a classe
  // vai mostrar aleatoriamente, letra a letra, que pertencem ao texto que entrou para classe
  boolean mostrarTexto()
  {
    while(y1<height) // enquanto o texto nao passar do final da altura da janela repetir o ciclo
    {
      while (x1<width) // enquanto o texto nao passar do comprimento da janela repetir o ciclo 
      {
        posicaoLetraSorte=int(random(texto.length())); // posicaoLetraSorte guarda uma posisao aleatoria da string texto
                                                              // como a funcao random devolve um float foi preciso fazer um cast para inteiro
        letra=texto.substring(posicaoLetraSorte,posicaoLetraSorte+1); // variavel letra guarda uma letra a sorte
        intersecting = intersect(x1,y1,centrox,centroy,0,raio); // chama a funcao intersect para testar se o texto que esta a ser escrito esta dentro da area do circulo
        if (intersecting==true) // se estiver dentro da area muda de cor
        {    
          fill(50); // cor dentro do circulo
        }
        else // se nao estiver dentro da area tem outra cor
        {
          fill(255); // cor do texto fora do circulo
        }
        if (temp.length()<textoEncontrar.length()) // enquanto a variavel temp nao tiver o mesmo tamanho da variavel tempoEncontrar ela e' incrementada com mais 1 letra
        {
          // a variavel temp vai guardar uma string do mesmo comprimento da string textoEncontrar para serem comparadas
          temp=temp+texto.substring(posicaoLetraSorte,posicaoLetraSorte+1); // guarda na variavel uma letra aleatoria de cada vez
        }
        else // entra nesta condicao quando a palavra temp estiver com o mesmo tamanha da palavra a textoEncontrar para serem comparadas
        {
          if(temp.equals(textoEncontrar)) // determina se a string temp e o texto a encontrar sao iguais. se forem muda de cor.
          {
            fill(0,100,200); // cor das letras iguais a string que esta na variavel textoEncontrar
            println("ENCONTRADA A PALAVRA "+textoEncontrar);
            letra=temp; // vai guardar a palavra "chave". vai servir para mudar de cor da palavra encontrada
            x1=x1-textWidth(letra); // anda para tras o numero de caracteres que tiver a palavra "chava" para escrever por cima com uma nova cor
            bingo=true; // como so passa por aqui quando as 2 strings (temp e textoEncontrar) sao iguais quer dizer que ja podemos acabar o programa
          }
          temp=texto.substring(posicaoLetraSorte,posicaoLetraSorte+1); // e' feito um reset a variavel temp com uma nova letra
        }
        text(letra,x1,y1); // escreve no ecra letra a letra
        x1=x1+textWidth(letra); // prepara a posicao na janela da proxima letra
      } // fim do ciclo while(x1<height)
      x1=0; // coloca a posicao do texto no eixo do x a 0
      y1=y1+tamanhoLetra; // muda de linha
    } // fim do ciclo while(y1<height)
    y1=tamanhoLetra; // volta a colocar o texto no inicio da janela no eixo dos Y
    x1=0;  // volta a colocar o texto no inicio da janela no eixo dos X
    return bingo;  
  } // fim do metodo mostrarTexto()
} // fim da classe
 
