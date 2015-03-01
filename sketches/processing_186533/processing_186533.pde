
//Variables
float MarioX, MarioY;
float MushyX1, MushyX2, MushyX3, MushyX4, MushyX5, MushyX6, MushyX7, MushyX8, MushyX9, MushyX10, MushyX11, MushyX12;
float MushyY1, MushyY2, MushyY3, MushyY4, MushyY5, MushyY6, MushyY7, MushyY8, MushyY9, MushyY10, MushyY11, MushyY12;
float Vx1, Vx2, Vx3, Vx4, Vx5, Vx6, Vx7, Vx8, Vx9, Vx10, Vx11, Vx12;
float MarioVY;
float gravity;
float segonAnterior;

//Variables Fotos
PImage Mario;
PImage Box;
PImage Pipe;
PImage Block;
PImage Plant;
PImage Mushy;
PImage Goomba;
PImage Fondo;
PImage Coin;
PImage PMBackground;

void setup() {

  size(800, 600);

  MarioX = width/2-35;
  MarioY = height/2+90;
  MarioVY = -2.6;

  //Posicions inicials Mushys
  MushyX1 = width/2-25;
  MushyY1 = height-417;
  MushyX2 = width/2-25;
  MushyY2 = height-417;
  MushyX3 = width/2-25;
  MushyY3 = height-417;
  MushyX4 = width/2-25;
  MushyY4 = height-417;
  MushyX5 = width/2-25;
  MushyY5 = height-417;
  MushyX6 = width/2-25;
  MushyY6 = height-417;
  MushyX7 = width/2-25;
  MushyY7 = height-417;
  MushyX8 = width/2-25;
  MushyY8 = height-417;
  MushyX9 = width/2-25;
  MushyY9= height-417;
  MushyX10 = width/2-25;
  MushyY10 = height-417;
  MushyX11 = width/2-25;
  MushyY11 = height-417;
  MushyX12 = width/2-25;
  MushyY12 = height-417;

  //Velocitats Mushys
  Vx1 = random(-2, 2);
  Vx2 = random(-2, 2);
  Vx3 = random(-2, 2);
  Vx4 = random(-2, 2);
  Vx5 = random(-2, 2);
  Vx6 = random(-2, 2);
  Vx7 = random(-2, 2);
  Vx8 = random(-2, 2);
  Vx9 = random(-2, 2);
  Vx10 = random(-2, 2);
  Vx11 = random(-2, 2);
  Vx12 = random(-2, 2);
  gravity = 1.6;

  //fotos
  Mario = loadImage("Mario.png");
  Box = loadImage("Box.png");
  Pipe = loadImage("MarioPipe.png");
  Block = loadImage("Block.png");
  Plant = loadImage ("Planta1.png");
  Mushy = loadImage ("Mushy.png");
  Goomba = loadImage ("Goomba.png");
  Fondo = loadImage ("Fondo.png");
  Coin = loadImage ("Coin.png");
  PMBackground = loadImage ("PMBackground.jpg");
  
}

void draw() {

  BackgroundFons();
  dibuixaMario();
  PlantaMinut();
  Fons();
  MushyHora();
  dibuixaCoin();
  CoinContador();
}

///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////FUNCIONS//////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////


void BackgroundFons() {
  if (hour()>1 && hour()<12) {
    image (Fondo, 0, 0, width, height);
    } else {
  image (PMBackground, 0, 0, width, height);
  }
}




void Fons() {

  image(Box, width/2-25, height-350, width/12, height/9);
  image(Block, width/2-25, height-130, width/12, height/9);
  image(Pipe, width/10, height-150, 100, 150);
  image(Pipe, width/10*8, height-150, 100, 150);
}

void dibuixaMario() {

  image(Mario, MarioX, MarioY, width/10, height/7.5);
  
  MarioY = MarioY + MarioVY;
  
  if (MarioY <= height/2+15 || MarioY >= height/2+90) {
      MarioVY = -MarioVY;
    
}
}

