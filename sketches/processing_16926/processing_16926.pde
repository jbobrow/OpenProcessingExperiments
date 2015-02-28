
void setup (){
  size(400,400);
  stroke(0);
  strokeWeight(3);
  background(250);
} 

  void draw () {
    background(255);
  if (mousePressed == true) {
      rectMode(CENTER);
  fill(136,152,207);
  rect(100,100,50,50); //tête
  fill(136,152,207);
  rect(100,165,80,80); //ventre
  fill(234,158,25);
  rect(99,102,15,15); //nez
  fill(158,44,44);
  rect(100,68,80,15); //base du chapeau
  fill(158,44,44);
  rect(100,43,50,35); //corps du chapeau
  fill(136,152,207);
  rect(155,138,30,30); //patte antérieure droite
  fill(136,152,207);
  rect(45,138,30,30); //patte antérieure gauche
  fill(136,152,207);
  rect(141,200,30,30); //patte postérieure droite
  fill(136,152,207);
  rect(58,198,30,30); //patte postérieure gauche
  
   } else {
     rectMode(CORNER);
      fill(136,152,207);
  ellipse(100,100,50,50); //tête
  fill(136,152,207);
  ellipse(100,163,80,80); //ventre
  fill(234,158,25);
  rect(92,99,15,15); //nez
  fill(158,44,44);
  rect(60,62,80,15); //base du chapeau
  fill(158,44,44);
  rect(75,27,50,35); //corps du chapeau
  fill(136,152,207);
  ellipse(150,140,30,30);
  fill(136,152,207);
  ellipse(50,140,30,30);
  fill(136,152,207);
  ellipse(141,200,30,30);
  fill(136,152,207);
  ellipse(58,198,30,30);
  }
}

                
                
