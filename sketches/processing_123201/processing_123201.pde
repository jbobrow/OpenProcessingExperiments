
//arrays amb la posicio i la velocitat dels cotxes
float[] cotxesx = {random(150.0,400.0),random(400.0,500.0),random(300.0,400.0),random(500.0,600.0),random(100.0,500.0),random(0.0,600.0)};   //200.0,250.0,400.0,350.0,450.0,300.0
float[] cotxesy = {153.0,226.0,283.0,350.0,188.0,316.0};/*205,275,310,400,240,365*/
float[] vel1 = {random(4.0,6.0),random(4.0,6.0),random(4.0,6.0),random(4.0,6.0),random(-1.0,-3.0),random(-2.0,-4.0)}; //1.0,9.0,13.0,12.0,-12.0,-11.0
float[] vel2 = {random(7.0,10.0),random(9.0,12.0),random(12.0,15.0),random(11.0,13.0),random(-11.0,-13.0),random(-10.0,-13.0)};   //8.0,10.0,13.0,12.0,-12.0,-11.0
float[] vel3 = {random(19.0,21.0),random(15.0,18.0),random(21.0,24.0),random(16.0,18.0),random(-22.0,-25.0),random(-15.0,-17.0)};   //19.0,16.0,22.0,17.0,-23.0,-16.0
float[] vel4 = {0.0,0.0,0.0,0.0,0.0,0.0};
//la posicio de la granota
float gustavox = 300;
float gustavoy = 430;

boolean coli = false;
boolean comprovacio = false;
boolean carretera1 = false;
boolean carretera2 = false; 
boolean fi = false;
Rana gustavo;
Car[] cotxes = new Car[6];

int pantalla = 1; 
int mando = 1;
int dificultat = 2;

void setup(){
  size(600,500);
  //Els cotxes que circulen cap a la dreta
  for(int i = 0; i<4;i++){
    cotxes[i] = new Car(cotxesx[i], cotxesy[i], vel1[i], color (random(255),random(255), random(255)));
  }
  //Els cotxes que circulen cap a la esquerra
  for(int i = 4; i<6;i++){
    cotxes[i] = new Car(cotxesx[i], cotxesy[i], vel1[i], color (random(255),random(255), random(255)));
  }
  //Rana gustavo
  gustavo = new Rana(gustavox, gustavoy);
 }


