
void setup (){
  size (640,360);
  smooth ();
  background (230,220,200);
  strokeWeight (0.5);
}
void draw (){
  
  //carré marron clair
  beginShape ();
  fill (180,150,140);
  vertex (0,250);
  vertex (300,120);
  vertex (420,220);
  vertex (100,330);
  endShape ();
  
  //ligne marron foncée
  beginShape ();
  fill (60,55,50);
  vertex (0,280);
  vertex (0,250);
  vertex (100,330);
  vertex (100,360);
  endShape ();
  
  //ligne jaune
  beginShape ();
  fill (225,215,175);
  vertex (100,330);
  vertex(420,220);
  vertex (420, 245);
  vertex (100,360);
  endShape ();
  
  //triangle marron foncé
  beginShape ();
  fill (60,55,50);
  vertex (225,315);
  vertex (320,280);
  vertex (330, 360);
  vertex (280,360);
  endShape ();
  

  
  //carré bleu
  beginShape();
  fill (138, 170,200);
  vertex (0,0);
  vertex (215,0);
  vertex (270,220);
  vertex (0,280);
  endShape();
  
  //grande ligne noire
  beginShape ();
  fill (40,35,35);
  vertex (0,75);
  vertex (320,0);
  vertex (390,0);
  vertex (0,95);
  endShape ();
  
  //grande ligne blanche
  beginShape ();
  fill (226,220,200);
  vertex (0,120);
  vertex (500,0);
  vertex (600,0);
  vertex (0, 140);
  endShape ();
  
  //grande ligne rouge
  beginShape ();
  fill (220,65,50);
  vertex (0,140);
  vertex (600,0);
  vertex (640,0);
  vertex (0,150);
  endShape ();
  
  //petite ligne blanche
  beginShape ();
fill (230,220,200);
vertex (305,185);
vertex (505,130);
vertex (515, 135);
vertex (315,190);
endShape ();

//petit carré blanc
beginShape ();
fill (230,220,200);
vertex (305,185);
vertex (315,190);
vertex (315,200);
vertex (305,195);
endShape ();

//petite ligne rouge
beginShape ();
fill (225,60,55);
vertex (315,190);
vertex (515,135);
vertex (515,140);
vertex (315,200);
endShape ();

//carré rouge
beginShape ();
fill (225,60,55);
vertex (430,345);
vertex (640,315);
vertex (640,360);
vertex (440,360);
endShape ();
}

