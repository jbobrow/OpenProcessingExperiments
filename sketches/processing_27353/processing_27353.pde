
/*==============================================================
  Philippe Tardif
  Algorithmie de base et interactivité EDM4600-50
  Simulation - TP3
  
  Des soldats sont largués sur une ville pour en prendre possesion. Vous devez tirer les ennemis avant qu'il ne touche le sol.
  Utiliser la souris pour viser vos ennemis et cliquer pour tirer
  
  Inspirations:
  - TP4 - Multiplayer classic Snake Game (or solo) 
  - Invasion:http://www.openprocessing.org/visuals/?visualID=17044
  - Le jeu de iPhone : Kaboom paratrooper
  
  Remerciement:-Justin Leduc
//============================================================= */

//Déclarations des variables globales
PImage bg, Menu, curseur, imgPara1, imgPara2, troupe1, troupe2, boom, Echec, Reussite, Instruction;
PFont typoMenu;
ArrayList paratrooper;
float posX, posY, rdVitesse, vitesseChute;

int temps, duree, menu, nbVies, pointage;
int mPrincipal=1;
int instruction=2;
int back=3;
int echec=4;
int reussite=5;
int difficulte=6;

boolean debutPartie;

//=========================================================
//  Ajustement des éléments avant le début du jeu
//=========================================================
void setup(){
  
  size(400,400);
  smooth();
  noCursor();
  
  //Chargement des images
  bg=loadImage("data/fond.png");
  Menu=loadImage("data/menu.jpg");
  Instruction=loadImage("data/instruction.png");
  Echec=loadImage("data/echec.png");
  Reussite=loadImage("data/reussite.png");
  curseur=loadImage("data/curseur.png");
  typoMenu = loadFont("AgencyFB-Reg-48.vlw");
  imgPara1=loadImage("data/paratrooper1.png");
  imgPara2=loadImage("data/paratrooper2.png");
  troupe1=loadImage("data/trooper1.png");
  troupe2=loadImage("data/trooper2.png");
  boom=loadImage("data/explosion.png");
  
  vitesseChute=0.5; 
  duree=2000;
 
  paratrooper = new ArrayList();
 
  nbVies=10;
  pointage=0;
  
  menu = mPrincipal;
  debutPartie=false;
}
//=========================================================================
// Fonction qui dessine le background et les paratroopers
//=========================================================================
void draw(){
  
  if(debutPartie==true){ //Vérifie si le jeu est lancé
  background(bg);
  
  //================================================================
  //Condition qui ajoute à l'ArrayList un instance de Paratrooper
  //================================================================
  if ( millis() - temps >duree) {//Duree controler selon le niveau de difficulté
    temps =  temps +duree;
   
    posX=random(width/2+100);
    posY=random(-200,150);
    rdVitesse=random(0.004, 0.008); 
    
    if(random(10)>5){
      paratrooper.add(new Paratrooper(imgPara1, troupe1,posX, posY, QUARTER_PI/7, rdVitesse));// Crée un nouveau paratrooper
    }else{
      paratrooper.add(new Paratrooper(imgPara2, troupe2,posX, posY, QUARTER_PI/7, rdVitesse));// Crée un nouveau paratrooper
    }
 }
 //===============Donne une vitesse de chute aléatoire au paratrooper et le dessine=========================
  for ( int n = 0; n < paratrooper.size();n++ ) {
 
   Paratrooper p = (Paratrooper) paratrooper.get(n);
   p.dessin();
   p.fall(vitesseChute);
    if( p.dessin()==false){ 
        paratrooper.remove(p);
        nbVies-=1;
      }
    }
   fill(0);
   textFont(typoMenu, 20);
   text("Vies: "+nbVies, width-50, 20);
   text("score: "+pointage, width-125, 20) ;
   if(nbVies<=0){//Si le nombre de vies atteint 0, on appel la fonction finPartie
      finPartie();
    }
  if(pointage>=150){//Si le pointage atteint 100, on appel la fonction reussite
     reussite();
   }
  }
  else{
    //================================================================
    //Si le jeu ne marche pas, il faut apparaitre un menu
    //================================================================
    if(menu == mPrincipal){//Apparition du menu principal
      background(Menu);
      textFont(typoMenu, 50);
      if(mouseX>=130 && mouseX<=250 && mouseY>=195&&mouseY<=250){fill(255,251,81);}else{fill(255);}
      text("Jouer", (width/2)-50, (height/2)+50);
      if(mouseX>=110 && mouseX<=280 && mouseY>=250&&mouseY<=300){fill(255,251,81);}else{fill(255);}
      text("Instruction", (width/2)-80, (height/2)+100);
    }
    ///////////////////////
    else if(menu == instruction){//Apparition des instructions
      background(Instruction);
      fill(255,251,81);
       textFont(typoMenu, 50);
      text("Instruction", (width/2)-80, (height/2)-50);
      textFont(typoMenu, 30);
      fill(255);
      text("Tirer les troupes, en", width/2-90, 200);
      text("parachutequi tente ", width/2-80, 230);
      text("d'envahir votre territoire", width/2-115, 260);
      text("Vous avez 5 vies", width/2-60, 290);
      if(mouseX>=18 && mouseX<=85 && mouseY>=335&&mouseY<=364){fill(255,251,81);}else{fill(255);}
      text("Retour", 20, 360);
    }
    ///////////////////
    else if(menu==difficulte){// Apparition des niveaux de difficulté
      background(Menu);
      textFont(typoMenu, 50);
      fill(255);
       if(mouseX>=192 && mouseX<=281 && mouseY>=167&&mouseY<=200){fill(255,251,81);}else{fill(255);}
      text("Facile", width/2-20, 200);
      if(mouseX>=179 && mouseX<=276 && mouseY>=218&&mouseY<=254){fill(255,251,81);}else{fill(255);}
      text("Moyen", width/2-20, 250);
      if(mouseX>=177 && mouseX<=294 && mouseY>=264&&mouseY<=296){fill(255,251,81);}else{fill(255);}
      text("Difficile", width/2-25, 300);
      textFont(typoMenu, 30);
      if(mouseX>=18 && mouseX<=85 && mouseY>=335&&mouseY<=364){fill(255,251,81);}else{fill(255);}
      text("Retour", 20, 360);
    }
    //////////////
    else if(menu == echec){//Apparition de l'interface d'échec
      background(Echec);
      fill(235);
      textFont(typoMenu, 30);
      text("Votre score:"+pointage, width/2-50,height/2-100);
      fill(235,55,55);
      textFont(typoMenu, 60);
      text("ÉCHEC", width/2-50, height/2+50);
      fill(255);
      textFont(typoMenu, 30);
      if(mouseX>=199 && mouseX<=223 && mouseY>=273&&mouseY<=300){fill(255,251,81);}else{fill(255);}
      text("OK", width/2, height/2+100);
    }
    /////////////
    else if(menu == reussite){//Apparition de l'interface de réussite
      background(Reussite);
      fill(235,55,55);
      textFont(typoMenu, 60);
      text("Victoire!", width/2-50, height/2);
      textFont(typoMenu, 30);
      if(mouseX>=199 && mouseX<=223 && mouseY>=273&&mouseY<=300){fill(255,251,81);}else{fill(0);}
      text("OK", width/2, height/2+100);
    }
  }
  
 image(curseur,mouseX-13,mouseY-13);//Curseur

}

