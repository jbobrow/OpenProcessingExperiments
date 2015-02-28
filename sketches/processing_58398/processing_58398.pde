
//=========================================
void setupGUI() {
  //=========================================
  color activeColor = color(0, 130, 164);
  controlP5 = new ControlP5(this);
  //controlP5.setAutoDraw(false);
  controlP5.setColorActive(activeColor);
  controlP5.setColorBackground(color(170));
  controlP5.setColorForeground(color(50));
  controlP5.setColorLabel(color(50));
  controlP5.setColorValue(color(255));

  ControlGroup ctrl = controlP5.addGroup("menu", 15, 25, 35);
  ctrl.setColorLabel(color(255));
  ctrl.close();

  sliders = new Slider[10];

  int left = 0;
  int top = 5;
  int len = 300;

  int si = 0;
  int posY = 45;

  Toggle b1 = controlP5.addToggle("ShowLines", true, 10, 10, 20, 20);
  b1.setGroup(ctrl);

  Toggle b2 = controlP5.addToggle("ShowTriangles", true, 70, 10, 20, 20);
  b2.setGroup(ctrl);

  Toggle b3 = controlP5.addToggle("ShowParticles", true, 160, 10, 20, 20);
  b3.setGroup(ctrl);

  sliders[si++] = controlP5.addSlider("nombreParticles", 10, 500, 20, left, top+posY+0, len, 15);
  sliders[si++] = controlP5.addSlider("Vitesse", 5, 30, 5, left, top+posY+20, len, 15);
  posY += 40;

  sliders[si++] = controlP5.addSlider("Shadow", 10, 255, 255, left, top+posY+0, len, 15);
  posY += 30;

  sliders[si++] = controlP5.addSlider("DistanceLiaison", 0.5, 2, 2, 0, 110, 300, 15);


  for (int i = 0; i < si; i++) {
    sliders[i].setGroup(ctrl);
    sliders[i].captionLabel().toUpperCase(true);
    sliders[i].captionLabel().style().padding(4, 0, 1, 3);
    sliders[i].captionLabel().style().marginTop = -4;
    sliders[i].captionLabel().style().marginLeft = 0;
    sliders[i].captionLabel().style().marginRight = -14;
    sliders[i].captionLabel().setColorBackground(0x99ffffff);
  }
}
//=========================================
void drawGUI() {
  //=========================================
  controlP5.show();
  controlP5.draw();
}

//=========================================
void controlEvent(ControlEvent theEvent) {
  //=========================================
  if (theEvent.isController()) { 

    if (theEvent.controller().name()=="ShowLines") { //affichage ou non des traits 
      if (theEvent.controller().value() == 1.0)particles.traceTraits = true;
      else particles.traceTraits = false;
    }

    if (theEvent.controller().name()=="ShowTriangles") { //affichage ou non des triangles 
      if (theEvent.controller().value() == 1.0)particles.traceTriangles = true;
      else particles.traceTriangles = false;
      verifDistance(particles.nbParticle);
    }

    if (theEvent.controller().name()=="ShowParticles") { //affichage ou non des particules 
      if (theEvent.controller().value() == 1.0)particles.traceParticle = true;
      else particles.traceParticle = false;
    }

    if (theEvent.controller().name()=="nombreParticles") {  
      int val = (int)theEvent.controller().value();

      verifDistance(val);
      
      if (val > particles.nbParticle) {//on ajoute des particules 
        int ajout = val - particles.nbParticle;
        particles.addParticles(ajout);
      }
      else if (val < particles.nbParticle) {
        int soust = particles.nbParticle - val;
        particles.removeParticles(soust);
      }
    }

    if (theEvent.controller().name()=="Vitesse") { 
      particles.changeVit = true;
      particles.vitesse = theEvent.controller().value();
    }

    if (theEvent.controller().name()=="Shadow") {
      particles.shadowLevel = theEvent.controller().value();
    }

    if (theEvent.controller().name()=="DistanceLiaison") { 
      boxDist = theEvent.controller().value();
      int nbPart = particles.nbParticle;
      verifDistance(nbPart);
    }
  }
}

//=========================================
void verifDistance(int nbPart){
  //=========================================
  if (particles.traceTriangles) {
    //Verifier taille triangles / nombres de particules pour ne pas ralentir l'ordinateur
    if (nbPart<=70)particles.distPoint = boxDist;
    else if (nbPart>70 && nbPart <=130)particles.distPoint = boxDist * 0.8;
    else if (nbPart>130 && nbPart <=300)particles.distPoint = boxDist * 0.6;
    else particles.distPoint = boxDist * 0.4;
  }
  else particles.distPoint = boxDist;
}



