
import processing.opengl.*;//importar a livraria opengl
PFont pf;//importar fonte
PImage img;//importar imagem
import ddf.minim.*; // biblioteca minim
Minim m;// esta linha diz que a livraria Minim agora se chama m
AudioSample player_1;//audiosample da livraria
float  volume;//variavel 
int posX; //variavel 
int posY;//variavel 
AudioInput in;
float getIN;//variavel 
float scale_IN;//variavel 




void setup() // void setup serve para inserirmos os parametros da pagina que sao os parametros constantes 
{
  size(500, 500); // tamanho da janela
  img = loadImage("America.jpg");//load da imagem
  smooth(); // aliza a imagem
  pf = createFont("Arial-BoldMT", 50, true);// cria uma nova fonte
  m = new Minim(this);// da uma nova entrada na libraria Minim
  player_1 = m.loadSample("alarm.mp3", 512);//faz o load da sample e danos o buffersize de 512 amostras por segundo
  m.debugOn();//load da libraria Minim
  in = m.getLineIn(Minim.MONO, 2);//danos o som MONO em vez de Stereo
  scale_IN = 100; //valor da variavel scale_IN
  volume = 0;//valor da variavel volume
}
 
void draw() {  // void draw serve para que exista um loop e para inserir os parametros que queremos desenhar e que queremos que se repitao
background(255);//cor de fundo branca
imageMode(CORNER);//a imagem é apresentada apartir do canto
  
  getIN =  abs( in.left.get(0)) ; //esta linha serve para calcular o numero inteiro que nos é dado pelo input do microfone
   volume = getIN * scale_IN;// esta lina diz que o volume é o getIN *100 que é o valor do scale_IN
   
  int s = second();  // esta linha diz que 's' vai de 0 a 59 e danos os segundos
  int m = minute();  // esta linha diz que 'm' vai de 0 a 59 e danos os minutos
  int h = hour();    // esta linha diz que 'h' vai de 0 a 23 e danos as horas
  tint(s*2+100,200,170);//esta linha da cor ah imagem de funso com interacçao com os segundos
  image(img,0,0);//da nos a imagem e a posiçao
  if(h > 12) {h -= 12;}   //esta linha diz que se as horas forem maiores que 12 retiram se 12 hrs ou seja se forem 14 horas passam a ser 2
 
  
  noStroke();//retira o outline
  fill(0,55,255);//cor de preenchimento do arco
  //a linha de codigo a baixo foi retirada de outro local 
  arc(width/2, height/2, 350+m*2,350+m*2, PI+PI/2 ,PI+PI/2 + radians(m)/60*360);//arco 
  //( posX,posY,tamanho, tamanho, posiçao onde começa, posiçao onde acaba que neste caso é o valor de m em radians que é a traduçao de um angulo em graus para PI )
  
   fill(255);//cor de preenchimento da elipse
  ellipse(width/2, height/2, 100,100);// elipse (posX,posY,tamanho, tamanho) a posX e Y esta determinada para ser ao centro da janela
  //a linha a baixo diz que se o valor do volume for maior que 5 que o outline do arco dos segundos vai passar a ser 15+ o volMap que vai ser o valor gerado pelo calculadao de numeros inteiros esse valor que de seguida foi mapeado de 0 a 300
  if ( volume > 5) {
          float volMap = map (volume, 5, 50, 0, 300);
          strokeWeight(15+volMap);
    } else// e se n existir som nenhum o outline vai ser 15 + o valor de s a dividir por dois
    {
  strokeWeight(15+s/2);// define o outline que mostra as horas que aumenta consuante os segundos
    }
  
  stroke (255,20,20);//cor do outline
  //a linha de codigo a baixo foi retirada de outro local
  arc(width/2, height/2, 200,200, PI+PI/2 ,PI+PI/2 + radians(s)/60*360); //arco 
  //( posX,posY,tamanho, tamanho, posiçao onde começa, posiçao onde acaba que neste caso é o valor de s em radians que é a traduçao de um angulo em graus para PI )
  
  noStroke();//retira o outline
  fill(255,255,0);// cor de preenchimento da elipse
  ellipse(width/2, height/2, 199,199);//elipse (posX posY tamanho tamanho
  
  //a linha de codigo a baixo foi retirada de outro local
  fill(255);//cor de preenchimento do arco
  arc(width/2, height/2, 200,200, PI+PI/2 ,PI+PI/2 + radians(h)/12*360);//arco 
  //( posX,posY,tamanho, tamanho, posiçao onde começa, posiçao onde acaba que neste caso é o valor de h em radians que é a traduçao de um angulo em graus para PI )
 //'PI+PI/2 ,PI+PI/2' esta parte de codigo define a posiçao de começo como sendo em um relogio a 0ºgraus
  fill(0);//cor de preenchimento da elipse
  //esta linha de codigo diz que se pressionar o rato a elipse aumenta de tamanho
  if(mousePressed) { ellipse(width/2, height/2, 100,100);
  }
  else{ ellipse(width/2, height/2, 50,50);
}
//esta linha de codigo diz que se o rato for pressionado aparece as horas
if (mousePressed) { 
  
  fill(255);//preenchimento do texto
  textAlign(CENTER);//alinhamento do texto
  textSize(50);//tamanho do texto
  text( h+12,  width/2, height/2+10);//texto(texto,posX posY)
  }
}
//esta linha diz que se o rato for pressionado vai tocar o sample se som 1 vez por cada clic e n por cada frame
void mousePressed(){
   player_1.trigger();
}
//as linhas a baixo servem para que seja apagado da memoria do computador a livraria e o audio sample sempre que paramos a aplicaçao
void stop()
{
  player_1.close();
  m.stop();
  super.stop();
}

