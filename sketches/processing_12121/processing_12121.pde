
  //classe fleur et sous-classe petale
   class Fleur{ 
         //variables positionnement fleurs
        int offset = width/11;//cadre vide autour sans implantation de fleur
        float xpt1 = random(offset, width-offset);//tete x au hasard dans width - cadre
        float ypt1 = random(height/2, height-offset);//tete y au hasard dans height - cadre
        float xpt2 = xpt1-20; float ypt2 = height;//pied par rapport à tete

        //variable déplacement tete
        float dir = .3; 
        //occurrences de la sous classe petales (nombre de petales)      
        Petal un = new Petal();Petal deux = new Petal();Petal trois = new Petal();Petal quatre = new Petal();Petal cinq = new Petal();
        //COULEUR 1 //définit une fourchette pour pétales dans une m^me fleur
        float pourpres = random(90,100); //définit dizaine 
        float coul = random(pourpres);//tire au sort dans dizaine
        //suite en void coul(); les deux paramètres restent ici pour déterminer une couleur pour tous les pétales


         void tracetige() {
           //mobilité tete, solution 1
           //th tige hauteur
           int th = floor(ypt2-ypt1);
           //incrementation tete pour balancement
           xpt1+=dir;
           //limites du balancement= demie hauteur en - et +
           if(xpt1 >= xpt2+th/2 || xpt1 <= xpt2-th/2){ dir*=-1;}
           fill(pourpres,100,coul,50);ellipse(xpt1,ypt1,5,3);// tete
           stroke(pourpres,100,100,50);line(xpt1,ypt1,xpt2,ypt2);noStroke();//tige
                        }  //ferme tige 
        void assemble() { 
          un.colorePetal();deux.colorePetal();trois.colorePetal();quatre.colorePetal();cinq.colorePetal();
           un.tracePetal();deux.tracePetal();trois.tracePetal();quatre.tracePetal();cinq.tracePetal();
           un.movePetal();deux.movePetal(); trois.movePetal();quatre.movePetal();cinq.movePetal();
           //un.tire(); deux.tire();trois.tire();quatre.tire();cinq.tire();
           //tire ici rend fébriles, petites et tremblantes. assez beau aussi, mais incompréhensible
                         }  //f.assemble 
                      
/* IL AURA FALLU METTRE LA SOUS CLASSE PETAL DANS LA CLASSE FLEUR POUR ACCORDER LES VARIABLES LOCALES */
/* MAIS PAS SUR QUE CE SOIT UNE BONNE METHODE */
                    
        class Petal{
            //IMPORTANT :  enoncé des variables ici pour individualisation du nombre
           // ici se forme le pétale individuellement 
                          float posx = random(width); float posy = random( height);
                          float numx = random(width); float numy = random(height);
                          //variable pour tire(), utilise movePetal()
                          //détermine la fréquence de tirage d'un nouveau nombre
                          //pour tire()
                          int timing = floor(random(100,300));
                           //variable distance dx et dy entre posx et numx pour movePetal()
                          float dx;float dy;float xinc;float yinc;
         //ici pour pas que la couleur change à chaque frame
               void colorePetal(){ 
                    coul += .00005;
                    if(pourpres >=100){pourpres = 90;}
                    color c = color(pourpres,100,100,noise(62)*100);
                    fill(c);
                                 }
               void tracePetal() { 
                    noStroke();beginShape();
                    vertex(xpt1,ypt1);
                    bezierVertex(posx, posy-dist(xpt1,ypt1,posx,posy),posx,posy+dist(xpt1,ypt1,posx,posy),xpt1,ypt1);
                    endShape();
                                  }//ferme tracePetal
        // 1) +100 en y tout simplement         
       //2) bezierVertex(posx, posy-timing,posx,posy+timing,xpt1,ypt1);//saccade due à timing
      //revoir plus tard, spécifiquement, avec rotation permettant de situer les poignées du vecteur 
     //par rapport à xpos, et de les faire tourner en m^me temps.
    //Le posit xy ne permet pas de conserver toujours les poignées perpendiculaires à trajectoire  
   //outil : répétiteur couleur par pétale
  // fill(0);text(c,posx,posy-100);noFill();

                                                      
               void movePetal(){//OK gros progrès sur move :: axiomatique :: positionCible-positionActuelle
                     if(frameCount%timing == 0){ tire();}// déplacer?
                     dx = numx - posx;//PRESERVER, efficace et beaucoup de travail
                     dy = numy - posy;
                     // distance divisée par timing
                     xinc = dx/timing;
                     yinc = dy/timing;  
                     //incrémentation pour tendre vers numx                    
                     posx += xinc;
                     posy += yinc;
                                 }
                // tirage nouvelle cible
               void tire(){ //garder ici : est apelée par fct au-dessus
                           numx = xpt1+random(-width/2,width/2);
                           numy = ypt1-random(-height/2,height/2);
                           }

                           }//f.petales
                           }//ferme fleur 

