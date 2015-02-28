
//..............import org.openkinect.*;
//..............import org.openkinect.processing.*;
// Showing how we can farm all the kinect stuff out to a separate class
//..............KinectTracker tracker;
// Kinect Library object
//..............Kinect kinect;
int quantidadeNeve=1000;  //mudar o numero se quiser mais ou menos flocos
int quantidadeBolas=5; // quantidade de bolas que vao aparecer no ecra mas so 1 e' que faz comecar a nevar

Snow[] snow = new Snow[quantidadeNeve]; // cria o array que vai guardar os flocos.
Bolas[] bolas = new Bolas[quantidadeBolas]; // cria o array que vai guardar as bolas que podem ser movidas

int totalFlocos;   // total de flocos que vao cair
boolean comecaNevar;
int posicaoXBotao;
int posicaoYBotao;
int tamanhoBotao;
//PVector posicao = new PVector(mouseX,mouseY);
PVector posicao;
int px; // usado para poder mudar do rato para o kinetic facilmente
int py; // usado para poder mudar do rato para o kinetic facilmente
int width = 600;
int height= 400;
int posicaoXBoto2=width/2;
int posicaoYBotao2=height/2;
int indexBotaoIniciar; // vai guardar o index do array das bolas que vai ter a cor a comecar nevar
color corBotaoIniciar; // vai guardar a cor que vai permitir comecar a nevar. depende do index

void setup() {   
  size(600,400); 
  smooth(); 
  //...............kinect = new Kinect(this);
  //...............tracker = new KinectTracker();
  comecaNevar=false;
  totalFlocos=0; // comeca com 0 flocos
  posicaoXBotao=width-50;
  posicaoYBotao= height-50;
  tamanhoBotao=60;
  noCursor();
  for (int i=0;i<quantidadeBolas;i++)
  {
    bolas[i] = new Bolas();
    bolas[i].circulos();
  }
  indexBotaoIniciar=int(random(0,4)); // escolhida a cor aleatoriamente baseado no index do array
  corBotaoIniciar=bolas[indexBotaoIniciar].corRandom; // e' guardada a cor aleatoria nesta variavel para ser mais tarde testada para comecar a nevar
  
  
}   

void draw()
{   
  background(0);// se a quantidade de flocos for maior ou igual ao array criado para os guardar
  // Run the tracking analysis
  //.......................tracker.track();
  // Show the image
  //tracker.display();
  //PVector posicao = tracker.getPos();  // apagar esta linha se quiser usar o rato
  posicao = new PVector(mouseX,mouseY);
  px = int(posicao.x);
  py = int(posicao.y);
  fill(100,250,50,100);
  noStroke();
  ellipse(px,py,20,20);
  for (int i=0;i<quantidadeBolas;i++)
  {
    bolas[i].circulos();
  }
  int loc = px+py*width; // localizao actual do pixel
  loadPixels();
  if ((pixels[loc]==color(corBotaoIniciar)))// se o cursor do rato passar pela cor guardada em corBotaoIniciar
  {
    comecaNevar=true;
  }
  if (comecaNevar) // entra aqui se passar o rato pelo botao
  {
    if (totalFlocos >= snow.length) // se ja foram criados todos os flocos de neve entra aqui
    {   
      int parouNevar=0;
      for (int i = 0; i < totalFlocos; i++) // corre todos os flocos para ver se ja chegaram ao fim
      {
        if (snow[i].y > height-20) // verifica se o floco chegou ao fim do ecra
        {
          parouNevar++; // contador de flocos que chegaram ao chao
          if (parouNevar>=quantidadeNeve) // se todos os flocos ja tiverem chegado ao chao
          {
            totalFlocos=0;
            comecaNevar=false;
          }
        }
      }
    }
    else // entra aqui enquanto os flocos nao chegarem ao fim
    { 
      // cria um floco 
      snow[totalFlocos] = new Snow(); 
      // aumenta a quantidade de flocos 
      totalFlocos++;
      // se chega ao fim do array da quantidade maxima dos flocos  
      // move e mostra os flocos
    }
    for (int i = 0; i < totalFlocos; i++)
    { 
      boolean tocou=snow[i].colisao(); //verifica se o cursor do rato colide com o floco de neve
      snow[i].colisaoBotao();
   //   snow[i].colisaoBotao2();
      if (!tocou) // se nao tocar continua a andar
      {   
        snow[i].move(); 
        snow[i].display();
        //snow[i].displaychuva();

      }
      else // se tocar manda o floco de neve para fora do ecra
      {
        snow[i].y=height+100;
      }
    }
  }
}

