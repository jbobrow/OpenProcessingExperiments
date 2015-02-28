
class Building {

  float buildingX;   //Building1 - Valeur
  float buildingY;
  float largeurBuilding;
  float hauteurBuilding;
  float largeurBuildingModif;
  float hauteurBuildingModif;
  float buildingHp;
  float buildingHpMax;
  float gauche;
  float droite;
  float haut;
  float bas;
  float fenetreNum;
  float couleurDuBuilding;
  

//Le building a 3 facteurs, une position sur l'axe des X, une hauteur et
// une largeur. À partir de ça il génère automatiquement des fenêtres, une 
// zone de détection de la souris et des points de vie proportionnels
  Building( float buildingX , float largeurBuilding, float hauteurBuilding) {

    this.buildingX = buildingX;
    this.buildingY = buildingY;
    this.hauteurBuilding = hauteurBuilding;
    this.largeurBuilding = largeurBuilding;
    this.buildingHp = ((largeurBuilding * hauteurBuilding)/80)+60;
    this.buildingHpMax = buildingHp;
    this.gauche = gauche;
    this.droite = droite;
    this.haut = haut;
    this.bas = bas;
    this.fenetreNum = fenetreNum;
    this.largeurBuildingModif = largeurBuilding;
    this.hauteurBuildingModif = hauteurBuilding-10;
    this.couleurDuBuilding = 90 + random(25);
  }
  
  void draw() {
  
    this.buildingX = buildingX + enviroXDynamique/2;
    this.buildingY = 350 - hauteurBuilding;
    
    
    // Ombre du building
    fill(0, 0, 0, 100);
    rect(buildingX+4, enviroY+buildingY+((buildingHpMax-buildingHp)/(buildingHpMax/100)*(hauteurBuilding/100))+4, largeurBuilding, hauteurBuilding * (buildingHp/buildingHpMax)+10);
    
    fill(couleurDuBuilding); // Building1 - Couleur
   
    if (mousePressed) { 
      this.gauche = buildingX ; 
      this.droite = buildingX+largeurBuilding;
      this.haut = enviroY+buildingY - 5 + ((buildingHpMax-buildingHp)/(buildingHpMax/100)*(hauteurBuilding/100));
      this.bas = enviroY+buildingY+((buildingHpMax-buildingHp)/(buildingHpMax/100)*(hauteurBuilding/100))+hauteurBuilding * (buildingHp/buildingHpMax)+10;
      if ( mouseX > gauche && mouseX < droite && mouseY > haut && mouseY < bas ) {
        // mouseOver
        if (buildingHp>0) {
          buildingHp -=1; // Dommages au building
          faireDeLaFumee = true;
          ouEstLaFumee = random(largeurBuilding)+buildingX;
          prochainCivil += 1; //Les dommages APPELLENT des unitées ennemies
          prochainSoldat += 1;
          prochainTank += 1;
          prochainHelico += 1;
          if (prochainCivil >= 100){
             civilEnFuite = true;
             ouEstLeCivil = (largeurBuilding / 2)+buildingX;
             prochainCivil = 0;
          }
          if (prochainSoldat >= prochainSoldatBase){
             soldatArrive = true;
             prochainSoldat = 0;
             if(prochainSoldatBase>30){
               prochainSoldatBase -= 10;
             }
          }
          if (prochainTank >= prochainTankBase){
             tankArrive = true;
             prochainTank = 0;
             if(prochainTankBase>60){
               prochainTankBase -= 15;
             }
          }
          if (prochainHelico >= prochainHelicoBase){
             helicoArrive = true;
             prochainHelico = 0;
             if(prochainHelicoBase>60){
               prochainHelicoBase -= 15;
             }
          }
          
          fill(200 + random (55)); // Le random fait vibrer le blanc pour sousligner les dommages
        }
      } 
      else {
        fill(couleurDuBuilding);
      }
    }
   
   
    
    
    // La position du building est basée sur le déroulement du décor, sa position en Y ET sa hauteur dépendent des points de vie
    rect(buildingX, enviroY+buildingY+((buildingHpMax-buildingHp)/(buildingHpMax/100)*(hauteurBuilding/100)), largeurBuilding, hauteurBuilding * (buildingHp/buildingHpMax)+10);
    // Barre présentant la résistance du building
    if (buildingHp>0) {
      fill(255, 0, 30);
      rect(buildingX+(largeurBuilding/2)-12, enviroY+buildingY-5+((buildingHpMax-buildingHp)/(buildingHpMax/100)*(hauteurBuilding/100)), buildingHpMax/(buildingHpMax/100)/4, 2);
      fill(33, 255, 0);
      rect(buildingX+(largeurBuilding/2)-12, enviroY+buildingY-5+((buildingHpMax-buildingHp)/(buildingHpMax/100)*(hauteurBuilding/100)), buildingHp/(buildingHpMax/100)/4, 2);
    }
    
    
    
  
    //Valeur de comparaison sur la dimension du building pour générer les fenêtres.
      largeurBuildingModif = largeurBuilding;
      hauteurBuildingModif = hauteurBuilding-10;
      fenetreNum =0;
    //Boucle de création des fenêtres
    while (largeurBuildingModif>10 && hauteurBuildingModif>10 ) {
      fill(70, 70, 70); //Couleur fenetre1
      rect(buildingX+largeurBuildingModif-11, enviroY+hauteurBuildingModif+buildingY-10+((buildingHpMax-buildingHp)/(buildingHpMax/100)*(hauteurBuilding/100)), 5, 5);
      //Modifie la couleur de la fenetre selon l'état du building
      if ((fenetreNum==3 && (buildingHp/buildingHpMax < 0.9)) 
        || (fenetreNum==6 && (buildingHp/buildingHpMax < 0.8)) 
        || (fenetreNum==8 && (buildingHp/buildingHpMax < 0.7)) 
        || (fenetreNum==2 && (buildingHp/buildingHpMax < 0.6))
        || (fenetreNum==5 && (buildingHp/buildingHpMax < 0.5))
        || (fenetreNum==0 && (buildingHp/buildingHpMax < 0.4))
        || (fenetreNum==4 && (buildingHp/buildingHpMax < 0.3))
        || (fenetreNum==7 && (buildingHp/buildingHpMax < 0.2))
        || (fenetreNum==1 && (buildingHp/buildingHpMax < 0.1))
        || (fenetreNum==9 && (buildingHp/buildingHpMax < 0.05))) {
        fill(60, 60, 60);
      }
      else {
        fill(150, 150, 150);
      }
      rect(buildingX+largeurBuildingModif-13, enviroY+hauteurBuildingModif+buildingY-11+((buildingHpMax-buildingHp)/(buildingHpMax/100)*(hauteurBuilding/100)), 5, 5);
      largeurBuildingModif-=10; // Déplace d'une fenêtre vers la droite
      fenetreNum +=1;
      if (largeurBuildingModif<20) {
        largeurBuildingModif = largeurBuilding; 
        hauteurBuildingModif -= 10; //Déplace d'une rangée vers le haut
      }
      if (fenetreNum >9) {
        fenetreNum =0;
      }
    }
  }
}

