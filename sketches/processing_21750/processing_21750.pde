
/*
Philippe Tardif
EDM4600-Algorithmie de base et interactivité
Tapisserie Numérique
Inspiration et Source : http://www.openprocessing.org/visuals/?visualID=21553

Interactivite: -En passant sur les cercles, ils deviennent plus gros et des carré apparaissent
               -En cliquant sur : SPACE, Z, X, C, V, B, N, des formes apparaissent
*/  

//------Déclaration des variables globales--------------------
float nbDiminue=0.1;
int r1 = 213;
int c1 = 155;
int x; 
int y;
float d;
//----Variables de couleur------------
int valeurCoulA = 200;
int valeurCoulB = 200;
int valeurCoulC = 200;

void setup(){
 
  size(400,400);
  smooth();
  colorMode(RGB);

}

//------------ Fonction qui fait la racine carré de la valeur x -----------------------------//
float square(float x) {
  return x*x;
}
///////////////Fonction qui dessine les cercles de couleur/////////////////////////////////////////////////////////////////////////////// 
//-------------Fonction inspiré de  http://www.openprocessing.org/visuals/?visualID=21553 -----------------------------------------------//
/////////////////////////////////////////////////////////////////////////////////////////////////////////

void dessinCercle(float x, float y, color c, boolean enBlanc) {
  d = map(sqrt(square(x-mouseX) + square(y-mouseY)), 110, 0, 10, 50); //Effet relever sur les cercles
  if (d<15) d = 15;
     
     if(enBlanc == true){
       fill(valeurCoulA,valeurCoulB, valeurCoulC);
       ellipse(x, y, d, d);
     }
     else{
       
       fill(c);
       ellipse(x, y, d, d);
       noFill();
       stroke(0);
       ellipse(x,y, d-7,d-7);
     }
 }
 
//------------ Fonction qui dessine les carrés de couleur -----------------------------------------------//
 void dessinCarre(float x, float y, color c){
     
   if(d<10) d=10;
   rectMode(CENTER);
   
               pushMatrix();
               translate(x,y);
               rotate(frameCount*0.1);
               scale(0.5);
   fill(c);
   rect(0, 0, d, d);
   popMatrix();
   
 }