void draw(){ 
  //switch amb els quatre casos, la pantalla del joc (1), la pantalla de game over (2), you win (3) i cheater(4)
  switch(pantalla){
    case 1: 
            //Crida al metode que contÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã�Â¯Ã�ï¿½Ã�Â¿Ã�ï¿½Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â© el fons
            Fons();
            strokeWeight(1);
            stroke(0);
            fill(255);
            //crida al metode que dibuixa la granota i al que la mou
            gustavo.dibuixa();
            gustavo.moure(gustavox,gustavoy);
            
            //SelecciÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã�Â¯Ã�ï¿½Ã�Â¿Ã�ï¿½Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â³ de la dificultat            
            if(mousePressed&&mouseX>=590-5&&mouseX<=590+5 && mouseY>=490-5 &&  mouseY<=490+5){
            dificultat = 3;
            }else if(mousePressed&&mouseX>=570-5&&mouseX<=570+5 && mouseY>=490-5 &&  mouseY<=490+5){
            dificultat = 2;
            }else if(mousePressed&&mouseX>=550-5&&mouseX<=550+5 && mouseY>=490-5 &&  mouseY<=490+5){
            dificultat = 1;
            }
            else if(mousePressed&&mouseX>=510-5&&mouseX<=510+5 && mouseY>=490-5 &&  mouseY<=490+5){
            dificultat = 4;
            }
            //Seleccio del metode de entrada
            if(mousePressed&&mouseX>=50-5&&mouseX<=50+5 && mouseY>=490-5 &&  mouseY<=490+5){
            mando = 1;
            }else if(mousePressed&&mouseX>=210-5&&mouseX<=210+5 && mouseY>=490-5 &&  mouseY<=490+5){
            mando = 2;
            }
            //switch en el que s'utilitza la variable mando per escollir el metode d'entrada
            switch(mando){
              case 1:
               gustavox = mouseX;
               gustavoy = mouseY;
               noCursor();
               break;
              case 2:
               
              if(key=='w'||key=='W'){
                    if(gustavoy>10){
                    gustavoy--;
                    }
                }
                if(key=='s'||key=='S'){
                    if(gustavoy<490){
                    gustavoy++;
                    }
                }
                if(key=='a'||key=='A'){
                    if(gustavox>10){
                    gustavox--;
                    }
                }
                if(key=='d'||key=='D'){
                    if(gustavox<width-10){
                    gustavox++;
                    }
                }
                break;
            }
            //comprovacio de que la granota esta en posicio i pot comenÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã�Â¯Ã�ï¿½Ã�Â¿Ã�ï¿½Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â§ar el joc
            textSize(32);
            stroke(255);
            if(comprovacio == false){
              textAlign(CENTER);
              text("Get in Position",width/2,height/2);
              noFill();
              rect(width/2,420,20,20);
            }
            if(gustavox>289&&gustavox<309&&gustavoy>410&&gustavoy<430){
              comprovacio = true;
            }
            
            stroke(0);
            fill(255);
            //switch que utilitza la variable dificultat per canviar la velocitat dels cotxes. El cas 4 es el 'stop', velocitat 0.
            switch(dificultat){
              case 1:
              for(int i = 0; i<4;i++){
                cotxes[i].dibuixa();
                cotxes[i].moure(vel1[i]);
                cotxesx[i] = (cotxesx[i] + vel1[i])%(width+30);
              }
              for(int i = 4; i<6;i++){
                cotxes[i].dibuixa();
                cotxes[i].moureinv(vel1[i]);
                cotxesx[i] = (cotxesx[i] + vel1[i]);
                if(cotxesx[i]<-30){
                  cotxesx[i] = width+30;
                }
              }
              break;       
             case 2: 
              for(int i = 0; i<4;i++){
                cotxes[i].dibuixa();
                cotxes[i].moure(vel2[i]);
                cotxesx[i] = (cotxesx[i] + vel2[i])%(width+30);
              }
              for(int i = 4; i<6;i++){
                cotxes[i].dibuixa();
                cotxes[i].moureinv(vel2[i]);
                cotxesx[i] = (cotxesx[i] + vel2[i]);
                if(cotxesx[i]<-30){
                  cotxesx[i] = width+30;
                }
              }     
              break;
              case 3: 
                for(int i = 0; i<4;i++){
                  cotxes[i].dibuixa();
                  cotxes[i].moure(vel3[i]);
                  cotxesx[i] = (cotxesx[i] + vel3[i])%(width+30);
                }
                for(int i = 4; i<6;i++){
                  cotxes[i].dibuixa();
                  cotxes[i].moureinv(vel3[i]);
                  cotxesx[i] = (cotxesx[i] + vel3[i]);
                  if(cotxesx[i]<-30){
                    cotxesx[i] = width+30;
                  }
                }
                break;
             case 4:
               for(int i = 0; i<4;i++){
                      cotxes[i].dibuixa();
                      cotxes[i].moure(vel4[i]);
                      cotxesx[i] = (cotxesx[i] + vel4[i])%(width+30);
                    }
                    for(int i = 4; i<6;i++){
                      cotxes[i].dibuixa();
                      cotxes[i].moureinv(vel4[i]);
                      cotxesx[i] = (cotxesx[i] + vel4[i]);
                      if(cotxesx[i]<-30){
                        cotxesx[i] = width+30;
                      }
                    }
                    break;  
            }
            //si despres de comprovar de que la granota esta en posicio, la granota passa per les dues parts de la carretera "carretera1" i "carretera2" 
            //pasaran a ser (cada una a traves de dos if direrents) true. Aquestes dues variables son antitrampes, si arribes al final sense passar per la carretera (treient el mouse fora del joc), 
            //no guanyaras, i el joc et portara a la pantalla 'cheater'
              
              if(comprovacio){
                if(gustavox>0&&gustavox<width&&gustavoy>height/2&&gustavoy<377){
                  carretera1 = true;
                }
                if(gustavox>0&&gustavox<width&&gustavoy>height/4 &&gustavoy<height/2){
                  carretera2 = true;
                }
                //comprovacio de la colisio entre els cotxes i la granota
                for(int i = 0; i<6 && coli == false; i++){
                  coli = collisio(cotxesx[i], cotxesy[i], gustavox, gustavoy);
                }
                //si colisiones, el joc et portara a la pantalla "Game Over"
                if(coli){
                  pantalla = 2;
                }
                //Si es compleix les condicio que he explicat abans (les variables carretera), et portara a la pantalla 'You Win!'. 
                //Pero si arribes al final sense complir les condicions, et portara a la pantalla 'Cheater'
                if(carretera1&&carretera2&&gustavoy<125){
                  pantalla = 3;
                }else if((carretera1 == false || carretera2 == false)&&gustavoy<125){
                  pantalla = 4;
                }
            }
            break;
            
    case 2: textAlign(CENTER);
            GameOver();
            strokeWeight(1);
            fill(255);
            stroke(200);
            rectMode(CENTER);
            
            rect(300,350,90,30);
            textSize(18);
            fill(0);
            text("Try Again",300,355);
            //si cliques en el boto de try again, es reinicialitzaran les variables necessaries i tornaras al joc, des del principi.
            if(mousePressed&&mouseX>300-45&&mouseX<300+45 && mouseY>350-15 &&  mouseY<350+15){
              comprovacio = false;
              coli = false;
              carretera1 = false;
              carretera2 = false;
              pantalla = 1;
              mando = 1;
            }
            break;
    case 3: YouWin();
            strokeWeight(1);
            fill(255);
            stroke(200);
            rectMode(CENTER);
            rect(300,350,90,30);
            textSize(18);
            fill(0);
            text("Try Again",300,355);
            //si cliques en el boto de try again, es reinicialitzaran les variables necessaries i tornaras al joc, des del principi.
            if(mousePressed&&mouseX>300-45&&mouseX<300+45 && mouseY>350-15 &&  mouseY<350+15){
              comprovacio = false;
              coli = false;
              carretera1 = false;
              carretera2 = false;
              pantalla = 1;
              mando = 1;
            }
            break;
    case 4: Cheater();
            break;
  }
}
  boolean collisio(float x, float y,float ranax, float ranay){
    //comprovacio de colisio: en aquesta funcio, entren les posicions de cada cotxe (d'un en un) i les posicions de la granota
    //si les posicions de la granota, entren dintre dels limits establerts dels cotxes, retornara true, sino retornara false
     return ((ranax>x-18&&ranax<x+18)&&(ranay>y-12&&ranay<y+12));
  }
  void Fons(){
    //metode que dibuixa el fons i els botons
    background(20);
    noStroke();
    rectMode(CENTER);
    fill(1,142,14);
    rect(width/2,height/5+10,width,height/12);
    fill(135,206,250);
    rect(width/2,height/8-25,width,height/4);
    fill(80);
    rect(width/2,440,width,125);
    stroke(90);
    for(int i = 0; i<width; i = i+20){
      line(i,380,i,height);
    }
    stroke(130);
    for(int i = 380; i<height; i = i+20){
      line(0,i,width,i);
    }
    stroke(255);
    strokeWeight(3);
    line(0,377,width/2-25,377);
    line(width/2+25,377,width,377);
    
    line(0,height/4+5,width,height/4+5);
  
    
    for(int i = -30; i<width; i = i + 100){
      strokeWeight(3);
      line (i+50,(height/2)+10,i+100,(height/2)+10);
    }
    strokeWeight(1);

    
    fill(255);
    rect(590,490,10,10);
    rect(570,490,10,10);
    rect(550,490,10,10);
    rect(510,490,10,10);
    rect(50,490,10,10);
    rect(210,490,10,10);
    fill(0);
    textAlign(CENTER);
    textSize(9);
    text("3",590,493);
    text("2",570,493);
    text("1",550,493);
    text("0",510,493);
    textSize(12);
    fill(255);
    text("Difficulty",570,475);
    text("Stop",510,475);
    text("Mouse",50,475);
    textAlign(LEFT);
    text("WASD (experimental)",150,475);
  }
  
  void GameOver(){
    //metode que dibuixa la pantalla 'game over'
    cursor(ARROW);
    background(0);
    textSize(40);
    fill(80);
    textAlign(CENTER);
    text("Game Over",width/2,height/2);
    fill(0,255,0);
    noStroke();
    rectMode(CENTER);
    rect(300,300,16,20);
    rect(300+11,300+6,5,7);
    rect(300-11,300+6,5,7);
    rect(300+11,300-4,5,7);
    rect(300-11,300-4,5,7);

    noStroke();
    rectMode(CENTER);
 
    fill(0);
    textSize(10);
    stroke(0);
    text("x",302,296);
    text("x",294,296);
    }
    
  void YouWin(){
    cursor(ARROW);
    //metode que dibuixa la pantalla 'you win'
    background(135,206,250);
    fill(255);
    textAlign(CENTER);
    textSize(40);
    text("You Win!",width/2,height/2);
  }
  
  void Cheater(){
    //metode que dibuixa la pantalla 'cheater'
    background(255,0,0);
    fill(0);
    textAlign(CENTER);
    textSize(40);
    text("F*** you, man, don't cheat",width/2,height/2);
  
  }
