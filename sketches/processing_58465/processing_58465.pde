
void setupGUI(){
  color activeColor = color(0,130,164);
  controlP5 = new ControlP5(this);
  //controlP5.setAutoDraw(false);
  controlP5.setColorActive(activeColor);
  controlP5.setColorBackground(color(170));
  controlP5.setColorForeground(color(50));
  controlP5.setColorLabel(color(50));
  controlP5.setColorValue(color(255));

  ControlGroup ctrl = controlP5.addGroup("menu",15,25,35);
  ctrl.setColorLabel(color(255));
  ctrl.close();

  sliders = new Slider[10];

  int left = 0;
  int top = 5;
  int len = 300;

  int si = 0;
  int posY = 0;
  //changer nombre de tache
   sliders[si++] = controlP5.addSlider("nombre de Taches",1,100,left,top+posY+0,len,15);
  posY += 30;
//changer l'espacement entre les tache en largeur=donc la taille du pinceau
  sliders[si++] = controlP5.addSlider("Taille Pinceau",1,20,left,top+posY+0,len,15);
  
  posY += 30;
//changer l'epaisseur des taches, elle prennent d'autre valeur aléatoire
  sliders[si++] = controlP5.addSlider("Epaisseur Taches",0,15,left,top+posY+0,len,15);
  posY += 30;
// changer alpha des taches
  sliders[si++] = controlP5.addSlider("Transparence Taches",0,255,left,top+posY+0,len,15);
  
  //changer la couleur des taches
  sliders[si++] = controlP5.addSlider("rouge",0,255,left,top+posY+20,len,15);
  //changer la couleur des taches
  sliders[si++] = controlP5.addSlider("vert",0,255,left,top+posY+40,len,15);
  //changer la couleur des taches
  sliders[si++] = controlP5.addSlider("bleu",0,255,left,top+posY+60,len,15);
  
  
    for (int i = 0; i < si; i++) {
    sliders[i].setGroup(ctrl);
    sliders[i].captionLabel().toUpperCase(true);
    sliders[i].captionLabel().style().padding(4,0,1,3);
    sliders[i].captionLabel().style().marginTop = -4;
    sliders[i].captionLabel().style().marginLeft = 0;
    sliders[i].captionLabel().style().marginRight = -14;
    sliders[i].captionLabel().setColorBackground(0x99ffffff);
  }

}

void drawGUI(){
  controlP5.show();
  controlP5.draw();
}

