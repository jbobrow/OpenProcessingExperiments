
//Creation d'une classe Loupe
class Loupe{
  float x; // position en X de la loupe
  float y; //position en Y de la loupe

  //Creation du constructeur de la loupe
  Loupe(float x, float y){
    x = mouseX;
    y = mouseY;
  }

  //Affiche la loupe selon les coordonnes actuelles de la souris.
  void display(){
    pushMatrix();//sauvegarder la configuration dans la matrice
    //Exterieur du contour de la loupe
    strokeWeight(10);
    stroke(173,173,173);
    noFill();
    ellipseMode(CENTER);
    ellipse(mouseX,mouseY,190,190);
    // interieur du contour de la loupe
    stroke(150,150,150);
    noFill();
    ellipseMode(CENTER);
    ellipse(mouseX,mouseY,175,175);
    //glace de la loupe
    noStroke();
    fill(255,255,255,20);
    ellipseMode(CENTER);
    ellipse (mouseX,mouseY, 170,170);
    //bout du haut de la poignee
    noStroke();
    fill(227,227,227);
    ellipse(mouseX+70,mouseY+90, 40,40);
    //poignee de la loupe oriente dans un angle de 45 degre par rapport aux coordonnes actuelles de la souris.
    fill(90,88,88);
    stroke(90,88,88);
    translate(mouseX+140,mouseY+160);
    rotate(radians(45));
    rectMode(CENTER);
    rect(0,0,200,30);
    popMatrix();//restaurer la configuration dans la matrice
  }
}


