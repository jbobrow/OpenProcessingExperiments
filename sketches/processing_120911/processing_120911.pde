
boolean llansador = false;
void setup (){
  size (650,650);
  background(#056560);
}

void draw(){
  //quadrats de colors
  if (mousePressed && (mouseButton == LEFT)){
  fill(random(0,248),random(4,255),random(48,255));
  rect(mouseX,mouseY,random(20,40),random(20,40));
  rect(650-mouseX,mouseY,random(35,40),random(35,40));
  }
  //rodones de colors
   if (mousePressed && (mouseButton == RIGHT)){
      fill (random (0,255),random (0,255),random (0,255));
      ellipse(mouseX,mouseY,random(35,40),random(35,40));
      ellipse(width-mouseX,mouseY,random(35,40),random(35,40));
   }
   //línies de colors
   if(keyPressed){
   if (key=='a')
      strokeWeight (12);
      stroke (random (150,255),random (0,150),random (0,255));
      line (mouseX,mouseY,pmouseX,pmouseY);
   }
   //triangles de colors
   if(keyPressed){
   if (key=='t')
     fill(random (0,255),random (0,255),random (0,255));
     triangle(mouseX, mouseY, mouseX-15, mouseY+15, mouseX+15, mouseY+15);
     triangle(width-mouseX, mouseY, width-mouseX-15, mouseY+15, width-mouseX+15, mouseY+15);
  }
   //netejar la pantalla
   if (keyPressed) {
   if (key == 'c')
      background(#056560);
  }
    
}
   





