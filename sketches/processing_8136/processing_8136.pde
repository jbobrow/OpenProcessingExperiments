
//Petite bestiole amoureuse de votre curseur


void setup() {
  size (500, 500);
  background(255);
  smooth();
  //ralentit la lecture des boucles comme void draw
  frameRate(10);
}


void draw() {
  /*effet flou, un rectangle légèremnt transparent se surimprime 
  à chaque boucle draw*/
  fill(255, 250);
  rect(0, 0, 500, 500);
  
  /*Déclaration de variable, lorsqu'il y a un random dessus 
  cela permet d'utiliser la meme valeur aléatoire
  à deux endroits en meme temps. 
  (je peux ainsi donner le meme mouvement aux deux "ailes") */
  float x = random(mouseX-50, mouseX+5);
  float y = random(mouseY-50, mouseY+5);
 
  float a = random(y-100, y+100);


  strokeWeight(0.4);
 //aile gauche
 stroke(random(100, 200));
 line(x-100, a, x, y);
 
 line(x-100, a, x-20, a+2);
 line(x-20, a+2, x, y);
 
 line(x-100, a, x-70, a+30);
 line(x-70, a+30, x, y);
 
 stroke(random(50, 150));
 line(x-100, a, x-50, a+25);
 line(x-70, a+30, x-50, a+25);
 line(x-50, a+25, x, y);
 
 
 //aile droite
 stroke(random(100, 200));
 line(x, y, x+100, a);
 
 line(x, y, x+20, a+2);
 line(x+20, a+2, x+100, a);
 
 line(x, y, x+70, a+30);
 line(x+70, a+30, x+100, a);
 
 stroke(random(50, 150));
 line(x, y, x+50, a+25);
 line(x+50, a+25, x+70, a+30);
 line(x+50, a+25, x+100, a);
 
 
 strokeWeight(0.8);
 //corps
 stroke(0);
 line(x-5, y+9, x+5, y+10);
 line(x-6, y+14, x+3, y+15);
 line(x-7, y+19, x+1, y+20);
 line(x-8, y+24, x-1, y+25);
 line(x-9, y+29, x-3, y+30);
 line(x-10, y+34, x-5, y+35);
 line(x-11, y+39, x-7, y+40);
 line(x-12, y+44, x-9, y+45);
 line(x-13, y+49, x-11, y+50);
 line(x-14, y+54, x-13, y+55);
 

 

 /* On capture ce qui est à l'écran 
 Les captures sont dans le dossier du sketch.*/
 
  if (keyPressed == true) { 
  
  saveFrame();
};
}

