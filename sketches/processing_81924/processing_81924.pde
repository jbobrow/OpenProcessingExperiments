
// http://processing.org/reference/mouseButton.html
// http://processing.org/discourse/beta/num_1238661349.html
// http://processing.org/reference/keyPressed_.html
// http://processing.org/reference/mouseReleased_.html

PImage cruz;
PImage circulo;
PImage gato;
PFont gulim;
int marc1=0;
int marc2=0;

void setup(){
  size(600,700);
  background(255);
  smooth();
  gato = loadImage("gato.png");
  image(gato,10,10);
  
  noFill();
  //Cuadro1 
  rect(0,100,200,200);
  //Cuadro2
  rect(200,100,200,200);
  //Cuadro3
  rect(400,100,200,200);
  //Cuadro4
  rect(0,300,200,200);
  //Cuadro5
  rect(200,300,200,200);
  //Cuadro6
  rect(400,300,200,200);
  //Cuadro7
  rect(0,500,200,200);
  //Cuadro8
  rect(200,500,200,200);
  //Cuadro9
  rect(400,500,200,200);
  
  cruz = loadImage("Cruz.png");
  circulo = loadImage("Circulo.png");
  
  
}

void draw(){
//noStroke();
  fill(255);
  rect(0,0,600,100);
  
  fill(0);
  textSize(20);
  text("Instrucciones",250,22);
  textSize(12);
  text("-Click izquierdo: Cruz",250,38);
  text("-Click derecho: Círculo",250,53);
  text("-Cualquier tecla para un",250,68);
  text("  juego nuevo",250,83);
  text("-Suma puntos al marcador",250,98);
  
  
  //Botones
  fill(#248FFF);
  rect(470,10,20,20);
  rect(570,10,20,20);
  fill(255);
  textSize(25);
  text("+",473,30);
  text("+",573,30);
  
  image(gato,10,10);
  gulim = loadFont("Gulim-48.vlw");
  fill(0);
  textFont(gulim);
  textSize(15);
  text("jugador 1",400,30);
  text("jugador 2",500,30);
  
  //Marcadores
  textSize(50);
  text(marc1,420,80);
  
  text(marc2,520,80);
  
  

}


void mouseReleased(){
  if(mouseButton==LEFT){
    if(mouseX>470 && mouseX<490 && mouseY>10 && mouseY<30){
      marc1=marc1+1;
    }
  }

  if(mouseButton==LEFT){
    if(mouseX>570 && mouseX<590 && mouseY>10 && mouseY<30){
      marc2=marc2+1;
    }
  }

}


void mousePressed(){

 //Cuadro1
      if (mouseButton == LEFT){
        if(mouseX >0 && mouseX<200 && mouseY>100 && mouseY<300){
          fill(255);
          rect(0,100,200,200);
          image(cruz,28,128);
        }
      }
       if (mouseButton == RIGHT){
        if(mouseX >0 && mouseX<200 && mouseY>100 && mouseY<300){  
          fill(255);
          rect(0,100,200,200);
          image(circulo,28,128);
        } 
      } 
  
 //Cuadro2
      if (mouseButton == LEFT){
        if(mouseX >200 && mouseX<400 && mouseY>100 && mouseY<300){
          fill(255);
          rect(200,100,200,200);
          image(cruz,228,128);
        }
      }
       if (mouseButton == RIGHT){
        if(mouseX >200 && mouseX<400 && mouseY>100 && mouseY<300){  
          fill(255);
          rect(200,100,200,200);
          image(circulo,228,128);
        } 
      } 
      
 //Cuadro3
      if (mouseButton == LEFT){
        if(mouseX >400 && mouseX<600 && mouseY>100 && mouseY<300){
          fill(255);
          rect(400,100,200,200);
          image(cruz,428,128);
        }
      }
       if (mouseButton == RIGHT){
        if(mouseX >400 && mouseX<600 && mouseY>100 && mouseY<300){  
          fill(255);
          rect(400,100,200,200);
          image(circulo,428,128);
        } 
      } 
      
 //Cuadro4
      if (mouseButton == LEFT){
        if(mouseX >0 && mouseX<200 && mouseY>300 && mouseY<500){
          fill(255);
          rect(0,300,200,200);
          image(cruz,28,328);
        }
      }
       if (mouseButton == RIGHT){
        if(mouseX >0 && mouseX<200 && mouseY>300 && mouseY<500){  
          fill(255);
          rect(0,300,200,200);
          image(circulo,28,328);
        } 
      } 
      
 //Cuadro5
      if (mouseButton == LEFT){
        if(mouseX >200 && mouseX<400 && mouseY>300 && mouseY<500){
          fill(255);
          rect(200,300,200,200);
          image(cruz,228,328);
        }
      }
       if (mouseButton == RIGHT){
        if(mouseX >200 && mouseX<400 && mouseY>300 && mouseY<500){  
          fill(255);
          rect(200,300,200,200);
          image(circulo,228,328);
        } 
      } 
      
 //Cuadro6
      if (mouseButton == LEFT){
        if(mouseX >400 && mouseX<600 && mouseY>300 && mouseY<500){
          fill(255);
          rect(400,300,200,200);
          image(cruz,428,328);
        }
      }
       if (mouseButton == RIGHT){
        if(mouseX >400 && mouseX<600 && mouseY>300 && mouseY<500){  
          fill(255);
          rect(400,300,200,200);
          image(circulo,428,328);
        } 
      } 
      
 //Cuadro7
      if (mouseButton == LEFT){
        if(mouseX >0 && mouseX<200 && mouseY>500 && mouseY<700){
          fill(255);
          rect(0,500,200,200);
          image(cruz,28,528);
        }
      }
       if (mouseButton == RIGHT){
        if(mouseX >0 && mouseX<200 && mouseY>500 && mouseY<700){  
          fill(255);
          rect(0,500,200,200);
          image(circulo,28,528);
        } 
      } 
  
 //Cuadro8
      if (mouseButton == LEFT){
        if(mouseX >200 && mouseX<400 && mouseY>500 && mouseY<700){
          fill(255);
          rect(200,500,200,200);
          image(cruz,228,528);
        }
      }
       if (mouseButton == RIGHT){
        if(mouseX >200 && mouseX<400 && mouseY>500 && mouseY<700){  
          fill(255);
          rect(200,500,200,200);
          image(circulo,228,528);
        } 
      }
     
 //Cuadro9
      if (mouseButton == LEFT){
        if(mouseX >400 && mouseX<600 && mouseY>500 && mouseY<700){
          fill(255);
          rect(400,500,200,200);
          image(cruz,428,528);
        }
      }
       if (mouseButton == RIGHT){
        if(mouseX >400 && mouseX<600 && mouseY>500 && mouseY<700){  
          fill(255);
          rect(400,500,200,200);
          image(circulo,428,528);
        }  
      }
}

 void keyPressed() { 
  
  background(255);
  noFill();
  //Cuadro1 
  rect(0,100,200,200);
  //Cuadro2
  rect(200,100,200,200);
  //Cuadro3
  rect(400,100,200,200);
  //Cuadro4
  rect(0,300,200,200);
  //Cuadro5
  rect(200,300,200,200);
  //Cuadro6
  rect(400,300,200,200);
  //Cuadro7
  rect(0,500,200,200);
  //Cuadro8
  rect(200,500,200,200);
  //Cuadro9
  rect(400,500,200,200);

 }

