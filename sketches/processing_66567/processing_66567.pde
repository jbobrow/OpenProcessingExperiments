
float posY = 200;
boolean position = false;
float r=int(random(255));
float g=int(random(255));
float b=int(random(255)); 
PFont fontStart;
PFont fontLose;
PFont fontWin;

void setup(){
  size(510,510);

  fontLose = loadFont("BankGothicBT-Medium-22.vlw");
  fontStart = loadFont("SimplifiedArabic-22.vlw");
  fontWin = loadFont("Arial-Black-24.vlw");

}

void draw(){
  fill(posY-r,posY-g,posY-b);
  noStroke();
  rect(0,0,width,height);
  println("R = "+posY+ "G = "+posY+ "B="+posY);
  fill(255);
  ellipse(width/2,posY,50,50);


  if(mouseY > posY+10){
    posY--;
  }
  if(mouseY < posY){
    posY--;
  }
  if(mouseY == posY){
    posY=posY+5;
  }
  if(mouseY > posY+10 && posY > 5){
  fill(255,0,0);
  textFont(fontStart);
  text("QUICKLY! STOP THE BALL",width/4,height/2);
  }
  frameRate(60);
  if(posY >= 500){
    fill(0,0,255);
    textFont(fontWin);
    text("Nice",230,width/2 + 25);
    text("You got our ball back!",width/4.25,height/2);
  }
  if(posY >= 500){
    stop();
  }
  if(posY <= 5){
    fill(255,255,255);
    textFont(fontLose);
    text("Way to go - You lost our ball!", width/6.5,height/2);
  }
}

