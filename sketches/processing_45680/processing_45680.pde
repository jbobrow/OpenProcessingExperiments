
void setup(){
  size(640,360);
  smooth();
  strokeWeight(0.5);
  
}
void draw(){
  color rouge= color(222,51,44);
  color noir= color(33,31,32);
  background(220,214,200);
    //Marron foncé
  fill(56,47,48);
  beginShape();
  vertex(431,271);
  vertex(527,339);
  vertex(527,374);
  vertex(394,281);
  endShape(CLOSE);
    //Marron clair
  fill(224,212,170);
  beginShape();
  vertex(527,339);
  vertex(640,302);
  vertex(640,335);
  vertex(527,373);
  endShape(CLOSE);
  //Marron
  fill(174,160,151);
  beginShape();
  vertex(430,271);
  vertex(640,224);
  vertex(640,301);
  vertex(527,339);
  endShape(CLOSE);
  //forme rouge
  fill(rouge);
  beginShape();
  vertex(0,0);
  vertex(242,0);
  vertex(242,140);
  vertex(0,140);
  endShape(CLOSE);
    //bleu
  fill(126,161,199);
  beginShape();
  vertex(217,0);
  vertex(640,0);
  vertex(640,225);
  vertex(250,315);
  vertex(160,150);
  vertex(242,104);
  endShape(CLOSE);
  //ellipse
  fill(noir);
  ellipse(0,360,530,530);
  //Gris
  fill(218,214,212);
  beginShape();
  vertex(0,161);
  vertex(640,12);
  vertex(640,38);
  vertex(0,188);
  endShape(CLOSE);
  //Rouge
  fill(rouge);
  beginShape();
  vertex(0,188);
  vertex(640,38);
  vertex(640,49);
  vertex(0,198);
  endShape(CLOSE);
    //trait noir
  fill(noir);
  beginShape();
  vertex(355,22);
  vertex(451,0);
  vertex(559,0);
  vertex(362,49);
  endShape(CLOSE);

  
}

