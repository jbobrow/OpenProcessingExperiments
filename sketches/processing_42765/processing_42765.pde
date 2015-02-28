
PImage castoro;
PImage legno;
PImage pantegana;
PImage mela;
PImage pera;
PImage pausa;
PImage splash;

int score = 0;

//font
PFont font;

//boleane
boolean looping = true;

//posizione del castoro
float x = 750.0;
float y = 100.0;

float xlegno = -101.0;
float ylegno = 20.0;
float xpantegana = -101.0;
float ypantegana = 20.0;
float xmela = -101.0;
float ymela = -101.0;

//definisco velocità
int speed = 2;

//definisco tempo in relazione alla velocità
int time1 = 20000;

//int legna
int a[] = new int[10];
int b[] = new int[10];
//int pantegana
int c[] = new int[10];
int d[] = new int[10];
//int mela
int e[] = new int[10];
int f[] = new int[10];
//int pera
int g[] = new int[10];
int h[] = new int[10];



void setup() {
  size(960, 640);
  font = loadFont("BorisBlackBloxx-48.vlw");
  textFont(font);
  smooth();
  background(255);
  castoro = loadImage("castoro.png");
  legno = loadImage("legno.png");
  pantegana = loadImage("pantegana.png");
  mela = loadImage("mela.png");
  pera = loadImage("pera.png");
  pausa = loadImage("pausa.png");
  splash = loadImage("splashscreen.png");

  // array legna
  for (int i = 0; i < a.length; i = i + 1) {
    a[i] = int(random(width));
    b[i] = int(random(height));
    //pantegana
    c[i] = int(random(width));
    d[i] = int(random(height));
    //mela
    e[i] = int(random(width));
    f[i] = int(random(height));
    //pera
    g[i] = int(random(width));
    h[i] = int(random(height));
  }
}

void draw() {
  textSize(60);
  

  int currentTime = millis();
  background(255);
  
  //font score
  fill(222, 153, 4);
  textSize(20);
  text("score: " + score, 20, 30);

  image(castoro, x, y);
  
  //array legno
  for (int i = 0; i < a.length; i = i + 1) {
    if (a[i] > width) {
      a[i] = 0;
    }
    image(legno, a[i], b[i]);
    
    if(dist(x, y, a[i], b[i]) < 50){
      b[i] = -200;
      score++;
    }
    
    a[i] = a[i] + speed;
    
    //velocità_tempo_legno
    if (currentTime > time1) {
    a[i] = a[i] + speed;
    }
    if(currentTime > time1*2) {
    a[i] = a[i] + speed;
    }
    if(currentTime > time1*3) {
    a[i] = a[i] + speed;
    }
    if(currentTime > time1*4) {
    a[i] = a[i] + speed;
    }
    if(currentTime > time1*5) {
    a[i] = a[i] + speed;
    }
    
  }
  
  //array pantegana
   for (int i = 0; i < c.length; i = i + 1) {
    if (c[i] > width) {
      c[i] = 0;
    }
    image(pantegana, c[i], d[i]);
    
    if(dist(x, y, c[i], d[i]) < 50){
      d[i] = -200;
      score--;
    }
    
    c[i] = c[i] + speed;
    
    //velocità_tempo_pantegana
    if (currentTime > time1) {
    c[i] = c[i] + speed;
    }
    if(currentTime > time1*2) {
    c[i] = c[i] + speed;
    }
    if(currentTime > time1*3) {
    c[i] = c[i] + speed;
    }
    if(currentTime > time1*4) {
    c[i] = c[i] + speed;
    }
    if(currentTime > time1*5) {
    c[i] = c[i] + speed;
    }
  } 
  
    //array mela
   for (int i = 0; i < e.length; i = i + 1) {
    if (e[i] > width) {
      e[i] = 0;
    }
    image(mela, e[i], f[i]);

    if(dist(x, y, e[i], f[i]) < 50){
      f[i] = -200;
      score++;
    }

    e[i] = e[i] + speed;
    
    //velocità_tempo_mela
    if (currentTime > time1) {
    e[i] = e[i] + speed;
    }
    if(currentTime > time1*2) {
    e[i] = e[i] + speed;
    }
    if(currentTime > time1*3) {
    e[i] = e[i] + speed;
    }
    if(currentTime > time1*4) {
    e[i] = e[i] + speed;
    }
    if(currentTime > time1*5) {
    e[i] = e[i] + speed;
    }
  }
  
  //array pera
   for (int i = 0; i < g.length; i = i + 1) {
    if (g[i] > width) {
      g[i] = 0;
    }
    image(pera, g[i], h[i]);
    
    if(dist(x, y, g[i], h[i]) < 50){
      h[i] = -200;
      score++;
    }
    g[i] = g[i] + speed;
    
    //velocità_tempo_pera
    if (currentTime > time1) {
    g[i] = g[i] + speed;
    }
    if(currentTime > time1*2) {
    g[i] = g[i] + speed;
    }
    if(currentTime > time1*3) {
    g[i] = g[i] + speed;
    }
    if(currentTime > time1*4) {
    g[i] = g[i] + speed;
    }
    if(currentTime > time1*5) {
    g[i] = g[i] + speed;
    }
  }
}


//keyboard
void keyPressed() {
  // movement of the beaver 
  if (key == CODED) {
    if (keyCode == RIGHT) { //to move right

      x = x + 30.0;
    } 
    else if (keyCode == LEFT) { //to move left
      x = x - 30.0;
    } 
    else if (keyCode == UP) { //to move up
      y = y - 30.0;
    } 
    else if (keyCode == DOWN) { //to move down
      y = y + 30.0;
    }
  } 
  image(castoro, x, y);

}


void mousePressed() {
  if(looping) {
  noLoop(); 
  image(pausa, 150, 150);
  looping = false;
  } else {
  loop(); 
  looping = true; 
  background(255, 0, 0);

}
}

