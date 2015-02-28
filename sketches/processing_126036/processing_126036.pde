
/*
  Processing Intermediate Workshop
  UFES, Vitória, ES, Brazil
  December, 2013
  gianordoligabriel@gmail.com 
*/

ArrayList<Ball> myBalls;

void setup(){
  size(500, 500);
  colorMode(HSB);
  background(255);
  
  myBalls = new ArrayList();
  //Criando uma lista de objetos Ball com 16 elementos
  for(int i = 0; i < 16; i++){
    //Define 3 variáveis aleatórias: posição, diâmetro e cor
    int ballDiameter = int(random(20, 60));
    int matiz = int(random(0, 255));
    PVector ballPos = new PVector(random(ballDiameter, width - ballDiameter),
                                  random(ballDiameter, height - ballDiameter));    
    myBalls.add(new Ball(ballPos, ballDiameter, matiz));  
  }
}

void draw(){
  background(255);
  
  //Percorra minha lista e exiba cada bola!
  for(int i=0; i<myBalls.size(); i++){
    myBalls.get(i).display();
  }
}

void mousePressed(){
  //Percorra minha lista e cheque se o mouse está sobre alguma bola
  for(int i=0; i<myBalls.size(); i++){
    myBalls.get(i).checkPressed();
  }
}

void mouseReleased(){
  //Percorra minha lista e cheque se o mouse ESTAVA sobre alguma bola
  for(int i=0; i<myBalls.size(); i++){
    myBalls.get(i).checkReleased();
  }
}

class Ball{
  
  //Variáveis da minha classe Ball
  PVector ballPos;    //Vetor com a posição da minha bola (x, y)
  PVector ballSpeed;  //Vetor com a velocidade da minha bola (x, y)
  int ballDiameter;   //Diâmetro da minha bola
  Boolean isDragging; //Verifica se minha bola está sendo "arrastada"
  int matiz;          //Matiz da minha bola
  float atrito;       //Fator de desaceleração
  int timer;          //Contador de tempo para animar meu alerta
  int motionTime;     //Duração da minha animação de alerta
  
  //Inicializando cada objeto
  //Esses parâmetros são passados no setup()
  Ball(PVector tempBallPos, int tempBallDiameter, int tempMatiz){
    ballPos = tempBallPos;
    ballSpeed = new PVector(0, 0);
    ballDiameter = tempBallDiameter;
    isDragging = false;
    matiz = tempMatiz;
    atrito = map(ballDiameter, 20, 60, 0.98, 0.8);
    timer = millis();
    motionTime = 300;
  
    //Checa se a bola acabou sobreposta a outra
    //Se sim, repele (ver função)
    repele();  
  }
  
  //Exibe minha bola
  void display(){
    
    quica();  //Checa se encostou no limite do canvas 
    colide(); //Checa se encostou em alguma outra bola
    
    ballPos.x += ballSpeed.x;  //Incrementa a posição de acordo com a velocidade
    ballPos.y += ballSpeed.y;
    
    ballSpeed.x *= atrito;     //Reduz a velocidade de acordo com o atrito
    ballSpeed.y *= atrito;      
      
    //Se o mouse estiver "arrastando" a bola
    if(isDragging){
      //Linha
      stroke(0);
      strokeWeight(1);
      noFill();
      line(ballPos.x, ballPos.y, mouseX, mouseY);
      
      //Halo
      float haloDiameter =
      map(dist(ballPos.x, ballPos.y, mouseX, mouseY),
          0, width, 30, 200);
      haloDiameter = constrain(haloDiameter, 0, 200);
      
      ellipse(ballPos.x, ballPos.y,
              haloDiameter, haloDiameter);
    }
    
    //Desenha a bola
    noStroke();
    fill(matiz, 255, 255);
    ellipse(ballPos.x, ballPos.y, ballDiameter, ballDiameter);
    
    //Desenha o alerta (se dentro do timer)
    alerta();
  }
  
