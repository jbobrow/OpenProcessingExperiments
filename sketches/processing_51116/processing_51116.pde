
//------------Sorte des variables
float x;
float y;

//------------Initialisation de ma fenêtre

void setup () {
  size(400, 400);
  smooth ();
}

//------------Dessin réinitialisé au frame sec. du projet
void draw () {

  //----------Valeur des Variables pour ma fenêtre DRAW
  x = width/2;
  y = height/2;

  //----------Si la souri est pressé le dessin est actualisé
  if (mousePressed == true) {
    //background..
    background(20);

    
    
      //-----------Queue
    noStroke();
    fill(255, 231, 178);
    ellipse (x+35, y+30, 150, 30);
    
    //--------Background dans la bouche
    fill(75, 0, 0);
    ellipse(x-15, y-10, 210, 100);
    noFill();

    //--------Rayé dans bouche
    colorMode(HSB);
    strokeWeight(1.5);
    float   raye = 0;
    while ( raye < 200 ) {
      float   dessinx2 = random (-110, 70);
      float   dessiny2 = random (-60, 40);
      float   colorx   = random (  1, 30);
      stroke(0, 8, colorx);
      line(x, y, x+dessinx2, y+dessiny2);
      raye = raye + 1;
    }
    colorMode(RGB);

    //----------Dents aléatoire haut  -82 -25  à  50  -25   milieu à -10 -10
    //IN PROGRESS Il serait bien d'avoir des dents pointu gèré à partir de while

    strokeWeight(5);
    stroke(255);
    point(x-40, y-13);

    //----------Dents aléatoire bas    
    //IN PROGRESS
    point(x+30, y+18);
    point(x+10, y+24);
    strokeWeight(1.5);

    //----------Gencives créé par des ellipse HAUTE
    fill(185, 62, 62);
    noStroke();
    ellipse(x+35, y-29, 40, 20);
    ellipse(x+24, y-24, 40, 20);
    ellipse(x+10, y-24, 40, 20);
    ellipse(x, y-20, 50, 20);
    ellipse(x-10, y-20, 50, 20);
    ellipse(x-20, y-20, 50, 20);
    ellipse(x-40, y-28, 50, 20);
    ellipse(x-60, y-30, 50, 20);

    //---------Gencives créé par des ellipse BASSE

    ellipse(x+35, y+29, 40, 20);
    ellipse(x+24, y+34, 40, 20);
    ellipse(x+10, y+35, 40, 20);
    ellipse(x, y+40, 50, 20);
    ellipse(x-10, y+32, 50, 20);
    ellipse(x-20, y+32, 50, 20);
    ellipse(x-40, y+28, 50, 20);
    ellipse(x-60, y+30, 50, 20);
    ellipse(x+50, y+30, 50, 20);
    ellipse(x-70, y+30, 50, 20);

    //---------Corps  ET TROU DANS LA BOUCHE !!!
    noStroke();
    fill(255, 231, 178);
    beginShape();
    curveVertex(x, y-100);
    curveVertex(x, y-100);
    curveVertex(x+90, y-70);
    curveVertex(x+100, y);
    curveVertex(x+70, y+40);
    curveVertex(x+15, y+50);
    curveVertex(x-30, y+55);
    curveVertex(x-60, y+50);
    curveVertex(x-90, y+45);
    curveVertex(x-108, y+20);
    curveVertex(x-115, y-45);
    curveVertex(x, y-100);


    curveVertex(x-110, y-33);
    curveVertex(x-110, y-33);
    curveVertex(x-111, y-30);
    curveVertex(x-105, y-15);
    curveVertex(x-97, y);
    curveVertex(x-70, y+20);
    curveVertex(x-50, y+30);
    curveVertex(x-30, y+35);
    curveVertex(x, y+39);
    curveVertex(x+15, y+36);
    curveVertex(x+40, y+30);
    curveVertex(x+60, y+18);
    curveVertex(x+70, y+10);
    curveVertex(x+75, y);
    curveVertex(x+81, y-31);
    curveVertex(x+80, y-33);
    curveVertex(x+40, y-28);
    curveVertex(x, y-23);
    curveVertex(x-110, y-33);
    curveVertex(x-110, y-33);
    curveVertex(x, y-100);

    endShape(CLOSE);

    //---------curve plus ronde du corps = dessus de tête
    arc(x-10, y-35, 200, 135, PI, 2*PI);


    //---------Mains + inclinaison légère de la main droite

    stroke(0);
    fill(255, 231, 178);

    pushMatrix();
    translate(-2, -2);
    rotate(-0.02);
    arc(x+100, y-10, 50, 25, 4.6, 8);
    popMatrix();

    arc(x-115, y-10, 50, 25, PI/2, 4.45 );
    noFill();

    //----------Bouche
    noFill();
    beginShape();
    curveVertex(x-110, y-33);
    curveVertex(x-110, y-33);
    curveVertex(x-111, y-30);
    curveVertex(x-105, y-15);
    curveVertex(x-97, y);
    curveVertex(x-70, y+20);
    curveVertex(x-50, y+30);
    curveVertex(x-30, y+35);
    curveVertex(x, y+39);
    curveVertex(x+15, y+36);
    curveVertex(x+40, y+30);
    curveVertex(x+60, y+18);
    curveVertex(x+70, y+10);
    curveVertex(x+75, y);
    curveVertex(x+81, y-31);
    curveVertex(x+80, y-33);
    curveVertex(x+40, y-28);
    curveVertex(x, y-23);
    curveVertex(x-110, y-33);
    curveVertex(x-110, y-33);
    endShape();

    //----------Sourcil gauche

      fill(0);
    beginShape();
    vertex(x-85, y-75);
    vertex(x-85, y-75);
    vertex(x-72, y-68);
    vertex(x-75, y-68);
    vertex(x-83, y-72);
    endShape(CLOSE);

    //----------Sourcil droit

    beginShape();
    vertex(x+80, y-76);
    vertex(x+80, y-73);
    vertex(x+65, y-70);
    vertex(x+64, y-70);
    vertex(x+80, y-76);
    endShape(CLOSE);


    //-----------Yeux Blanc
    fill(255, 255, 255);
    ellipse(x+72, y-55, 25, 28);
    ellipse(x-83, y-55, 25, 28);

    //-----------Joues droites
    noFill();
    arc(x+78, y-30, 20, 20, 5, 2*PI);
    arc(x+80, y-31, 20, 20, 5, 1.9*PI);

    //-----------Joues gauches
    arc(x-105, y-30, 20, 20, PI, 5);
    arc(x-108, y-29, 20, 20, PI, 4);

    //-----------Pieds
    stroke(0);
    fill(255, 231, 178);
    arc(x+35, y+50, 30, 45, -0.25, PI+0.2);
    arc(x-50, y+47, 30, 45, 0.3, PI+0.1);
    noStroke();
    ellipse(x+35, y+50, 30, 20);

    //-----------Yeux pupille
    fill(0);
    noStroke();
    ellipse(x+71, y-54, 10, 10);
    ellipse(x-83, y-54, 10, 10);


    //-----------Ptit truc sous la bouche
    stroke(1);
    noFill();
    beginShape();
    curveVertex(x-11, y+40);
    curveVertex(x-11, y+40);
    curveVertex(x, y+43);
    curveVertex(x+10, y+40);
    curveVertex(x+10, y+40);
    endShape();

    beginShape();
    curveVertex(x-5, y+47);
    curveVertex(x-5, y+45);
    curveVertex(x, y+46);
    curveVertex(x+4, y+45);
    curveVertex(x+4, y+47);
    endShape();

    //-----------Genoux
    beginShape();
    curveVertex(x-60, y+53);
    curveVertex(x-55, y+60);
    curveVertex(x-51, y+62);
    curveVertex(x-47, y+60);
    curveVertex(x-47, y+60);
    endShape();

    beginShape();
    curveVertex(x+45, y+55);
    curveVertex(x+40, y+62);
    curveVertex(x+36, y+63);
    curveVertex(x+32, y+62);
    curveVertex(x+32, y+62);
    endShape();

    //------------Bosse en dessous de l'oeil gauche
    fill(255, 231, 178);
    stroke(2);
    arc(x-97, y-38, 50, 20, PI+PI/2, 2*PI);

    //------------Bosse en dessous de l'oeil droite
    arc(x+72, y-36, 50, 20, PI+0.2, PI+2.1);
    noStroke();

    //------------Plancher
    strokeWeight(1);
    float   plancher2 = 0;
    while ( plancher2 < 15 ) {
      float   dessinx = random (-90, +80);
      float   dessiny = random ( 75, 100);
      stroke(255);
      line(x-100, y+69, x+100, y+72);
      line(x-90, y+75, x+96, y+80);
      line(x-dessinx, y+dessiny, x+dessinx, y+dessiny);
      plancher2 = plancher2 + 1;
    }
  }



  if (mousePressed == false) {
    //background..
    background(20);

    //------------Queue tête -------- Monstre gentil
    noStroke();
    fill(255, 231, 178);
    ellipse(x+25, y-50, 60, 40);
    ellipse(x+35, y-40, 60, 40);

    //------------Queue Cu  -------- Monstre gentil
    ellipse(x+30, y+30, 145, 40);

    //------------Ellipse corps  -------- Monstre gentil
    noStroke();
    fill(255, 231, 178);
    ellipse(x, y, 200, 120);

    //------------Contour queue  -------- Monstre gentil
    stroke(0);
    noFill();
    arc(x, y, 200, 120, 0.6, 1.1);
    arc(x, y, 200, 120, 4.6, 5);
    arc(x+35, y-40, 60, 40, 5, 5.5);

    //-----------Mains ou ce qui peut ressembler a des mains  -------- Monstre gentil
    noFill();
    arc(x+53, y+30, 20, 25, 0, PI);
    arc(x-55, y+30, 20, 25, 0, PI);

    //-----------Bouche  -------- Monstre gentil
    beginShape();
    vertex(x-80, y+14);
    vertex(x-80, y+14);
    vertex(x-60, y+15);
    vertex(x-40, y+17);
    vertex(x-20, y+18);
    vertex(x, y+18);
    vertex(x, y+18);
    vertex(x+20, y+18);
    vertex(x+40, y+17);
    vertex(x+60, y+15);
    vertex(x+80, y+14);
    vertex(x+80, y+14);
    endShape();

    //----------Yeux Blanc  -------- Monstre gentil
    fill(255, 255, 255);
    ellipse(x+72, y-5, 25, 28);
    ellipse(x-72, y-5, 25, 28);

    //----------Joues droites  -------- Monstre gentil
    noFill();
    arc(x+75, y+20, 20, 20, 5, 2*PI);
    arc(x+79, y+19, 20, 20, 5, 1.9*PI);

    //----------Joues gauches  -------- Monstre gentil
    arc(x-79, y+20, 20, 20, PI, 5);
    arc(x-81, y+19, 20, 20, PI, 4);

    //----------Pieds  -------- Monstre gentil
    stroke(0);
    fill(255, 231, 178);
    arc(x+35, y+50, 30, 45, -0, PI-0.29);
    arc(x-50, y+47, 30, 45, 0.3, PI+0.1);

    //----------Yeux pupille  -------- Monstre gentil
    fill(0);
    noStroke();
    ellipse(x+69, y+2, 10, 10);
    ellipse(x-69, y+2, 10, 10);

    //----------Ptit truc sous la bouche  -------- Monstre gentil
    stroke(1);
    noFill();
    beginShape();
    curveVertex(x-11, y+25);
    curveVertex(x-11, y+25);
    curveVertex(x, y+28);
    curveVertex(x+10, y+25);
    curveVertex(x+10, y+25);
    endShape();

    beginShape();
    curveVertex(x-5, y+33);
    curveVertex(x-5, y+31);
    curveVertex(x, y+32);
    curveVertex(x+4, y+31);
    curveVertex(x+4, y+33);
    endShape();

    //----------Genoux  -------- Monstre gentil
    beginShape();
    curveVertex(x-60, y+53);
    curveVertex(x-55, y+60);
    curveVertex(x-51, y+62);
    curveVertex(x-47, y+60);
    curveVertex(x-47, y+60);
    endShape();

    beginShape();
    curveVertex(x+45, y+55);
    curveVertex(x+40, y+62);
    curveVertex(x+36, y+63);
    curveVertex(x+32, y+62);
    curveVertex(x+32, y+62);
    endShape();

    //----------Plancher  -------- Monstre gentil
    float   plancher = 0;
    while ( plancher < 15 ) {
      float   dessinx = random (-90, +80);
      float   dessiny = random ( 75, 100);
      stroke(255);
      line(x-100, y+69, x+100, y+72);
      line(x-90, y+75, x+96, y+80);
      line(x-dessinx, y+dessiny, x+dessinx, y+dessiny);
      plancher = plancher + 1;
    }
  }
}
                                