// -----------------Fonction qui dessine tout-----------------------------------------------------//
void draw(){
 background(50);
  y=10;
  
  //Boucle imbriqué
   for(int i=0;i<=20;i++){
     
     x=10;
     
     
       for(int b=0;b<=20;b++){
         //Si SPACE est enfoncé--------------------------------------------
         if(keyCode==32&&((x>=110 && x<=170 || x>=230 && x<=270) && y==90 
             || (x>=90 && x<=290) && y==110
             || (x>=70 && x<=310) && y==130 
             || x>=70 && x<=330 && y==150
             || (x>=50 && x<=90 || x>=310 && x<=350) && y==170
             ||(x>=30 && x<=90 || x>=310 && x<=370) && y==190
             ||(x>=70 && x<=150|| x>=250 && x<=330) && y==210
             ||(x>=50 && x<=350) && y==230
             ||(x>=30 && x<=350) && y==250
             ||(x>=70 && x<=330) && y==270
             ||(x>=90 && x<=310) && y==290
             ||(x>=130 && x<=270) && y==310)){
           
           dessinCercle(x, y, color(255,255,255), true);
         }
         //Si Z est enfoncé------------------------------------------------
         else if((keyCode==122 || keyCode==90) &&(
           (x>=130 && x<=170 || x>=230 && x<=270) && y==110
           ||(x>=110 && x<=290) && y==130
           ||(x>=90 && x<=310) && y==150
           ||(x>=90 && x<=310) && y==170
           ||(x>=90 && x<=310) && y==190
           ||(x>=90 && x<=310) && y==210
           ||(x>=110 && x<=290) && y==230
           ||(x>=130 && x<=270) && y==250
           ||(x>=150 && x<=250) && y==270
           ||(x>=170 && x<=230) && y==290
           ||(x>=190 && x<=210) && y==310)){
             dessinCercle(x, y, color(234,0,0), true);
           }
           //Si X est enfoncé---------------------------------------------
         else if((keyCode==88 || keyCode==120) &&(
           (x>=170 && x<=230) && y==50
           ||(x>=170 && x<=230) && y==70
           ||(x>=170 && x<=230) && y==90
           ||(x>=90 && x<=310) && y==110
           ||(x>=90 && x<=310) && y==130
           ||(x>=90 && x<=310) && y==150
           ||(x>=90 && x<=310) && y==170
           ||(x>=170 && x<=230) && y==190
           ||(x>=170 && x<=230) && y==210
           ||(x>=170 && x<=230) && y==230
           ||(x>=170 && x<=230) && y==250
           ||(x>=170 && x<=230) && y==270
           ||(x>=170 && x<=230) && y==290
           ||(x>=170 && x<=230) && y==310
           ||(x>=170 && x<=230) && y==330)){
             dessinCercle(x, y, color(234,0,0), true);
         }
         //Si C est enfoncé-----------------------------------------------
         else if((keyCode==67 || keyCode==99)&&(
           (x>=130 && x<=230) && y==30
           ||(x>=90 && x<=270) && y==50
           ||(x>=70 && x<=290) && y==70
           ||(x>=50 && x<=310) && y==90
           ||(x>=30 && x<=110 ||x>=170 && x<=190 ||x>=250 && x<=330) && y==110
           ||(x>=30 && x<=110 ||x>=170 && x<=190 ||x>=250 && x<=330) && y==130
           ||(x>=30 && x<=110 ||x>=170 && x<=190 ||x>=250 && x<=330) && y==150
           ||(x>=30 && x<=110 ||x>=170 && x<=190 ||x>=250 && x<=330) && y==170
           ||(x>=30 && x<=330) && y==190
           ||(x>=30 && x<=50 || x>=90 && x<=270 || x>=310 && x<=330) && y==210
           ||(x>=30 && x<=70 || x>=110 && x<=250 || x>=290 && x<=330) && y==230
           ||(x>=30 && x<=90 || x>=150 && x<=210 || x>=270 && x<=330) && y==250
           ||(x>=50 && x<=110 || x>=250 && x<=310) && y==270
           ||(x>=70 && x<=290) && y==290
           ||(x>=90 && x<=270) && y==310
           ||(x>=110 && x<=250) && y==330
           ||(x>=150 && x<=210) && y==350)){
             dessinCercle(x, y, color(234,0,0), true);
         }
         //Si V est enfoncé-----------------------------------------------
         else if((keyCode==118 || keyCode==86) &&(
           (x>=130 && x<=270) && y==70
           ||(x>=130 && x<=270) && y==90
           ||(x>=130 && x<=270) && y==110
           ||(x>=230 && x<=270) && y==130
           ||(x>=210 && x<=250) && y==150
           ||(x>=190 && x<=230) && y==170
           ||(x>=150 && x<=270) && y==190
           ||(x>=150 && x<=270) && y==210
           ||(x>=190 && x<=230) && y==230
           ||(x>=190 && x<=230) && y==250
           ||(x>=190 && x<=230) && y==270
           ||(x>=190 && x<=230) && y==290
           ||(x>=190 && x<=230) && y==310)){
             dessinCercle(x, y, color(234,0,0), true);
         }
         //Si B est enfoncé--------------------------------------------
         else if((keyCode==66 || keyCode==98) &&(
              x==210 && y==30
             ||(x>=190 && x<=230) && y==50
             ||(x>=170 && x<=250) && y==70
             ||(x>=150 && x<=270) && y==90
             ||(x>=130 && x<=290) && y==110
             ||(x>=110 && x<=310) && y==130
             ||(x>=90 && x<=330) && y==150
             ||(x>=70 && x<=350) && y==170
             ||(x>=170 && x<=250) && y==190
             ||(x>=170 && x<=250) && y==210
             ||(x>=170 && x<=250) && y==230
             ||(x>=170 && x<=250) && y==250
             ||(x>=170 && x<=250) && y==270
             ||(x>=170 && x<=250) && y==290
             ||(x>=170 && x<=250) && y==310
             ||(x>=170 && x<=250) && y==330)){
               dessinCercle(x, y, color(234,0,0), true);
         }
         //Si N est enfoncé---------------------------------------------
          else if((keyCode==78 || keyCode==110) &&(
            x==210 && y==30
             ||(x>=190 && x<=230) && y==50
             ||(x>=170 && x<=250) && y==70
             ||(x>=150 &&x<=170 || x>=250 && x<=270) && y==90
             ||(x>=130 &&x<=170 || x>=250 && x<=290) && y==110
             ||(x>=110 &&x<=170 || x>=250 && x<=310) && y==130
             ||(x>=90 && x<=330) && y==150
             ||(x>=70 && x<=350) && y==170
             ||(x>=90 && x<=330) && y==190
             ||(x>=110 &&x<=170 || x>=250 && x<=310) && y==210
             ||(x>=130 &&x<=170 || x>=250 && x<=290) && y==230
             ||(x>=150 &&x<=170 || x>=250 && x<=270) && y==250
             ||(x>=170 && x<=250) && y==270
             ||(x>=190 && x<=230) && y==290
             || x==210 && y==310)){
               dessinCercle(x, y, color(234,0,0), true);
         }
          
         else{
             
           if(intCercle(x, y, 10, mouseX, mouseY)){
               dessinCarre(x, y, color(valeurCoulA+10,valeurCoulB+10, valeurCoulC+10));
               
               nbDiminue-=0.1;
             }else{
                
                dessinCercle(x, y, color(i*25, i*10, b*25), false);
             }
           
         }
         x+=20;
       }
       y+=20;
     } 
}
//------------------Fonction qui fait que les formes et les carrés changent de couleur au clic--------

void mouseReleased(){
    
    if(valeurCoulA == 200) {
    int aleat= round(random(0,256));
      valeurCoulA=aleat;
      valeurCoulB=aleat;
      valeurCoulC=aleat;
   
    }else{
      valeurCoulA=200;
      
    }
    setup();
}
//-------------Fonction qui permet de vérifier si la souris survol un cercle----------------------

boolean intCercle(int cercleX, int diameter,int cercleY, float positionX,float positionY){
  return (positionX > cercleX && positionX< cercleX+diameter && positionY > cercleY && positionY<cercleY+diameter);
}




