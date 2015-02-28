
void setup (){
 size (640, 360);
 smooth();
 noStroke();
 background (226, 217, 195);
}

void draw (){
  fill (200);// rectangle gris droit
  pushMatrix();
  rotate(-PI/3);
  rect (100,0,200,800);
  popMatrix(); 
  
  fill (50);// ombre grise
  pushMatrix();
  rotate(-PI/3);
  rect (80,0,30,800);
  popMatrix(); 
  
  fill (120,149,203);// rectangle bleu
  pushMatrix();
  rotate(-PI/12.0);
  rect (-50,0,900,300);
  
  fill (0);// ellipse noir
  ellipse (-10,250,500,500);
  
  fill (200);
  rect (20,40,400,40);// rectangle gris
  
  fill (200);// rectangle gris du bas
  rect (-50,280,150,70);
  popMatrix(); 
  
  fill (160,27,10);
  pushMatrix();
  rotate(PI/-12.0);
  rect (20,80,400,10);// ombre rouge
  popMatrix(); 
  
  fill (226,200,93);// rectangle jaune
  pushMatrix();
  rotate(-PI/15);
  rect (-90,220,80,400);
  popMatrix(); 
  



}

