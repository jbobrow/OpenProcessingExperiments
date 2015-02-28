
Temps cronometre;
int blocksize = 34;
float xPos = 170;
float yPos = 34;
float aceleracioX = 3.405;
float aceleracioY = 3.405;
float desaceleracio = 0.9;
float velX = 0;
float velY = 0;
int seg;
int min;
boolean fi = false;
float[][] poX = {{34,  68,  34,  0,   34,  102, 102, 136, 170,204,136,170,170,204,170,204,0,  34, 34, 34, 102,34, 68, 34, 34, 0,  68,  68, 34, 34, 102,102,102,0,  68, 34, 68, 34, 102,136,136,170,68, 102,102,136,136,170,170,238,238,476,408,408,238,340,204,238,272,374,476,646,578,578,544,544,544,646,612,68, 68, 102,136,170,170,170,238,170,204,170,136,204,204,204,272,272,340,306,306,306,408,340,340,374,476,442,442,578,476,510,510,612,544,544,646,544,578,578,442,374,442,272,272,306,306,374,340,374,442,408,374,374,442,408,476,272,238,272,306,340,340,442,510,510,544,340,340,374,374,408,408,476,442,510,136,136,510,544,544,612,612,646,646,238,238,510,476,476,612,578,578,612,476,510,68, 408,0, 0,0,  680, 0,   680, 680,714},
                 {68,  68,  102, 68,  102, 102, 136, 136, 204,204,170,170,272,204,204,204,34, 34, 68, 170,102,68, 68, 68, 34, 34, 102, 68, 68, 102,170,102,238,68, 68, 68, 68, 34, 238,204,136,170,102,102,136,136,272,170,238,238,476,476,476,408,306,340,238,238,272,442,612,646,646,578,578,544,646,646,646,68, 136,102,170,170,238,238,238,204,204,204,136,204,272,272,272,340,340,306,306,408,408,442,340,476,476,476,442,578,578,510,646,612,544,612,646,544,612,578,578,442,442,272,306,306,374,374,340,442,442,408,374,442,442,476,476,272,306,340,340,340,442,442,612,510,544,340,374,374,476,408,476,476,510,510,136,170,544,544,646,612,646,646,680,238,272,510,476,612,612,612,578,646,510,510,68, 408,0, 0,680,680, 680, 714, 714,714}};
float[][] poY = {{34,  0,   68,  102, 136, 34,  34,  34,  34, 0,  68, 68, 102,102,34, 0,  170,170,204,238,238,272,272,306,306,340,340, 340,374,408,374,374,306,442,408,476,476,510,544,476,476,510,510,442,442,408,408,442,442,442,476,374,374,374,34, 0,  68, 34, 34, 34, 34, 0,  68, 68, 102,102,136,102,102,136,170,170,136,136,204,170,136,272,204,340,340,340,374,510,510,544,510,476,68, 68, 68, 102,102,136,68, 68, 34, 408,408,408,544,374,442,510,306,374,374,306,340,306,306,408,442,374,374,306,408,408,408,442,476,544,510,510,544,170,136,340,238,170,170,136,34, 34, 34, 272,272,204,204,204,272,272,238,204,204,272,204,204,272,272,340,238,238,238,238,340,170,170,170,238,204,204,306,306,204,340,68,0,0,  0,   578, 544, 578,544},
                 {34,  34,  68,  102, 136, 136, 34,  136, 34, 34, 68, 102,102,136,34, 34, 170,204,204,238,340,272,306,306,340,340,340, 374,374,408,374,408,306,442,442,476,544,578,544,476,544,544,510,510,442,442,408,476,442,476,476,476,374,374,34, 68, 68, 68, 102,34, 34, 68, 68, 102,102,136,136,170,102,170,170,204,136,204,204,170,170,272,272,340,374,408,374,510,578,544,544,510,306,68, 102,102,136,136,136,68, 68, 476,408,544,544,510,510,510,544,408,374,374,340,306,340,442,442,442,374,442,476,408,442,476,544,544,544,510,578,340,136,340,238,238,170,170,34,170, 68, 340,272,272,204,272,272,306,238,272,238,272,204,306,272,340,340,272,238,340,238,374,204,170,238,238,238,204,306,340,238,374,578, 34, 0,   544, 578, 544,578,578}};
 
int pantalla = 1;

   
void setup(){
size(682,170);
cronometre = new Temps();
}

