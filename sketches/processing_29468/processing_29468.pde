
PGraphics tela;
int cor[] = new int[3];
int iniTimer, endTimer;

void setup(){
  tela = createGraphics(500, 500, JAVA2D);
  size (500, 500, JAVA2D);
  background(0);
  noCursor();
}

//iniTimer = millis();

void draw(){
  tela.beginDraw();
  tela.background(0,10);
  if(mousePressed) user();
  backdrop(); //ainda errado, corrigir.
  tela.endDraw();
  
  image(tela, 0, 0);
  filter(DILATE);

}

void user(){
  float posX = mouseX;
  float posY = mouseY;
  tela.strokeWeight(10);
  tela.stroke(4, 172, 185, 80);
  tela.fill(255, 250);
  tela.ellipse(posX, posY, 30, 30);
}

void backdrop(){
  float posX = random(0, 500);
  float posY = random(0, 500);
  for(int i = 0; i < 3; i++)
  cor[i]=int(random(0, 255));
  tela.strokeWeight(15);
  tela.stroke(cor[0], cor[1], cor[2], 90);
  tela.fill(cor[0], cor[1], cor[2], 150);
  tela.ellipse(posX, posY, 10, 10);

}

