
import ddf.minim.*;

int DURACAO_MARCOS = 16999;
int frequenciaAbreFecha = 2;
int numFramesPorCarinha = 2;  // The number of frames in the animation
int frame = 0;
int numCarinhas = 26;
float raioCarinha = 20;
float d = 0; // numero qualquer para inicializacao da variavel que reccebe calculo da distancia do mouse ao centro do botao

int xCarinhaMarcos, yCarinhaMarcos;
boolean primeiraCarinhaMarcos = true;

boolean[] par = new boolean[numCarinhas];  // inicializado com o défault
String[] estadoDaAnimacao = new String[numCarinhas];
PImage[] images = new PImage[numFramesPorCarinha*numCarinhas];
int[] xCarinha = new int[numFramesPorCarinha*numCarinhas];
int[] yCarinha = new int[numFramesPorCarinha*numCarinhas];

boolean inicio = true;
PImage[] image_marcos = new PImage[numFramesPorCarinha];
PImage[] fundo_imagem = new PImage[2];


Minim minim;
AudioPlayer[] song;
AudioPlayer songMarcos;

Timer timer;

void setup() {
  size(877, 500);

  minim = new Minim(this);
  // load a file, give the AudioPlayer buffers that are 2048 samples long
  song = new AudioPlayer[numCarinhas];
  song[0] = minim.loadFile("mila.mp3", 2048);
  song[1] = minim.loadFile("paulinha.mp3", 2048);
  song[2] = minim.loadFile("carol.mp3", 2048);
  song[3] = minim.loadFile("wall.mp3", 2048);
  song[4] = minim.loadFile("larissa.mp3", 2048);
  song[5] = minim.loadFile("denise.mp3", 2048);
  song[6] = minim.loadFile("paula.mp3", 2048);
  song[7] = minim.loadFile("vic.mp3", 2048);
  song[8] = minim.loadFile("marce.mp3", 2048);
  song[9] = minim.loadFile("dani.mp3", 2048);
  song[10] = minim.loadFile("erica.mp3", 2048);
  song[11] = minim.loadFile("yuri.mp3", 2048);
  song[12] = minim.loadFile("barbara.mp3", 2048);
  song[13] = minim.loadFile("ana.mp3", 2048);
  song[14] = minim.loadFile("jon.mp3", 2048);
  song[15] = minim.loadFile("rafaela.mp3", 2048);
  song[16] = minim.loadFile("luiza.mp3", 2048);
  song[17] = minim.loadFile("loretta.mp3", 2048);
  song[18] = minim.loadFile("heitor.mp3", 2048);
  song[19] = minim.loadFile("mariana.mp3", 2048);
  song[20] = minim.loadFile("maina.mp3", 2048);
  song[21] = minim.loadFile("karina.mp3", 2048);
  song[22] = minim.loadFile("arlete.mp3", 2048);
  song[23] = minim.loadFile("gab.mp3", 2048);
  song[24] = minim.loadFile("luana.mp3", 2048);
  song[25] = minim.loadFile("marcos.mp3", 2048);


  songMarcos = minim.loadFile("apmarcosf.mp3", 2048);
  timer = new Timer(DURACAO_MARCOS);

  for (int i = 0; i < numCarinhas; i++) {
    estadoDaAnimacao[i] = "parado";
  }

  xCarinhaMarcos = 210;
  yCarinhaMarcos = 43;

  xCarinha[0] = 536;  // Assign value to third element in the array
  yCarinha[0] = 271;  // Assign value to third element in the array

  xCarinha[1] = 536; // Assign value to third element in the array
  yCarinha[1] = 271;  // Assign value to third element in the array

  xCarinha[2] = 379;  // Assign value to third element in the array
  yCarinha[2] = 245;  // Assign value to third element in the array

  xCarinha[3] = 379;  // Assign value to third element in the array
  yCarinha[3] = 245;  // Assign value to third element in the array

  xCarinha[4] = 455; // Assign value to second element in the array
  yCarinha[4] = 262; // Assign value to second element in the array

  xCarinha[5] = 455;  // Assign value to third element in the array
  yCarinha[5] = 262;  // Assign value to third element in the array

  xCarinha[6] = 52;  // Assign value to third element in the array
  yCarinha[6] = 230;  // Assign value to third element in the array

  xCarinha[7] = 52;  // Assign value to third element in the array
  yCarinha[7] = 230;  // Assign value to third element in the array

  xCarinha[8] = 437;  // Assign value to third element in the array
  yCarinha[8] = 287;  // Assign value to third element in the array

  xCarinha[9] = 437;  // Assign value to third element in the array
  yCarinha[9] = 287;  // Assign value to third element in the array

  xCarinha[10] = 644; // Assign value to second element in the array
  yCarinha[10] = 233; // Assign value to second element in the array

  xCarinha[11] = 644;  // Assign value to third element in the array
  yCarinha[11] = 233;  // Assign value to third element in the array

  xCarinha[12] = 394;  // Assign value to third element in the array
  yCarinha[12] = 295;  // Assign value to third element in the array

  xCarinha[13] = 394;  // Assign value to third element in the array
  yCarinha[13] = 295;  // Assign value to third element in the array

  xCarinha[14] = 0;  // Assign value to third element in the array
  yCarinha[14] = 268;  // Assign value to third element in the array

  xCarinha[15] = 0;  // Assign value to third element in the array
  yCarinha[15] = 268;  // Assign value to third element in the array

  xCarinha[16] = 183; // Assign value to second element in the array
  yCarinha[16] = 251; // Assign value to second element in the array

  xCarinha[17] = 183;  // Assign value to third element in the array
  yCarinha[17] = 251;  // Assign value to third element in the array

  xCarinha[18] = 293;  // Assign value to third element in the array
  yCarinha[18] = 278;  // Assign value to third element in the array

  xCarinha[19] = 293;  // Assign value to third element in the array
  yCarinha[19] = 278;  // Assign value to third element in the array

  xCarinha[20] = 505;  // Assign value to third element in the array
  yCarinha[20] = 279;  // Assign value to third element in the array

  xCarinha[21] = 505;  // Assign value to third element in the array
  yCarinha[21] = 279;  // Assign value to third element in the array

  xCarinha[22] = 121;  // Assign value to third element in the array
  yCarinha[22] = 265;  // Assign value to third element in the array

  xCarinha[23] = 121;  // Assign value to third element in the array
  yCarinha[23] = 265;  // Assign value to third element in the array

  xCarinha[24] = 414;  // Assign value to third element in the array
  yCarinha[24] = 251;  // Assign value to third element in the array

  xCarinha[25] = 414;  // Assign value to third element in the array
  yCarinha[25] = 251;  // Assign value to third element in the array

  xCarinha[26] = 352;  // Assign value to third element in the array
  yCarinha[26] = 271;  // Assign value to third element in the array

  xCarinha[27] = 352;  // Assign value to third element in the array
  yCarinha[27] = 271;  // Assign value to third element in the array

  xCarinha[28] = 148;  // Assign value to third element in the array
  yCarinha[28] = 240;  // Assign value to third element in the array

  xCarinha[29] = 148;  // Assign value to third element in the array
  yCarinha[29] = 240;  // Assign value to third element in the array

  xCarinha[30] = 798; // Assign value to second element in the array
  yCarinha[30] = 270; // Assign value to second element in the array

  xCarinha[31] = 798;  // Assign value to third element in the array
  yCarinha[31] = 270;  // Assign value to third element in the array

  xCarinha[32] = 843;  // Assign value to third element in the array
  yCarinha[32] = 266;  // Assign value to third element in the array

  xCarinha[33] = 843;  // Assign value to third element in the array
  yCarinha[33] = 266;  // Assign value to third element in the array

  xCarinha[34] = 579;  // Assign value to first element in the array
  yCarinha[34] = 261;  // Assign value to first element in the array

  xCarinha[35] = 579; // Assign value to second element in the array
  yCarinha[35] = 261; // Assign value to second element in the array

  xCarinha[36] = 222;  // Assign value to third element in the array
  yCarinha[36] = 264;  // Assign value to third element in the array

  xCarinha[37] = 222;  // Assign value to third element in the array
  yCarinha[37] = 264;  // Assign value to third element in the array

  xCarinha[38] = 254;  // Assign value to third element in the array
  yCarinha[38] = 259;  // Assign value to third element in the array

  xCarinha[39] = 254;  // Assign value to third element in the array
  yCarinha[39] = 259;  // Assign value to third element in the array

  xCarinha[40] = 159;  // Assign value to third element in the array
  yCarinha[40] = 284;  // Assign value to third element in the array

  xCarinha[41] = 159;  // Assign value to third element in the array
  yCarinha[41] = 284;  // Assign value to third element in the array

  xCarinha[42] = 82;  // Assign value to third element in the array
  yCarinha[42] = 258;  // Assign value to third element in the array

  xCarinha[43] = 82;  // Assign value to third element in the array
  yCarinha[43] = 258;  // Assign value to third element in the array

  xCarinha[44] =39;  // Assign value to third element in the array
  yCarinha[44] = 274;  // Assign value to third element in the array

  xCarinha[45] = 39;  // Assign value to third element in the array
  yCarinha[45] = 274;  // Assign value to third element in the array

  xCarinha[46] = 323;  // Assign value to third element in the array
  yCarinha[46] = 247;  // Assign value to third element in the array

  xCarinha[47] = 323;  // Assign value to third element in the array
  yCarinha[47] = 247;  // Assign value to third element in the array

  xCarinha[48] = 479;  // Assign value to third element in the array
  yCarinha[48] = 299;  // Assign value to third element in the array

  xCarinha[49] = 479;  // Assign value to third element in the array
  yCarinha[49] = 299;  // Assign value to third element in the array

  xCarinha[50] = 684; // Assign value to second element in the array
  yCarinha[50] = 220; // Assign value to second element in the array

  xCarinha[51] = 684;  // Assign value to third element in the array
  yCarinha[51] = 220;  // Assign value to third element in the array



  frameRate(frequenciaAbreFecha);


  // TO DO: inicializar todas as imagens 
  fundo_imagem[0] = loadImage("inicio_fundod2.jpg");
  fundo_imagem[1] = loadImage("montagem.jpg");

  image_marcos[0] = loadImage("i_marcos_f.png");
  image_marcos[1] = loadImage("i_marcos_a.png");

  images[0]  = loadImage("mila_f.png");
  images[1]  = loadImage("mila_a.png");
  images[2]  = loadImage("paulinha_f.png");
  images[3]  = loadImage("paulinha_a.png");
  images[4]  = loadImage("carol_f.png");
  images[5]  = loadImage("carol_a.png");
  images[6]  = loadImage("wall_f.png");
  images[7]  = loadImage("wall_a.png");
  images[8]  = loadImage("larissa_f.png");
  images[9]  = loadImage("larissa_a.png");
  images[10]  = loadImage("denise_f.png");
  images[11]  = loadImage("denise_a.png");
  images[12]  = loadImage("paula_f.png");
  images[13]  = loadImage("paula_a.png");
  images[14]  = loadImage("vic_f.png");
  images[15]  = loadImage("vic_a.png");
  images[16]  = loadImage("marce_f.png");
  images[17]  = loadImage("marce_a.png");
  images[18]  = loadImage("dani_f.png");
  images[19]  = loadImage("dani_a.png");
  images[20]  = loadImage("erica_f.png");
  images[21]  = loadImage("erica_a.png");
  images[22]  = loadImage("yuri_f.png");
  images[23]  = loadImage("yuri_a.png");
  images[24]  = loadImage("barbara_f.png");
  images[25]  = loadImage("barbara_a.png");
  images[26]  = loadImage("ana_f.png");
  images[27]  = loadImage("ana_a.png");
  images[28]  = loadImage("jon_f.png");
  images[29]  = loadImage("jon_a.png");
  images[30]  = loadImage("rafa_f.png");
  images[31]  = loadImage("rafa_a.png");
  images[32]  = loadImage("luiza_f.png");
  images[33]  = loadImage("luiza_a.png");
  images[34]  = loadImage("loretta_f.png");
  images[35]  = loadImage("loretta_a.png");
  images[36]  = loadImage("heitor_f.png");
  images[37]  = loadImage("heitor_a.png");
  images[38]  = loadImage("mariana_f.png");
  images[39]  = loadImage("mariana_a.png");
  images[40]  = loadImage("maina_f.png");
  images[41]  = loadImage("maina_a.png");
  images[42]  = loadImage("karina_f.png");
  images[43]  = loadImage("karina_a.png");
  images[44]  = loadImage("arlete_f.png");
  images[45]  = loadImage("arlete_a.png");
  images[46]  = loadImage("gab_f.png");
  images[47]  = loadImage("gab_a.png");
  images[48]  = loadImage("luana_f.png");
  images[49]  = loadImage("luana_a.png");
  images[50]  = loadImage("marcos_f.png");
  images[51]  = loadImage("marcos_a.png");

  //imageMode(CENTER);
} 

