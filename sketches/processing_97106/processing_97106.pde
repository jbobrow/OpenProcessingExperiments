
//Reforço3
//baseado no esboço de Nathana Czornei

void setup(){
  size (200,200);
  background (230,250,180);
}



void draw (){
  float r=random (200);
  float i=random (255);
  float j=random (255);
  float k=random (255);
  fill (0);
  rect (75,75,50,50);
  noStroke();
  fill (i,j,k,r);
  ellipse (i,j,10,10);
  if ((mouseX>75 && mouseX<125) && (mouseY>75 && mouseY<125)){
    background (230,250,180);
  }
}
