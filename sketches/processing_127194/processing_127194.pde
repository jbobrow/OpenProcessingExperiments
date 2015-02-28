
/* @pjs preload = "apple_white.png"; */

PImage img; //gazou wo ireru hensu

//syokika
void setup() {
size(450,450); //gamen size
frameRate(30); //1byou ni 30frame
background(25); //haikeisyoku
noStroke(); //rinkaku wo byougasinai
smooth(); //object ni anti-aliasing wo kakeru
fill(0); //object wo kuro de nuritubusu
img = loadImage("apple_white.png"); //gazou wo hyouji
}


//kakkonai wo kurikaesu
void draw() {
  
  if (mousePressed) cursor();
  else noCursor(); //cursor wo kesu
   fill(0);
  image(img, mouseX, mouseY);
}

// mouse ga osaretatoki kakkonai wo jikkou
void mousePressed(){
  noStroke();
  fill(0,5);
  rectMode(CORNER); //kijyunnten wo center
  rect(0,0,width,height); //sikaku no byouga
  
for (int i = 0; i < 100; i ++) {
  ellipse(random(450), random(450), 60, 60); //maru no byouga
}
}

