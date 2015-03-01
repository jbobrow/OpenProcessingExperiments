
void setup(){
size (600,600);
background (255);
int verde = #80FF00;
}
void draw(){
  println(mouseX + "," +mouseY);
   //entre cada circulo hay un valor de 40
   //color amarillo
  fill(255,255,0);
  ellipse(35,25,30,30);
  //verde
  fill(128,255,0);
  ellipse(75,25,30,30);
  //celeste
  fill(0,255,255);
  ellipse(115,25,30,30);
  //azul
  fill(0,128,255);
  ellipse(155,25,30,30);
  //lila
  fill(153,51,255);
  ellipse(195,25,30,30);
  //rosa
  fill(255,102,255);
  ellipse(235,25,30,30);
  //marron claro
  fill(255,229,204);
  ellipse(275,25,30,30);
  //rojo
  fill(255,0,0);
  ellipse(315,25,30,30);
  //naranja
  fill(255,153,51);
  ellipse(355,25,30,30);
  //gris
  fill(160,160,160);
  ellipse(395,25,30,30);
  //negro
  fill(0,0,0);
  ellipse(435,25,30,30);
  //blanco
  fill(255,255,255);
  ellipse(475,25,30,30);
  //definir variable
if (mousePressed) {
  ellipse (mouseX,mouseY,10,10);
    if(mouseX>20 && mouseX<50 && mouseY<40 && mouseY>10){
      fill(255,255,0);
      ellipse (mouseX,mouseY,10,10);
    }
    if(mouseX>60 && mouseX<90 && mouseY<40 && mouseY>10){
      fill(128,255,0);
      ellipse (mouseX,mouseY,10,10);
    }
    if(mouseX>100 && mouseX<130 && mouseY<40 && mouseY>10){
      fill(0,255,255);
      ellipse (mouseX,mouseY,10,10);
    }
    if(mouseX>140 && mouseX<170 && mouseY<40 && mouseY>10){
      fill(0,128,255);
      ellipse (mouseX,mouseY,10,10);
    }
    if(mouseX>180 && mouseX<210 && mouseY<40 && mouseY>10){
      fill(153,51,255);
      ellipse (mouseX,mouseY,10,10);
    }
    if(mouseX>220 && mouseX<250 && mouseY<40 && mouseY>10){
      fill(255,102,255);
      ellipse (mouseX,mouseY,10,10);
    }
    if(mouseX>260 && mouseX<290 && mouseY<40 && mouseY>10){
      fill(255,229,204);
      ellipse (mouseX,mouseY,10,10);
    }
    if(mouseX>300 && mouseX<330 && mouseY<40 && mouseY>10){
      fill(255,0,0);
      ellipse (mouseX,mouseY,10,10);
    }
    if(mouseX>340 && mouseX<370 && mouseY<40 && mouseY>10){
      fill(255,153,51);
      ellipse (mouseX,mouseY,10,10);
    }
    if(mouseX>380 && mouseX<410 && mouseY<40 && mouseY>10){
      fill(160,160,160);
      ellipse (mouseX,mouseY,10,10);
    }
    if(mouseX>420 && mouseX<450 && mouseY<40 && mouseY>10){
      fill(0,0,0);
      ellipse (mouseX,mouseY,10,10);
    }
    if(mouseX>460 && mouseX<490 && mouseY<40 && mouseY>10){
      fill(255,255,255);
      ellipse (mouseX,mouseY,10,10);
    }
  }
}



