
PFont f; //Pfont variabel
PImage mBackground; //variabel för bakgrundsbild
//variablar för Mario
PImage mario;
PImage mario2;
PImage mario3;
PImage marioL;
PImage marioL2;
PImage marioL3;

float marioSize=30;//ställ storlek på Mario

void setup() {

  size(320, 279);//fönsterstorlek
  f = loadFont("Tahoma-12.vlw"); //laddar teckensnitt
  mBackground = loadImage("backgroundImage.png");//bakgrundsbild
  //läs in bildfiler
  mario = loadImage("mario.png"); 
  mario2 = loadImage("mario2.png"); 
  mario3 = loadImage("mario3.png"); 

  marioL = loadImage("marioL.png"); 
  marioL2 = loadImage("marioL2.png"); 
  marioL3 = loadImage("marioL3.png"); 
  frameRate(18);
  smooth();
}

void draw() {
  image(mBackground, 0, 0);
  textFont(f, 12);
  fill(255); //textfärg
  text("Styr Mario med musen. LMB för att simma vänster.",10, 15);
//om vänster musknapp är nedtryckt simmar Mario åt vänster eller om den inte är det
//simmar Mario åt höger. 
  if (mousePressed && (pmouseY-mouseY)>0) {
    image(marioL, mouseX, mouseY, marioSize, marioSize);
  }
  else if (mousePressed && (pmouseY-mouseY)>=-10) {
    image(marioL2, mouseX, mouseY, marioSize, marioSize);
  }
  else if (mousePressed && (pmouseY-mouseY)<-10) {
    image (marioL3, mouseX, mouseY, marioSize, marioSize);
  }
  else if (frameCount%3==0) {
    image(mario, mouseX, mouseY, marioSize, marioSize);
  } 
  else if (frameCount%2==0) {
    image(mario2, mouseX, mouseY, marioSize, marioSize);
  }
  else if (frameCount%2!=0 && frameCount%3!=0) {
    image(mario3, mouseX, mouseY, marioSize, marioSize);
  }
}