//========================Lors du clic sur un paratrooper, il est supprimer==================================
  void mousePressed(){
    println("Positionx="+mouseX+"  PositionY:"+mouseY);
    //Si le début de la partie est lancé
    if(debutPartie){
      for(int i=paratrooper.size()-1; i>=0;i--){
        Paratrooper p = (Paratrooper) paratrooper.get(i);
        
        // Si l'utilisateur clique sur un paratrooper, il est ôter de l'interface
        if ( mouseX>p.positionX && mouseX<(p.positionX+36) && mouseY>(p.positionY) && mouseY<(p.positionY+60) && mouseY<=320){
         
          image(boom, p.positionX, p.positionY);
          pointage+=5;
          paratrooper.remove(i);//ôte le paratrooper cliquer 
        }  
      }
    }else {
      //Condition pour naviguer dans le jeu
      if(menu == mPrincipal){
        if(mouseX>=130 && mouseX<=250 && mouseY>=195&&mouseY<=250){
          menu=difficulte;  
        }
        if(mouseX>=110 && mouseX<=280 && mouseY>=250&&mouseY<=300){menu = instruction;}
      }else if(menu==difficulte){
       setup();
       //Ajustement des paramètre en focntion de la difficulté
       if(mouseX>=192 && mouseX<=281 && mouseY>=167&&mouseY<=200){vitesseChute=0.5;duree=2000;}
       if(mouseX>=179 && mouseX<=276 && mouseY>=218&&mouseY<=254){vitesseChute=1;duree=1000;} 
       if(mouseX>=177 && mouseX<=294 && mouseY>=264&&mouseY<=296){vitesseChute=4;duree=700;}
       
       for(int i=paratrooper.size()-1; i>=0;i--){
            Paratrooper p = (Paratrooper) paratrooper.get(i);
            paratrooper.remove(i);//ôte le paratrooper cliquer 
          }
         debutPartie=true;
      }else if(menu == instruction){
        if(mouseX>=18 && mouseX<=85 && mouseY>=335&&mouseY<=364){menu = mPrincipal;}
      }else if(menu == echec || menu==reussite){
        if(mouseX>=199 && mouseX<=223 && mouseY>=273&&mouseY<=300){menu = mPrincipal;}
      }
    }
  }
  //==========================================================
  //Affiche l'écran de réussite et supprime les instances
  //==========================================================
 void reussite(){
   
    for(int i=paratrooper.size()-1; i>=0;i--){
      Paratrooper p = (Paratrooper) paratrooper.get(i);
      paratrooper.remove(i);//ôte le paratrooper cliquer 
    }
    setup();
    menu=reussite;
 }
  //==========================================================
  //Affiche l'écran d'échec et supprime les instances
  //==========================================================
 void finPartie(){
   
    for(int i=paratrooper.size()-1; i>=0;i--){
      Paratrooper p = (Paratrooper) paratrooper.get(i);
      paratrooper.remove(i);//ôte le paratrooper cliquer 
    }
     setup();
     menu=echec;
  }


