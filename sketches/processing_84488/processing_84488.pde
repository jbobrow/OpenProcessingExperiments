
void setup()
{
size(500, 500);
background(255);
 smooth();
}
void draw(){
  pushMatrix();
  //soleil de couleur vert clair au milieu
  noStroke();
  fill(111,230,60,120);
  translate(width/2, height/2);
  for (int i=0;i<360;i=i+30){
  rotate(radians(30)); 
  quad(0,0,50,30,50,70,60,70);
}
  //rotation des rectangles rose
  noStroke();
  fill(250,130,200,20);
  for (int i=0;i<360;i=i+30){
  rotate(radians(35)); 
  quad(0,0,170,0,120,50,60,30);
}
//rotation des ellipses bleu
  noStroke();
  fill(100,245,250,10);
  for (int i=0;i<360;i=i+30){
  rotate(radians(30)); 
  arc(0,0,450,70,0,PI);
}
  //fleur gris au milieu
  noStroke();
  fill(100);
  for (int i=0;i<360;i=i+30){
  rotate(radians(30)); 
  arc(0,0,50,10,0,PI);
}
 // rotation des traits gris au milieu
  noStroke();
  translate(0,0);
  fill(100,80);
  for (int i=0;i<360;i=i+30){
  rotate(radians(30)); 
  arc(30,30,50,10,0,PI);
}
  //fleur gris a gauche en haut
  popMatrix();
  translate(width/6, height/6);
  noStroke();

  fill(180,20);
  for (int i=0;i<360;i=i+30){
  rotate(radians(30)); 
  arc(0,0,50,10,0,PI);
  }
  //fleur gris a droit en haut
  translate(500/6*4,0);
  noStroke();
  fill(180,20);
  for (int i=0;i<360;i=i+30){
  rotate(radians(30)); 
  arc(0,0,50,10,0,PI);
  }
    //fleur gris a droit en bas
    translate(0, height/6*4);
  noStroke();
  fill(180,20);
  for (int i=0;i<360;i=i+30){
  rotate(radians(30)); 
  arc(0,0,50,10,0,PI);
  }
    //fleur gris a gauche en bas
    translate(0-330, 0);
  noStroke();
  fill(180,20);
  for (int i=0;i<360;i=i+30){
  rotate(radians(30)); 
  arc(0,0,50,10,0,PI);
}
}


