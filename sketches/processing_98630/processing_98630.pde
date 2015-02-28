
//Experiencia alienigene, quan cliques el mouse la vaca fa muuuu!!, i l'alien quan rebota fa un crit alienigene//

PImage vaca;//imatge de la vaca//
int posX, posY, velX, velY;

var audioElement1 = document.createElement("audio");
var audioElement2 = document.createElement("audio");


void setup(){
  size(800,600);
  posX = width/2;
  posY = height/2;
  velX = 4;
  velY = 4;
  
  audioElement1.setAttribute("src", "alien_crida.wav");
  audioElement2.setAttribute("src", "so_cow.wav");
  
  colorMode(RGB);
  vaca = loadImage("vacabona.png");
  noCursor();
    
}
 

void draw(){
  smooth();
  dibuixa_fons();
  image(vaca, mouseX-50, mouseY-50);
  
  posX = posX+velX;
  posY = posY+velY;
  
  //dibuixem l'alien//
    noStroke();
    fill (67,237,74);  
    ellipse(posX, posY+50, 40, 80);
    rect(posX-5, posY+100, 10, 35);
    rect(posX+5, posY+100, 10, 35);
    rect(posX+30, posY+50, 20, 10);
    rect(posX-30, posY+50, 20, 10);
    ellipse (posX, posY, 60, 80);
    fill (252,242,23);
    ellipse (posX+15, posY-5, 20, 10);
    ellipse (posX-15, posY-5, 20, 10);
 
  if((posX<30)||(posX>770)){
    velX = -velX;
    audioElement1.setAttribute("src", "alien_crida.wav");
    audioElement1.play();
  } 
    
  if((posY<30)||(posY>500)){
    velY = -velY;
    audioElement1.setAttribute("src", "alien_crida.wav");
    audioElement1.play();
  } 
}
  
void dibuixa_fons(){
  rectMode(CENTER);
  noStroke();
  fill(17,188,69);
  rect(width/2,520,800,170);
  fill(91,187,250);
  rect(width/2,217,800,435);
  fill(236,240,44,80);
  quad(340,110,460,110,530,400,280,400);
  fill(173,5,5);
  ellipse(width/2,105,200,75);
  fill(227,27,27);
  ellipse(width/2,100,200,75);
  stroke(53,73,240);
  strokeWeight(2);
  fill(53,123,240);
  ellipse(width/2,70,120,75);
  }
  
void mousePressed(){
    audioElement2.setAttribute("src", "so_cow.wav");
    audioElement2.play();
   }



