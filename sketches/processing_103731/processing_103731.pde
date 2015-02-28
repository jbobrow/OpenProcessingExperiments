
//Esse sketch desenha uma carinha no centro da tela.
//Todos os valores, tanto os tamanhos quantos as posições,
//possuem um valor em comum, o que permite escalonar
//facilmente o desenho a partir do centro.

//Variáveis.
//Declarando variáveis para guardar informaçoes de cor.
color vermelhinho;
color azulzinho;
color corDoFundo;
//A variável escala vaipermitir transformar o desenho proporcionalmente.
int escala;
//As váriáveis origemX e origemY guardarão os valores que irão definir
//a posição horizontal e vertical do centro do desenho.
int origemX;
int origemY;

//Dentro do bloco setup() ficam so comandos que serão acionados
//uma única vez, assim que o programa for iniciado.
void setup(){
//A função size() define resolução, horizontal e vertica, do sketch,
//no caso 700 por 500 pixels.
  size(700, 500);
//A função smooth() ativa o anti serrilhamento.  
  smooth();
//Inicializando as variáveis.
//As variáveis do tipo do tipo esperam por valores do tipo cor,
//Para isso usamos a função color() que nos permite escrever cores
//de forma mais intuitiva, passando separadamente os valores de
//vermelho, verde e azul.
  vermelhinho = (color(255,62,55));
  azulzinho = (color(55,62,255));
  corDoFundo = (color(0,0,0));
//Declarando um valor inicial para a variável escala.
  escala =10;
//Declarando as variáveis que irão definir a posição central do desenho.
//No caso desejamos exatamente o centro e conseguimos isso dividindo as
//constantes width (largura) e height (altura) por 2.
  origemX=width/2;
  origemY=height/2;
}

//Dentro do blog draw() ficam os comandos que serão acionados
//contantemente em um loop.
void draw(){
//A função background() pinta a telada com a cor desejado,
//apagando assim o desenho do ciclo anterior.
  background(corDoFundo);
//Os comandos a seguir alternam a cor e desenham as ellipses que formam a carinha,
//sempre com parâmetros relacionados com a variável que faz o fator de escala.
  fill(azulzinho);
  ellipse(origemX,origemY,escala*5,escala*5);
  fill(vermelhinho);
  ellipse(origemX-escala,origemY-escala,escala,escala);
  ellipse(origemX+escala,origemY-escala,escala,escala);
  ellipse(origemX,origemY+escala,escala*3,escala);

//Aqui a variável escala recebe o valor da posição
//vertical do mouse, transformando o tamanho do desenho.
  escala = mouseY;
}


