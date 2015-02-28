
Objet objet;

Objet objet1;
Objet objet2;
Objet objet3;

void setup() {
  size(300, 400);

  PVector pos = new PVector(50, height-200); 
  PVector pos2 = new PVector(118, height-150); 
  PVector pos3 = new PVector(190, height-100); 
  PVector pos4 = new PVector(253, height-50); 
  PVector vel = new PVector(0, 0);
  PVector acc =new PVector(0, 1);
  objet = new Objet(pos, vel, acc, 1.5);
  objet1 = new Objet(pos2, vel, acc, 1.5);
  objet2 = new Objet(pos3, vel, acc, 1.5);
  objet3 = new Objet(pos4, vel, acc, 1.5);
}

void draw() {
  background(0);

  PVector gravite = new PVector(0, 0); 
  objet.appliqueForce(gravite);
  PVector vent = new PVector (0, 0);
  objet.appliqueForce(vent);


  fill(255, 80);
  rect(280, 0, 20, height);//Barreaux
  rect(142, 0, 20, height);//
  rect(70, 0, 20, height);//
  rect(212, 0, 20, height);//
  rect(0, 0, 20, height);//
  rect(0, 280, 20, width);// Bordure gauche
  rect(0, 150, 20, width);//
  rect(0, 75, 20, width);//
  rect(0, 225, 20, width);//
  rect(280, 280, 20, width);// Bordure droit
  rect(280, 150, 20, width);//
  rect(280, 75, 20, width);//
  rect(280, 225, 20, width);//
  objet.update();
  objet.draw();
  objet1.draw();
  objet2.draw();
  objet3.draw();
  
    
}


