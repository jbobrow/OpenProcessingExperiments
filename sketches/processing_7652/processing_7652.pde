
class Bestiole {


  float x, y, taille;

  Bestiole(float depart_x, float depart_y, float t) {
    x = depart_x;
    y = depart_y;
    taille = t;
  }



  void draw() {
    distx=mouseX-x;
    disty=mouseY-y;
    bouger();
    dessiner();
  }

  void bouger() {
    // bouger al�atoirement 
    x += random(-1,1);
    y += random(-1,1);
    // boucler sur les bords du Sketch
    if (x > width + taille) x = -taille;
    if (x < -taille) x = width + taille;
    if (y > height + taille) y = -taille;
    if (y < -taille) y = height + taille;
  }

  void dessiner() {

    pushMatrix();

    // dessiner le corps
    fill(0);
    translate(x,y);
    // le corps est compos� de plein de cercles
    for(int i=0; i<360; i+=30) {
      pushMatrix();
      rotate(radians(i));
    //les cercles se d�placent sur eux-m�me en fonction du stress du monstre  
      translate(random(-stress,stress), random(-stress,stress));
     //les cercles changent de taille en fonction de la souris
     ellipse(taille/2, 0, mouseX, mouseY);
      popMatrix();
    }

    // dessiner le visage
    smooth();
    stroke(10);
    fill(0);
    //visage de base (cercle noir)
    ellipse(0,0,58,58);
    fill(255);
    //oeil1
    ellipse(-taille/3, -taille/4, taille/3, taille/3);
    //pupille1
    fill(0);
    //oeil2
    ellipse(-taille/3, -taille/4, taille/5, taille/5);
    fill(255);
    ellipse( taille/3, -taille/4, taille/3, taille/3);
    //pupille2
    fill(0);
    ellipse( taille/3, -taille/4, taille/5, taille/5);
    fill(255);
    //bouche
    ellipse(0,  taille/5,random(4,bouche), taille/4 );


    // si la souris est postionn�e proche du visage :
    if(distx>-100&&distx<100&&disty>-100&&disty<100){
    // alors le monstre fronce les sourcils  
     fill(0);
      triangle(-17,-25,-36,-20,0,-10);
     fill(0);
     triangle(5, -10, 36, -20, 15, -25); 
    //et sa bouche s'affole !
     bouche=20;
      //le niveau de stress est d�fini par les secondes
      stress=second();
    }
    // sinon, pas de stress et bouche immobile
    else{
      stress=0;
      bouche=0;
    }

    popMatrix(); // revenir � l'orientation d'origine

  }

}

