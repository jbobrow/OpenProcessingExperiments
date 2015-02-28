
PVector pos;
PVector vel;
boolean pause = true;
boolean fim = false;
int[] [] blocos;

void setup() {
  size (300, 300);
  smooth();
  strokeWeight(3);
  fill(128);
  stroke(255);
  frameRate(25);
  pos = new PVector (width/2, height/2);
  vel = new PVector (10, -5);
  blocos = new int[7][4];
  for (int x = 0; x < 7; x++){
    for (int y = 0; y < 4; y++)
    blocos[x][y] = 1;
  }
  textFont( loadFont( "Verdana-Bold-48.vlw" ));
}

void draw(){
  background(0);
  if (!pause) {
    update();
  }
  ellipse(pos.x, pos.y, 20, 20);
  rect( mouseX - 35, 270, 70, 20 );
  fim = true;
  for (int x = 0; x < 7; x++) {
    for (int y = 0; y <4; y++) {
    if (blocos [x][y] > 0) {
      fim = false;
      fill(128);
      rect(10 + x*40, 10 + y*20, 40, 20);
    }
    }
  }
  if (fim) {
    pause = true;
    fill(255);
    textSize(16);
    text("PARABÉNS!!! VOCÊ VENCEU!!!", 50, 200);
  }
  if (pause) {
    textSize(12);
    fill(128);
    text ( "pressione o botão do mouse para continuar", 5, 250);
  }
}
  
  
  
void update(){
  pos.add(vel);
  if (pos.x + 10 > width || pos.x - 10 < 0) {
    vel = new PVector (-vel.x, vel.y);
  }
  if (pos.y - 10 < 0) {
    vel = new PVector (vel.x, -vel.y);
  }
  if (pos.y + 10 > height) {
  vel = new PVector (vel.x, - vel.y);
  pos = new PVector (width/2, height/2);
  pause = true;
  }
  if ( pos.y >= 260 && pos.x >= mouseX - 35 && pos.x <= mouseX +35 ) {
    vel = new PVector( int(map( pos.x - mouseX, -35, 35, -10, 10 )), -vel.y);
  }
  for (int x = 0; x < 7; x++) {
    for( int y = 0; y < 4; y++) {
      if (blocos[x][y] > 0) {
        if (pos.x + 10 > 10 + x*40 && pos.x - 10 < 10 + x*40 + 40 && pos.y + 10 + y*20 > 10 && pos.y - 10 < 10 + y*20 + 20){
          blocos[x][y] = 0;
          if (pos.x > 10 + x*40 && pos.x < 10 + x*40 + 40){
            vel = new PVector(vel.x, -vel.y);
          }
          if (pos.y > 10 + y*20 && pos.y < 10 + y*20 + 20){
            vel = new PVector ( -vel.x, vel.y);
          }
        }
      }
    }
  }
}

void mousePressed() {
  pause = !pause;
  if (fim) {
    for (int x = 0; x<7; x++){
      for (int y = 0; y < 4; y++) {
        blocos[x][y] = 1;
      }
    }
    pos = new PVector (width/2, height/2);
    vel = new PVector (10, -5);
    fim = false;
  }
}

