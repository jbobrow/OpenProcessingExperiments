
PImage acorn;
PImage butternut;
PImage delicata;
PImage hubbard;
PImage kabocha;
PImage pumpkin;
PImage spaghetti;
PImage sweetdumpling;
PImage turban;

float maxFrameSize;

float acornX;
float acornY;

float butternutX;
float butternutY;

float delicataX;
float delicataY;

float hubbardX;
float hubbardY;

float kabochaX;
float kabochaY;

float pumpkinX;
float pumpkinY;

float spaghettiX;
float spaghettiY;

float sweetdumplingX;
float sweetdumplingY;

float turbanX;
float turbanY;

void setup(){
  size(900, 600);
  background(255);
  smooth();
  PFont font;
    font = loadFont("PrestigeEliteStd-Bd-18.vlw");
    textFont(font);
    fill(0);
  acorn = loadImage("acorn.png");
  butternut = loadImage("butternut.png");
  delicata = loadImage("delicata.png");
  hubbard = loadImage("hubbard.png");
  kabocha = loadImage("kabocha.png");
  pumpkin = loadImage("pumpkin.png");
  spaghetti = loadImage("spaghetti.png");
  sweetdumpling = loadImage("sweetdumpling.png");
  turban = loadImage("turban.png");
  
  acornX = (0);
  acornY = (0);
  
  butternutX = (300);
  butternutY = (0);
  
  delicataX = (600);
  delicataY = (0);
  
  hubbardX = (0);
  hubbardY = (200);
  
  kabochaX = (300);
  kabochaY = (200);
  
  pumpkinX = (600);
  pumpkinY = (200);
  
  spaghettiX = (0);
  spaghettiY = (400);
  
  sweetdumplingX = (300);
  sweetdumplingY = (400);
  
  turbanX = (600);
  turbanY = (400);
  
  
}  
void draw(){
  background(255);
  image(acorn, acornX, acornY);
  if (mouseX <= 300 && mouseY <= 200 && mouseX >= 0 && mouseY >= 0){
  text ("Acorn", 200,200);
  }
  image(butternut, butternutX, butternutY);
  if (mouseX >= 300 && mouseY <= 200 && mouseX <=600){
  text ("Butternut", 480,200);
  }
  image(delicata, delicataX, delicataY);
  if (mouseX >= 600 && mouseY <= 200){
  text ("Delicata", 780,200);
  }
  image(hubbard, hubbardX, hubbardY);
  if (mouseX <= 300 && mouseY <= 400 && mouseY >= 200){
  text ("Hubbard", 200,400);
  }
  image(kabocha, kabochaX, kabochaY);
  if (mouseX >= 300 && mouseY >= 200 && mouseX <=600 && mouseY <=400){
  text ("Kabocha", 480,400);
  }
  image(pumpkin, pumpkinX, pumpkinY);
  if (mouseX >= 600 && mouseY <= 400 && mouseY >=200){
  text ("Pumpkin", 780,400);
  }
  image(spaghetti, spaghettiX, spaghettiY);
  if (mouseX <= 300 && mouseY >= 400){
  text ("Spaghetti", 200,580);
  }
  image(sweetdumpling, sweetdumplingX, sweetdumplingY);
  if (mouseX <= 600 && mouseX >= 300 && mouseY >= 400){
  text ("Sweet Dumpling", 480,580);
  }
  image(turban, turbanX, turbanY);
  if (mouseX >= 600 && mouseY >= 400){
  text ("Turban", 780,580);
  }
}

