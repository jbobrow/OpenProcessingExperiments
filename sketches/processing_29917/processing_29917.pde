
//para inserir uma musica;
import ddf.minim.*;  
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim minim;

AudioPlayer musica;

FFT fft;



//variaveis que definem o jogo, vencedor, perdedor.
Boolean[][] board;
Integer[] win;
Boolean winner;
Boolean last;
int[]score = new int[3];
float theta;

//load dos dois monstros;
PImage monstroPNG;
PImage monstr2PNG;

void setup(){
  size(600,600); // tamanho da janela;
  // load da música; 
  minim= new Minim(this);
  musica = minim.loadFile("som.mp3");
  musica.play();
  fft = new FFT(musica.bufferSize(),musica.sampleRate());
  
  
  smooth();
  strokeWeight(5);
  board = new Boolean[3][3];
  win = new Integer[4];
  winner = null;
  last = (round(random(0,1)) == 0) ? true : false;
  textAlign(CENTER, CENTER); // formatação do texto, alinhado ao centro
  score[2]++;
  
  //load dos dois monstros;
  monstroPNG = loadImage("monstro.png"); 
  monstr2PNG = loadImage("monstr2.png");
}

void draw(){
  drawgrid(); // grelha
  drawboard();
  drawwin();
  drawcursor(); //variavel que controla o cursor 
}
// permite clicar , deixando o monstro na casa pretendida;
void mousePressed(){
  int x = mouseX/200;
  int y = mouseY/200;
    
  if (winner != null || full() )
      setup();
  
  else if (board[x][y] == null){
    if (mouseButton == LEFT)
       if (last == false){
         board[x][y] = true;
         last = true;
       }
       else{
         board[x][y] = false;
         last = false;
       }
    findwin();
  }
}

void drawboard(){
  for (int i=0; i<3; i++)
    for (int j=0; j<3; j++)
      if (board[i][j] != null){
        if (board[i][j] == true)
          drawo(i,j);
        else if (board[i][j] == false)
          drawx(i,j);
      }
}
// desenho da grelha de fundo;
void drawgrid(){
  background(252,224,8);
  stroke(0);
  line(200, 0, 200, 599);
  line(400, 0, 400, 599);
  line(0, 200, 599, 200);
  line(0, 400, 599, 400);
}

void drawo(int x, int y){ //MONSTRO1
image(monstroPNG, 0+x*200,200*y);
}

void drawx(int x, int y){ //MONSTRO2
image(monstr2PNG, 50+x*200,50+y*200);
}
// valores dos montros;
void findwin(){
  for (int i=0; i<3; i++){
    if (board[i][0] != null && board[i][1] != null && board[i][2] != null)
      if (board[i][0] == board[i][1] && board[i][0] == board[i][2])
        setwin(100+200*i, 0, 100+200*i, 599, board[i][0]);
  
    if (board[0][i] != null && board[1][i] != null && board[2][i] != null)
      if (board[0][i] == board[1][i] && board[0][i] == board[2][i])
        setwin(0, 100+200*i, 599, 100+200*i, board[0][i]);
  }
  
  if (board[0][0] != null && board[1][1] != null && board[2][2] != null)
    if (board[0][0] == board[1][1] && board[0][0] == board[2][2])
      setwin(0, 0, 599, 599, board[0][0]);

  if (board[0][2] != null && board[1][1] != null && board[2][0] != null)  
    if (board[0][2] == board[1][1] && board[0][2] == board[2][0])
      setwin(0, 599, 599, 0, board[1][1]);
}

void setwin(int a, int b, int c, int d, Boolean w){
   win[0] = a; win[1] = b; win[2] = c; win[3] = d; winner = w;
   if (w == false)
     score[0]++;
   else if (w == true)
     score[1]++;
 }

void drawwin(){ 
  if (win[0] != null || full()){
    stroke(100,200,0);
    if (win[0] !=null)
      line(win[0], win[1], win[2], win[3]);
    writewinner();
  }
}

void writewinner(){
    String s;
    PFont font = loadFont("Arial-Black-48.vlw");
    textFont(font, 96);
    if (winner != null){
      if (winner == false)
        s = "GANHOU"; // aparece no ecrã caso o jogador perca;
      else
        s = "0 VITÓRIAS"; // aparece no ecrã caso não haja mais hipoteses de jogo;
    }
    else
      s = "PERDEU!";
    noStroke();
    fill(255,200);
    rect(0,0,599,599);
    shadowtext(s, width/2, height/2, 3);
    textFont(font, 24);
    shadowtext("Jogar de Novo", width/2, height*.2, 1); // permite ao jogador jogar de novo, sem fechar a aplicação;
    
}

void shadowtext (String s, float x, float y, int o){
    fill(100,100);
    text(s, x+o, y+o);
    fill(0);
    text(s, x, y);
}

void drawcursor(){
  if (board[mouseX/200][mouseY/200] == null && winner==null)
    if (last == false)
      drawo(mouseX/200, mouseY/200);
    else
      drawx(mouseX/200, mouseY/200);
}

boolean full(){
  boolean full = true;
  for (int i=0; i<3; i++)
    for (int j=0; j<3; j++)
      if (board[i][j] == null)
        full = false;
  return full;
}

