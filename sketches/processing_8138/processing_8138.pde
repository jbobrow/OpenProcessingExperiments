
/*sorte de croix dépendant de l'emplacement de la souris
laissez cliquer votre souris et la structure clignote*/

void setup() {
  size (500, 500);
  background(0);
  smooth();
  strokeWeight(0.1);

}


void draw() {
   
  //couleur définie aléatoiremment
  stroke(random(0, 255),30);
  
  //déclaration de variable 
  float a = mouseX/5;
 
 if (mousePressed == true) { 


  //lignes dont le deuxième point dépend de l'emplacement de la souris
  line(50, 0, mouseX, mouseY-a);
  line(100, 0, mouseX, mouseY-a);
  line(150, 0, mouseX, mouseY-a);
  line(200, 0, mouseX, mouseY-a);
  line(250, 0, mouseX, mouseY-a);
  line(300, 0, mouseX, mouseY-a);
  line(350, 0, mouseX, mouseY-a);
  line(400, 0, mouseX, mouseY-a);
  line(450, 0, mouseX, mouseY-a);
  
  line(50, 500, mouseX, mouseY+a);
  line(100, 500, mouseX, mouseY+a);
  line(150, 500, mouseX, mouseY+a);
  line(200, 500, mouseX, mouseY+a);
  line(250, 500, mouseX, mouseY+a);
  line(300, 500, mouseX, mouseY+a);
  line(350, 500, mouseX, mouseY+a);
  line(400, 500, mouseX, mouseY+a);
  line(450, 500, mouseX, mouseY+a);
  
  line(0, 50, mouseX-a, mouseY);
  line(0, 100, mouseX-a, mouseY);
  line(0, 150, mouseX-a, mouseY);
  line(0, 200, mouseX-a, mouseY);
  line(0, 250, mouseX-a, mouseY);
  line(0, 300, mouseX-a, mouseY);
  line(0, 350, mouseX-a, mouseY);
  line(0, 400, mouseX-a, mouseY);
  line(0, 450, mouseX-a, mouseY);
  
  line(500, 50, mouseX+a, mouseY);
  line(500, 100, mouseX+a, mouseY);
  line(500, 150, mouseX+a, mouseY);
  line(500, 200, mouseX+a, mouseY);
  line(500, 250, mouseX+a, mouseY);
  line(500, 300, mouseX+a, mouseY);
  line(500, 350, mouseX+a, mouseY);
  line(500, 400, mouseX+a, mouseY);
  line(500, 450, mouseX+a, mouseY);
};

 /* On capture ce qui est à l'écran et puis efface en remplissant avec du blanc. 
 Les captures sont dans le dossier du sketch. */ 
 
  if (keyPressed == true) { 

  saveFrame();
  background(0); 
  
};
}

