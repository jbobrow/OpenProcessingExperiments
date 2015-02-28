
//la taille de mon sketch
void setup ()
{
  size (400,400);
  background (255);
  smooth();
}

//fonction draw
void draw()
{
  //je fais un fond qui bouge, change de couleur
  background (random(mouseX),random(mouseY));
  //je veux que mes formes ne soient pas remplies
  noFill();
  //je fais une série d'ellipses qui bougent
  //1ere ellipse
  strokeWeight(3);
stroke(#FF03D6,random(mouseX));
  ellipse(200,200,random(250),random(250));
  
  //deuxième ellipse
  strokeWeight(2);
  stroke(#21FF05,random(mouseX));
  ellipse(200,200,random(200),random(100));
  
  //3ème ellipse
  strokeWeight(2);
  stroke(#05FFFD);
  ellipse(200,200,random(100),random(75));
  
  //4éme ellipse
  strokeWeight(2);
  stroke(#FFF305);
  ellipse(200,200,random(150),random(90));
  
}

