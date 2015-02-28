
//hase2animiert(mouseX,mouseY)

void setup () {
  size(200,200);
  smooth();
 
}


void draw() {
    frameRate(40);

//Hase Normal
 
    background(255);
//Körper
     //außen
        fill(180,180,180,255);
        stroke(150,150,150,255);
        ellipse(mouseX,mouseY+38,50,55);
     //innen
        fill(195,195,195,255);
        stroke(180,180,180,255);
        ellipse(mouseX,mouseY+45,30,35);
  
//Kopf       

  //ohren
      //grau

        fill(180,180,180,255);
        stroke(150,150,150,255);
        ellipse(mouseX-10,mouseY-35,15,80);
        ellipse(mouseX+10,mouseY-35,15,80);
      //rosa
        fill(255,168,220,255);
        stroke(240,138,199,255);
        ellipse(mouseX-10,mouseY-30,8,40);
        ellipse(mouseX+10,mouseY-30,8,40);
        
  //Grundriss-Kopf
        fill(180,180,180,255);
        stroke(150,150,150,255);
        ellipse(mouseX,mouseY,40,40);
        
  //Augen
      //weiß
        fill(255,255,255,255);
        stroke(240,240,240,255);
        ellipse(mouseX-8,mouseY-5,8,10);
        ellipse(mouseX+8,mouseY-5,8,10);
      //blau  
        fill(0,164,255,255);
        stroke(0,164,255,100);
        ellipse(mouseX-8,mouseY-5,4,4);
        ellipse(mouseX+8,mouseY-5,4,4);
        
  //Mund
      //umriss
        fill(180,180,180,255);
        stroke(150,150,150,255);
        ellipse(mouseX,mouseY+8,25,20);
      //Zunge 
        fill(240,92,220,255);
        stroke(210,0,146,200);
        ellipse(mouseX,mouseY+10,5,10);
      //Zähne
        fill(255);
        stroke(255);
        quad(mouseX+1,mouseY+10,mouseX+1,mouseY+16,mouseX+3,mouseY+16,mouseX+3,mouseY+10);
        quad(mouseX-1,mouseY+10,mouseX-1,mouseY+16,mouseX-3,mouseY+16,mouseX-3,mouseY+10);
      //Mundwinkel
        fill(180,180,180,255);
        stroke(150,150,150,255);
        arc(mouseX+7,mouseY+6,15,15, PI/2,PI);
        arc(mouseX-7,mouseY+6,15,15, 0,PI/2);
      //Schnurrhaare sehen doof aus
       
  //Nase
        fill(60,60,60,255);
        stroke(45,45,45,255);
        triangle(mouseX-3,mouseY,mouseX+3,mouseY,mouseX,mouseY+6);      

  //Beine
    //links
      //grau
        fill(180,180,180,255);
        stroke(150,150,150,255);
        arc(mouseX-35,mouseY+55,60,25,TWO_PI-PI/2, TWO_PI);
        arc(mouseX-26,mouseY+55,40,21, 0, PI/2);
        arc(mouseX-25,mouseY+45,60,40, PI/2, PI);
        arc(mouseX-34,mouseY+46,41,06, PI, TWO_PI-PI/2);
        
      //rosa 
        fill(240,180,208,255);
        stroke(240,138,199,130);
        arc(mouseX-25,mouseY+55,30,16,TWO_PI-PI/2, TWO_PI);
        arc(mouseX-20,mouseY+55,20,8, 0, PI/2);
        arc(mouseX-20,mouseY+50,30,18, PI/2, PI);
        arc(mouseX-25,mouseY+50,20,6, PI, TWO_PI-PI/2);
        ellipse(mouseX-46,mouseY+48,12,6);
        ellipse(mouseX-43,mouseY+55,8,4);
        ellipse(mouseX-36,mouseY+59,6,4);
        
    //rechts
      //grau    
        fill(180,180,180,255);
        stroke(150,150,150,255);     
        arc(mouseX+34,mouseY+46,41,06,TWO_PI-PI/2, TWO_PI);
        arc(mouseX+25,mouseY+45,60,40, 0, PI/2);
        arc(mouseX+26,mouseY+55,41,20, PI/2, PI);
        arc(mouseX+35,mouseY+55,60,25, PI, TWO_PI-PI/2);
     //rosa   
        fill(240,180,208,255);
        stroke(240,138,199,130);
        arc(mouseX+25,mouseY+50,20,6,TWO_PI-PI/2, TWO_PI);
        arc(mouseX+20,mouseY+50,30,18, 0, PI/2);
        arc(mouseX+20,mouseY+55,20,8, PI/2, PI);
        arc(mouseX+25,mouseY+55,30,16, PI, TWO_PI-PI/2);
        ellipse(mouseX+46,mouseY+48,12,6);
        ellipse(mouseX+43,mouseY+55,8,4);
        ellipse(mouseX+36,mouseY+59,6,4);

//Arme
    //links
      //d.grau 
        fill(180,180,180,255);
        stroke(150,150,150,255);     
        ellipse(mouseX-20,mouseY+33,15,20);
      //h.grau  
        fill(195,195,195,255);
        stroke(180,180,180,255);
        ellipse(mouseX-17,mouseY+33,06,15);
   //rechts//  
      //d.grau
        fill(180,180,180,255);
        stroke(150,150,150,255);     
        ellipse(mouseX+20,mouseY+33,15,20);
      //h.grau  
        fill(195,195,195,255);
        stroke(180,180,180,255);
        ellipse(mouseX+17,mouseY+33,06,15);
if(mousePressed) {
//Körper
     //außen
        fill(180,180,180,255);
        stroke(150,150,150,255);
        ellipse(mouseX,mouseY+38,50,55);
     //innen
        fill(195,195,195,255);
        stroke(180,180,180,255);
        ellipse(mouseX,mouseY+45,30,35);
  
//Kopf       

  //ohren
      //grau

        fill(180,180,180,255);
        stroke(150,150,150,255);
        ellipse(mouseX-10,mouseY-35,15,80);
        ellipse(mouseX+10,mouseY-35,15,80);
      //blau 
        fill(0,74,255,255);
        stroke(17,39,93,130);
        ellipse(mouseX-10,mouseY-30,8,40);
        ellipse(mouseX+10,mouseY-30,8,40);
        
  //Grundriss-Kopf
        fill(180,180,180,255);
        stroke(150,150,150,255);
        ellipse(mouseX,mouseY,40,40);
        
  //Augen
      //weiß
        fill(255,255,255,255);
        stroke(240,240,240,255);
        ellipse(mouseX-8,mouseY-5,8,10);
        ellipse(mouseX+8,mouseY-5,8,10);
      //grün  
        fill(0,255,84,255);
        stroke(29,93,41,100);
        ellipse(mouseX-8,mouseY-5,4,4);
        ellipse(mouseX+8,mouseY-5,4,4);
        
  //Mund
      //umriss
        fill(180,180,180,255);
        stroke(150,150,150,255);
        ellipse(mouseX,mouseY+8,25,20);
      //Zunge 
        fill(240,92,220,255);
        stroke(210,0,146,200);
        ellipse(mouseX,mouseY+10,5,10);
      //Zähne
        fill(255);
        stroke(255);
        quad(mouseX+1,mouseY+10,mouseX+1,mouseY+16,mouseX+3,mouseY+16,mouseX+3,mouseY+10);
        quad(mouseX-1,mouseY+10,mouseX-1,mouseY+16,mouseX-3,mouseY+16,mouseX-3,mouseY+10);
      //Mundwinkel
        fill(180,180,180,255);
        stroke(150,150,150,255);
        arc(mouseX+7,mouseY+6,15,15, PI/2,PI);
        arc(mouseX-7,mouseY+6,15,15, 0,PI/2);
      //Schnurrhaare sehen doof aus
       
  //Nase
        fill(60,60,60,255);
        stroke(45,45,45,255);
        triangle(mouseX-3,mouseY,mouseX+3,mouseY,mouseX,mouseY+6);      

  //Beine
    //links
      //grau
        fill(180,180,180,255);
        stroke(150,150,150,255);
        arc(mouseX-35,mouseY+55,60,25,TWO_PI-PI/2, TWO_PI);
        arc(mouseX-26,mouseY+55,40,21, 0, PI/2);
        arc(mouseX-25,mouseY+45,60,40, PI/2, PI);
        arc(mouseX-34,mouseY+46,41,06, PI, TWO_PI-PI/2);
        
      //blau 
        fill(0,74,255,255);
        stroke(17,39,93,130);
        arc(mouseX-25,mouseY+55,30,16,TWO_PI-PI/2, TWO_PI);
        arc(mouseX-20,mouseY+55,20,8, 0, PI/2);
        arc(mouseX-20,mouseY+50,30,18, PI/2, PI);
        arc(mouseX-25,mouseY+50,20,6, PI, TWO_PI-PI/2);
        ellipse(mouseX-46,mouseY+48,12,6);
        ellipse(mouseX-43,mouseY+55,8,4);
        ellipse(mouseX-36,mouseY+59,6,4);
        
    //rechts
      //grau    
        fill(180,180,180,255);
        stroke(150,150,150,255);     
        arc(mouseX+34,mouseY+46,41,06,TWO_PI-PI/2, TWO_PI);
        arc(mouseX+25,mouseY+45,60,40, 0, PI/2);
        arc(mouseX+26,mouseY+55,41,20, PI/2, PI);
        arc(mouseX+35,mouseY+55,60,25, PI, TWO_PI-PI/2);
     //blau 
        fill(0,74,255,255);
        stroke(17,39,93,130);
        arc(mouseX+25,mouseY+50,20,6,TWO_PI-PI/2, TWO_PI);
        arc(mouseX+20,mouseY+50,30,18, 0, PI/2);
        arc(mouseX+20,mouseY+55,20,8, PI/2, PI);
        arc(mouseX+25,mouseY+55,30,16, PI, TWO_PI-PI/2);
        ellipse(mouseX+46,mouseY+48,12,6);
        ellipse(mouseX+43,mouseY+55,8,4);
        ellipse(mouseX+36,mouseY+59,6,4);

//Arme
    //links
      //d.grau 
        fill(180,180,180,255);
        stroke(150,150,150,255);     
        ellipse(mouseX-20,mouseY+33,15,20);
      //h.grau  
        fill(195,195,195,255);
        stroke(180,180,180,255);
        ellipse(mouseX-17,mouseY+33,06,15);
   //rechts//  
      //d.grau
        fill(180,180,180,255);
        stroke(150,150,150,255);     
        ellipse(mouseX+20,mouseY+33,15,20);
      //h.grau  
        fill(195,195,195,255);
        stroke(180,180,180,255);
        ellipse(mouseX+17,mouseY+33,06,15);
}

}


