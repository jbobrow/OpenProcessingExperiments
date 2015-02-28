
import hypermedia.video.*;          //  importa a OpenCV library

// som 
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim minim;

AudioPlayer musica;

FFT fft;




OpenCV opencv;                      //  cria uma nova libraria OpenCV 
PImage movementImg;                 //  Cria o PImage para manter a imagem em movimento
int apanhamonstros;                 //  Cria uma variável para contar o número total de monstros destruidos
ArrayList monstros;                 //  Creates an ArrayList to hold the Bubble objects


PFont font;                         //  cria um novo objecto: font

void setup()
{
  size ( 640, 480 );                      //  tamanho da imagem 640 x 480
  
  minim= new Minim(this);
  musica = minim.loadFile("som.mp3");
  musica.play();
  fft = new FFT(musica.bufferSize(),musica.sampleRate());
  opencv = new OpenCV( this );            // inicializa a libraria OpenCV
  opencv.capture( 640, 480 );             // Define o tamanho de captura da webcam para 640 x 480
  movementImg = new PImage( 640, 480 );   // Inicializa o PImage que mantém a imagem em movimento
  apanhamonstros = 0;                     
  
  monstros = new ArrayList();              //  inicializa o ArrayList
  
 
  font = loadFont("Serif-48.vlw");         //  Carregar ficheiro da fonte escolhida para a memória
  textFont(font, 25);    

    //  Adiciona um novo monstro ao array com random x position  

}

void draw()
{
 
  if ( monstros.size() < 5) {
    // monstro ( posX, posY, largura, altura )
    monstros.add(new monstro( ((int) random( width )),  -20, 50, 58));
   
  }
  
  opencv.read();                              //  Captura uma imagem a partir da câmara     
  opencv.flip(OpenCV.FLIP_HORIZONTAL);        //  movimento da imagem horizontalmente
  image( opencv.image(), 0, 0 );              //  captura a imagem da câmera 
  opencv.absDiff();                           //  cria uma imagem diferente
    
  opencv.convert(OpenCV.GRAY);                //  Converte para tons de cinza
  opencv.blur(OpenCV.BLUR, 3);                
  opencv.threshold(20);                       //  limites para converter para preto e branco
  movementImg = opencv.image();     
 
  tint (255); 
   image( movementImg, 0, 0 );              //  captura a imagem da câmera   
  
  
  for ( int i = 0; i < monstros.size(); i++ ){       //  criar um array para monstros
    monstro _monstro = (monstro) monstros.get(i);    //  Cópia o monstro actual para um objeto temporário
    
    if(_monstro.update() == 1){                      //  Se o retorno do monstro for '1'
      monstros.remove(i);      //  vai remover o monstro da matriz

      _monstro = null;                               //  e tornar o objecto monstro nulo
      i--;                                          
    
  }else{                                             //  se a funçao do monstro na actualizaçao nao retorna a 1
      monstros.set(i, _monstro);                    
      _monstro = null;                               
    }
  }
  
 
  opencv.remember(OpenCV.SOURCE, OpenCV.FLIP_HORIZONTAL);   
   fill (255,0,0);
  text("MONSTROS APANHADOS: " + apanhamonstros, 250, 420);                                                           

  
}



