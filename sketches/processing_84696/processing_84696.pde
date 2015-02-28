
 //déclinaison de triangles et cercles, orientation et largeur de traits
size(400,600);
background(255);
 
 //FIGURES LIGNE DU HAUT
 //6 variables pour garder tjrs la mm taille de triangle
int TpointUnX;
TpointUnX = 30;
int TpointUnY;
TpointUnY = 75;
int TpointDeuxX;
TpointDeuxX = 58;
int TpointDeuxY;
TpointDeuxY = 20;
int TpointTroisX;
TpointTroisX = 86;
int TpointTroisY;
TpointTroisY = 75;

 //PREMIER GROUPE FIGURE
 //premier triangle
stroke(0);
noFill();
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(5); 
line(TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 //deuxième
stroke(0);
noFill();
strokeWeight(1); 
TpointUnX = TpointUnX+30;
TpointUnY = TpointUnY+30;
TpointDeuxX = TpointDeuxX+30;
TpointDeuxY = TpointDeuxY+30;
TpointTroisX = TpointTroisX+30;
TpointTroisY = TpointTroisY+30;
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(2); 
line(TpointUnX,TpointUnY,TpointTroisX,TpointTroisY);

 // troisième
stroke(0);
noFill();
strokeWeight(1); 
TpointUnX = TpointUnX+30;
TpointUnY = TpointUnY-30;
TpointDeuxX = TpointDeuxX+30;
TpointDeuxY = 20;
TpointTroisX = TpointTroisX+30;
TpointTroisY = 75;
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(5); 
line(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY);


 //DEUXIEME GROUPE FIGURE 
 //(nouvelles mesures des vairables de bases)
TpointUnX = 150;
TpointUnY = 75;
TpointDeuxX = 178;
TpointDeuxY = 20;
TpointTroisX = 206;
TpointTroisY = 75;

 //premier triangle- largeur base
stroke(0);
noFill();
strokeWeight(1); 
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(3); 
line(TpointUnX,TpointUnY,TpointTroisX,TpointTroisY);

 //deuxième- largeur deux côtés
stroke(0);
noFill();
strokeWeight(1); 
TpointUnX = TpointUnX+30;
TpointUnY = TpointUnY+30;
TpointDeuxX = TpointDeuxX+30;
TpointDeuxY = TpointDeuxY+30;
TpointTroisX = TpointTroisX+30;
TpointTroisY = TpointTroisY+30;
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(8); 
line(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY);
line(TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 // troisième- largeur base
stroke(0);
noFill();
strokeWeight(1); 
TpointUnX = TpointUnX+30;
TpointUnY = TpointUnY-30;
TpointDeuxX = TpointDeuxX+30;
TpointDeuxY = 20;
TpointTroisX = TpointTroisX+30;
TpointTroisY = 75;
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(3); 
line(TpointUnX,TpointUnY,TpointTroisX,TpointTroisY);

 //TROISIEME GROUPE FIGURE  
 //(nouvelles meusres des vairables de bases)
TpointUnX = 270;
TpointUnY = 75;
TpointDeuxX = 298;
TpointDeuxY = 20;
TpointTroisX = 326;
TpointTroisY = 75;

 //premier triangle
stroke(0);
noFill();
strokeWeight(1); 
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(4); 
line(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY);

 //deuxième triangle
stroke(0);
noFill();
strokeWeight(1); 
TpointUnX = TpointUnX+30;
TpointUnY = TpointUnY+30;
TpointDeuxX = TpointDeuxX+30;
TpointDeuxY = TpointDeuxY+30;
TpointTroisX = TpointTroisX+30;
TpointTroisY = TpointTroisY+30;
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(4); 
line(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY);
line(TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
line(TpointUnX,TpointUnY,TpointTroisX,TpointTroisY);

 // troisième triangle
stroke(0);
noFill();
strokeWeight(1); 
TpointUnX = TpointUnX+30;
TpointUnY = TpointUnY-30;
TpointDeuxX = TpointDeuxX+30;
TpointDeuxY = 20;
TpointTroisX = TpointTroisX+30;
TpointTroisY = 75;
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(4); 
line(TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 //FIGURES DEUXIEME LIGNE 
 //6 nouvelles variables 
TpointUnX = 30;
TpointUnY = 195;
TpointDeuxX = 58;
TpointDeuxY = 140;
TpointTroisX = 86;
TpointTroisY = 195;

 //PRMEMIER GROUPE FIGURE DROIT
 //line= relie les deux triangles
strokeWeight(4);
line(58,140,114,140); 
 //premier triangle
stroke(0);
noFill();
strokeWeight(1); 
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(4);
line(TpointUnX,TpointUnY,TpointTroisX,TpointTroisY);

 // deuxième triangle
 TpointUnX =TpointUnX+56;
TpointDeuxX = TpointDeuxX+56;
TpointTroisX = TpointTroisX+56;
stroke(0);
noFill();
strokeWeight(1); 
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(4);
line(TpointUnX,TpointUnY,TpointTroisX,TpointTroisY);

 //DEUXIEME GROUPE DE FIGURES
 //line= relie les deux triangles
strokeWeight(1);
line(174,140,230,140);
 // nouvelles mesures des vairables de bases
TpointUnX = 146;
TpointUnY = 195;
TpointDeuxX = 174;
TpointDeuxY = 140;
TpointTroisX = 202;
TpointTroisY = 195;

 // premier triangle 
stroke(0);
noFill();
strokeWeight(1); 
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(4);
line(TpointUnX,TpointUnY,TpointTroisX,TpointTroisY);
line(TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 // deuxième triangle
TpointUnX =TpointUnX+56;
TpointDeuxX = TpointDeuxX+56;
TpointTroisX = TpointTroisX+56;
stroke(0);
noFill();
strokeWeight(1); 
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY); 
strokeWeight(4);
line(TpointUnX,TpointUnY,TpointTroisX,TpointTroisY);
line(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY);

 // TROISIEME GROUPE FIGURE GAUCHE
  //line= relie les deux triangles
strokeWeight(1);
line(290,140,345,140);
 // nouvelles mesures des vairables de bases
TpointUnX = 262;
TpointUnY = 195;
TpointDeuxX = 290;
TpointDeuxY = 140;
TpointTroisX = 318;
TpointTroisY = 195;
 
 //premier triangle
stroke(0);
noFill();
strokeWeight(1); 
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY); 
strokeWeight(4);
line(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY);
line(TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY); 

 // deuxième triangle
TpointUnX =TpointUnX+56;
TpointDeuxX = TpointDeuxX+56;
TpointTroisX = TpointTroisX+56;
stroke(0);
noFill();
strokeWeight(1); 
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY); 
strokeWeight(4);
line(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY);
line(TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY); 

 // FIGURES TROISIEME LIGNE INTRODUCTION DE CERCLE
 //PREMIER GROUPE DE FIGURE
  // nouvelles variables
TpointUnX = 30;
TpointUnY = 245;
TpointDeuxX = 58;
TpointDeuxY = 295;
TpointTroisX = 86;
TpointTroisY = 245;
 // premier triangle
stroke(0);
noFill();
strokeWeight(1); 
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY); 

 // deuxième triangle
 TpointUnX = TpointUnX+20;
TpointDeuxX = TpointDeuxX+20;
TpointTroisX = TpointTroisX+20;
stroke(0);
noFill();
strokeWeight(1); 
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(3); 
line(50,245,68,278);
line(106,245,88,278);
strokeWeight(7);
ellipse(TpointDeuxX,TpointDeuxY,20,20);

 // troisième triangle
 TpointUnX = TpointUnX+20;
TpointDeuxX = TpointDeuxX+20;
TpointTroisX = TpointTroisX+20;
stroke(0);
noFill();
strokeWeight(1); 
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 // DEUXIEME GROUPE FIGURE
 // nouvelles variables
TpointUnX = 150;
TpointUnY = 245;
TpointDeuxX = 178;
TpointDeuxY = 295;
TpointTroisX = 206;
TpointTroisY = 245;

 //premier triangle
stroke(0);
noFill();
strokeWeight(1); 
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 //deuxième triangle
TpointUnX = TpointUnX+20;
TpointDeuxX = TpointDeuxX+20;
TpointTroisX = TpointTroisX+20;
stroke(0);
noFill(); 
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(2);
ellipse(TpointDeuxX,TpointDeuxY,50,50);

 //troisième triangle
TpointUnX = TpointUnX+20;
TpointDeuxX = TpointDeuxX+20;
TpointTroisX = TpointTroisX+20;
stroke(0);
noFill(); 
strokeWeight(1);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 // TROISIEME GROUPE FIGURE
 // nouvelles variables
TpointUnX = 270;
TpointUnY = 245;
TpointDeuxX = 298;
TpointDeuxY = 295;
TpointTroisX = 326;
TpointTroisY = 245;

 //premier triangle
stroke(0);
noFill(); 
strokeWeight(1);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(2);
ellipse(TpointTroisX,TpointTroisY,15,15);

 // deuxième triangle
TpointUnX = TpointUnX+20;
TpointDeuxX = TpointDeuxX+20;
TpointTroisX = TpointTroisX+20;
stroke(0);
noFill(); 
strokeWeight(2);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(1);
ellipse(TpointDeuxX,TpointDeuxY,20,20);

 //troisième triangle
TpointUnX = TpointUnX+20;
TpointDeuxX = TpointDeuxX+20;
TpointTroisX = TpointTroisX+20;
stroke(0);
noFill(); 
strokeWeight(1);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(2);
ellipse(TpointUnX,TpointUnY,15,15);

 // QUATRIEME LIGNE DE FIGURE
 // 6 nouvelles variables
TpointUnX = 30;
TpointUnY = 355;
TpointDeuxX = 58;
TpointDeuxY = 405;
TpointTroisX = 86;
TpointTroisY = 355;

 //PREMIER GROUPE DE FIGURE
 //premier triangle
TpointUnX = TpointUnX+20;
TpointDeuxX = TpointDeuxX+20;
TpointTroisX = TpointTroisX+20;
stroke(0);
noFill(); 
strokeWeight(1);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 //deuxième triangle
stroke(0);
TpointUnX = TpointUnX-20;
TpointDeuxX = TpointDeuxX-20;
TpointTroisX = TpointTroisX-20;
TpointUnY = TpointUnY+20;
TpointDeuxY = TpointDeuxY+20;
TpointTroisY = TpointTroisY+20;
noFill(); 
strokeWeight(1);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 //troisième triangle
TpointUnX = TpointUnX+40;
TpointDeuxX = TpointDeuxX+40;
TpointTroisX = TpointTroisX+40;
noFill(); 
strokeWeight(1);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

//premier cercle
TpointDeuxX = TpointDeuxX-20;
TpointDeuxY = TpointDeuxY-50;
stroke(0);
noFill(); 
strokeWeight(5);
ellipse(TpointDeuxX,TpointDeuxY,40,40);

 //DEUXIEME GROUPE DE FIGURE
 // nouvelles variables
TpointUnX = 150;
TpointUnY = 355;
TpointDeuxX = 178;
TpointDeuxY = 405;
TpointTroisX = 206;
TpointTroisY = 355;

 //premier triangle
TpointUnX = TpointUnX+20;
TpointDeuxX = TpointDeuxX+20;
TpointTroisX = TpointTroisX+20;
stroke(0);
noFill(); 
strokeWeight(1);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 //deuxième triangle
stroke(0);
TpointUnX = TpointUnX-20;
TpointDeuxX = TpointDeuxX-20;
TpointTroisX = TpointTroisX-20;
TpointUnY = TpointUnY+20;
TpointDeuxY = TpointDeuxY+20;
TpointTroisY = TpointTroisY+20;
noFill(); 
strokeWeight(1);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 //troisième triangle
TpointUnX = TpointUnX+40;
TpointDeuxX = TpointDeuxX+40;
TpointTroisX = TpointTroisX+40;
noFill(); 
strokeWeight(1);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 //premier cercle
TpointTroisX = TpointTroisX-30;
strokeWeight(3);
ellipse(TpointTroisX,TpointTroisY,30,30);

 //deuxième cercle 
TpointTroisX = TpointTroisX-35;
strokeWeight(3);
ellipse(TpointTroisX,TpointTroisY,30,30);

 //troisième cercle
TpointTroisY = TpointTroisY-20;
TpointTroisX = TpointTroisX+18;
strokeWeight(6);
ellipse(TpointTroisX,TpointTroisY,15,15);

 //TROISIEME GROUPE DE FIGURE
 // nouvelles variables
TpointUnX = 290;
TpointUnY = 355;
TpointDeuxX = 318;
TpointDeuxY = 405;
TpointTroisX = 346;
TpointTroisY = 355;

 //premier triangle
strokeWeight(1);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
 
  //deuxième triangle
stroke(0);
TpointUnX = TpointUnX-20;
TpointDeuxX = TpointDeuxX-20;
TpointTroisX = TpointTroisX-20;
TpointUnY = TpointUnY+20;
TpointDeuxY = TpointDeuxY+20;
TpointTroisY = TpointTroisY+20;
noFill(); 
strokeWeight(1);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 //troisième triangle
TpointUnX = TpointUnX+40;
TpointDeuxX = TpointDeuxX+40;
TpointTroisX = TpointTroisX+40;
noFill(); 
strokeWeight(1);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

//premier cercle
TpointDeuxX = TpointDeuxX-20;
TpointDeuxY = TpointDeuxY-50;
stroke(0);
noFill(); 
strokeWeight(3);
ellipse(TpointDeuxX,TpointDeuxY,40,40);

//deuxième cercle
strokeWeight(8);
ellipse(TpointDeuxX,TpointDeuxY,20,20);

 //CINQUIEME LIGNE DE FIGURE
 // 6 nouvelles variables
TpointUnX = 30;
TpointUnY = 485;
TpointDeuxX = 58;
TpointDeuxY = 535;
TpointTroisX = 86;
TpointTroisY = 485;

 // PREMIER GROUPE DE FIGURE
 // premier triangle
strokeWeight(1);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 // premier cercle
strokeWeight(8);
ellipse(TpointDeuxX,TpointDeuxY,30,30);
 
 //deuxième cercle
strokeWeight(2);
ellipse(TpointDeuxX,TpointDeuxY,15,15);
 
 //deuxième triangle 
TpointUnX = TpointUnX+56;
TpointTroisX = TpointTroisX+28;
TpointTroisY = TpointTroisY+50;
strokeWeight(2);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 //troisième cercle
strokeWeight(8);
ellipse(TpointUnX,TpointUnY,15,15);
 
 //quatrième cercle
strokeWeight(1);
ellipse(TpointUnX,TpointUnY,30,30);
 
 // DEUXIEME GROUPE DE FIGURE
 // premier triangle 
TpointUnX = 150;
TpointDeuxX = 178;
TpointTroisX = 206;
TpointTroisY = 485;
strokeWeight(2);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 //deuxième triangle
TpointUnX = TpointUnX+56;
TpointTroisX = TpointTroisX+28;
TpointTroisY = TpointTroisY+50;
strokeWeight(1);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);

 //premier cercle
strokeWeight(3);
ellipse(206,515,50,50);

 //deuxième cercle
strokeWeight(5);
ellipse(206,515,30,30);

 //troisième cercke
strokeWeight(2);
ellipse(206,515,20,20);

 //TROISIEME GROUPE DE FIGURE
 //premier triangle
TpointUnX = 270;
TpointDeuxX = 298;
TpointTroisX = 326;
TpointTroisY = 485;
strokeWeight(1);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
 
 //deuxième triangle
TpointUnX = TpointUnX+56;
TpointTroisX = TpointTroisX+28;
TpointTroisY = TpointTroisY+50;
strokeWeight(1);
triangle(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY,TpointTroisX,TpointTroisY);
strokeWeight(6);
line(TpointUnX,TpointUnY,TpointDeuxX,TpointDeuxY);

 //premier cercle
strokeWeight(3);
ellipse(280,515,20,20);

 //deuxième cercle
ellipse(285,515,20,20);

 //troisième cercle
ellipse(340,510,20,20);

 //quatrième cercle
ellipse(335,510,20,20);


