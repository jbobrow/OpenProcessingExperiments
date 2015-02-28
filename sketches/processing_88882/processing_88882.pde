
BallBall [] ballsList = new Ball[1];
//opções de background
int alphaBg = 10;
int backgroundColor = 0;
boolean bg = true;
//parametro inicial para o objeto na array
float initDiam = 4;
float initAngle = 0.4;
float initOffset = 10;
 
//incrementando os parametros do objeto adicionado
float incDiam = 2;
float incAngle = 0.4;
float incOffset = 10;

//controle das cores ativas através do teclado
boolean cr = false;
boolean cg = false;
boolean cb = false;

//Se uma cor for desativada, retorna o resultColor
int resultColor = 0;

//status das cores ao serem ativadas
color redStat;
color greenStat;
color blueStat;

void setup(){
  size(500,500);
  smooth();
  frameRate(60);
  ballsList[0] = new Ball(initDiam,initAngle,initOffset);
}
  
void draw(){

  //cuidando do Background
  fill(backgroundColor,alphaBg );
  rect(0,0,width,height);
  
  //criando a primeira array e adicionando todas as funções
  for(int i = 0; i< ballsList.length; i++){
    ballsList[i].run();

  }
  
  //se o mouse for pressionado, o rastro das bolas é apagado
  if(mousePressed){
    alphaBg++;
  }else{
    alphaBg = 10;
  }
  
  //teste para garantir que se o fundo for preto a bola inicial apareça branca e vice versa
  //garante também que os medidores de cores também mudem com a cor do fundo
  if(backgroundColor == 0){
    resultColor = 255;
    redStat = 255;
    greenStat = 255;
    blueStat = 255;
  }else{
    resultColor = 0;
    redStat = 0;
    greenStat = 0;
    blueStat = 0;
  }
   
  if(bg){
    backgroundColor = 0;
  }else{
    backgroundColor = 255;
  }
  
  if(cr){
      for(int i = 0; i < ballsList.length; i++){
        ballsList[i].r = ballsList[i].randomR;
      }
      //garante o status para vermelho
      redStat = #ff0000;
    }else{
      for(int i = 0; i < ballsList.length; i++){
        ballsList[i].r = resultColor;
      }
    }

  if(cg){
    for(int i = 0; i < ballsList.length; i++){
      ballsList[i].g = ballsList[i].randomG;
    }
    //garante o status para verde
    greenStat = #00ff00;
  }else{
    for(int i = 0; i < ballsList.length; i++){
      ballsList[i].g = resultColor;
    }
  }
  
  if(cb){
    for(int i = 0; i < ballsList.length; i++){
      ballsList[i].b = ballsList[i].randomB;
    }
    //garante o status para azul
    blueStat = #0000ff;
  }else{
    for(int i = 0; i < ballsList.length; i++){
      ballsList[i].b = resultColor;
    }
  }
  
  fill(blueStat);
  rect(width-40,height-40,10,10);
  fill(greenStat);
  rect(width-70,height-40,10,10);
  fill(redStat);
  rect(width-100,height-40,10,10);

}
 
void keyPressed(){
  if(key == '+'){
    //se a array for igual a 1, resetar os incrementos
    if(ballsList.length == 1){
      incDiam = 0;
      incAngle = 0;
      incOffset = 0;
    }
    //incrementando os parametros
    incDiam+= 2;
    incAngle+= 0.4;
    incOffset+= 10;
    //mostrando a bola e adicionando
    Ball  newBall = new Ball(initDiam+incDiam,initAngle+incAngle,initOffset+incOffset*1.2);
    ballsList = (Ball[]) append(ballsList, newBall);
  }
   
  if(key == '-'){
    //diminuindo a array
    ballsList = (Ball[]) shorten(ballsList);
    //se a array diminuir a 0, aumentar 1 para não deixar ela desaparecer
    if(ballsList.length == 0){
      Ball  newBall = new Ball(initDiam,initAngle,initOffset);
      ballsList = (Ball[]) append(ballsList, newBall);
    }
  }
  //controle do background, apaga e acende
  if(key == 'w' || key == 'W'){
    bg = !bg;
  }
  //controle das cores, liga e desliga o random 
  if(key == 'r' || key == 'R'){
    cr = !cr;
  }
  
  if(key == 'g' || key == 'G'){
    cg = !cg;
  }
  if(key == 'b' || key == 'B'){
    cb = !cb;
  }  
}

class Ball{
  float x,y,diam,rad,angle,offset;
  float deg = 0.0;
  float r = 255;
  float g = 255;
  float b = 255;
  
  float randomR = random(255);
  float randomG = random(255);
  float randomB = random(255);
    
  Ball(float tempDiam, float tempAngle, float tempOffset){
    diam = tempDiam;
    angle = tempAngle;
    offset = tempOffset;
  }
    
  void run(){
    display();
    circular();
  }
    
  void display(){
    fill(r,g,b);
    noStroke();    
    ellipse(x,y,diam,diam);
  }
    
  void circular(){
    deg+= angle;
    rad = radians(deg);  
    x = sin(rad)*offset + mouseX;
    y = cos(rad)*offset + mouseY;
    

  }
 
}
