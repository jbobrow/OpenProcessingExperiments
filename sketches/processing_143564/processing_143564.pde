
float x= 0;
float dx=1.5;
float y= 850;

void setup (){
  size(800,800);
}

void draw(){
  background(217,246,250);
  fondo();
  brazos();
  cabeza();
  corbata();
  ojos();
  boca();
  nariz();
  cuerpo();
  corbata();
  piernas();
  zapatos();
}

void fondo(){
fill(61,157,250,50);
strokeWeight(0.5);
stroke(61,157,250);
ellipse(x-200,y,50,50);
ellipse(x-200,y-100,50,50);
ellipse(x-200,y-200,50,50);
ellipse(x-200,y-300,50,50);
ellipse(x-200,y-400,50,50);
ellipse(x-200,y-500,50,50);
ellipse(x-200,y-600,50,50);
ellipse(x-200,y-700,50,50);
ellipse(x-200,y-800,50,50);
ellipse(x-100,y-50,50,50);
ellipse(x-100,y-150,50,50);
ellipse(x-100,y-250,50,50);
ellipse(x-100,y-350,50,50);
ellipse(x-100,y-450,50,50);
ellipse(x-100,y-550,50,50);
ellipse(x-100,y-650,50,50);
ellipse(x-100,y-750,50,50);
ellipse(x-100,y-850,50,50);
ellipse(x+0,y,50,50);
ellipse(x+0,y-100,50,50);
ellipse(x+0,y-200,50,50);
ellipse(x+0,y-300,50,50);
ellipse(x+0,y-400,50,50);
ellipse(x+0,y-500,50,50);
ellipse(x+0,y-600,50,50);
ellipse(x+0,y-700,50,50);
ellipse(x+0,y-800,50,50);
ellipse(x+100,y-50,50,50);
ellipse(x+100,y-150,50,50);
ellipse(x+100,y-250,50,50);
ellipse(x+100,y-350,50,50);
ellipse(x+100,y-450,50,50);
ellipse(x+100,y-550,50,50);
ellipse(x+100,y-650,50,50);
ellipse(x+100,y-750,50,50);
ellipse(x+100,y-850,50,50);
ellipse(x+200,y,50,50);
ellipse(x+200,y-100,50,50);
ellipse(x+200,y-200,50,50);
ellipse(x+200,y-300,50,50);
ellipse(x+200,y-400,50,50);
ellipse(x+200,y-500,50,50);
ellipse(x+200,y-600,50,50);
ellipse(x+200,y-700,50,50);
ellipse(x+200,y-800,50,50);
ellipse(x+300,y-50,50,50);
ellipse(x+300,y-150,50,50);
ellipse(x+300,y-250,50,50);
ellipse(x+300,y-350,50,50);
ellipse(x+300,y-450,50,50);
ellipse(x+300,y-550,50,50);
ellipse(x+300,y-650,50,50);
ellipse(x+300,y-750,50,50);
ellipse(x+300,y-850,50,50);
ellipse(x+400,y,50,50);
ellipse(x+400,y-100,50,50);
ellipse(x+400,y-200,50,50);
ellipse(x+400,y-300,50,50);
ellipse(x+400,y-400,50,50);
ellipse(x+400,y-500,50,50);
ellipse(x+400,y-600,50,50);
ellipse(x+400,y-700,50,50);
ellipse(x+400,y-800,50,50);
ellipse(x+500,y-50,50,50);
ellipse(x+500,y-150,50,50);
ellipse(x+500,y-250,50,50);
ellipse(x+500,y-350,50,50);
ellipse(x+500,y-450,50,50);
ellipse(x+500,y-550,50,50);
ellipse(x+500,y-650,50,50);
ellipse(x+500,y-750,50,50);
ellipse(x+500,y-850,50,50);
ellipse(x+600,y,50,50);
ellipse(x+600,y-100,50,50);
ellipse(x+600,y-200,50,50);
ellipse(x+600,y-300,50,50);
ellipse(x+600,y-400,50,50);
ellipse(x+600,y-500,50,50);
ellipse(x+600,y-600,50,50);
ellipse(x+600,y-700,50,50);
ellipse(x+600,y-800,50,50);
ellipse(x+700,y-50,50,50);
ellipse(x+700,y-150,50,50);
ellipse(x+700,y-250,50,50);
ellipse(x+700,y-350,50,50);
ellipse(x+700,y-450,50,50);
ellipse(x+700,y-550,50,50);
ellipse(x+700,y-650,50,50);
ellipse(x+700,y-750,50,50);
ellipse(x+700,y-850,50,50);
ellipse(x+800,y,50,50);
ellipse(x+800,y-100,50,50);
ellipse(x+800,y-200,50,50);
ellipse(x+800,y-300,50,50);
ellipse(x+800,y-400,50,50);
ellipse(x+800,y-500,50,50);
ellipse(x+800,y-600,50,50);
ellipse(x+800,y-700,50,50);
ellipse(x+800,y-800,50,50);
ellipse(x+900,y-50,50,50);
ellipse(x+900,y-150,50,50);
ellipse(x+900,y-250,50,50);
ellipse(x+900,y-350,50,50);
ellipse(x+900,y-450,50,50);
ellipse(x+900,y-550,50,50);
ellipse(x+900,y-650,50,50);
ellipse(x+900,y-750,50,50);
ellipse(x+900,y-850,50,50);
x=x+dx;
y=y; 
if(x>200){
dx=-1.5;
}
if(x<0){
dx=1.5;
}
}

