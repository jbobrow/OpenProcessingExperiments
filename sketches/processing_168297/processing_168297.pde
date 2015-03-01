
//Gemma Galceran Kimura - Seminari 2
//Moure un personatge a partir del seu centre: il·lustració d'un pokemon
 
void setup() {
  size (1400,1400);
}
 
void keyPressed()
{
  if (keyPressed); // si mantens qualsevol lletra apretada, els ulls i les orelles s'il·luminen i fa pampallugues.
  {
    fill(#26536F);
    ellipse(mouseX-150,mouseY-250,60,60);
    ellipse(mouseX+150,mouseY-250,60,60);
    noFill();
     
    stroke(#F5C834);
    strokeWeight(5);
    ellipse(mouseX-175,mouseY-470,85,85);
    ellipse(mouseX+175,mouseY-470,85,85);
    ellipse(mouseX,mouseY+200,590,540);
    stroke(#26536F);
    ellipse(mouseX-175,mouseY-470,75,75);
    ellipse(mouseX+175,mouseY-470,75,75);
    ellipse(mouseX,mouseY+200,620,570);
    noStroke();
  }
 
}
 
void draw() {
  background(#FAF4AE);
  noStroke();
  
  //negre
  fill(0);
  ellipse(mouseX,mouseY+150,850,700);
  arc(mouseX,mouseY+137,850,1100,-PI,0);
   
  //blanc
  fill(#FAF4AE);
  ellipse(mouseX,mouseY+200,650,600);
   
    //ulls blancs
    ellipse(mouseX-150,mouseY-250,100,100);
    ellipse(mouseX+150,mouseY-250,100,100);
     
    //iris negre
    fill(0);
    ellipse(mouseX-150,mouseY-250,60,60);
    ellipse(mouseX+150,mouseY-250,60,60);
     
    //orelles
    ellipse(mouseX-175,mouseY-470,140,140);
    ellipse(mouseX+175,mouseY-470,140,140);
     
    beginShape();
    vertex(mouseX-100,mouseY-350);
    vertex(mouseX-150,mouseY-350);
    vertex(mouseX-200,mouseY-470);
    vertex(mouseX-150,mouseY-470);
    endShape();
     
    beginShape();
    vertex(mouseX+100,mouseY-350);
    vertex(mouseX+150,mouseY-350);
    vertex(mouseX+200,mouseY-470);
    vertex(mouseX+150,mouseY-470);
    endShape();
     
    textSize(60);
    fill(#26536F);
    text("*HUG ME*",mouseX-135,mouseY+200); 
      
}

