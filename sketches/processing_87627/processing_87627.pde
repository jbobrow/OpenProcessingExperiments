
float x;
float y;
void setup() {
        size(400,400); // La taille de la fenetre.
        frameRate(30); // Le nombre d'images par seconde.
        smooth(); // Lisser les formes dessinees.
        x = width/2;
        y= height/2;
        
}


// Fonction qui est appelee a chaque nouvelle image.
void draw() {
        background(10,194,242); // Remplir l'arriere-plan d'une teinte de gris.
       
       
      
        pushMatrix();
        translate (x,y);
        popMatrix();
        fill(255,8,214);
        noStroke();
        ellipse(x,y+55,150,50);/*perso*/
        ellipse(x,y-50,150,150);/*perso*/
        rectMode(CENTER);
        rect(x,y+5,150,100);/*perso*/
      
        pushMatrix();/*1e tentacule*/
translate(x-75,y+80);
rotate(60);
fill(255,8,214);
ellipse(0,0,20,90);
fill(random(0,255),random(0,255),random(0,255));
ellipse(0,0,10,10);
popMatrix();
pushMatrix();/*2e tentacule*/
translate(x-57,y+85);
rotate(60);
fill(255,8,214);
ellipse(0,0,20,90);
fill(random(0,255),random(0,255),random(0,255));
ellipse(0,0,10,10);
popMatrix();
pushMatrix();/*3e tentacule*/
translate(x-35,y+80);
rotate(60);
fill(255,8,214);
ellipse(0,0,20,90);
fill(random(0,255),random(0,255),random(0,255));
ellipse(0,0,20,20);
popMatrix();
pushMatrix();/*4e tentacule*/
translate(x-15,y+80);
rotate(0);
fill(255,8,214);
ellipse(0,0,20,90);
fill(random(0,255),random(0,255),random(0,255));
ellipse(0,0,10,10);
popMatrix();
pushMatrix();/*5e tentacule*/
translate(x+5,y+90);
rotate(0);
fill(255,8,214);
ellipse(0,0,20,90);
fill(random(0,255),random(0,255),random(0,255));
ellipse(0,0,10,10);
popMatrix();
pushMatrix();/*6e tentacule*/
translate(x+24,y+85);
rotate(60);
fill(255,8,214);
ellipse(0,0,20,90);
fill(random(0,255),random(0,255),random(0,255));
ellipse(0,0,10,10);
popMatrix();
pushMatrix();/*7e tentacule*/
translate(x+43,y+90);
rotate(60);
fill(255,8,214);
ellipse(0,0,20,90);
fill(random(0,255),random(0,255),random(0,255));
ellipse(0,0,10,10);
popMatrix();
pushMatrix();/*8e tentacule*/
translate(x+65,y+80);
rotate(330);
fill(255,8,214);
ellipse(0,0,20,90);
fill(random(0,255),random(0,255),random(0,255));
ellipse(0,0,10,10);
popMatrix();
/*pois*/
  fill(random(0,255),random(0,255),random(0,255));
        ellipse(x-35,y-100,20,20);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x+35,y-100,10,10);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x,y-100,10,10);
        ellipse(x-50,y-80,10,10);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x-20,y-80,20,20);
        ellipse(x+20,y-80,10,10);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x+50,y-80,10,10);
        ellipse(x-35,y-60,10,10);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x+35,y-60,20,20);
        ellipse(x,y-60,20,20);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x-70,y-60,10,10);
        ellipse(x+70,y-60,10,10);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x-50,y-40,20,20);
        ellipse(x-20,y-117,10,10);
        ellipse(x+50,y-40,20,20);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x+20,y-117,10,10);
        ellipse(x-70,y-20,10,10);
        ellipse(x+70,y-20,10,10);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x-35,y-20,10,10);
        ellipse(x+35,y-20,20,20);
        ellipse(x-50,y,10,10);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x+50,y,10,10);
        ellipse(x-70,y+20,10,10);
        ellipse(x+70,y+20,10,10);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x-35,y+20,20,20);
        ellipse(x+35,y+20,10,10);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x-70,y+60,10,10);
        ellipse(x+70,y+60,10,10);
        ellipse(x-35,y+60,10,10);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x+35,y+60,10,10);
        ellipse(x-70,y+60,10,10);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x+70,y+60,10,10);
        ellipse(x-35,y+60,10,10);
        ellipse(x+35,y+60,20,20);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x+50,y+40,10,10);
        ellipse(x-50,y+40,10,10);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x-20,y+40,10,10);
        ellipse(x+20,y+40,10,10);
         fill(random(0,255),random(0,255),random(0,255));
        ellipse(x,y+62,10,10);
         fill(255);
        ellipse(x,y-50,75,75);/*oeuil blanc*/
        fill(8,255,224);
        ellipse(x-3,y-50,60,60);/*oeuil bleu*/
        for ( int i = 35; i >0; i =i -1){
        fill(127*i/35);
        ellipse(x,y-50,i,i);/*oeuil noir*/
        }
        
        fill(255);/*étincelle de yeux*/
        ellipse(x-10,y-60,15,15);
        ellipse(x-15,y-75,10,10);
        fill(0);
        arc(x,y,75,75,radians(0),radians(180));/*bouche*/
        fill(255);/*dents*/
         for(int i=-28; i<35; i= i+7) {
     rect(x+i,y+5,6,10);
     ellipse(x+i,y+9,5,5);
    }
        
        fill(100,0,20);/*langue*/
        arc(x,y+23,50,28,radians(0),radians(180));
        ellipse(x-13,y+24,27,15);
        ellipse(x+13,y+24,27,15);
}
     
