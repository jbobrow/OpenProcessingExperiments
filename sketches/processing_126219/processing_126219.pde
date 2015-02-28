
void setup() {
  size(500, 500);
  
  background(255);

  fill(255,0,0);
  rect(0,0,100,30);

  fill(0,255,0);
  rect(100,0,100,30);
  
  fill(0,0,255);
  rect(200,0,100,30);
  
   fill(255,217,0);
  rect(300,0,100,30);
  
     fill(97,0,255);
  rect(400,0,100,30);
  
  fill (133,150,240);
  ellipse(450,450,30,30);
  
  fill (0);
  ellipse(443,443,3,3);
  
  fill (0);
  ellipse(457,443,3,3);
  
  fill (0);
  rect(443,455,15,1);
  
  noFill();
  noStroke();
  
}

void draw() {
  
  //SETTO IL COLORE ROSSO
  if(mouseX>0 && mouseX<100 && mouseY>0 &&mouseY<30){
    fill(255,0,0);
    stroke(255,0,0);
     }

  //SETTO IL COLORE VERDE
  if(mouseX>100 && mouseX<200 && mouseY>0 && mouseY<30){
    fill(0,255,0);
    stroke(0,255,0);
     }
  
  //SETTO IL COLORE BLU
  if(mouseX>200 && mouseX<300 && mouseY>0 &&mouseY<30){
    fill(0,0,255);
    stroke(0,0,255);
     }
  //SETTO IL COLORE GIALLO
  if(mouseX>300 && mouseX<400 && mouseY>0 &&mouseY<30){
    fill(255,217,0);
    stroke(255,217,0);
     }
      //SETTO IL COLORE VIOLA
  if(mouseX>400 && mouseX<500 && mouseY>0 &&mouseY<30){
    fill(97,0,255);
    stroke(97,0,255);
     }
     
 
     
  //DISEGNO SOLO SE FACCIO CLICK SUL MOUSE E LA POSIZIONE DEL MOUSE E' FUORI DAI PULSANTI
  if (mousePressed && mouseY>35) {
    line(mouseX, mouseY,pmouseX,pmouseY);
  }
}
void keyPressed() {
  if (keyCode == 67) { //c = clear
    fill(255,255,255);
    rect(0,30,500,470);
     }
}