void keyPressed() {
  for (int i=0;i<quantidadeBolas;i++)
  {
    if ((key=='m')&&(dist(px,py,bolas[i].xRandom,bolas[i].yRandom)<=bolas[i].tamanhoRandom))
      {
         bolas[i].xRandom=px;
         bolas[i].yRandom=py;
      }
  }
 

  /*.....................int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t+=5;
      tracker.setThreshold(t);
    } 
    else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    }
  }.....................*/
  
}


class Bolas{
  float xRandom;
  float yRandom;
  float tamanhoRandom;
  color corRandom;
  
  Bolas(){
    xRandom=random(50,width-50);
    yRandom=random(50,height-50);
    tamanhoRandom=random(40,50);
    corRandom = color(int(random(10,255)),int(random(10,255)),int(random(10,255))); 
   // corRandom = corBotao; 
  }
  
void circulos() {
   noStroke();
   fill(corRandom);
   ellipse(xRandom,yRandom,tamanhoRandom,tamanhoRandom);
  }
  
}



class Imagens{
  float xRandom;
  float yRandom;
  float tamanhoRandom;
  PImage bebe;
  //color corRandom;
  
  Imagens(){
    xRandom=random(50,width-50);
    yRandom=random(50,height-50);
    tamanhoRandom=random(40,50);
    bebe = loadImage("bebe.png");
    
    //corRandom = color(int(random(10,255)),int(random(10,255)),int(random(10,255))); 
   // corRandom = corBotao; 
  }
  
void guardaChuvas() {
   noStroke();
   //fill(corRandom);
   imageMode(CENTER);
   image(bebe,xRandom,yRandom);
   //ellipse(xRandom,yRandom,tamanhoRandom,tamanhoRandom);
   
  }
  
}




/*class KinectTracker {



  // Size of kinect image
  int kw = largura;
  int kh = altura;
  int threshold = 450;

  // Raw location
  PVector loc;

  // Interpolated location
  PVector lerpedLoc;

  // Depth data
  int[] depth;


  PImage display;

  KinectTracker() {
    kinect.start();
    kinect.enableDepth(true);

    // We could skip processing the grayscale image for efficiency
    // but this example is just demonstrating everything
    kinect.processDepthImage(true);

    display = createImage(kw,kh,PConstants.RGB);

    loc = new PVector(0,0);
    lerpedLoc = new PVector(0,0);
  }

  void track() {

    // Get the raw depth as array of integers
    depth = kinect.getRawDepth();

    // Being overly cautious here
    if (depth == null) return;

    float sumX = 0;
    float sumY = 0;
    float count = 0;

    for(int x = 0; x < kw; x++) {
      for(int y = 0; y < kh; y++) {
        // Mirroring the image
        int offset = kw-x-1+y*kw;
        // Grabbing the raw depth
        int rawDepth = depth[offset];

        // Testing against threshold
        if (rawDepth < threshold) {
          sumX += x;
          sumY += y;
          count++;
        }
      }
    }
    // As long as we found something
    if (count != 0) {
      loc = new PVector(sumX/count,sumY/count);
    }

    // Interpolating the location, doing it arbitrarily for now
    lerpedLoc.x = PApplet.lerp(lerpedLoc.x, loc.x, 0.3f);
    lerpedLoc.y = PApplet.lerp(lerpedLoc.y, loc.y, 0.3f);
  }

  PVector getLerpedPos() {
    return lerpedLoc;
  }

  PVector getPos() {
    return loc;
  }

  void display() {
    PImage img = kinect.getDepthImage();

    // Being overly cautious here
    if (depth == null || img == null) return;

    // Going to rewrite the depth image to show which pixels are in threshold
    // A lot of this is redundant, but this is just for demonstration purposes
    display.loadPixels();
    for(int x = 0; x < kw; x++) {
      for(int y = 0; y < kh; y++) {
        // mirroring image
        int offset = kw-x-1+y*kw;
        // Raw depth
        int rawDepth = depth[offset];

        int pix = x+y*display.width;
        if (rawDepth < threshold) {
          // A red color instead
          display.pixels[pix] = color(255,255,255);
        } 
        else {
          display.pixels[pix] = img.pixels[offset];
        }
      }
    }
    display.updatePixels();

    // Draw the image
    image(display,0,0);
  }

  void quit() {
    kinect.quit();
  }

  int getThreshold() {
    return threshold;
  }

  void setThreshold(int t) {
    threshold =  t;
  }
}
*/




