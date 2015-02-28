

void moveCircle(int i) {
    xcircles[i] += sXcircles[i];//applique la composante x de la vitesse
    if (xcircles[i]<0 || xcircles[i]>width) {//si sort par la gauche ou la droite
          sXcircles[i] = -sXcircles[i]; }  //inverser la composante x de la vitesse
     ycircles[i] += sYcircles[i];//applique la composante x de la vitesse
     if (ycircles[i]<0 || ycircles[i]>height) {//si sort par le haut ou le bas
         sYcircles[i] *= -1; }//inverser la composante y de la vitesse
}

void mousePressed() {
    //bouton souris enfoncé: début de la creation d'un nouveau cercle
    startNewCircle=true;
    xcircles[nCircles]=mouseX;
    ycircles[nCircles]=mouseY;
    dcircles[nCircles]=0;
    //on lui donne une couleur aléatoire
    ccircles[nCircles]= color( random(255), random(255), random(255));

}

void mouseReleased() {
    //bouton souris relâché: fin de la création du cercle
    if (!startNewCircle) return;//erreur, on a pas commencé de cercle
    float d = dist( mouseX, mouseY, 
          xcircles[nCircles], ycircles[nCircles]);
    //println("rayon : " + d);
    dcircles[nCircles]=(int) d*2; //diamètre
    //la vitesse est proportionnelle au rayon
    sXcircles[nCircles]= (mouseX-xcircles[nCircles])/10;
    sYcircles[nCircles]= (mouseY-ycircles[nCircles])/10;
   
    nCircles++; //incrémente l'index à la case suivante libre du tableau
    startNewCircle=false; //la création du cercle est terminée
}

void mouseDragged() {
    //souris bougée bouton enfoncé -- feedback visuel
    if (startNewCircle) {
      float d = dist( mouseX, mouseY, 
          xcircles[nCircles], ycircles[nCircles]);
      dcircles[nCircles]=(int) d*2; //diamètre
      line(xcircles[nCircles], ycircles[nCircles], mouseX, mouseY);
  }
}