void draw() {

  if (inicio) {
    background(fundo_imagem[0]);
    // Marcos falando
    if (!songMarcos.isPlaying()) {
      songMarcos.play();
      timer.start();
    }
    if (primeiraCarinhaMarcos) {
      image(image_marcos[0], xCarinhaMarcos, yCarinhaMarcos);
      primeiraCarinhaMarcos = false;
    }
    else {
      image(image_marcos[1], xCarinhaMarcos, yCarinhaMarcos);
      primeiraCarinhaMarcos = true;
    }
    if (timer.isFinished()) {
      inicio = false;
      println("timerTerminou");
    } 
    else {
      println(timer.passedTime);
    }
  } 
  else {  // se nao for inicio
    background(fundo_imagem[1]);
    for (int j = 0; j < numCarinhas; j++) {
      if (estadoDaAnimacao[j] == "andando") {
        if (!song[j].isPlaying()) {
          song[j].loop();
          song[j].play();
        }
        frame = frame++ % numFramesPorCarinha;
        if (par[j]) {
          image(images[numFramesPorCarinha*j], xCarinha[numFramesPorCarinha*j], yCarinha[numFramesPorCarinha*j]);
          par[j] = false;
        }
        else {
          image(images[numFramesPorCarinha*j+1], xCarinha[numFramesPorCarinha*j+1], yCarinha[numFramesPorCarinha*j+1]);
          par[j] = true;
        }
      }
      else {
        if (song[j].isPlaying()) {
          song[j].pause();
        }
        d = dist(mouseX, mouseY, xCarinha[numFramesPorCarinha*j]+15, yCarinha[numFramesPorCarinha*j]+15);
        if (d < raioCarinha) {
          image(images[numFramesPorCarinha*j+1], xCarinha[numFramesPorCarinha*j+1], yCarinha[numFramesPorCarinha*j+1]);
          //  image(images[numFramesPorCarinha*j], xCarinha[numFramesPorCarinha*j], yCarinha[numFramesPorCarinha*j],images[numFramesPorCarinha*j].width*1.30,images[numFramesPorCarinha*j].height*1.30);
          //          xCarinha[numFramesPorCarinha*j] += 1;
          //          yCarinha[numFramesPorCarinha*j] += random(-1, 1);
        }
        else {
          image(images[numFramesPorCarinha*j], xCarinha[numFramesPorCarinha*j], yCarinha[numFramesPorCarinha*j]);
        }
      }
    }
  }
}

void mousePressed() { 
  if (inicio == false) {
    for (int k = 0; k < numCarinhas; k++) { 
      d = dist(mouseX, mouseY, xCarinha[numFramesPorCarinha*k]+15, yCarinha[numFramesPorCarinha*k]+15);
      if (d < raioCarinha) {
        if (estadoDaAnimacao[k] == "andando") {
          estadoDaAnimacao[k] = "parado";
        } 
        else {
          estadoDaAnimacao[k] = "andando";
        }
      }
    }
  }
}

void stop() {
  // always close Minim audio classes when you are done with them
  for (int j = 0; j < numCarinhas; j++) {
    song[j].close();
  }

  songMarcos.close();
  // always stop Minim before exiting
  minim.stop();
}

class Timer {
 
  int passedTime;
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }
  
  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}