class Snow {   
  float x,y;   // posicao       
  float speed,speedx;  // velocidade da neve       
  color c;   // cor da neve
  float r;   //raio da neve  
  float inc; // vai ajudar a variar o angulo da queda da neve
  float[] distancia;
  
  Snow() {    
    r = random(3,5);                 // os flocos tem dimensao diferente    
    x = random(width);             //comeca numa posicao aleatoria    
    y = -r*4;                           // comeca em cima do ecra    
    speed = random(1,2);                     // velocidade aleatoria de cada floco   
    speedx = 1;
    //c = color(150,150,150);                 // cor da neve
    c = color(random(00,255),random(00,255),random(00,255), random(255,255));                 // cor da neve aleatoria para cada floco
    distancia=new float[quantidadeBolas];
   }     
  //Funcao que faz cair a neve
  void move() {
    if (y < height) // nao deixa a neve passar o fim do ecra para dar o efeito que caiu no chao
    {  
      //y += speed+map(mouseY,0,height,0,0.2);// neve cai
      y += speed*map(mouseY,0,height,0,1.2);// neve cai
//      y += speed*map(mouseY,0,height,0,1);             // outra forma da neve cair.
      inc += 0.01;
      x += speedx*(sin(inc)/10.0 + cos(inc*1.2)/20.0)+map(mouseX,0,width,-0.3,0.3); // efeito da neve a descolar para os lados
      
      //x += random(-0.3, 0.3);
    }
  }     
  // Verifica se tocou o cursor     
  boolean colisao() {
    float distancia = dist(x,y, px, py);       
    if (distancia < 10) {
      return true;
    }
    else {   
      return false;
    }
  }
  void colisaoBotao() {
    int contadorColisao=0;
    for (int i=0;i<quantidadeBolas;i++)
    {
      distancia[i] = dist(x,y,bolas[i].xRandom,bolas[i].yRandom);
      if (distancia[i] <= bolas[i].tamanhoRandom/1.8) // vai verificar se o floco esta em contacto com a bola
      {
        contadorColisao++;
      }
    }
      if (contadorColisao>0) // se o floco de neve estiver em contacto com alguma bola para
      {
        speed=0;
        speedx=0;
      }
      else
      {
        speed = random(1,2);                      
        speedx = 1;
      }
    }
  
  // mostra o floco    
  void display() {    
    fill(c);    // cor do floco
    noStroke();    
    ellipse(x,y,r*1.2,r*1.2);
  }
  // mostra a chuva
  /* void displaychuva() {   
   // Display the drop   
   fill(c);
   noStroke();    
   for (int i = 2; i < 8; i++ ) {  
   ellipse(x,y+i*2,i*1,i*1);
   }
   }*/
   
   
}

