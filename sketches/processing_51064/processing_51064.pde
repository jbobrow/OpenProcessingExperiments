
/*--------------------------------------------------------------------------------
 Monstre
 Par Gabrielle Demers
 ----------------------------------------------------------------------------------*/

// Variables pour la position
float x;
float y;

// Configurer la scène
size(400, 400);
smooth();

// Placer au centre de la scene
x = width/2;
y = height/2;

// Arrière plan
background(230);

// Boucle While, donner la valeur 0 à la variable
int i = 0;
// faire la boucle des tâches pendant que i est plus petit que 256
while(i<256){
// dessin avec la variable pour le dégradé
stroke(i);
// définir la position des lignes
line(i, i, i, 400);
line(i, 1, i, 400);

line(1, i, 400, i);

// incrémenter la boucle
i++;
}

//veston
//base
fill(0);
rectMode(CENTER);
//la taille du veston est propotionnelle a la scene
float largeurVeston = x-50;
float hauteurVeston = y;
rect(x, y+125, largeurVeston, hauteurVeston); 



//collet 
strokeWeight(2);
stroke(255);
//en haut à gauche
triangle( x-10, y+25, x-55, y+75, x-20, y+75);
//en haut à droite
triangle( x+10, y+25, x+50, y+75, x+20, y+75);
//en bas à gauche
triangle( x-20, y+75, x, y+125, x-45, y+90);
//en bas à droite
triangle (x+20, y+75, x+45, y+90, x, y+125);



//couture
line( x, y+125, x, y*2);

//boutons
float diametreBouton = x-195;
//bouton en haut à gauche
ellipse (x-20, y+150, diametreBouton, diametreBouton);
//bouton en haut à droite
ellipse( x+20, y+150, diametreBouton, diametreBouton);
//bouton en bas à gauche
ellipse(x-20, y+170, diametreBouton, diametreBouton);
//bouton en bas à droite
ellipse(x+20, y+170, diametreBouton, diametreBouton);

//poche
float largeurPoche = x/8;
float hauteurPoche = 3;
rect( x+55, y+120, largeurPoche, hauteurPoche);



//mouchoir
fill(200);
//mouchoir arrière
triangle(x+52, y+103, x+63, y+115, x+46, y+115);
//mouchoir avant
triangle(x+60, y+105, x+63, y+115, x+50, y+115); 

//cou
float largeurCou = x-170;
float hauteurCou = 7;
rect(x, y+22, largeurCou, hauteurCou);

//télévision
fill(80);
//base
float largeurBase = 115;
float hauteurBase = 8;
rect(x, y+13, largeurBase, hauteurBase);
//boite
float largeurBoite = x;
float hauteurBoite = y-50;
rect(x, y-67, largeurBoite, hauteurBoite);
line(255, 190, 255, 80);

//boutons télé
float diametreBoutontv = 31;
ellipse(277, 95, diametreBoutontv, diametreBoutontv);
ellipse(277, 136, diametreBoutontv, diametreBoutontv);

float largeurBouton = x/8;
float hauteurBouton = 3;
rect(278, 165, largeurBouton, hauteurBouton); 
rect(278, 170, largeurBouton, hauteurBouton);
rect(278, 175, largeurBouton, hauteurBouton);
rect(278, 180, largeurBouton, hauteurBouton);

fill(250);
pushMatrix(); // sauvegarder la matrice de transformation
translate(545, 6); // deplacer la forme a dessiner
rotate(90); // effectuer la rotation
translate(x, y); // deplacer l'axe de rotation
rectMode(CENTER);
rect(0, 0, 20, 5); // dessiner la forme
popMatrix(); // restaurer la matrice de transformation

pushMatrix(); // sauvegarder la matrice de transformation
translate(195, -135); // deplacer la forme a dessiner
rotate(145); // effectuer la rotation
translate(x, y); // deplacer l'axe de rotation
rectMode(CENTER);
rect(0, 0, 20, 5); // dessiner la forme
popMatrix(); // restaurer la matrice de transformation

// écran télé
strokeWeight(30);
strokeJoin(ROUND);
rect(180, 133, 105, 88);

//colorbar télé

//barres couleurs premiere rangée à partir du haut
noStroke();
float largeurBarre = x-170;
float hauteurBarre = y-140;
fill(240, 233, 17);
rect(128, 114, largeurBarre, hauteurBarre);
fill(17, 240, 223);
rect(158, 114, largeurBarre, hauteurBarre);
fill(27, 240, 17);
rect(188, 114, largeurBarre, hauteurBarre);
fill(240, 17, 210);
rect(218, 114, largeurBarre, hauteurBarre); 
fill(240, 17, 17);
rect(240, 114, largeurBarre - 15, hauteurBarre);

//barres couleurs deuxieme rangée à partir du haut
fill(0);
rect(128, 150, largeurBarre, hauteurBarre-48);
fill(240, 17, 210);
rect( 158, 150, largeurBarre, hauteurBarre-48);
fill(0);
rect(188, 150, largeurBarre, hauteurBarre-48);
fill(17, 240, 234);
rect(218, 150, largeurBarre, hauteurBarre-48); 
fill(0);
rect(240, 150, largeurBarre - 15, hauteurBarre-48);

//barres couleurs troisieme rangée à partir du haut
fill(27, 24, 131);
rect(130, 169, largeurBarre+5, hauteurBarre-33);
fill(240);
rect(165, 169, largeurBarre+5, hauteurBarre-33);
fill(98, 56, 155);
rect(200, 169, largeurBarre+5, hauteurBarre-33);
fill(50);
rect(232, 169, largeurBarre+2, hauteurBarre-33);

//antennes
strokeWeight(3);
stroke(0);
line(x+35, y-144, x+80, y-187);
ellipse(280, 13, 6, 6);
line(x+35, y-144, x+20, y-180);
ellipse(x+20, y-180, 6, 6); 

// Et Voilà Monsieur Cathodique!!!







