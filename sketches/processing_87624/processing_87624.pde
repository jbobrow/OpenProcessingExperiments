
float x; //centre, axe x
float y; //centre, axe y
float ybb ; // bas de la bouche, axe y
float pdby ; //paupière du bas, axe y

void setup() 
        {
        size(400,400); //Taille de la fenetre.
        frameRate(30); //Nombre d'images/seconde.
        smooth(); //Lisser les formes dessinées.
        
        x = width*0.5; //centre, axe x
        y = height*0.5; //centre, axe y
        pdby = height*0.5; //paupière du bas, axe y
        ybb=height*0.5; //bas de la bouche, axe y
        }


//Fonction qui est appelée à chaque nouvelle image.
void draw() 
        {
        background(255); //Remplir l'arrière-plan d'une teinte de gris.
        
        //montée et descente du monstre dans l'eau pendant sa nage, axe y
        y = height*0.5 + sin(frameCount*0.1+radians(90))*15; 
        ybb=height*0.5 + sin(frameCount*0.1+radians(90))*15; 
        //note : la fonction sin est ajoutée à pdby dans le bloc "forme : paupière droite du bas"  
  
  
//CORPS ET PATTES
        fill(#4d0000); 
        beginShape();  //forme : articulation5 avec fonction cos additionnée à y pour action de nager
        curveVertex(x+142, y-74 + cos(frameCount*0.2+radians(90))*30); 
        curveVertex(x+56, y-60 + cos(frameCount*0.2+radians(90))*30);
        curveVertex(x+38, y-72 + cos(frameCount*0.2+radians(90))*30);
        curveVertex(x+51, y-91 + cos(frameCount*0.2+radians(90))*30);
        curveVertex(x+71, y-106 + cos(frameCount*0.2+radians(90))*30);
        curveVertex(x+73, y-80 + cos(frameCount*0.2+radians(90))*30);
        curveVertex(x+56, y-60 + cos(frameCount*0.2+radians(90))*30);
        curveVertex(x+31, y-56 + cos(frameCount*0.2+radians(90))*30);
        endShape();
       
        fill(#4d0000);
        beginShape();  //forme : articulation4 avec fonction cos additionnée à y pour action de nager
        curveVertex(x+67, y-58 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x+48, y-27 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x+11, y-36 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x-4, y-62 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x+56, y-93 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x+67, y-71 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x+48, y-27 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x+77, y+38 + cos(frameCount*0.2+radians(90))*40);
        endShape();
       
        fill(#464a06); //forme : taches sur l'articulation4 avec fonction cos additionnée à y pour action de nager
        ellipse(x+36, y-71 + cos(frameCount*0.2+radians(90))*40, 6,4);
       
        fill(#4d0000);
        beginShape();  //forme : articulation3 avec fonction cos additionnée à y pour action de nager
        curveVertex(x+69, y-57 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x+30, y+10 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x-35, y-19 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x-29, y-55 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x+13, y-73 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x+51, y-57 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x+30, y+10 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x-52, y+43 + cos(frameCount*0.2+radians(90))*50);
        endShape();

        fill(#464a06); //forme : taches sur l'articulation3 avec fonction cos additionnée à y pour action de nager
        ellipse(x-4, y-63 + cos(frameCount*0.2+radians(90))*50, 15,12);
        ellipse(x+31, y-50 + cos(frameCount*0.2+radians(90))*50, 21,25);
                                   
        fill(#4d0000);
        beginShape(); //forme : patte gauche 3 avec fonction cos additionnée à y pour action de nager
        curveVertex(x+3, y-3 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x-16, y-23 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x-36, y-26 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x-36, y+5 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x-54, y-41 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x-24, y-55 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x-9, y-49 + cos(frameCount*0.2+radians(90))*50);
        endShape();
        
        fill(#4d0000);
        beginShape(); //forme : patte droite 3 avec fonction cos additionnée à y pour action de nager
        curveVertex(x+17, y+19 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x+38, y-12 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x+57, y-12 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x+66, y+21 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x+64, y-29 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x+28, y-43 + cos(frameCount*0.2+radians(90))*50);
        curveVertex(x+16, y-33 + cos(frameCount*0.2+radians(90))*50);
        endShape();
                                          
        fill(#4d0000);
        beginShape(); //forme : articulation2 avec fonction cos additionnée à y pour action de nager
        curveVertex(x+45, y-34 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x+18, y+36 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x-59, y-10 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x-54, y-48 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x-4, y-57 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x+37, y-34 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x+18, y+36 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x-76, y+66 + cos(frameCount*0.2+radians(90))*40);
        endShape();                 
      
        fill(#464a06); //forme : taches sur l'articulation2 avec fonction cos additionnée à y pour action de nager
        ellipse(x-51, y-40 + cos(frameCount*0.2+radians(90))*40, 13,16);
        ellipse(x+26, y-10 + cos(frameCount*0.2+radians(90))*40, 20,25);
        ellipse(x-9, y-24 + cos(frameCount*0.2+radians(90))*40, 28,26);
       
        fill(#4d0000);
        beginShape(); //forme : patte gauche 2 avec fonction cos additionnée à y pour action de nager
        curveVertex(x-27, y+20 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x-46, y + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x-66, y-3 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x-66, y+28 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x-84, y-18 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x-49, y-34 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x-39, y-26 + cos(frameCount*0.2+radians(90))*40);
        endShape();
        
        fill(#4d0000);
        beginShape(); //forme : patte droite 2 avec fonction cos additionnée à y pour action de nager
        curveVertex(x+1, y+51 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x+22, y+20 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x+41, y+20 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x+50, y+53 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x+48, y+4 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x+12, y-11 + cos(frameCount*0.2+radians(90))*40);
        curveVertex(x, y-1 + cos(frameCount*0.2+radians(90))*40);
        endShape();

        fill(#4d0000);
        beginShape();  //forme : articulation1 avec fonction cos additionnée à y pour action de nager
        curveVertex(x+32, y-10 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x+5, y+67 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x-78, y+42 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x-89, y+1 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x-32, y-40 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x+17, y-9 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x+5, y+67 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x-89, y+90 + cos(frameCount*0.2+radians(90))*25);
        endShape();
               
        fill(#464a06); //forme : taches sur l'articulation1 avec fonction cos additionnée à y pour action de nager
        ellipse(x-34, y-9 + cos(frameCount*0.2+radians(90))*25, 13,16);
        ellipse(x-21, y+25 + cos(frameCount*0.2+radians(90))*25, 20,18);
        ellipse(x+1, y-15 + cos(frameCount*0.2+radians(90))*25, 6,8);
                                          
        fill(#4d0000);
        beginShape();  //forme : patte gauche 1 avec fonction cos additionnée à y pour action de nager
        curveVertex(x-71, y+50 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x-87, y+30 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x-110, y+27 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x-110, y+58 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x-128, y+12 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x-84, y-2 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x-83, y+4 + cos(frameCount*0.2+radians(90))*25);
        endShape();
                                            
        fill(#4d0000);
        beginShape();  //forme : patte droite1 avec fonction cos additionnée à y pour action de nager
        curveVertex(x-8, y+56 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x-1, y+49 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x+16, y+53 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x+19, y+87 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x+28, y+37 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x-9, y+17 + cos(frameCount*0.2+radians(90))*25);
        curveVertex(x-19, y+23 + cos(frameCount*0.2+radians(90))*25);
        endShape();
        
        
        //TÊTE & SES COMPOSANTES 
        translate(random(3), random(3)); //vibration aléatoire de la tête
            
        fill(#4d0000);
        beginShape(); //forme : tête
        curveVertex(x+32, y-10); 
        curveVertex(x-48, y+65);
        curveVertex(x-99, y+63);
        curveVertex(x-118, y-16);
        curveVertex(x-51, y-22);
        curveVertex(x-20, y+25);
        curveVertex(x-48, y+65);
        curveVertex(x-89, y+90);
        endShape(CLOSE);
        
        fill(#464a06); //forme : taches sur la tête 
        ellipse(x-99, y+16, 20,23);
        ellipse(x-57, y+58, 15,10); 
        ellipse(x-46, y+31, 23,30);
        ellipse(x-64, y-9, 13,16);
        
        fill(0);        
        beginShape(); //intérieur bouche
        vertex(x-57, ybb+62);
        vertex(x-58, ybb+66);
        vertex(x-73, ybb+69);
        vertex(x-90, ybb+60);
        vertex(x-90, ybb+55);
        endShape();

        fill(255);
        beginShape(); //forme : dent gauche du bas
        vertex(x-78, ybb+61);
        vertex(x-77, ybb+63);
        vertex(x-80, ybb+64);
        vertex(x-80, ybb+61);
        vertex(x-80, ybb+60);
        endShape(CLOSE);
               
        fill(255); 
        beginShape(); //forme : dent droite du bas
        vertex(x-71, ybb+62);
        vertex(x-70, ybb+64);
        vertex(x-73, ybb+65);
        vertex(x-73, ybb+62);
        vertex(x-73, ybb+61);
        endShape(CLOSE);
         
        fill(255);
        beginShape();//forme : dent gauche du haut
        vertex(x-81, y+61);
        vertex(x-87, y+61);
        vertex(x-85, y+59);
        vertex(x-89, y+55);
        vertex(x-83, y+54);
        endShape(CLOSE);
               
        fill(255);
        beginShape();//forme : dent centrale du haut
        vertex(x-73, y+63);
        vertex(x-76, y+59);
        vertex(x-78, y+61);
        vertex(x-78, y+56);
        vertex(x-73, y+55);
        endShape(CLOSE);
               
        fill(255);
        beginShape(); //forme : dent droite du haut
        vertex(x-67, y+56);
        vertex(x-66, y+61);
        vertex(x-69, y+62);
        vertex(x-71, y+59);
        vertex(x-70, y+56);
        endShape(CLOSE);
        
        fill(#4d0000); 
        beginShape(); //forme : bas de la bouche 
        curveVertex(x-155, ybb+9);
        curveVertex(x-91, ybb+60);
        curveVertex(x-59, ybb+63);
        curveVertex(x-59, ybb+67);
        curveVertex(x-63, ybb+68);
        curveVertex(x-67, ybb+69);
        curveVertex(x-71, ybb+69);
        curveVertex(x-78, ybb+68);
        curveVertex(x-86, ybb+66);
        curveVertex(x-96, ybb+57);
        curveVertex(x-75, ybb+43);
        endShape(CLOSE);
    
        fill(#4d0000);
        beginShape(); //forme : haut de la bouche
        curveVertex(x-123, y+123);
        curveVertex(x-91, y+60);
        curveVertex(x-52, y+64);
        curveVertex(x-56, y+56);
        curveVertex(x-61, y+50);
        curveVertex(x-68, y+47);
        curveVertex(x-79, y+51);
        curveVertex(x-89, y+47);
        curveVertex(x-95, y+50);
        curveVertex(x-92, y+61);
        curveVertex(x-26, y-2);
        endShape(CLOSE);
               
        fill(150);
        beginShape(); //forme : oeil gauche
        curveVertex(x-92, y+62);
        curveVertex(x-89, y+36);
        curveVertex(x-93, y+14);
        curveVertex(x-110, y+14);
        curveVertex(x-108, y+34);
        curveVertex(x-89, y+36);
        curveVertex(x-90, y-50);
        endShape(CLOSE);
        
        fill(0);
        beginShape();  //forme : pupille gauche
        curveVertex(x-105, y+57);
        curveVertex(x-95, y+33);
        curveVertex(x-93, y+24);
        curveVertex(x-105, y+22);
        curveVertex(x-106, y+30);
        curveVertex(x-95, y+33);
        curveVertex(x-57, y-19);
        endShape(CLOSE);
        
        for (int i = 15 ; i > 0 ; i = i - 1)//boucle : forme elliptique dans milieu pupille gauche
                {
                fill(i*255.);
                ellipse(x-99, y+26, i, i);
                }
        
        fill(150);
        beginShape(); //forme : oeil droit
        curveVertex(x-61, y+59);
        curveVertex(x-58, y+33);
        curveVertex(x-64, y+12);
        curveVertex(x-75, y+18);
        curveVertex(x-77, y+31);
        curveVertex(x-58, y+33);
        curveVertex(x-60, y-78);
        endShape(CLOSE);
               
        fill(0);
        beginShape();  //forme : pupille droite
        curveVertex(x-67, y+61);
        curveVertex(x-61, y+32);
        curveVertex(x-63, y+23);
        curveVertex(x-71, y+19);
        curveVertex(x-74, y+28);
        curveVertex(x-61, y+32);
        curveVertex(x-28, y+1);
        endShape(CLOSE);
        
        for (int i = 15 ; i > 0 ; i = i - 1) //boucle : forme elliptique dans milieu pupille droite 
                {
                fill(i*100.);
                ellipse(x-69, y+26, i, i); 
                }
       
        pdby = pdby - 1; //mouvement : paupière droite du bas           
        if (pdby<200) 
                {
                pdby = pdby+3;
                }   
                
        fill(#4d0000); 
        beginShape(); //forme : paupière droite du bas
        curveVertex(x-61, y+1);
        curveVertex(x-58, pdby+33+ sin(frameCount*0.1+radians(90))*15); //ajout de la fonction sin dans l'axe y pour suivre montée et descente du monstre
        curveVertex(x-63, y+44);
        curveVertex(x-77, pdby+33+ sin(frameCount*0.1+radians(90))*15); //ajout de la fonction sin dans l'axe y pour suivre montée et descente du monstre
        curveVertex(x-79, y+11);
        endShape(CLOSE); 
               
        fill(255);
        text(mouseX + " " + mouseY, mouseX + 5, mouseY); //afficher position du curseur
        }
