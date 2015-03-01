
// Dessiner des cercles


void setup() { 

size(700,300);

background(255);
frameRate(20);
  
}


void draw() {  
  

  
  noFill();
  strokeWeight(random(7));
  stroke(random(255),random(255),random(255));
  ellipse(random(0,300),random(0,300), random(5,100), random(5,100));
  
  noStroke();
  fill(255);
  rect(300,0,400,300);
  
  fill(0);
  text("En informatique on utilise souvent des nombres ",305,20);
  text("aleatoires cela permet a l'ordinateur de choisir",305,40);
  text("des nombres au hasard a chaque fois.",305,60);
    
  text("Dans Processing on utilise la fonction random();",305,85);
  text("On peut ajouter deux valeurs entre les parentheses",305,105);
  text("d'abord la valeur minimale que l'on souhaite, puis,",305,125);
  text("la valeur maximale que l'on souhaite.",305,145);
  
  
  text("noFill();",315,190);
  text("strokeWeight(random(7));",315,210);
  text("stroke(random(255),random(255),random(255));",315,230);
  text("ellipse(random(300),random(300), random(5,15),random(5,15)",315,250);
 
 
    
  
}