void CoinContador(){
  image (Coin, width-100, 25, width/20, height/16);
  fill(246, 214, 59);
  textSize(26);
  text(second(), width-60, 52);
  noFill();
}

void dibuixaCoin(){
   
  /*while(millis()>=500){
    image (Coin, width/2-25, height/2-130, width/12, height/10);
  }*/
  
  if (second()!=segonAnterior){
    segonAnterior=second();
    image (Coin, width/2-25, height/2-130, width/12, height/10);
   
  }
}

  

void PlantaMinut() {

  float minuts = map(minute(), 0, 59, height-150, 0);

  image(Plant, width/10+15, minuts, width/12, height);

  image(Plant, width/10*8+15, minuts, width/12, height);
}

////////////////////
////////////////////
//BOLETS i GOOMBAS//
////////////////////
////////////////////

void MushyHora() {

  if ((hour() >= 1) && (hour() < 13)) {
    image (Mushy, MushyX1, MushyY1, width/12, height/9);
    MushyY1 = MushyY1 + gravity;
    MushyX1 = MushyX1 + Vx1;

    if (MushyX1 >= width/10*8-45 || MushyX1 <= width/10+80) {
      Vx1 = -Vx1;
    }

    if (MushyY1 >= height-60) {
      MushyY1 = height-60;
    }
  }


  if ((hour() >= 2) && (hour() < 13)) {
    image (Mushy, MushyX2, MushyY2, width/12, height/9);
    MushyY2 = MushyY2 + gravity;
    MushyX2 = MushyX2 + Vx2;
    if (MushyX2 >= width/10*8-45 || MushyX2 <= width/10+80) {
      Vx2 = -Vx2;
    }
    if (MushyY2 >= height-60) {
      MushyY2 = height-60;
    }
  }

  if ((hour() >= 3) && (hour() < 13)) {
    image (Mushy, MushyX3, MushyY3, width/12, height/9);
    MushyY3 = MushyY3 + gravity;
    MushyX3 = MushyX3 + Vx3;
    if (MushyX3 >= width/10*8-45 || MushyX3 <= width/10+80) {
      Vx3 = -Vx3;
    }
    if (MushyY3 >= height-60) {
      MushyY3 = height-60;
    }
  }


if ((hour() >= 4) && (hour() < 13)) {
  image (Mushy, MushyX4, MushyY4, width/12, height/9);
  MushyY4 = MushyY4 + gravity;
  MushyX4 = MushyX4 + Vx4;
  if (MushyX4 >= width/10*8-45 || MushyX4 <= width/10+80) {
    Vx4 = -Vx4;
  }
  if (MushyY4 >= height-60) {
    MushyY4 = height-60;
  }
}


if ((hour() >= 5) && (hour() < 13)) {
  image (Mushy, MushyX5, MushyY5, width/12, height/9);
  MushyY5 = MushyY5 + gravity;
  MushyX5 = MushyX5 + Vx5;
  if (MushyX5 >= width/10*8-45 || MushyX5 <= width/10+80) {
    Vx5 = -Vx5;
  }
  if (MushyY5 >= height-60) {
    MushyY5 = height-60;
  }
}


if ((hour() >= 6) && (hour() < 13)) {
  image (Mushy, MushyX6, MushyY6, width/12, height/9);
  MushyY6 = MushyY6 + gravity;
  MushyX6 = MushyX6 + Vx6;
  if (MushyX6 >= width/10*8-45 || MushyX6 <= width/10+80) {
    Vx6 = -Vx6;
  }
  if (MushyY6 >= height-60) {
    MushyY6 = height-60;
  }
}


if ((hour() >= 7) && (hour() < 13)) {
  image (Mushy, MushyX7, MushyY7, width/12, height/9);
  MushyY7 = MushyY7 + gravity;
  MushyX7 = MushyX7 + Vx7;
  if (MushyX7 >= width/10*8-45 || MushyX7 <= width/10+80) {
    Vx7 = -Vx7;
  }
  if (MushyY7 >= height-60) {
    MushyY7 = height-60;
  }
}


if ((hour() >= 8) && (hour() < 13)) {
  image (Mushy, MushyX8, MushyY8, width/12, height/9);
  MushyY8 = MushyY8 + gravity;
  MushyX8 = MushyX8 + Vx8;
  if (MushyX8 >= width/10*8-45 || MushyX8 <= width/10+80) {
    Vx8 = -Vx8;
  }
  if (MushyY8 >= height-60) {
    MushyY8 = height-60;
  }
}


if ((hour() >= 9) && (hour() < 13)) {
  image (Mushy, MushyX9, MushyY9, width/12, height/9);
  MushyY9 = MushyY9 + gravity;
  MushyX9 = MushyX9 + Vx9;
  if (MushyX9 >= width/10*8-45 || MushyX9 <= width/10+80){
  Vx9 = -Vx9;
}
  if (MushyY9 >= height-60){
    MushyY9 = height-60;
  }
}

if ((hour() >= 10) && (hour() < 13)) {
  image (Mushy, MushyX10, MushyY10, width/12, height/9);
  MushyY10 = MushyY10 + gravity;
  MushyX10 = MushyX10 + Vx10;
  if (MushyX10 >= width/10*8-45 || MushyX10 <= width/10+80){
  Vx10 = -Vx10;
}
  if (MushyY10 >= height-60){
    MushyY10 = height-60;
  }
}

if ((hour() >= 11) && (hour() < 13)) {
 image (Mushy, MushyX11, MushyY11, width/12, height/9);
  MushyY11 = MushyY11 + gravity;
  MushyX11 = MushyX11 + Vx11;
  if (MushyX11 >= width/10*8-45 || MushyX11 <= width/10+80){
  Vx11 = -Vx11;
}
  if (MushyY11 >= height-60){
    MushyY11 = height-60;
  }
}
if ((hour() >= 12) && (hour() < 13)) {
 image (Mushy, MushyX12, MushyY12, width/12, height/9);
  MushyY12 = MushyY12 + gravity;
  MushyX12 = MushyX12 + Vx12;
  if (MushyX12 >= width/10*8-45 || MushyX12 <= width/10+80){
  Vx12 = -Vx12;
}
  if (MushyY12 >= height-60){
    MushyY12 = height-60;
  }
}

if ((hour() >= 13) && (hour() <= 24)) {
    image (Goomba, MushyX1, MushyY1, width/12, height/9);
    MushyY1 = MushyY1 + gravity;
    MushyX1 = MushyX1 + Vx1;

    if (MushyX1 >= width/10*8-45 || MushyX1 <= width/10+80) {
      Vx1 = -Vx1;
    }

    if (MushyY1 >= height-60) {
      MushyY1 = height-60;
    }
  }


  if ((hour() >= 14) && (hour() <= 24)) {
    image (Goomba, MushyX2, MushyY2, width/12, height/9);
    MushyY2 = MushyY2 + gravity;
    MushyX2 = MushyX2 + Vx2;
    if (MushyX2 >= width/10*8-45 || MushyX2 <= width/10+80) {
      Vx2 = -Vx2;
    }
    if (MushyY2 >= height-60) {
      MushyY2 = height-60;
    }
  }

  if ((hour() >= 15) && (hour() <= 24)) {
    image (Goomba, MushyX3, MushyY3, width/12, height/9);
    MushyY3 = MushyY3 + gravity;
    MushyX3 = MushyX3 + Vx3;
    if (MushyX3 >= width/10*8-45 || MushyX3 <= width/10+80) {
      Vx3 = -Vx3;
    }
    if (MushyY3 >= height-60) {
      MushyY3 = height-60;
    }
  }


if ((hour() >= 16) && (hour() <= 24)) {
  image (Goomba, MushyX4, MushyY4, width/12, height/9);
  MushyY4 = MushyY4 + gravity;
  MushyX4 = MushyX4 + Vx4;
  if (MushyX4 >= width/10*8-45 || MushyX4 <= width/10+80) {
    Vx4 = -Vx4;
  }
  if (MushyY4 >= height-60) {
    MushyY4 = height-60;
  }
}


if ((hour() >= 17) && (hour() <= 24)) {
  image (Goomba, MushyX5, MushyY5, width/12, height/9);
  MushyY5 = MushyY5 + gravity;
  MushyX5 = MushyX5 + Vx5;
  if (MushyX5 >= width/10*8-45 || MushyX5 <= width/10+80) {
    Vx5 = -Vx5;
  }
  if (MushyY5 >= height-60) {
    MushyY5 = height-60;
  }
}


if ((hour() >= 18) && (hour() <= 24)) {
  image (Goomba, MushyX6, MushyY6, width/12, height/9);
  MushyY6 = MushyY6 + gravity;
  MushyX6 = MushyX6 + Vx6;
  if (MushyX6 >= width/10*8-45 || MushyX6 <= width/10+80) {
    Vx6 = -Vx6;
  }
  if (MushyY6 >= height-60) {
    MushyY6 = height-60;
  }
}


if ((hour() >= 19) && (hour() <= 24)) {
  image (Goomba, MushyX7, MushyY7, width/12, height/9);
  MushyY7 = MushyY7 + gravity;
  MushyX7 = MushyX7 + Vx7;
  if (MushyX7 >= width/10*8-45 || MushyX7 <= width/10+80) {
    Vx7 = -Vx7;
  }
  if (MushyY7 >= height-60) {
    MushyY7 = height-60;
  }
}


if ((hour() >= 20) && (hour() <= 24)) {
  image (Goomba, MushyX8, MushyY8, width/12, height/9);
  MushyY8 = MushyY8 + gravity;
  MushyX8 = MushyX8 + Vx8;
  if (MushyX8 >= width/10*8-45 || MushyX8 <= width/10+80) {
    Vx8 = -Vx8;
  }
  if (MushyY8 >= height-60) {
    MushyY8 = height-60;
  }
}


if ((hour() >= 21) && (hour() <= 24)) {
  image (Goomba, MushyX9, MushyY9, width/12, height/9);
  MushyY9 = MushyY9 + gravity;
  MushyX9 = MushyX9 + Vx9;
  if (MushyX9 >= width/10*8-45 || MushyX9 <= width/10+80){
  Vx9 = -Vx9;
}
  if (MushyY9 >= height-60){
    MushyY9 = height-60;
  }
}

if ((hour() >= 22) && (hour() <= 24)) {
  image (Goomba, MushyX10, MushyY10, width/12, height/9);
  MushyY10 = MushyY10 + gravity;
  MushyX10 = MushyX10 + Vx10;
  if (MushyX10 >= width/10*8-45 || MushyX10 <= width/10+80){
  Vx10 = -Vx10;
}
  if (MushyY10 >= height-60){
    MushyY10 = height-60;
  }
}

if ((hour() >= 23) && (hour() <= 24)) {
 image (Goomba, MushyX11, MushyY11, width/12, height/9);
  MushyY11 = MushyY11 + gravity;
  MushyX11 = MushyX11 + Vx11;
  if (MushyX11 >= width/10*8-45 || MushyX11 <= width/10+80){
  Vx11 = -Vx11;
}
  if (MushyY11 >= height-60){
    MushyY11 = height-60;
  }
}
if ((hour() >= 24) && (hour() <= 1)) {
 image (Goomba, MushyX12, MushyY12, width/12, height/9);
  MushyY12 = MushyY12 + gravity;
  MushyX12 = MushyX12 + Vx12;
  if (MushyX12 >= width/10*8-45 || MushyX12 <= width/10+80){
  Vx12 = -Vx12;
}
  if (MushyY12 >= height-60){
    MushyY12 = height-60;
  }
}

}



