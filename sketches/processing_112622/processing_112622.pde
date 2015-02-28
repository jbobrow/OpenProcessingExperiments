
import ddf.minim.*;

Minim minim;

// Imagem da balinha
PImage mouseCursor;
// Imagem bg
PImage backgroundImage;
// Inicia o bonequinho no centro da tela
float x;
float y;
float easing;
// Velocidade máxima do boneco
float maxEasing = 1;
float angleToMouse;
float centerX;
float centerY;
// Distância em que o boneco para de seguir o mouse
float distanceToStopRunning = 10.0;
float distanceToReachCursor = 40.0;
int score;
Timer scoreTimer;

Timer increaseBonecoSpeedTimer;

// Diz se conseguiu alcançar o mouse
boolean reached;

// Animações do bonequinho
Animation animationRunning;
Animation animationReached;
// Animação atual dele
Animation currentAnimation;

void setup() {
  size(640, 480);
  mouseCursor = loadImage("bala.png");
  backgroundImage = loadImage ("bg.png");
  
  //rectMode(CENTER);
  animationRunning = new Animation("bonequinho", 18);
  animationReached = new Animation("bonequinhoPegou", 15);
  
  // Salva a posição do centro do bonequinho pra desenhar ele no centro
  centerX = animationRunning.images[0].width / 2;
  centerY = animationRunning.images[0].height / 2;
  
  // INICIALIZAÇÃO DO PLAYER
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  AudioPlayer backgroundMusic = minim.loadFile("bg.mp3");
  
  // Diminuir o volume da música de fundo
  backgroundMusic.setGain(-20.0);
  
  // tocar a música de fundo
  backgroundMusic.play();
  
  start();
}

void draw() { 
  background(backgroundImage);
  
  // Mostra o score no canto da tela
  text("Score: " + score, 10, 30);
  
  if (reached) {
    // Depois que tiver alcançado a balinha, se o usuário apertar
    // o mouse, reinicia a cena
    if (mousePressed) {
      start();
    }
  } else {
    // Só desenha balinha e faz o boneco se mexer se ele
    // ainda não tiver pego a balinha. Depois que ele tiver pego,
    // ou seja, reached = true, nunca mais vai entrar aqui.
    
    // Aumenta o score e reseta o timer se estiver na hora
    if (scoreTimer.isFinished()) {
      score += 1;
      scoreTimer.reset();
    }
    
    // Aumenta a velocidade do boneco se não tiver alcançado a velocidade máxima
    // e reseta o timer se estiver na hora
    if (increaseBonecoSpeedTimer.isFinished() && easing < maxEasing) {
      // Aumenta velocidade do boneco
      easing += 0.01;
      increaseBonecoSpeedTimer.reset();
    }
  
    // Se alcançou o mouse, marcar que alcançou e mudar a animação
    if (distance(x, y, mouseX, mouseY) <= distanceToReachCursor) {
      reached = true;
      currentAnimation = animationReached;
      println("Pegou!");
      
      // Tocar som de pegar a balinha
      AudioPlayer reachedSound = minim.loadFile("reached.mp3");
      reachedSound.play();
    }
    
    // Desenha a balinha 
    image(mouseCursor, mouseX, mouseY);
    
    // Move o boneco horizontalmente
    float dx = mouseX - x;
    if (abs(dx) > distanceToStopRunning) {
      x += dx * easing;
    }
  
    // Move o boneco verticalmente
    float dy = mouseY - y;
    if (abs(dy) > distanceToStopRunning) {
      y += dy * easing;
    }
    
    // Esse PI/2 gira o boneco em 90 graus, antes ele tava de lado
    angleToMouse = atan2(dy, dx) + PI / 2;   
  }

  pushMatrix();
  
  translate(x, y);
  rotate(angleToMouse);
  
  // Como a coordenada (0,0) do boneco é o canto superior esquerdo, 
  // ao invés de desenhar o boneco lá, desenhamos nas coordenadas do centro
  // (aquela que foi salva lá em cima, no setup)
  currentAnimation.display(-centerX, -centerY);
  popMatrix();
}

// Calcula a distância entre dois pontos usando Teorema de Pitágoras
float distance(float x1, float y1, float x2, float y2) {
  return sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2));
}

// Inicializa as variáveis pro estado inicial da cena
void start() {
  x = 320;
  y = 180;
  angleToMouse = 0.0;
  easing = 0.02;
  currentAnimation = animationRunning;
  reached = false;
  score = 0;
  // Aumenta score a cada 0.1 segundos
  scoreTimer = new Timer(100);
  // Aumenta velocidade do boneco à cada 2 segundos
  increaseBonecoSpeedTimer = new Timer(2000);
}
// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame;

  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    rectMode(CENTER);
    image(images[frame], xpos, ypos);
    println("xpos = " + x + "    ypos = " + y);
  }

  int getWidth() {
    return images[0].width;
  }
}

// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 10-5: Object-oriented timer

class Timer {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    reset();
  }
  
  void reset() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }
  
  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}