void brazos(){
strokeWeight(2);
stroke(0,0,0);
fill(254,255,44);
rect(mouseX-100,mouseY+237.5,150,15);
rect(mouseX+300,mouseY+237.5,100,15);
ellipse(mouseX-100,mouseY+237+7.5,50,50);
ellipse(mouseX+400,mouseY+237+7.5,50,50);
fill(255,255,255);
rect(mouseX+0,mouseY+225,25,40);
rect(mouseX+275,mouseY+225,25,40); 

}

void cabeza(){
fill(254,255,44);
strokeWeight(2);
quad(mouseX,mouseY,mouseX+300,mouseY,mouseX+275,mouseY+250,mouseX+25,mouseY+250);
strokeWeight(0);
fill(213,216,20);
ellipse(mouseX+50,mouseY+30,20,40);
ellipse(mouseX+30,mouseY+60,15,30);
ellipse(mouseX+260,mouseY+40,20,30);
ellipse(mouseX+50,mouseY+210,20,40);
ellipse(mouseX+70,mouseY+230,10,20);
ellipse(mouseX+250,mouseY+200,15,30);
ellipse(mouseX+220,mouseY+220,20,30);
}

void ojos(){
strokeWeight(2);
fill(255,255,255);
ellipse(mouseX+100,mouseY+100,100,100);
ellipse(mouseX+200,mouseY+100,100,100);
fill(65+mouseX,178-mouseY/2,237-mouseX);
strokeWeight(3);
ellipse(mouseX+120,mouseY+100,35,35);
ellipse(mouseX+180,mouseY+100,35,35);
fill(0,0,0);
strokeWeight(2);
ellipse(mouseX+120,mouseY+100,12.5,12.5);
ellipse(mouseX+180,mouseY+100,12.5,12.5);
}

void boca(){
strokeWeight(3);
noFill();
arc(mouseX+150,mouseY+150,200,75,0,PI);
strokeWeight(2);
fill(255,255,255);
quad(mouseX+120,mouseY+185.5,mouseX+142.5,mouseY+187,mouseX+142.5,mouseY+209.5,mouseX+119,mouseY+208);
quad(mouseX+160,mouseY+187,mouseX+182.5,mouseY+185.5,mouseX+182.5,mouseY+208,mouseX+160,mouseY+209.5);
}

void nariz(){
fill(254,255,44);
strokeWeight(2);
arc(mouseX+150,mouseY+125,25,30,PI-QUARTER_PI,TWO_PI+QUARTER_PI);
}

void cuerpo(){
strokeWeight(2);
stroke(0,0,0);
fill(255,255,255);
rect(mouseX+25,mouseY+250,250,75);
fill(191,132,13);
rect(mouseX+25,mouseY+285,250,40);
rect(mouseX+75,mouseY+325,50,20);
rect(mouseX+175,mouseY+325,50,20);
fill(0,0,0);
rect(mouseX+40,mouseY+295,35,7.5);
rect(mouseX+90,mouseY+295,35,7.5);
rect(mouseX+175,mouseY+295,35,7.5);
rect(mouseX+225,mouseY+295,35,7.5);
fill(255,255,255);
triangle(mouseX+142.5,mouseY+250,mouseX+125,mouseY+265,mouseX+95,mouseY+250);
triangle(mouseX+162.5,mouseY+250,mouseX+180,mouseY+265,mouseX+210,mouseY+250);
}

void corbata(){
fill(255,0,0);
beginShape();
vertex(mouseX+137.5,mouseY+250);
vertex(mouseX+162.5,mouseY+250);
vertex(mouseX+157.5,mouseY+260);
vertex(mouseX+142.5,mouseY+260);
endShape();
beginShape();
vertex(mouseX+142.5,mouseY+260);
vertex(mouseX+157.5,mouseY+260);
vertex(mouseX+165,mouseY+295);
vertex(mouseX+150,mouseY+310);
vertex(mouseX+135,mouseY+295);
endShape();
}

void piernas(){
fill(254,255,44);
rect(mouseX+92.5,mouseY+345,15,30);
rect(mouseX+192.5,mouseY+345,15,30);
fill(0,0,0);
rect(mouseX+92.5,mouseY+375,15,5);
rect(mouseX+192.5,mouseY+375,15,5);
fill(255,255,255);
rect(mouseX+92.5,mouseY+380,15,5);
rect(mouseX+192.5,mouseY+380,15,5);
fill(67,178,237);
rect(mouseX+92.5,mouseY+385,15,5);
rect(mouseX+192.5,mouseY+385,15,5);
fill(255,255,255);
rect(mouseX+92.5,mouseY+390,15,5);
rect(mouseX+192.5,mouseY+390,15,5);
fill(255,0,0);
rect(mouseX+92.5,mouseY+395,15,5);
rect(mouseX+192.5,mouseY+395,15,5);
fill(255,255,255);
rect(mouseX+92.5,mouseY+400,15,15);
rect(mouseX+192.5,mouseY+400,15,15);
}

void zapatos(){
strokeWeight(0);
fill(0,0,0);
rect(mouseX+87.5,mouseY+415,25,30);
rect(mouseX+70,mouseY+420,25,25);
arc(mouseX+70,mouseY+445,70,50,PI,TWO_PI);
rect(mouseX+187.5,mouseY+415,25,30);
rect(mouseX+212.5,mouseY+420,25,25);
arc(mouseX+230.5,mouseY+445,70,50,PI,TWO_PI);
}


