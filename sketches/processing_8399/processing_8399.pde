
/*Petit moucheron amoureux de votre curseur,
ou comment programmer un mini comportement avec juste deux lignes*/

void setup() {
  size (500, 500);
  background(255);
  smooth();
  //ralentit la lecture des boucles comme void draw
  frameRate(10);
}


void draw() {
   background(255);
   
  //un random choisi
  float a = random(10, 50);
  //random servant pour les poignets
  float a1 = mouseX-a;
  float a2 = mouseX+a;
  //random servant pour les phalanges
  float r1 = random(a1-20, a1);
  float r2 = random(a2, a2+20);
  
  stroke(0);
  
  //main gauche
  line(mouseX-a, mouseY+100, r1, mouseY+50);
  line(mouseX-a, mouseY+100, r1+10, mouseY+50);
  line(mouseX-a, mouseY+100, r1+20, mouseY+50);
  
  line(r1, mouseY+50, mouseX-25, random(mouseY+15, mouseY+30));
  line(r1+10, mouseY+50, mouseX-20, random(mouseY+15, mouseY+30));
  line(r1+20, mouseY+50, mouseX-15, random(mouseY+15, mouseY+30));
 
  
  //main droite
  line(mouseX+a, mouseY+100, r2, mouseY+50);
  line(mouseX+a, mouseY+100, r2+10, mouseY+50);
  line(mouseX+a, mouseY+100, r2+20, mouseY+50);
  
  line(r2, mouseY+50, mouseX+15, random(mouseY+15, mouseY+30));
  line(r2+10, mouseY+50, mouseX+20, random(mouseY+15, mouseY+30));
  line(r2+20, mouseY+50, mouseX+25, random(mouseY+15, mouseY+30));
  
  
  
  //bras
  line(200, 300, mouseX-a, mouseY+100);
  line(300, 300, mouseX+a, mouseY+100);
  
  //corps
  fill(0);
  //création d'un rectangle(x, y, largeur, hauteur)  
  rect(200, 300, 100, 50);
  
  //yeux
  fill(255);
  rect(225, 310, 10, 15);
  rect(270, 310, 10, 15);
  
  //pupilles
  fill(0);
  rect(225+mouseX/50, 310+mouseY/50, 2, 2);
  rect(270+mouseX/50, 310+mouseY/50, 2, 2);
  
  //dents
  stroke(255);
  line(205, 332, 295, 332);
  line(205, 332+mouseY/70, 295, 332+mouseY/70);

  //pieds
  noStroke();
  fill(0);
  rect(200, 355, 2, 10);
  rect(298, 355, 2, 10);
  

 /* On capture ce qui est à l'écran 
 Les captures sont dans le dossier du sketch.*/
 
  if (keyPressed == true) { 
  
  saveFrame();
};
}