public class Rana{
  float xPos;
  float yPos;
  
  Rana(float x, float y){
    //constructor de la granota
    xPos = x;
    yPos = y;
  }
  
  void dibuixa(){
  //dibuix de la granota
  fill(0,255,0);
  noStroke();
  rectMode(CENTER);
  rect(xPos,yPos,12,15);
  rect(xPos+200-192,yPos+6,3,5);
  rect(xPos+200-208,yPos+6,3,5);
  rect(xPos+200-192,yPos-4,3,5);
  rect(xPos+200-208,yPos-4,3,5);
  fill(255);
  rect(xPos+200-197,yPos-6,2,3);
  rect(xPos+200-202,yPos-6,2,3);
  }

  void moure(float x, float y){
   xPos = x;
   yPos = y;
  }
}
class Car {
  color c;
  float xPos;
  float yPos; 
  float xSpeed;

  Car() {
    c = color(255, 0, 0);
    xPos = width/2;
    yPos = height/2;
    xSpeed = 1;
  }
  Car(float x, float y, float vel, color newC){
    c = newC;
    xPos = x;
    yPos = y;
    xSpeed = vel;
  }

  void dibuixa() {
    rectMode(CENTER);
    fill(c);
    rect(xPos, yPos, 36, 24, 6);
    noFill();
    rect(xPos, yPos, 12, 17, 2);
    rect(xPos, yPos, 20, 17, 2);
    fill(0);
    ellipse(xPos-10, yPos +12, 5, 5);
    ellipse(xPos + 10, yPos +12, 5, 5);
    ellipse(xPos -10, yPos -12, 5, 5);
    ellipse(xPos + 10, yPos -12, 5, 5);
  }

  void moure() {
    xPos = (xPos + xSpeed)%(width+30);
  }
  void moure(float velo) {
    //el metode per moure els cotxes que van cap a la dreta, la velocitat s'introdueix quan es crida, per a que es pugui canviar la dificultat
    xPos = (xPos + velo)%(width+30);
  }
  void moureinv(){
    xPos = (xPos + xSpeed);
    if(xPos<-30){
      xPos = width+30;
    }
  }
  void moureinv(float velo){
    //el metode per moure els cotxes que van en contradireccio.
    xPos = (xPos + velo);
    if(xPos<-30){
      xPos = width+30;
    }
  }
}


