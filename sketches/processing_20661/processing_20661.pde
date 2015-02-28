
/*****************************************
  Créature: Simon Desjardins
  TP1 - Création d'un monstre interactif
*****************************************/

//Mise en place des nombreuses variables
float x;   //centerX
float y;   //centerY
float x1, x2, x3, x4;  //   coordonnées de
float y1, y2, y3, y4;  //     la queue
float h;   //Tete height
float w;   //Tete width
float el;  //Oeuil gauche rayon
float er;  //Oeuil droit rayon
float pl;  //Pupille gauche
float pr;  //Pupille gauche
float clk; //Transparence

int cloak = 0;
//Fin de la déclaration des variables

void setup() {
    size(400, 400);
    smooth();
    frameRate(30);
    x = width/2;
    y = height/2;
    x1 = width/2;  
    y1 = height/2; 
    x2 = width/2;
    y2 = height/2;   
    x3 = width/2;
    y3 = height/2; 
    x4 = width/2;
    y4 = height/2;
    h = 100;
    w = 100;
    clk = 255;

}

void draw() {  
    background(0);
    
    float toX = mouseX;
    float toY = mouseY;
    
    //CLOAK mode
    if ( cloak == 0 ) {
      clk = constrain(clk+10, 0, 255);
    }
    else if ( cloak == 1) {
      clk = constrain(clk-10, 0, 255);
    }
    
    
    //Queue

    fill(25, clk);
    ellipse(x4, y4, 120, 120);
    
    fill(50, clk);
    ellipse(x3, y3, 140, 140);
    
    fill(75, clk);
    ellipse(x2, y2, 160, 160);
    
    fill(100, clk);
    ellipse(x1, y1, 180, 180);
    
    
    //Tete
    fill(255, clk);
    ellipse(x, y, 2*h, 2*w);
    
    //Dreads over
    stroke(100, clk);
    strokeWeight(10.0);
    line(x-60, y-85, x-60, y-70);
    line(x-30, y-100, x-30, y-85);
    line(x, y-105, x, y-90);
    line(x+30, y-100, x+30, y-85);
    line(x+60, y-85, x+60, y-70);
    strokeWeight(1.0);
    stroke(0);
    
    //Yeux
    el = 50;
    er = 25;
    fill(35);
    ellipse(x-40, y-30, el, el);
    ellipse(x+40, y-30, er, er);

    
    //Pupille gauche inter
    pl = 5;
    float radianspl = atan2(mouseY-(y-30),mouseX-(x-40)); // Calcule l'angle vers lequel la pupille doit s'orienter
    float distancepl = sqrt(pow(mouseY-(y-30),2)+pow(mouseX-(x-40),2)); // Notre bon ami Pythagore nous donne la distance entre le centre de l'oeil et la souris
    fill(255, 0, 0);
    ellipse(cos(radianspl)*min(distancepl,el/2-pl/2)+(x-40),sin(radianspl)*min(distancepl,el/2-pl/2)+(y-30), pl, pl); // À l'aide de l'angle et la distance récoltée plus haut, on situe notre pupille dans l'espace
    
    //Pupille droite inter
    pr = 10;
    float radianspr = atan2(mouseY-(y-30),mouseX-(x+40)); // Calcule l'angle vers lequel la pupille doit s'orienter
    float distancepr = sqrt(pow(mouseY-(y-30),2)+pow(mouseX-(x+40),2)); // Notre bon ami Pythagore nous donne la distance entre le centre de l'oeil et la souris
    fill(255, 0, 0);      
    ellipse(cos(radianspr)*min(distancepr,er/2-pr/2)+(x+40),sin(radianspr)*min(distancepr,er/2-pr/2)+(y-30), pr, pr); // À l'aide de l'angle et la distance récoltée plus haut, on situe notre pupille dans l'espace
   
    
    //Bouche
    noFill();
    strokeWeight(5.0);
    beginShape();
    curveVertex(x-50, y+10);
    curveVertex(x-33, y+35);
    curveVertex(x-17, y+50);
    curveVertex(x, y+50);
    curveVertex(x+33, y+35);
    curveVertex(x+50, y+30);
    endShape(CLOSE);
    strokeWeight(1.0);

    //Langue
    pushMatrix();
      translate(x+18,y+53);
      rotate(radians(135));
      noStroke();
      fill(255, 0, 170, clk);
      ellipse(0, 0, 15, 30);
    popMatrix();
    
    
    //GRAB
   if (mousePressed) {
     if (mouseButton == LEFT) {
       x = (toX-x)/4.0+x;
       y = (toY-y)/4.0+y;
       x1 = (toX-x1)/6.0+x1;
       y1 = (toY-y1)/6.0+y1;
       x2 = (toX-x2)/9.0+x2;
       y2 = (toY-y2)/9.0+y2;
       x3 = (toX-x3)/12.0+x3;
       y3 = (toY-y3)/12.0+y3;
       x4 = (toX-x4)/15.0+x4;
       y4 = (toY-y4)/15.0+y4;  
    }
    
    
    //Active le CLOAK MODE
     if (mouseButton == RIGHT) {
       cloak = (cloak + 1) % 2;
     }
  }
}

    //Cette option nous indique où se siture la souris en X et Y lorsqu'on clique  
void mousePressed() {
  println("Clique x"+mouseX+" y "+mouseY); 
  
}