  //Função que desenha o alerta
  void alerta(){
    
    if(timer > millis()){
      stroke(0, 100);
      strokeWeight(2);
      strokeCap(SQUARE);
      
      float innerAlertRadius = map(timer - millis(),
                                   motionTime/2, 0,
                                   1.2, 2);
      float outerAlertRadius = map(timer - millis(),
                                   motionTime, motionTime/2,
                                   1.2, 2);
      innerAlertRadius = constrain(innerAlertRadius, 1.2, 2);
      outerAlertRadius = constrain(outerAlertRadius, 1.2, 2);
      
      for(int i=0; i<360; i += 36){
        float x1 = ballPos.x + cos(radians(i)) * ballDiameter/2 * innerAlertRadius;
        float y1 = ballPos.y + sin(radians(i)) * ballDiameter/2 * innerAlertRadius;
        float x2 = ballPos.x + cos(radians(i)) * ballDiameter/2 * outerAlertRadius;
        float y2 = ballPos.y + sin(radians(i)) * ballDiameter/2 * outerAlertRadius;
        line(x1, y1, x2, y2);
      }  
    }
  }
  
  //Função que "repele" uma bola em relação à outra, pra que elas NUNCA ocupem o mesmo espaço
  void repele(){
    for(int i=0; i<myBalls.size(); i++){
      Ball tempBall = myBalls.get(i);
      
      //Ignora a própria bola no array
      if(tempBall != this){
        float distancia = dist(ballPos.x, ballPos.y,
                               tempBall.ballPos.x, tempBall.ballPos.y);
                               
        //Se duas bolas estiverem encostando...
        if(distancia <= (ballDiameter + tempBall.ballDiameter)/2){
          //Vou calcular a direção de "fuga" de uma bola em relação à outra
          //e armazenar em um vetor 
          PVector direcao = new PVector(ballPos.x - tempBall.ballPos.x,
                                        ballPos.y - tempBall.ballPos.y);
          //Normalize mantém a proporção entre x e y do vetor,
          //mas transforma a soma dele em 1.
          //Em suma, tenho direção sem distância
          direcao.normalize();
          //Multiplico minha direção pela distância!
          //Adiciona 10% para afastar o suficiente!
          ballPos.x += direcao.x * distancia * 1.1;
          ballPos.y += direcao.y * distancia * 1.1;
        }  
      }
    }  
  }
  
  //Verifica a colisão com outras bolas
  void colide(){
    for(int i=0; i<myBalls.size(); i++){
      Ball tempBall = myBalls.get(i);
      if(tempBall != this){
        float distancia = dist(ballPos.x, ballPos.y,
                               tempBall.ballPos.x, tempBall.ballPos.y);
                               
        //Se colide com alguma bola...
        if(distancia <= (ballDiameter + tempBall.ballDiameter)/2){
          tempBall.ballSpeed.x += ballSpeed.x;
          tempBall.ballSpeed.y += ballSpeed.y;

          float angle = atan2(tempBall.ballPos.y - ballPos.y, tempBall.ballPos.x - ballPos.x);
          ballPos.x = tempBall.ballPos.x - cos(angle) * (tempBall.ballDiameter + ballDiameter)/2;
          ballPos.y = tempBall.ballPos.y - sin(angle) * (tempBall.ballDiameter + ballDiameter)/2;
          
          ballSpeed.x *= -1;
          ballSpeed.y *= -1;
          
          //Define um timer para desenhar o alerta
          //Esse if previne o timer de ficar sendo chamado
          //várias vezes quando duas bolas estão encostadas
          if(timer + 2*motionTime < millis()){
            timer = millis() + motionTime;
          }
        }  
      }
    }
  }
  
  //Verifica a colisão com as quinas
  void quica(){
    if(ballPos.x - ballDiameter/2 < 0){
      ballPos.x = ballDiameter/2;
      ballSpeed.x *= -1;
    }  
    if(ballPos.x + ballDiameter/2 > width){
      ballPos.x = width - ballDiameter/2;
      ballSpeed.x *= -1;
    }
    if(ballPos.y  - ballDiameter/2 < 0){
      ballPos.y = ballDiameter/2;
      ballSpeed.y *= -1;
    }
    if(ballPos.y + ballDiameter/2 > height){
      ballPos.y = height - ballDiameter/2;
      ballSpeed.y *= -1;
    }  
  }

  //Verifica se o mouse estava sobre ESSA bola quando foi pressionado
  void checkPressed(){
    float distancia = dist(ballPos.x, ballPos.y, mouseX, mouseY);
    if(distancia < ballDiameter/2){
      isDragging = true;
    }  
  }

  //Verifica se o mouse foi solto depois de "arrastar" essa bola
  void checkReleased(){
    if(isDragging){
      ballSpeed.x = (ballPos.x - mouseX)/10;
      ballSpeed.y = (ballPos.y - mouseY)/10;  
    }
    isDragging = false;  
  }  
}
