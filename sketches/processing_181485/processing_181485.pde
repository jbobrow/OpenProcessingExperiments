
//aqui et deixo el link al dropbox, on podras trobar el zip
//amb el Sketch amb el so funcionant
// --->link: https://dl.dropboxusercontent.com/u/77992359/la%20lluvia.zip


Gota[] pluja = new Gota[800];
int vel1 = 4;
int vel2 = 8;
boolean velLlu = false;
boolean truenico = false;

void setup(){
  size (400, 600);
  for (int i = 0; i < pluja.length;i++){
    pluja[i] = new Gota(random(height), 0, random(vel1,vel2), color(0,0,255));
  }
  
  

}
void draw(){
  noStroke();
  //fondo
  background(196,190,190);

//gotas--------------------------------------
  for (int i = 0; i < pluja.length;i++){
    pluja[i].dibuixa();
   pluja[i].moure();
  }
//fin gotas---------------------------------
  //nubes
  fill(75,75,75);
  noStroke();
  ellipse(90, 25, 300, 160);
  ellipse(170, 20, 300, 160);
  ellipse(280, 27, 300, 160);
  ellipse(320, 23, 300, 160);
  //suelo
  noStroke();
  fill(64,32,0);
  rect(0, 550, 400, 50);
  //charcos
  noStroke();
  fill(49, 163, 193);
  ellipse(50, 575, 40, 40);
  ellipse(70, 570, 30, 30);
  ellipse(190, 575, 45, 35);
  ellipse(320, 575, 60, 40);
 //rayos y truenos y retruecanos y mas cosas
if(truenico) {

strokeWeight(8);
stroke(255);
//rayos
strokeWeight(8);
line(85, 75, 30, 175);
line(30, 175, 60, 220);
line(60, 220, 50, 250);
line(50, 250, 157, 312);

line(185, 80, 147, 170);
line(147, 170, 187, 221);

line(247, 57, 215, 141);
line(215, 141, 278, 179);
line(278, 179, 237, 252);


line(370, 58, 378, 174);
line(378, 174, 276, 266);
stroke(0);
//cuerpo
strokeWeight(3);
line(150, 550, 200, 450);
line(240, 550, 200, 450);
line(200, 450, 200, 300);
line(200, 315, 150, 385);
line(200, 315, 250, 385);
fill (238, 207, 161);
ellipse(200, 275, 40, 49);
//pelo
fill(0);
beginShape();
vertex(184, 259);
vertex(216, 259);
vertex(212, 237);
vertex(204, 248);
vertex(197, 237);
vertex(191, 248);
vertex(185, 243);
endShape(CLOSE);

//hojos
line(187, 271, 197, 271);
line(204, 271, 214, 271);
//boca
strokeWeight(2);
fill (255);
rect(190, 282, 20, 10);
line(196, 282, 196, 292);
line(202, 282, 202, 292);
line(190, 287, 210, 287);

  }//fin del humanoide xd

 }
 void mousePressed(){
  for (int i = 0; i < pluja.length;i++){
   pluja[i].masVel();
  }
 truenico = true; 
 }
 void mouseReleased(){
   for (int i = 0; i < pluja.length;i++){
     pluja[i].stopVel();
   }
   truenico = false;

 }
 


class Gota {
  color c;
  float xPos;
  float yPos;
  float ySpeed;
  
  Gota(){
    c = color(255,0,0);
    xPos = width;
    yPos = height;
    ySpeed = 1;
  }
  Gota(float x, float y, float vel, color newC){
    c = newC;
    xPos = x;
    yPos = y;
    ySpeed = vel;
  }
  void dibuixa(){
    fill(0,0,255);
    ellipse(xPos - 5, yPos-10, 5,5);
  }
  void moure(){
    yPos = (yPos + ySpeed)%height;
  }
  void masVel(){
    ySpeed = ySpeed*3;
    velLlu = true;
  }
  void stopVel(){
    ySpeed = ySpeed/3;
    velLlu = false;
  }

}


