
float cercle_x;
float cercle_y;
float cercle_r = 100;

electron test = new electron();
electron[] Tableau = new electron[20];
         
        

void setup(){
        ellipseMode(CENTER);
        size(1000,1000,P3D);
        background(#FFFFFF);
          cercle_x = height/2;
          cercle_y = width/2;
          cercle_r = 500 * .75;
          noStroke();
        for (int i = 0; i<Tableau.length;i++){
        Tableau [i]= new electron();
    } 
}
          




void draw(){

        if (mousePressed && mouseX<700 && mouseX>0){
          cercle_r=500*.75-mouseX/2;
        }
         if (keyPressed){
          if (key==' '){
            background(#FFFFFF);
          }
        }

        noFill();
          ellipse (cercle_x, cercle_y, cercle_r, cercle_r);
          test.bouge();
          for (int i = 0; i<Tableau.length;i++){
          Tableau[i].bouge();
        } 
}



class electron {
// Propriété de l'objet
        float point_x = 0;
        float point_y = 0;
        float rayon,angle;

// Constructeur
electron(){
rayon =random(4);
angle =random(360);
         point_y += sin(radians(angle)) * PI * rayon;
        }

        void bouge(){

        


  //on dŽplace le point
  point_x += cos(radians(angle)) * PI * rayon;
  point_y += sin(radians(angle)) * PI * rayon;

  // la distance de notre point du centre
  float distance = dist(point_x, point_y, cercle_x, cercle_y);

  //verifions si le point est sur ou en dehors du cercle
  if( distance >= (cercle_r-5) )
  {
    // l'angle du bord du cercle
    float angle_cercle = degrees(atan2( point_y-cercle_x , point_x-cercle_y));

    // remettre le cercle sur le bord pour ne pas sortir du rayon
    // sans cette fonction la balle peut sortir de temps en temps
    // ce caclul est totalement artificiel (ou en tout cas pas trs mathŽmatique)
    // et en plus *0.308 a ŽtŽ calculŽ par tatonnement en essayant plusieurs valeurs
    point_x = cercle_x + cos(radians(angle_cercle)) * PI * (cercle_r*0.308);
    point_y = cercle_y + sin(radians(angle_cercle)) * PI * (cercle_r*0.308);

    // calculer le rebond suivant la formule suivant:
    // nouvelle_angle = (2 * l'angle du bord) - angle_actuel
    angle = ((angle_cercle * 2) - angle) + 180;

    // rester ˆ l'intŽrieur de 0-360
    angle %= 360; 

  }

  // ralentir un peu

  //fin du dŽplacement
  //on dessine le point




  fill(0,0,0,40);
          ellipse (point_x,point_y,5,5);

        }

}