void keyPressed() {
    frameRate(5);

//Hase rot bei press Key  

//Körper
     //außen
        fill(180,180,180,255);
        stroke(150,150,150,255);
        ellipse(mouseX,mouseY+38,50,55);
     //innen
        fill(195,195,195,255);
        stroke(180,180,180,255);
        ellipse(mouseX,mouseY+45,30,35);
  
//Kopf       

  //ohren
      //grau

        fill(180,180,180,255);
        stroke(150,150,150,255);
        ellipse(mouseX-10,mouseY-35,15,80);
        ellipse(mouseX+10,mouseY-35,15,80);
     //rot 
        fill(255,0,0,255);
        stroke(255,0,23,130);
        ellipse(mouseX-10,mouseY-30,8,40);
        ellipse(mouseX+10,mouseY-30,8,40);
        
  //Grundriss-Kopf
        fill(180,180,180,255);
        stroke(150,150,150,255);
        ellipse(mouseX,mouseY,40,40);
        
  //Augen
      //weiß
        fill(255,255,255,255);
        stroke(240,240,240,255);
        ellipse(mouseX-8,mouseY-5,8,10);
        ellipse(mouseX+8,mouseY-5,8,10);
     //rot 
        fill(255,0,0,255);
        stroke(255,0,23,130);
        ellipse(mouseX-8,mouseY-5,4,4);
        ellipse(mouseX+8,mouseY-5,4,4);
        
  //Mund
      //umriss
        fill(180,180,180,255);
        stroke(150,150,150,255);
        ellipse(mouseX,mouseY+8,25,20);
      //Zunge 
        fill(240,92,220,255);
        stroke(210,0,146,200);
        ellipse(mouseX,mouseY+10,5,10);
      //Zähne
        fill(255);
        stroke(255);
        quad(mouseX+1,mouseY+10,mouseX+1,mouseY+16,mouseX+3,mouseY+16,mouseX+3,mouseY+10);
        quad(mouseX-1,mouseY+10,mouseX-1,mouseY+16,mouseX-3,mouseY+16,mouseX-3,mouseY+10);
      //Mundwinkel
        fill(180,180,180,255);
        stroke(150,150,150,255);
        arc(mouseX+7,mouseY+6,15,15, PI/2,PI);
        arc(mouseX-7,mouseY+6,15,15, 0,PI/2);
      //Schnurrhaare sehen doof aus
       
  //Nase
        fill(60,60,60,255);
        stroke(45,45,45,255);
        triangle(mouseX-3,mouseY,mouseX+3,mouseY,mouseX,mouseY+6);      

  //Beine
    //links
      //grau
        fill(180,180,180,255);
        stroke(150,150,150,255);
        arc(mouseX-35,mouseY+55,60,25,TWO_PI-PI/2, TWO_PI);
        arc(mouseX-26,mouseY+55,40,21, 0, PI/2);
        arc(mouseX-25,mouseY+45,60,40, PI/2, PI);
        arc(mouseX-34,mouseY+46,41,06, PI, TWO_PI-PI/2);
        
     //rot 
        fill(255,0,0,255);
        stroke(255,0,23,130);
        arc(mouseX-25,mouseY+55,30,16,TWO_PI-PI/2, TWO_PI);
        arc(mouseX-20,mouseY+55,20,8, 0, PI/2);
        arc(mouseX-20,mouseY+50,30,18, PI/2, PI);
        arc(mouseX-25,mouseY+50,20,6, PI, TWO_PI-PI/2);
        ellipse(mouseX-46,mouseY+48,12,6);
        ellipse(mouseX-43,mouseY+55,8,4);
        ellipse(mouseX-36,mouseY+59,6,4);
        
    //rechts
      //grau    
        fill(180,180,180,255);
        stroke(150,150,150,255);     
        arc(mouseX+34,mouseY+46,41,06,TWO_PI-PI/2, TWO_PI);
        arc(mouseX+25,mouseY+45,60,40, 0, PI/2);
        arc(mouseX+26,mouseY+55,41,20, PI/2, PI);
        arc(mouseX+35,mouseY+55,60,25, PI, TWO_PI-PI/2);
     //rot 
        fill(255,0,0,255);
        stroke(255,0,23,130);
        arc(mouseX+25,mouseY+50,20,6,TWO_PI-PI/2, TWO_PI);
        arc(mouseX+20,mouseY+50,30,18, 0, PI/2);
        arc(mouseX+20,mouseY+55,20,8, PI/2, PI);
        arc(mouseX+25,mouseY+55,30,16, PI, TWO_PI-PI/2);
        ellipse(mouseX+46,mouseY+48,12,6);
        ellipse(mouseX+43,mouseY+55,8,4);
        ellipse(mouseX+36,mouseY+59,6,4);

//Arme
    //links
      //d.grau 
        fill(180,180,180,255);
        stroke(150,150,150,255);     
        ellipse(mouseX-20,mouseY+33,15,20);
      //h.grau  
        fill(195,195,195,255);
        stroke(180,180,180,255);
        ellipse(mouseX-17,mouseY+33,06,15);
   //rechts//  
      //d.grau
        fill(180,180,180,255);
        stroke(150,150,150,255);     
        ellipse(mouseX+20,mouseY+33,15,20);
      //h.grau  
        fill(195,195,195,255);
        stroke(180,180,180,255);
        ellipse(mouseX+17,mouseY+33,06,15);
}
  