void draw(){  
  switch(pantalla){
    case 1:
      if(xPos>136 && ((yPos<75 && xPos>60) || (yPos>-477 && yPos<0))){
        xPos = 136;
        velX = 0;
        
      }
      if(xPos>170 && yPos>30 && yPos <=50 ){
        xPos = 170;
        velX = 0;
      }
      if(xPos<-510 && yPos>=-446 && yPos<68){
        xPos = -510;
        velX = 0;
      }
      if(xPos <-541 ){
        xPos  = -544;
        yPos = -476;
        velX = 0;
        pantalla = 2 ;
        fi = true;
      }
      
      if(yPos>68){
        yPos = 68;
        velY = 0;
      }  
      if(yPos<-476){
        yPos = -476;
        velY = 0;
      }
     
      println(xPos+","+yPos);
      background(255);
      rectMode(CORNER);
      strokeWeight(1);
      noFill();
      strokeWeight(3);
      stroke(0,0,0,20);
    //  rect(0,0,649,599);
      /*line(0,0,0,599);
      line(0,0,649,0);
      line(649,0,649,599);
      line(0,599,649,599);*/
      for(int i = -237; i<1400; i = i+blocksize){
        line(i+xPos, -300+yPos, i+xPos, 1000+yPos);
      }
      for(int i = -237; i<1400; i = i+blocksize){
        line(-300+xPos, i+yPos, 1400+xPos, i+yPos);
      }
      
         stroke(255,0,0);
      for(int i = 0; i<poX[0].length;i++){
        line(xPos+poX[0][i],yPos+poY[0][i],xPos+poX[1][i],yPos+poY[1][i]);
      }    
         
    
      
      //la posicio X i la Y, se li afegeix la velocitat, que pot ser positiva o negativa
      //aquesta velocitat va disminuint a cada volta del draw, per la multiplicacio per la desaceleracio
      //per ultim fa una comprovacio, si la velocitat absoluta, es menor a 0.01, la velocitat es igual a 0
      xPos = xPos+velX;
      yPos = yPos+velY;
      velX = velX * desaceleracio;
      velY = velY * desaceleracio;
      if (abs(velX) < .01) {
         velX = 0;
        }
      if (abs(velY) < .01) {
          velY = 0;
      }      
      rectMode(CENTER);
      rect(154, 86, blocksize-15,blocksize-15);
        //rect(xPos+12, yPos+12, blocksize-10,blocksize-10);  
      rectMode(CORNER);
      strokeWeight(1);
      fill(250);
     // rect(0,580-101,120,100);
      
      //println(mouseX+","+mouseY);
      cronometre.dibuixaCronometre();
      cronometre.limitCrono(10);
      break;
    case 2:
    cronometre.pausa();
    
      if(fi){
        seg = ((cronometre.pausa())/ 1000)%60;
        min =(cronometre.pausa()/ 60000);
        fi = false;
     }
      textAlign(CENTER);
      textSize(80);
       if(seg/10==0){
      text(min+":"+"0"+seg, width/2+50, height/2+30);
    }else{
      text(min+":"+seg,  width/2+50, height/2+30);
    }
      
    break;
    
    case 3:
  
    break;
}
}



void keyPressed() {
  if (keyCode == RIGHT) {
    velX = velX- aceleracioX;
  } else if (keyCode == LEFT) {
    velX = velX+aceleracioX;
  }
   
  if (keyCode == DOWN) {
    velY = velY-aceleracioY;
  } else if (keyCode == UP) {
    velY = velY+aceleracioY;
  }
}
void keyReleased() {
  if (key == 'T') {
  //  println("T pressed " + key);
  }
}

class Temps{
  int principi;
  int enrera;
  boolean pausat;
  Temps(){
    principi = millis();
    pausat = false;
  }
  
  void reiniciaEnrera(int segons){
    enrera = millis() + segons * 1000;
  }
  int principi(){
    return(principi);
  }
  int segons(){
    return (int)((millis() - principi)/ 1000)%60;
  }
  int minuts(){
    return (int)((millis() - principi)/ 60000);
  }
  
  int minutsEnrera(){
      int resultat = (int)((enrera-millis())/ 60000); 
      if (resultat < 0){
        resultat = 0;
      }
      return resultat;
  }
  
  int segonsEnrera(){
    int resultat = (int)((enrera-millis())/ 1000)%60;
    if (resultat < 0){
        resultat = 0;
      }
      return resultat; 
   }
  
  boolean fiEnrera(){
    return minutsEnrera() == 0 && segonsEnrera() == 0;
  }
  boolean limitCrono(int seg){
      return minuts()*60 + segons() == seg;
  }
  
  void dibuixaCronometre(){
    fill(255);
    stroke(200);
    rect(10,20,50,20);
    fill(0);
    stroke(0);
    if(segons()/10==0){
      text(minuts()+":"+"0"+segons(), 18, 36);
    }else{
      text(minuts()+":"+segons(), 18, 36);
    }

  }
  void dibuixaComptaEnrere(){
    fill(0);
    text(minutsEnrera()+":"+segonsEnrera(), 10, 100);
  }
  void reinicia(){
    principi = millis();
  }

 
  int pausa(){
    //if (pausat == false){
      return(millis() - principi);
     // pausat = true;
    
    //principi = millis() - pausa;
  } 
}
  



