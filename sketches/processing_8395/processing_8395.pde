
/*
Fundamentos da Computacao II
 trabalho final
 Guilherme Almeida de Souza  
 Junho/2009
 ----------------------------
 Cria "minhocas" na tela, coloridas
 de acordo com imagens carregadas e
 com capacidade de reproducao.
 */

PImage [] fundo = new PImage [5];
//cria um vetor de variaveis para guardar imagens
PFont courier12;
//cria uma variavel para guardar uma fonte
boolean play = true;
boolean controls = true;
boolean replicate = true;
//variaveis do tipo boolean para, respectivamente,
//definir se o programa está rodando, definir se
//o menu aparece e definir se as minhocas se repli-
//carao ou nao
int nMax = 2000;
int nNow = 0;
//variaveis para guardar o numero atual de individuos
//e o numero maximo
float [] x = new float [nMax];
float [] y = new float [nMax];
float [] px = new float [nMax];
float [] py = new float [nMax];
float [] vel = new float [nMax];
float [] dir = new float [nMax];
color [] worm = new color [nMax];
//todos esses vetores correspondem a parametros
//que cada minhoca tem.
//x e y definem a posicao atual da "cabeca" da minhoca.
//px e py definem a posicao anterior.
//a velocidade é expressa nas variaveis "vel" e "dir",
//ou seja, velocidade absoluta e direcao, em vez de ser
//expressa em componentes x e y.
//a variavel chamada worm define a cor da minhoca.
color [][] imagem;
//esse vetor serve para guardar a imagem que estará sendo
//usada para basear as cores das minhocas
void setup(){
  size(647,400);
  imagem = new color [width][height];
  //inicializa o vetor imagem, deixando-o pronto para receber valores
  fundo[0] = loadImage ("1.jpg");
  fundo[1] = loadImage ("2.jpg");
  fundo[2] = loadImage ("3.jpg");
  fundo[3] = loadImage ("4.jpg");
  fundo[4] = loadImage ("5.jpg");
  //carrega as imagens dos arquivos na pasta data
  courier12 = loadFont ("CourierNewPSMT-12.vlw");
  textFont(courier12,12);
  //carrega a fonte e a define para o uso
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      imagem[i][j] = fundo[0].get(i,j);
    }
  }
  //esta iteracao carrega a imagem da variavel "fundo[0]"
  //no vetor que define a imagem a ser usada para definir
  //a cor de cada minhoca.
  background(0);
  frameRate(30);
  smooth();
}

void mouseReleased(){
  newWorm(mouseX,mouseY);
  //quando o mouse é clicado e depois solto, chama-se a
  //função definida para criar um novo "individuo", na
  //posicao do mouse
}

void keyReleased(){
  if (keyCode == DELETE || keyCode == BACKSPACE){
    clear();
  }
  //quando a tecla delete ou backspace for pressionada,
  //chama-se a funcao definida para limpar a tela
  else if (keyCode == ENTER){
    if(play){
      play = false;
    }
    else{
      play = true;
    }
  }
  //quando a tecla enter for pressionada, muda-se a
  //"situacao" do programa, rodando ou nao.
  else if (key=='1'){
    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        imagem[i][j] = fundo[0].get(i,j);
      }
    }
  }
  else if(key=='2'){
    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        imagem[i][j] = fundo[1].get(i,j);
      }
    }
  }
  else if(key=='3'){
    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        imagem[i][j] = fundo[2].get(i,j);
      }
    }
  }
  else if(key=='4'){
    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        imagem[i][j] = fundo[3].get(i,j);
      }
    }
  }
  else if(key=='5'){
    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        imagem[i][j] = fundo[4].get(i,j);
      }
    }
  }
  //quando as teclas numericas de 1 a 5 sao pressionadas,
  //muda-se a imagem que define as cores das minhocas
  else if(key=='R'||key=='r'){
    if(replicate){
      replicate = false;
    }
    else{
      replicate = true;
    }
  }
  //quando a tecla R e pressionada, pausa ou continua 
  //a replicacao das minhocas
  else if(key=='S'||key=='s'){
    save("/capturas/vermes"+random(3000)+".png");
  }
  //quando a tecla S e pressionada, salva o conteudo
  //da tela num arquivo png
  else  if (key=='H'||key=='h'){
    if(controls){
      controls = false;
    }
    else{
      controls = true;
    }
    //quando a tecla H e pressionada, esconde ou
    //mostra as informacoes e controles
  }
}

