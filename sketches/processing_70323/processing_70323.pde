

// Variable de position
int x =230;
int y =150;

int etatcoup;
final int DESCEND = 0;
final int MONTE = 1;


float rad;
float vitessecoup;
float mainX;
float mainY;

//Couleur des yeux
int etatYeux;


void setup() {
  // Configuration du cadre
  size ( 400, 400 );
  smooth ();

  background ( 125, 125, 125 );
}



void draw() {
  background(125, 125, 125);

  //coup du monde
  strokeWeight (4);
  fill ( 255 );
  rect ( x-5, y+65, 10, 10 );
  rect ( x-5, y+55, 10, 10);

  // tête du monstre
  strokeWeight ( 3 );
  stroke ( 255 );
  fill ( 255 );
  ellipse ( x, y-20, 95, 95 );
  ellipse ( x, y, 75, 110);

  // yeux du monstre  
  if (etatYeux ==1) {
    fill ( 154, 4, 4 );

    //dessine sourcils
    stroke(105, 10, 10);
    line(x-10+random(-3, 3), y-40+random(-3, 3), x-30, y-45);
    line(x+10+random(-3, 3), y-40+random(-3, 3), x+30, y-45);
  }
  else {
    fill ( 0 );
  }
  ellipse ( x-20, y-22, 25, 25 );
  ellipse ( x+20, y-22, 25, 25 );
  stroke (214, 6, 6);
  fill (214, 6, 6);

  //Pupille de gauche
  float pupilleGaucheX = x-20;  
  float pupilleGaucheY = y-22;

  float anglePupille = atan2(mouseY-pupilleGaucheY, mouseX-pupilleGaucheX);
  float distance = dist(mouseX, mouseY, pupilleGaucheX, pupilleGaucheY);
  distance = constrain(distance, 0, 5);
  pupilleGaucheX = pupilleGaucheX + cos(anglePupille) * distance;
  pupilleGaucheY = pupilleGaucheY + sin(anglePupille) * distance;

  ellipse ( pupilleGaucheX, pupilleGaucheY, 10, 10 );
  fill ( 0 );
  ellipse ( pupilleGaucheX, pupilleGaucheY, 5, 5 );  

  //Pupille de droite
  float pupilleDroiteX = x+20;  
  float pupilleDroiteY = y-22;

  anglePupille = atan2(mouseY-pupilleDroiteY, mouseX-pupilleDroiteX);
  distance = dist(mouseX, mouseY, pupilleDroiteX, pupilleDroiteY);
  distance = constrain(distance, 0, 5);
  pupilleDroiteX = pupilleDroiteX + cos(anglePupille) * distance;
  pupilleDroiteY = pupilleDroiteY + sin(anglePupille) * distance;

  fill (214, 6, 6);
  ellipse ( pupilleDroiteX, pupilleDroiteY, 10, 10 );
  fill ( 0 );
  ellipse ( pupilleDroiteX, pupilleDroiteY, 5, 5 );  


  // nez du monstre
  strokeJoin ( ROUND );
  stroke ( 0 );
  fill ( 0 );
  triangle ( x, y-5, x-5, y+10, x+5, y+10 );

  //bouche du monstre
  strokeWeight ( 4 );
  line (x-20, y+25, x+20, y+25);
  int i =0;
  while (i< 4) {
    int espacement = 10*i;
    line( x-15+ espacement, y+30, x-15+ espacement, y+20);
    i++ ;
  }





  //bras gauche du monstre  
  fill ( 255 );
  noStroke ( );
  //quad (x-58, y+75, x-40, y+ 100, x-110, y+120, x-110, y+90);
  //quad ( x-100, y+90, x-110, y+120, x-140, y+120, x-140, y+90 );
  strokeWeight(27);
  stroke(255);  
  line(x-90, y+88, x, y+88);       //bicep

  //---------------------------------  
  //partie animé du bras

  //Si clic sur avant-bras
  if (mousePressed == true)
  {
    if (mouseX > x-100 &&     //rect(x-100, y+15, 20,70); rectangle de l'avant bras
    mouseX < x-100+20 &&
      mouseY > y+15 &&
      mouseY < y+15+70) 
    {
      etatcoup=1;
    }
  }else{
    etatcoup=0;
  } 

  pushMatrix();  //Push matrix pour effectuer rotation
  translate(x-90, y+88); //axe de rotation est le coude
  if (etatcoup == 1)
  { 
    rad-=0.01 + vitessecoup;
    vitessecoup += 0.01;
    if (rad < -HALF_PI)
    {
      rad=0;
      etatcoup=0;
      vitessecoup=0;
    }
    rad = constrain(rad, -PI+HALF_PI, PI+HALF_PI);
    rotate(rad);

  }

  strokeWeight(2);
  rect(-10, -65, 20, 70);
  //line(x-100, y+88, x-100, y+25);       //avant bras

  //couteau du monstre
  noStroke ();
  fill ( 134, 79, 37 );
  rect ( -45, -80, 45, 10 );
  fill ( 188, 187, 186 );
  triangle ( -110, -85, -30, -85, -30, -60 );
  fill ( 147, 146, 145 );
  stroke ( 2);
  strokeWeight(4);
  line(  -110, -85, -30, -60 );

  // main gauche
  fill ( 0 );
  ellipse ( 0, -75, 40, 30 );

  popMatrix();  //Pop matrix pour fin de la rotation;
  //---------------------------------
  //fin partie animé du bras

  //chemise du monstre
  fill ( 255 );
  noStroke ();
  rect ( x-57, y+75, 115, 125 );

  //bras droite
  fill ( 255 );
  noStroke ( );
  ellipse ( x+60, y+89, 35, 30 );
  quad ( x+50, y+78, x+75, y+80, x+88, y+120, x+63, y+120 );
  rect ( x+63, y+120, 25, 60 );
  fill ( 0 );
  ellipse ( x+74, y+185, 35, 30 );



  //poche de la chemisse
  noFill ();
  stroke ( 2);
  beginShape ( );
  vertex ( x+20, y+100 );
  vertex (x+40, y+100 );
  vertex (x+40, y+125 );
  vertex (x+30, y+130 );
  vertex (x+20, y+125 );
  vertex (x+20, y+100 );
  endShape ();

  //ceinture du monstre
  noStroke ( );
  fill ( 214, 6, 6 );
  rect ( x-57, y+200, 114, 10);
  fill ( 0);
  ellipse (x, y+205, 15, 15 );

  //Pentalon du monstre
  noStroke ();
  fill (26, 6, 214 );
  rect( x-57, y+210, 57, 60 );
  fill ( 26, 6, 214 );
  rect( x, y+210, 57, 60 );
  stroke ( 4 );
  line ( x, y+210, x, y+250 );


  //cravate du monstre
  fill ( 168, 6, 214 );
  noStroke ();
  beginShape ();
  vertex (x-2, y+75 );
  vertex (x-10, y+190 );
  vertex (x, y+210);
  vertex (x+10, y+190);
  vertex (x+2, y+75 );
  endShape ();
  triangle ( x-17, y+76, x+17, y+76, x, y+86 );

  //Noeud papillon du monstre
  fill ( 214, 6, 6 );
  triangle ( x, y+75, x-30, y+65, x-30, y+85 );
  triangle ( x, y+75, x+30, y+65, x+30, y+85 );
}


void mousePressed()
{
  //SI on clique sur oeil gauche ou droit, on change etat
  if (dist(mouseX, mouseY, x-20, y-22) < 12 ||
    dist(mouseX, mouseY, x+20, y-22) < 12)
  {
    if (etatYeux ==0)
    {
      etatYeux=1;
    }
    else
    {
      etatYeux=0;
    }
  }
}


