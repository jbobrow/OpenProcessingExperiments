
int petitPanier = 20;
int grandPanier = 40;
int px=0;
int py=0;

void setup(){;

size(400,200);
background(86, 213, 250);

ellipse(100, 100, grandPanier, petitPanier);
strokeWeight(2);

petitPanier = (40+grandPanier); 

}

void draw (){
  if(mousePressed){
    background(86, 213, 250);
    ellipse(mouseX, mouseY, mouseX+20, mouseY+30);
    // (place X, place Y, hauteur, largeur)
    
    px = mouseX;
    py = mouseY;
}
}


