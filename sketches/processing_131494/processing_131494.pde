
Balloon[] globos = new Balloon[10];
PImage balloondreta,balloonesquerra;
PFont font, font2;
Puntuacio score;
int punts = 0;
//quantitat de punts que augmenta el comptador amb cada polsacio
int quantitat = 1;
//transparencia de la mosca (el +1)
float transpa = 255;
//posicio de la mosca
float x;
float y;
int alter = 0;
int alterimage = 0;
Punt mosca;
Logro medalla;

void setup(){
  size(400,400);
  font = createFont("System Negrita", 20);
  textFont(font);
  score = new Puntuacio(80,30,quantitat);
  mosca = new Punt(quantitat);
  balloondreta = loadImage("balloondreta.gif");
  balloonesquerra = loadImage("balloonesquerra.gif");
  for(int i = 0; i<globos.length;i++){
      globos[i] = new Balloon((random(150,350)),(random(150,350)));
    
  }
  medalla = new Logro();
}

void draw(){
 background(30,30,220);
  noStroke();
  fill(1,142,14);
  rect(0,(height/4)*3+25,width,height/4);
  for(int i = 0;i<globos.length;i++){
      globos[i].dibuixaGlobo();
      globos[i].moure();
  }
  //crida del marcador
  score.dibuixa();
  //crida de la mosca
  mosca.dibuixa(x, y);
  
  if(punts>=10){
    medalla.dibuixa();
    
    medalla.desapareix();
  }
  println(medalla.trans);
  
  
  
}

void mousePressed(){
  //crida de la funcio puntua
  // score.puntua();
   //reinicialitzacio de transpa i nova posicio per a la x i la y
   //transpa = 255;
   //x = mouseX+random(-25,25);
   //y = mouseY+random(-25,25);
  for(int i = 0;i<globos.length;i++){
    globos[i].pum(); 
  }

}


class Balloon{
  float posX;
  float posY;
  Balloon(float xPos, float yPos){
    posX = xPos;
    posY = yPos;
  }
  void dibuixaGlobo(){
    imageMode(CENTER);
    if((((int)(alterimage/300))%2)==0){
      image(balloondreta,posX,posY);
    }else{
      image(balloonesquerra,posX,posY);
    }
    alterimage += 1;

    //48 x 78
    //48 x 56
  }
  void dibuixaPum(){
  
  }
  
  void moure(){
    if(alter%12==0){
      posX+=2;
    }else if(alter%15==0){
      posX-=1;
    }
    alter+=1;
    
    if(posY>-20){
      posY-=0.5;
    }else{
      posY=430;
    }
    
    if(posX>415){
      posX=0;
    }else if(posX<-15){
      posX=400;
    }
  }
  void pum(){
    if(mouseX>posX-(balloondreta.width/2) && mouseX<posX+(balloondreta.width/2) && mouseY>posY-(balloondreta.height/2)-11 && mouseY<posY+(balloondreta.height/2)-11){
      print("ok");
      score.puntua();
      transpa = 255;
      x = mouseX+random(-25,25);
      y = mouseY+random(-25,25); 
    }
    
  }
}

class Logro{
  float xpos;
  float ypos;
  float trans;
  float comptador = 0;
  Logro(){
    xpos = 195;
    ypos = 10;
    trans = 255;
  }
  
  void dibuixa(){
    noStroke();
    fill(40, trans);
    rect(xpos,ypos,195,40);
    fill(60, trans);
    rect(xpos+6,ypos+5,30,31);
    
    tint(255,trans);
    image(balloondreta,xpos+21,ypos+20,balloondreta.width/2.8,balloondreta.height/2.8);
    
   // textMode(CENTER);
    fill(220, trans);
    textSize(14);
    
    text("¡Has petado 10 globos!",xpos+188, ypos+24);
    
    strokeWeight(2);
    stroke(255, trans);
    strokeCap(SQUARE);
    line(xpos,ypos,xpos+195,ypos);
    line(xpos,ypos,xpos,ypos+40);
    stroke(150, trans);
    line(xpos,ypos+40,xpos+195,ypos+40);
    line(xpos+195,ypos,xpos+195,ypos+40);
    comptador+=1;
    
    tint(255);
    strokeWeight(1);
    strokeCap(ROUND);
    
  }
  void desapareix(){
    if(comptador>100 && trans>=0){
    trans *= 0.96;
    }
  }


}

class Punt{
  int valor;
  
  Punt(int p){
    valor = p;
  }
  
  void dibuixa(float xMosca, float yMosca ){
    fill(255,transpa);
    textSize(20);
    text("+"+valor,xMosca,yMosca);
    //velocitat a la que puja la mosca
    y -= 1.5;
    //velocitat a la que desapareix la mosca
    transpa -= 4;  
  }
  
}

class Puntuacio{
  int xPos;
  int yPos;
  float augment;
  
  Puntuacio(int x, int y, float a){
    xPos = x;
    yPos = y;
    augment = a;
  }

  void dibuixa(){
    if(punts>=99999){
      punts=99999;
    }
    noStroke();
   // fill(30,30,200);
    fill(40);
    rect(xPos-56,yPos-16,58,19);
    fill(255);
    textAlign(RIGHT);
    textSize(20);
    strokeWeight(2.5);
    text(punts, xPos, yPos);
    strokeCap(SQUARE);
    stroke(255);
    line(xPos-57,yPos-18,xPos+1,yPos-18); //primera horitzontal
    line(xPos-58,yPos-17,xPos-58,yPos); //primera vertical
    stroke(150);
    line(xPos-57,yPos+2,xPos+1,yPos+2); //segona horitzontal
    line(xPos+2,yPos-17,xPos+2,yPos+1); //segona vertical
  }
  
  void puntua(){
    if(punts<=99999){
      punts += augment;
    }else{
      punts = 99999;
    }
  }
}