void draw(){
  if (play){
    //este condicional faz com que o programa rode
    //apenas se a variavel "play" for verdadeira
    fill(0,0,0,20);
    noStroke();
    rect(0,0,width,height);
    //preenche a tela com um preto transparente,
    //dando o efeito de rastro
    updateDir();
    updatePos();
    //chama as funcoes que atualizam a posicao e
    //a direcao das minhocas
    if(nNow<nMax && replicate){
      replicate();
    }
    //chama a funcao que reproduz as minhocas apenas
    //se duas condicoes forem satisfeitas: se o numero
    //maximo ainda nao foi atingido, e se a replicacao
    //esta ligada
    drawTail();
    stats();
    //chama duas funcoes, a de desenhar a minhoca e a de
    //desenhar os controles e informacoes
  }
}

float compX(float d, float v){
  return(cos(radians(d))*v);
}

float compY(float d, float v){
  return(sin(radians(d))*v);
}

//ja que a velocidade das minhocas e expressa vetorialmente,
//escrevi essas funcoes para tirar as componentes x e y da
//velocidade com base na direcao e modulo

void updateDir (){
  for (int i = 0; i < nNow; i++){
    dir [i] += random(-50,50);
  }
}
//atualiza a direcao de cada minhoca adicionando a ela uma
//componente aleatoria, fazendo a minhoca andar como uma
//barata tonta

void updatePos (){
  for (int i = 0; i < nNow; i++){
    px[i] = x[i];
    py[i] = y[i];
    x[i] += compX(dir[i],vel[i]);
    y[i] += compY(dir[i],vel[i]);
  }
}
//atualiza a posicao da minhoca adicionando a ela as compo-
//nentes x e y tiradas da direcao e modulo da velocidade
//atualiza tambem as posicoes anteriores deixando-as iguais
//as atuais antes de atualizar as atuais

void drawTail (){
  for (int i = 0; i < nNow; i++){
    stroke(worm[i]);
    strokeWeight(2);
    line(px[i],py[i],x[i],y[i]);
  }
}
//desenha as minhocas ligando as posicoes anteriores com as
//atuais

void replicate (){
  for (int i = 0; i < nNow; i++){
    if(random(100)>99){
      newWorm(x[i],y[i]);
    }
  }
}
//para cada minhoca, ha uma probabilidade de 1% de se reproduzir
//em cada frame do draw. caso se reproduza, uma nova minhoca e
//criada na posicao daquela que a deu origem.

void clear (){
  nNow = 0;
}
//limpa a tela deletando todas as minhocas. faz isso apenas atribuindo
//valor nulo pro numero atual de minhocas. porque todas as funções que
//interagem as minhocas usam um for que vai apenas ate o numero atual,
//entao quando este e zero nao se atualiza as posicoes nem se desenha
//as minhocas.

void newWorm (float posx,float posy){
  //uma funcao que cria uma minhoca pegando como argumento a posicao
  //onde ela nascera
  if (nNow <= nMax-1){
    x[nNow] = posx;
    y[nNow] = posy;
    px[nNow] = x[nNow];
    py[nNow] = y[nNow];
    //em um primeiro momento, as posicoes anteriores são igauis as atuais.
    //na primeira iteracao da funcao updatePos(), isso muda.
    vel[nNow] = random (8);
    dir[nNow] = random(360);
    //atribui direcoes e velocidades aleatorias
    if(x[nNow]>0 && x[nNow]<width && y[nNow]>0 && y[nNow]<height){
      worm[nNow] = imagem[int(posx)][int(posy)];
    }
    //atribui como cor o pixel na imagem de base que corresponde a
    //posicao onde nasceu a minhoca.
    //o condicional é importante para que nao haja acesso de valores
    //fora da imagem, dando um Array Index Out of Bounds Exception
    else{
      worm[nNow] = (0);
    }
    nNow ++;
    //incrementa o numero atual de minhocas, mantendo o numero sempre
    //atualizado
  }
}

void stats (){
  if(controls){
    fill(0);
    noStroke();
    rect(5,5,240,70);
    rect(5,385,100,10);
    fill(100);
    text("clique para criar um verme",10,15);
    text("backspace/delete-limpa a tela",10,25);
    text("1,2,3,4,5 muda o esquema de cor",10,35);
    text("R to liga/desliga a replicação",10,45);
    text("S salva, H esconde o menu",10,55);
    text(nNow+" vermes",10,395);
    if(play){
      text("enter pausa",10,65);
    }
    else{
      text("enter continua",10,65);
    }
  }
}
//essa funcao serve apenas para desenhar as instrucoes
//e comandos, e funciona apenas quando a variavel controls
//e verdadeira

