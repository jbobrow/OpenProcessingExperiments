

void setup() {
  size(600, 600);
  //noStroke();
   frameRate(18);
}
void draw() {  
  rectMode(CENTER);
  if(mousePressed) {    
    background (234,212,124);  
    float posx = random(1,600);
    float posy = random(1,600);
    fill (random (255),random (255),random (255));
    rect(random (posx), random (posy),random (50,50),random (50,50)); 
    fill (167,5,5);
    triangle(mouseX-48,mouseY-112,mouseX,mouseY-200,mouseX+48,mouseY-112);//cappello(basedx,vertice,basesx)
    fill (255,255,255);
    ellipse (mouseX,mouseY-191,20,20);//pallina cappello
    fill (255,228,196);
    ellipseMode (CENTER);
    ellipse (mouseX,mouseY-92,80,80); //testa
    fill (255,255,255);//da qui in poi barba omino
    ellipseMode (CENTER);
    ellipse (mouseX-40,mouseY-100,12,12);
    fill (255,255,255);
    ellipseMode (CENTER);
    ellipse (mouseX-40,mouseY-92,12,12);
    fill (255,255,255);
    ellipseMode (CENTER);
    ellipse (mouseX-40,mouseY-96,12,12);
    fill (255,255,255);
    ellipseMode (CENTER);
    ellipse (mouseX-40,mouseY-90,12,12);
    fill (255,255,255);
    ellipseMode (CENTER);
    ellipse (mouseX-40,mouseY-85,12,12);
    fill (255,255,255);
     fill (255,255,255);
    ellipseMode (CENTER);
    ellipse (mouseX+40,mouseY-100,12,12);
    fill (255,255,255);
    ellipseMode (CENTER);
    ellipse (mouseX+40,mouseY-92,12,12);
    fill (255,255,255);
    ellipseMode (CENTER);
    ellipse (mouseX+40,mouseY-96,12,12);
    fill (255,255,255);
    ellipseMode (CENTER);
    ellipse (mouseX+40,mouseY-90,12,12);
    fill (255,255,255);
    ellipseMode (CENTER);
    ellipse (mouseX+40,mouseY-85,12,12);
    fill (255,255,255);
    arc(mouseX,mouseY-79,80,80,0,PI,OPEN);//barba
    fill (234,207,189);
    arc(mouseX,mouseY-89,12,12,0,PI,OPEN);//naso
    fill(240,238,237);
    arc(mouseX,mouseY-70,25,20,0,PI,CHORD);//sorriso
    fill (255,255,255);
    rectMode (CENTER);
    rect (mouseX,mouseY-119,96,25,8);//linea cappello
    fill (255,255,255);
    ellipseMode (CENTER);
    ellipse (mouseX-20,mouseY-100,10,11);//occhiodx   
    fill (60,40,5);
    ellipseMode (CENTER);
    ellipse (mouseX-20,mouseY-100,5,5);//pupilladx 
    fill (255,255,255);
    ellipseMode (CENTER);
    fill (0,0,0);
    rectMode (CENTER);
    rect (mouseX+20,mouseY-100,10,2);//occhiolino  
    fill (60,40,5);
    //ellipse (mouseX+20,mouseY-100,5,5);//pupillasx
    fill(167,5,5);
    rectMode(CENTER);
    rect(mouseX,mouseY-20,200,20,3);//braccia
    fill (255,228,196);
    rectMode (CENTER);
    rect (mouseX-98,mouseY-30,10,15,6);//pollice dx
    fill (255,228,196);
    ellipse (mouseX-105,mouseY-20,25,20);//mano dx
    fill (255,228,196);
    rectMode (CENTER);
    rect (mouseX+98,mouseY-30,10,15,6);//pollice sx
    fill (255,228,196);
    ellipse (mouseX+105,mouseY-20,25,20);//mano sx
    fill(167,5,5);
    rectMode (CENTER);
    rect(mouseX,mouseY,90,80,15);//busto
    fill (255,255,255);
    rectMode (CENTER);
    rect(mouseX,mouseY,20,80);//lineabusto
     rectMode (CENTER);
      fill (90,66,14);
    ellipseMode (CENTER);
    ellipse (mouseX,mouseY+15,10,10);
    fill (90,66,14);
    ellipseMode (CENTER);
    ellipse (mouseX,mouseY-15,10,10);
     fill (167,5,5); 
     rect (mouseX-25,mouseY+75,40,90,4);//gamba dx
     rectMode (CENTER);
     fill (167,5,5); 
     rect (mouseX+25,mouseY+75,40,90,4);//gamba sx
     rectMode (CENTER);
      fill(0,0,0);
      rectMode (CENTER);
     rect (mouseX,mouseY+40,90,20);//cintura
     fill(0,0,0);
     rect (mouseX-25,mouseY+130,35,20,10);//scarpa dx
     rectMode (CENTER);
     fill(0,0,0);
     rect (mouseX+25,mouseY+130,35,20,10);//scarpa sx
     
}else{ 
    background (93,89,88);
    fill (255,228,196);
    ellipseMode (CENTER);
    ellipse (mouseX,mouseY-92,80,80); //testa
     fill (0,0,0);
    rectMode (CENTER);
    rect (mouseX,mouseY-119,84,15);//base cappello
    fill (0,0,0);
    rectMode (CENTER);
    rect (mouseX,mouseY-130,70,30);
    fill (234,207,189);
    arc(mouseX,mouseY-89,12,12,0,PI,OPEN);//naso
    fill (0,0,0);
    rectMode (CENTER);
    rect (mouseX,mouseY-70,20,2,4);//bocca
    fill (237,244,252);
    rect (mouseX,mouseY-47,27,14,4);//collo
    fill (255,255,255);
    ellipseMode (CENTER);
    ellipse (mouseX-20,mouseY-100,10,11);//occhiodx   
    fill (0,0,0);
    ellipseMode (CENTER);
    ellipse (mouseX-20,mouseY-100,5,5);//pupilladx 
    fill (255,255,255);
    ellipseMode (CENTER);
    ellipse (mouseX+20,mouseY-100,10,11);//occhiosx   
    fill (0,0,0);
    ellipse (mouseX+20,mouseY-100,5,5);//pupillasx
    fill(167,5,5);
    //quad (38, 31, 86, 20, 69, 63, 30, 76);
    fill (255,255,255);
    rectMode (CORNER);
    fill (255,228,196);
    ellipse (mouseX-50,mouseY,20,26);//mano dx
    fill (255,228,196);
    ellipse (mouseX+50,mouseY,20,26);//mano sx
    fill(255,255,255);
    rectMode (CENTER);
    rect(mouseX-35,mouseY-18,20,50,5);//braccio DX
    fill(255,255,255);
    rectMode (CENTER);
    rect(mouseX+35,mouseY-18,20,50,5);//braccio DX
    fill(255,255,255);
    rectMode (CENTER);
    rect(mouseX,mouseY,70,90,6);//BUSTO
    fill (215,226,240);
    rectMode (CENTER);
    rect (mouseX,mouseY-30,14,30,1);//cravatta
    fill (23,255,160);
    fill(245,211,32);
    rectMode (CENTER);
    rect (mouseX,mouseY,90,30);//regalo
    fill (14,108,73);
    rectMode(CENTER);
    rect(mouseX,mouseY,90,5);
    fill (14,108,73);
    rectMode(CENTER);
    rect(mouseX,mouseY,10,30);
    fill (14,108,73);
    ellipseMode (CENTER);
    ellipse (mouseX+7,mouseY-20,5,15);
    ellipseMode (CENTER);
    ellipse (mouseX-7,mouseY-20,5,15);
    rectMode (CENTER);
     fill (0,0,0); 
     rect (mouseX-20,mouseY+90,30,90);//gamba dx
     rectMode (CENTER);
     fill (0,0,0); 
     rect (mouseX+20,mouseY+90,30,90);//gamba sx
     rectMode (CENTER);
     fill(52,51,50);
     rect (mouseX-20,mouseY+130,35,20,10);//scarpa dx
     rectMode (CENTER);
     fill(52,51,50);
     rect (mouseX+20,mouseY+130,35,20,10);//scarpa sx
}
}



