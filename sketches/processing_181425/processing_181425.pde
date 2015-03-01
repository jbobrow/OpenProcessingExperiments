
void setup() {  //setup function called initially, only once
  size(801, 601);
  background(255);
  smooth();
    
  textSize(12);
}
   
void draw() {  //draw function loops
  background(255);
   
  strokeWeight(1);
  stroke(220);
  dessiner_grille();
    
  textSize(14);
  strokeWeight(1);
  stroke(0);
  fill(0);
  textSize(16);
  text("Pour utiliser les couleurs nous allons utiliser differentes fonctions : ",25,20);
  textSize(14);
  //fill(255,0,0);
  text("1- la fonction fill(); permet de preciser la couleur de remplissage de notre forme.",25,45);
  //fill(0,255,0);
  text("2- la fonction stroke(); permet de preciser la couleur du contour de la forme. ",25,65);
  //fill(0,0,255);
  text("3- la fonction noFill(); permet de dessiner une forme sans couleur de remplissage.",25,85);
  //fill(255,125,50);
  text("4- la fonction noStroke(); permet de dessiner une forme sans contour.",25,105);
  //fill(128,0,96);
  textSize(16);
  text("Pour utiliser les fonctions fill() et stroke() nous devons préciser une couleur entre les parentheses.",25,130);
 // fill(193,223,0);
  text("Dans Processing les couleurs sont representees par trois nombres compris entre 0 et 255. Le premier ",25,155);
  text("represente la quantite de Rouge, le deuxième la quantite de vert, et le dernier la quantite de bleu.",25,180);
  text("Deux programmes existent pour vous aider : http://www.openprocessing.org/classroom/4441 .",25,210);
  
  
  translate(0,-75);
  stroke(255,0,0);
  noFill();
  ellipse(150,400,200,200);
  if (dist(mouseX,mouseY,150,400)<100){
      text("stroke(255,0,0);",60,380);
      text("noFill();",60,400);
      text("ellipse(150,400,200,200);",60,420);
  }
  
  noStroke();
  fill(0,255,0);
  ellipse(400,400,200,200);
  if (dist(mouseX,mouseY,400,400)<100){
      fill(0);
      text("noStroke();",310,380);
      text("fill(0,255,0);",310,400);
      text("ellipse(400,400,200,200);",310,420);
  }
  
  stroke(0,0,255);
  fill(255,185,185);
  ellipse(650,400,200,200);
  if (dist(mouseX,mouseY,650,400)<100){
      fill(0);
      text("stroke(0,0,255);",560,380);
      text("fill(255,185,185);",560,400);
      text("ellipse(650,400,200,200);",560,420);
  }
  
  
  fill(0);  
  text("Il est aussi possible de changer l'épaisseur du contour avec la fonction strokeWeight();",25,550);
  
  translate(-15,0);
  strokeWeight(3);
  stroke(255,0,0);
  noFill();
  ellipse(150,620,100,100);
  
  text("strokeWeight(3);",225,590);
  text("stroke(255,0,0);",225,610);
  text("noFill();",225,630);
  text("ellipse(150,620,100,100);",225,650);
  
  strokeWeight(7);
  stroke(0,255,255);
  noFill();
  ellipse(550,620,100,100);
  
  text("strokeWeight(7);",625,590);
  text("stroke(0,255,255);",625,610);
  text("noFill();",625,630);
  text("ellipse(550,620,100,100);",625,650);
 
  
  
  
    
  
     
     
  
}
   
   
void dessiner_grille(){
    for (int i = 0 ; i <= width ; i+=10){
        line(i,0,i,height);
        for (int j = 0 ; j <= height ; j +=10){
            line(0,j,width,j);
        }
    }
}
