
PFont offer;
PFont cantRefuse;
PImage Godfather;
float yPos;
float xPos;
float yFinal;
float xFinal;

void setup(){
  size(800, 800);
  smooth();
    offer = loadFont("Desdemona-48.vlw");
    Godfather = loadImage("godfather_cat.jpg");
    cantRefuse = loadFont("Corleone-48.vlw");
    background(255);
    makeOffer();
        
}
  
  void draw(){
   if (mousePressed == true && (mouseX > xPos && mouseX < xFinal)
       && (mouseY < yPos && mouseY > yFinal) ){
     checkRefuse();
   }
  }

void makeOffer(){
    textSize(56);
    textFont(offer);
    fill(0);
    xPos = random(0, width - 100);
    yPos = random(50, height);
    xFinal = xPos + 125;
    yFinal = yPos - 35;
  text("Offer", xPos, yPos);
  println(xPos);
  println(xFinal);
  println(yPos);
  println(yFinal);
}

void checkRefuse(){
  float rand = random(1, 25);
  if (rand < 20){
    strokeWeight(10);
    stroke(255, 0, 0, 100);
    line (xPos, yFinal, xFinal, yPos);
    makeOffer();
  }else{
    background(0);
    textSize(56);
    textFont(cantRefuse);
    fill(255);
    text("An Offer", width/2, height/2);
    text("You Can't Refuse", width/2, height/2 + 50);
    image(Godfather, width/2 - 250, height/2 - 250, 250, 300);
  }
}

