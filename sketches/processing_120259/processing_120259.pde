
void setup()
{
size(500,500);
}
void draw()
{
  background(255);
translate(width/2,height/2); //in die Mitte springen

for(int i=0;i<360;i+=30) { //360 Grad in 20 Grad Schritten
pushMatrix();
rotate(radians(i)); //Um i rotieren
translate(0,200); //Um Radius verschieben
fill(255);
ellipse(0,0,50,50);
popMatrix();
}

for(int i=0;i<360;i+=90) { //360 Grad in 20 Grad Schritten
pushMatrix();
rotate(radians(i)); //Um i rotieren
translate(0,200); //Um Radius verschieben
fill(175,7,7);
ellipse(0,0,50,50);
popMatrix();
}


  
  
  float sec = map(second(),0,60,0,360);
  
  pushMatrix();
  rotate(radians(sec)); //Um i rotieren
  translate(0,-200); //Um Radius verschieben
  ellipse(0,0,10,10);
  popMatrix();
  
  float min = map(minute(),0,60,0,360);
  
  pushMatrix();
  rotate(radians(min)); //Um i rotieren
  translate(0,-180); //Um Radius verschieben
  fill(0);
  rect(0,0,5,180);
  popMatrix();
  
   float h = map(hour(),0,12,0,360);
  
  pushMatrix();
  rotate(radians(h)); //Um i rotieren
  translate(0,-130); //Um Radius verschieben
  fill(0);
  rect(0,0,5,130);
  popMatrix();
  
  ellipse(0,0,40,40);
  
}
