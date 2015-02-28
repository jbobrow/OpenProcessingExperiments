
//this was inspired by a batch of posters for BUND - an environmentalist group that protects animals.
int words1 = 3000;
int words2 = 7000;
int words3 = 11000;
//initializing values in miliseconds for each sentence

int i; //flooding square height

void setup(){
  size(720,350);
  smooth();
}

void draw(){

  PImage bg;
  bg = loadImage("species.jpg"); //load bg
  image(bg, 0, 0);

  if(words1 < millis()){
    PImage w1;
    w1 = loadImage("w1.jpg"); //load first sentence
    image(w1, 150,260);
    fill(0);
    rect(0,300,width,i--);
  }
  if(words2 <millis()){//load second sentence
    fill(0);
    noStroke();
    rect(150,260,442,33);
    PImage w2;
    w2 = loadImage("w2.jpg");
    image(w2, 120,260);
  }
  if(words3 <millis()){ //load last sentence
    fill(0);
    noStroke();
    rect(120,260,481,33);
    PImage w3;
    w3 = loadImage("w3.jpg");
    image(w3, 100,260);
  }
}




