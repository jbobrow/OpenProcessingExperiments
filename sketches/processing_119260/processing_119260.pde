
//variables de posicion y velocidad
float xPos = 170;
float xSpeed = 0.5;
float xPos2 = 320;
float xSpeed2 = 0.5;
float xPos3 = 220;
float xSpeed3 = 1;
float yPos = 145;
float ySpeed = 1;

void setup(){
size (600,600);
}

void draw(){
background(148,118,92);
strokeWeight(1);
  
//raton marcando puntos  
//println(mouseX+","+mouseY);

//cabeza
noStroke();
fill(80,80,80);
ellipse(260,356,380,270);

//orejas
ellipse(70,320,80,120);
ellipse(450,320,80,120);

//cabello
fill(218,28,205);
beginShape();
noStroke();
vertex(240,240);
vertex(275,240);
vertex(323,75);
vertex(295,96);
vertex(279,75);
vertex(269,96);
vertex(259,75);
vertex(244,96);
vertex(224,75);
endShape(CLOSE);

//ojos
smooth();
fill(0,0,0);
arc(190,285,100,100,0,PI);
 
smooth();
fill(0,0,0);
arc(340,285,100,100,0,PI);
 
smooth();
fill(255,255,255);
arc(190,280,100,100,0,PI);
 
smooth();
fill(255,255,255);
arc(340,280,100,100,0,PI);
 
smooth();
fill(45,240,120);
arc(xPos2,280,25,25,0,PI);
xPos2 = xPos2 + xSpeed2;
  if(xPos2 >= 360) {
    xSpeed2 = -xSpeed2 ;
  } else if (xPos2 <= 320) {
    xSpeed2 = + 0.5;
  }

smooth();
fill(45,240,120);
arc(xPos,280,25,25,0,PI);
xPos = xPos + xSpeed;
  if(xPos >= 210) {
    xSpeed = -xSpeed ;
  } else if (xPos <= 170) {
    xSpeed = + 0.5;
  }
  
//boca
stroke(0);
strokeWeight(15);
line(210,415,310,415);
fill(255,255,255);
beginShape();
strokeWeight(1);
vertex(245,415);
vertex(245,440);
vertex(260,440);
vertex(260,415);
endShape(CLOSE);
beginShape();
vertex(260,415);
vertex(260,440);
vertex(275,440);
vertex(275,415);
endShape(CLOSE);

line(265,305,300,380);
line(300,380,265,370);

//perilla
noStroke();
fill(218,28,205);
triangle(240,465,265,520,285,465);

//mosca
fill(00,00,00);
ellipse(xPos3,yPos,5,5);
xPos3 = xPos3 + xSpeed3;
  if(xPos3 >= 300) {
    xSpeed3 = -xSpeed3 ;
  } else if (xPos3 <= 220) {
    xSpeed3 = + 1;
  }
  if (mousePressed){
      xPos = 190;
      xSpeed = 0;
      xPos2 = 340;
      xSpeed2 = 0;
      xPos3 = mouseX;
      xSpeed3 = 0;
      yPos = mouseY;
  }
  textSize(20);
  if (yPos >= 54 && yPos <= 539 && xPos3 >= 22 && xPos3 <= 499) {
    text("Como molesta",450,500);
    } else {
      text("Gracias!",450,500);
    }

}




