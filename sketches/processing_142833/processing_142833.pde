
void setup(){
size(500,600);

}

void draw (){
  background(255);
  noCursor();

dibuixNobita();
comprobarLimits();

}

void dibuixNobita(){
//cabell
fill(0);
ellipse(275,200,350,350);

fill(255);
noStroke();
ellipse(300,325,300,300);

//cara fons
fill(252,198,164);
ellipse(250,250,300,250);
noStroke();
rect(125,120,274,150);
ellipse(262,120,272,50);
ellipse(420,250,70,100);
stroke(1);
ellipse(420,250,15,40);

//fons retall cabell
fill(255);
noStroke();
rect(85,111,50,50);
stroke(1);

//ulleres
fill(255);
ellipse(150,200,120,150);
fill(255);
ellipse(270,200,120,150);
line(330,200,400,200);

//ulls
fill(0);
ellipse(mouseX,mouseY+100,30,30);
ellipse(mouseX+100,mouseY+100,30,30);
fill(255);
ellipse(mouseX-10,mouseY+100,10,10);
ellipse(mouseX+90,mouseY+100,10,10);

//nas
fill(252,198,164);
stroke(1);
ellipse(200,250,30,30);
fill(252,198,164);
noStroke();
ellipse(208,252,30,30);

//coll
fill(252,198,164);
rect(220,340,100,50);

//detalls
stroke(1);
noFill();
bezier(mouseX, 300, mouseX+30, 340, mouseX+80, 340, mouseX+130, 300);
bezier(135,120,150,mouseY,170,100,190,130);
bezier(220,130,250,mouseY,300,100,330,130);
strokeWeight(2);
bezier(430,120,435,115,450,100,460,80);
bezier(430,120,435,125,450,125,460,145);
fill(255);
noStroke();

//roba
fill(252,mouseY,164);
noStroke();
rect(190,400,150,200);
fill(252,mouseY,164);
triangle(190,400,220,380,220,400);
triangle(320,400,320,380,340,400);
rect(220,380,100,20);
ellipse(185,440,60,80);
ellipse(180,520,60,200);
ellipse(350,440,60,80);
ellipse(355,520,60,200);
stroke(1);
noFill();
bezier(200,600,200,570,190,550,190,450);
bezier(330,600,330,570,320,550,330,450);
fill(252,198,164);
noStroke();
triangle(220,379,320,379,230,450);
stroke(1);
}

void comprobarLimits(){;

if (mouseX > 220){ // quedarse ciego derecha
  background(1);
  fill(255,0,0);
textSize(25);
createFont("Arial",16,true);
text("¡¡AUGGHHTT!!! MIS OJOOOSSSSS!!!",40,250);
}
if (mouseX< 100){ //quedarse ciego izquierda
  background(1);
  fill(255,0,0);
  textSize(25);
  createFont("Arial",16,true);
  text("¡¡AUGGHHTT!!! MIS OJOOOSSSSS!!!",40,250);
}
if (mouseY< 35){ //quedarse ciego arriba
  background(1);
  fill(255,0,0);
  textSize(25);
  createFont("Arial",16,true);
  text("¡¡AUGGHHTT!!! MIS OJOOOSSSSS!!!",40,250);
}
if (mouseY> 165){ //quedarse ciego abajo
  background(1);
  fill(255,0,0);
  textSize(25);
  createFont("Arial",16,true);
  text("¡¡AUGGHHTT!!! MIS OJOOOSSSSS!!!",40,250);
}

}



