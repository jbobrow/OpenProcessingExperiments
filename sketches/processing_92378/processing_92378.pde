
float x;
float y;

int c,d,e,f; //mouvement oeil gauche et droit

int etat;
final int ON = 1;
final int OFF = 0;
float r,g,b;
float r2,g2,b2;
int o;

float timeStamp;
float interval;


float oscillationCompteur = 0;      //occilateur pour fil à toiel d'araigné
 

void setup() {
        size(400,400); 
        frameRate(30); 
        smooth(); 



x=width/2;    // variables pour mouvement des yeux
y=height/2;
c=width/22;
d=height/15;
e=width/16;
f=height/13;
o=color(255,10,10);   //couleur iris oeil

etat = OFF;

 
  r2 = random(256);
  g2 = random(256);
  b2 = random(256);


                  
interval = random(100,30);          //necessaire pour clignotement des yeux a vitesse aleatoire






}

void draw() {
   background(200);
        noStroke();

  


translate(x,y);


translate(-200,-200);





                      // patte droite 4

fill(70,70,0);
beginShape(); 
curveVertex(198.0, 298.0);
curveVertex(194.0, 170.0);
curveVertex(220.0, 21.0);
curveVertex(232.0, 123.0);
curveVertex(221.0, 298.0);
curveVertex(260.0, 315.0);
curveVertex(208.0, 309.0);
curveVertex(218.0, 223.0);
curveVertex(219.0, 51.0);
curveVertex(209.0, 170.0);
curveVertex(210.1311, -22.459656);
endShape();




                        // patte gauche 4

fill(70,70,0);
beginShape(); 
curveVertex(207.0, 303.0);
curveVertex(203.0, 175.0);
curveVertex(183.0, 26.0);
curveVertex(164.0, 136.0);
curveVertex(138.0, 281.0);
curveVertex(106.0, 279.0);
curveVertex(116.0, 289.0);
curveVertex(149.0, 293.0);
curveVertex(182.0, 57.0);
curveVertex(195.0, 171.0);
curveVertex(219.1311, -17.459656);
endShape();





                   //patte gauche 3

fill(90,90,0);
beginShape(); 
curveVertex(250.0, 305.0);
curveVertex(167.0, 181.0);
curveVertex(150.0, 107.0);
curveVertex(160.0, 27.0);
curveVertex(116.0, 112.0);
curveVertex(59.0, 282.0);
curveVertex(40.0, 300.0);
curveVertex(2, 250.0);
curveVertex(53.0, 268.0);
curveVertex(112.0, 82.0);
curveVertex(181.0, 2);
curveVertex(180.0, 175.0);
curveVertex(357.0, 367.0);
endShape();




                        // patte droite 3

fill(90,90,0);
beginShape(); 
curveVertex(127.0, 354.0);
curveVertex(200.0, 151.0);
curveVertex(287.0, 34.0);
curveVertex(302.0, 71.0);
curveVertex(290.0, 323.0);
curveVertex(340.0, 348.0);
curveVertex(276.0, 346.0);
curveVertex(283.0, 299.0);
curveVertex(283.0, 68.0);
curveVertex(204.0, 155.0);
curveVertex(264.1311, 4.540344);
endShape();





                           // interactivite changement de couleur de l'oeil droit oreille

pushMatrix();
translate(445,415);
rotate(3);
 if ( mouseInsideCircle( x+55, y-20 , 50) ) { 
    
    fill(220,100,100);
  } else {
     fill(255);
  }





                        // oeil droit oreille

ellipse(160,250,30,60); 
fill(o);
ellipse(148,260-mouseY/d,5,20);
fill(157,3,3);
ellipse(147,260-mouseY/d,3,10);
popMatrix();






                         // oeil droit coin supérieur

pushMatrix();
translate(515,230);
rotate(15);
fill(255);
ellipse(160,250,30,40); 

popMatrix();






                      // interactivite changement de couleur de l'oeil gauche oreille

pushMatrix();
translate(110,-110);
rotate(13);
 if ( mouseInsideCircle( x-60, y-20 , 50) ) {  
    fill(220,100,100);
  } else {
     fill(255);
  }
  
                     //oeil gauche oreille
  
ellipse(160,250,30,60); 
fill(o);
ellipse(148,244+mouseY/d,7,20);
fill(157,3,3);
ellipse(146,244+mouseY/d,4,10);

popMatrix();





                                                //oeil gauche coin supérieur

pushMatrix();
translate(290,-120);
rotate(1);
fill(255);
ellipse(160,250,30,40); 
popMatrix();





                                        //tete

fill(175,175,0);
beginShape();                                      
curveVertex(214.0, 90.0);
curveVertex(154.0, 146.0);
curveVertex(136.0, 258.0);
curveVertex(199.0, 290.0);
curveVertex(262.0, 261.0);
curveVertex(248.0, 160.0);
curveVertex(206.0, 127.0);
curveVertex(154.0, 146.0);
curveVertex(121.0, 195.0);
endShape();
                                      //Boucle pour dégrader de la tete

 for(int i=0; i<120;i=i+5){
  fill(20,20,20,20);
ellipse(200,220,i+10,i+10);

}      







fill(255);
beginShape();                            //Fil de toile d'araigé qui pend
    curveVertex(200 , 234.0);
   
    oscillationCompteur = oscillationCompteur + 0.07;
     
    float oscillation1 = cos( oscillationCompteur + radians(90)) * 10 + 200;
    curveVertex( oscillation1 , 364.0);
     
    float oscillation2 = cos( oscillationCompteur ) + 200;
    curveVertex(oscillation2 ,280.0);
    
    curveVertex(250 , 205.0);
    endShape();




                          // interactivite changement de couleur de l'oeil gauche

 if ( mouseInsideCircle( x-25, y+10 , 50) ) {  
   
    fill(220,100,100);
  } else {
     fill(255);
  }                          
                               //oeil gauche
    
  ellipse( 175, 210 , 50, 50 );  
fill(o);
ellipse(164+mouseX/c, 202+mouseY/d,25,25);
fill(157,3,3);
ellipse(164+mouseX/c,202+mouseY/d,15,15);
fill(255);
ellipse(185,205,10,10);





                              // interactivite changement de couleur de l'oeil droit

 if ( mouseInsideCircle( x+30, y+10 , 50) ) {  
    fill(220,100,100);
  } else {
     fill(255);
  }
   
                          //oeil droit
    
 ellipse(230,210,45,45); 
fill(o);
ellipse(219+mouseX/c,202+mouseY/d,20,20);
fill(157,3,3);
ellipse(219+mouseX/c,202+mouseY/d,14,14);
fill(255);
ellipse(242,206,10,10);



                      
                      
                      // interactivite changement de couleur de l'oeil front

 if ( mouseInsideCircle( x, y-27 , 50) ) {  
    fill(220,100,100);
  } else {
     fill(255);
  }
  
                        //oeil front
  
ellipse(200,172,32,28);  
fill(o);
ellipse(193+mouseX/e,165+mouseY/f,12,10);
fill(157,3,3);
ellipse(193+mouseX/e,165+mouseY/f,6,5);
fill(255);
ellipse(203,169,7,7);





                        // interactivite changement de couleur de l'oeil nez

if ( mouseInsideCircle( x+5, y+45 , 50) ) {  
    fill(220,100,100);
  } else {
     fill(255);
  }

                        //oeil nez

ellipse(205,245,32,32);  
fill(o);
ellipse(197+mouseX/e,238+mouseY/f,12,12);
fill(157,3,3);
ellipse(197+mouseX/e,238+mouseY/f,6,6);
fill(255);
ellipse(211,239,8,8);





                            // interactivite changement de couleur de l'oeil dessus tete

if ( mouseInsideCircle( x, y-60 , 50) ) {  
    fill(220,100,100);
  } else {
     fill(255);
  }
  
                        //oeil dessus tête
  
ellipse(200,140,55,30);  
fill(o);
ellipse(190+mouseX/c,130,20,10);
fill(157,3,3);
ellipse(190+mouseX/c,128,10,5);
fill(255);
ellipse(207,135,9,9);






                    // interactivite changement de couleur de l'oeil menton

 if ( mouseInsideCircle( x, y+82 , 50) ) {  
    fill(220,100,100);
  } else {
     fill(255);
  }
  
                           //oeil menton
  
ellipse(200,282,55,30); 
fill(o);
ellipse(190+mouseX/c,292,20,10);
fill(157,3,3);
ellipse(190+mouseX/c,295,10,5);






pushMatrix();
translate(400,415);
rotate(9);






                        // interactivite changement de couleur de l'oeil joue gauche

if ( mouseInsideCircle( x-50, y+50 , 50) ) {  
    fill(220,100,100);
  } else {
     fill(255);
  }

                      // oeil joue gauche

ellipse(160,250,30,60);
fill(o);
ellipse(170,255-mouseY/d,10,20);
fill(157,3,3);
ellipse(173,255-mouseY/d,5,10);
popMatrix();






                     // interactivite changement de couleur de l'oeil joue droit

pushMatrix();
translate(225,595);
rotate(10);

if ( mouseInsideCircle( x+46, y+60, 50) ) {  
    fill(220,100,100);
  } else {
     fill(255);
  }
  
                         // oeil joue droit
                         
ellipse(163,295,30,60);  
fill(o);
ellipse(155,305-mouseY/d,10,20);
fill(157,3,3);
ellipse(153,305-mouseY/d,5,10);
fill(255);
ellipse(157,300,8,8);
popMatrix();

 
  
  

                     // patte droite 2

fill(110,110,0);
beginShape(); 
curveVertex(266.0, 308.0);
curveVertex(228.0, 155.0);
curveVertex(261.0, 14.0);
curveVertex(327.0, 255.0);
curveVertex(399.0, 266.0);
curveVertex(320.0, 284.0);
curveVertex(303.0, 226.0);
curveVertex(259.0, 34.0);
curveVertex(233.0, 149.0);
curveVertex(221.75995, 8.5354);
endShape();




                  //patte gauche 2

fill(110,110,0);
beginShape(); 
curveVertex(180.0, 323.0);
curveVertex(157.0, 170.0);
curveVertex(89.0, 101.0);
curveVertex(58.0, 67.0);
curveVertex(101.0, 170.0);
curveVertex(169.0, 322.0);
curveVertex(153.0, 344.0);
curveVertex(88.0, 337.0);
curveVertex(147.0, 315.0);
curveVertex(53.0, 105.0);
curveVertex(65.0, 47.0);
curveVertex(170.0, 150.0);
curveVertex(287.0, 385.0);
endShape();




                    // patte gauche 1

fill(145,145,0);
beginShape(); 
curveVertex(193.0, 98.0);
curveVertex(145.0, 357.0);
curveVertex(108.0, 77.0);
curveVertex(136.0, 133.0);
curveVertex(157.0, 185.0);
curveVertex(157.0, 140.0);
curveVertex(89.0, 37.0);
curveVertex(99.0, 225.0);
curveVertex(123.0, 351.0);
curveVertex(58.0, 378.0);
curveVertex(147.0, 363.0);
curveVertex(172.0, 213.0);
endShape();




             //poils patte gauche

fill(65,65,0);
beginShape(); 
curveVertex(179.0, 258.0);
curveVertex(165.0, 210.0);
curveVertex(165.0, 187.0);
curveVertex(178.0, 205.0);
curveVertex(169.0, 180.0);
curveVertex(179.0, 188.0);
curveVertex(163.0, 154.0);
curveVertex(163.0, 169.0);
curveVertex(157.0, 180.0);
curveVertex(158.0, 180.0);
curveVertex(152.0, 177.0);
curveVertex(147.0, 172.0);
curveVertex(132.0, 209.0);
curveVertex(147.0, 190.0);
curveVertex(149.0, 213.0);
curveVertex(154.0, 194.0);
curveVertex(167.0, 212.0);
curveVertex(252.0, 285.0);
endShape();




                    // poil patte droite

fill(65,65,0);
beginShape(); 
curveVertex(240.0, 225.0);
curveVertex(242.0, 199.0);
curveVertex(243.0, 180.0);
curveVertex(256.0, 204.0);
curveVertex(251.0, 177.0);
curveVertex(265.0, 184.0);
curveVertex(246.0, 166.0);
curveVertex(245.0, 169.0);
curveVertex(238.0, 175.0);
curveVertex(236.0, 175.0);
curveVertex(232.0, 165.0);
curveVertex(234.0, 148.0);
curveVertex(210.0, 177.0);
curveVertex(225.0, 172.0);
curveVertex(223.0, 205.0);
curveVertex(231.0, 183.0);
curveVertex(244.0, 200.0);
curveVertex(334.0, 282.0);
endShape();


     
                           //patte droite

fill(145,145,0);
beginShape(); 
curveVertex(425.0, 384.0);
curveVertex(332.0, 390.0);
curveVertex(227.0, 393.0);
curveVertex(243.0, 337.0);
curveVertex(298.0, 71.0);
curveVertex(253.0, 142.0);
curveVertex(243.0, 174.0);
curveVertex(231.0, 169.0);
curveVertex(241.0, 133.0);
curveVertex(330.0, 20.0);
curveVertex(256.0, 344.0);
curveVertex(328.0, 390.0);
curveVertex(400.0, 390.0);
endShape();
fill(0);




                     //interactivite: boutons changent progressivement de couleur de façon autonome
                     
     if (etat == ON){      
int v =0;                 
    while ( v < 20 ) {           
      
      v = v + 1; 
    }
    fill(g, b, 0,200);

}
  else {
    fill(r,g,b,200);
  }
 
 
   if ( random(100) < 5 ) {
    r2 = random(150);
    g2 = random(225);
    b2 = random(80);
}


 r = ( r2 - r )  * 0.04 + r;
  g = ( g2 - g )  * 0.04 + g;
  b = ( b2 - b )  * 0.04 + b;
   
   
   
   
   
                         //Dessin des boutons dans le visage
  
  ellipse(204, 195, 10, 10);             
  ellipse(142,212,7,10);
  ellipse(145,202,4,7);
  ellipse(255,225,8,12);
  ellipse(235,240,8,8);
  ellipse(260,215,2,4);
  ellipse(225,255,4,4);
  ellipse(178,255,14,14);
  ellipse(184,242,8,8);
  ellipse(175,242,6,6);
  ellipse(180,178,8,8);
  ellipse(175,160,13,12);
  ellipse(217,158,11,8);
  ellipse(220,180,3,3);
  
  
  
 
                // En cliquant souris sur tete, les yeux clignote
                //Zone interactive rectangulaire
                
if ( mousePressed ) {
   if ( mouseX > x-80 && mouseX < x+60 && mouseY > y-65 && mouseY < y+85 ) {
                if ( millis() - timeStamp >= interval ) {
                        timeStamp = timeStamp + interval;
                        o = color(random(256), random(10,50), random(10,50));
                }
}
        }
        
   
   
   
   
 
}

void mousePressed() {
  
  
  
  //Les boutons changent de couleur aleatoirement lorsque la souris clique sur la tete
 // Zone interctive rectangulaire
 
  if ( mouseX > x-80 && mouseX < x+60 && mouseY > y-65 && mouseY < y+75 ) {
    if ( etat == OFF ) {
      etat = ON;
    }
    else {
      etat = OFF;
    }
  }
}
  
  
  
 

//interactivite: les yeux rougissent lorsque que le curseur les survole
//zones interractives circulaires

 boolean mouseInsideCircle( float oeilX, float oeilY , float oeilDiameter) {
    
  float distance = dist( oeilX , oeilY , mouseX , mouseY);
    
  boolean result = distance < oeilDiameter*0.5;
    
  return result;
    
}
 




