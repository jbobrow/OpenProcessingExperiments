
void setup(){
  size(400,400);
  stroke(128);
}

void draw() {
 background(0);
 println(mouseX + ", " + mouseY);
 /*Haut-gauche*/
 if (mouseX<200 && mouseY<200){
   fill(116,208,241);
   rect(0,0, 200, 200);
   viseur(mouseX,mouseY);
   fill(0);
   text("Go There ~>",70,20);
 }
 /*Haut-droite*/
 else if (mouseX>200 && mouseY<200) {
   fill(0,255,0);
   rect(200,0, 200, 200);
   line(290,75,310,75);
   line(290,75,290,125);
   line(310,75,310,125);
   line(280,125,290,125);
   line(310,125,320,125);
   line(280,125,300,150);
   line(300,150,320,125);
   fill(0);
   text("Follow Me :D",265,20);
   cible(300,300);
 }
 /*Bas-droite*/
 else if (mouseX>200 && mouseY>200) {
   fill(255,0,0);
   rect(200,200, 200, 200);
   viseur(mouseX,mouseY);
   cible(mouseY,mouseX);
cible(inverseX(mouseX+10), mouseY);
cible(inverseX(mouseX+20), inverseY(mouseY-50));
cible(inverseY(mouseY+50), inverseX(mouseX-30));
cible(inverseY(mouseY+70), mouseX-10);
cible(mouseX+100, inverseY(mouseY));
cible(mouseX+200, inverseY(mouseY-50));
cible(inverseY(mouseY+50), inverseX(mouseX-30));
cible(inverseY(mouseY+70), mouseX-10);
text("Enjoi !",275,225);
text("(<~ Ur teh winrar if u go tehr !)",225,380);
 }
 
 /*Bas-gauche*/
 else if (mouseX<200 && mouseY>200){ 
   fill(255);
   rect(0,200, 200, 200);
   PImage b;
b = loadImage("trollface.gif");
image(b,50,250, width/4, height/4);
fill(0);
text("U JELLY ?",75,360);
 }
 else if (mouseX==200 && mouseY==200) {
   background(255,0, 255);
  party(100,50);
 party(50,150);
party(200,100);
party(150,200);
party(300,350);
party(100,300);
party(150,250);
 }
 line(0, 200, 400, 200);
 line(200, 0, 200, 400);
}

/*Code perso*/
void party(int x, int y){
  text("!Party Hard!",x,y);
}

void viseur(int x, int y){
   fill(255,10); 
  stroke(0);
  strokeWeight(3);
  ellipse(x,y, 42, 42);
  strokeWeight(1);  
  ellipse(x,y,5,5); 
  strokeWeight(2);
  line(x-15,y,x-5,y);
  line(x+15,y,x+5,y);
  line(x,y-15,x,y-5);
  line(x,y+15,x,y+5);
}

void cible(int x,int y){
  fill(255,0,0);
  ellipse(x,y,50,50);
  fill(255);
  ellipse(x,y,35,35);
  fill(255,0,0);
  ellipse(x,y,20,20);
  fill(255);
  ellipse(x,y,5,5);
}

int inverseX (int x) {
  return(width-x);
}

int inverseY (int y) {
  return(height-y);
}

