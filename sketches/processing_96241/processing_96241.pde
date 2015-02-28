
//declaracio
int x;

//inicialitzacio de la x=0
void setup()
{
  x=0;
  size(500, 600);
  background(124,209,250);
  noCursor();
}

void draw()
{
  background(124,209,250);
  //tija de la flor
  stroke(44,203,31);
  strokeWeight(7);
  line(2*width/5,height/2,2*width/5,11*height/12);
  //terra
  fill(44,203,31);
  rect(0,width,width,height);
  //petals del fons
  pushMatrix();
  translate(2*width/5,height/2);
  for(int i=0; i<80; i++){
    rotate(PI/6);
    fill(255);
    noStroke();
    ellipse(0,height/40,2*width/25,4*height/15);
  }
  popMatrix();
  //cercle del mig
  noStroke();
  fill(255,255,0);
  ellipse(2*width/5,height/2,4*width/25,2*height/15);

  //marieta en moviment
  stroke(0);
  strokeWeight(2);
  fill(0);
  ellipse(mouseX,mouseY-33,width/25,height/30);//el cap de la marieta
  //antenes marieta
  line(mouseX-13,mouseY-50,mouseX,mouseY-30);
  ellipse(mouseX-13,mouseY-50,width/95,height/95);
  line(mouseX+13,mouseY-50,mouseX,mouseY-30);
  ellipse(mouseX+13,mouseY-50,width/95,height/95);
  //potes Esquerra
  noFill();
  arc(mouseX-40, mouseY+15, 4*width/25, 2*height/15, PI+HALF_PI, TWO_PI);
  arc(mouseX-25, mouseY+35, 4*width/25, 2*height/15, PI+PI/3, PI+HALF_PI);
  arc(mouseX-10, mouseY+60, 4*width/25, 2*height/15, PI+QUARTER_PI, PI+HALF_PI);
  //potes Dreta
  arc(mouseX+40, mouseY+15, 4*width/25, 2*height/15, PI, PI+HALF_PI);
  arc(mouseX+25, mouseY+35, 4*width/25, 2*height/15, PI+HALF_PI, PI+HALF_PI+PI/6);
  arc(mouseX+10, mouseY+60, 4*width/25, 2*height/15, PI+HALF_PI, PI+HALF_PI+QUARTER_PI);
  //cos vermell de la marieta
  fill(255,0,0);
  ellipse(mouseX, mouseY, 3*width/25, 7*height/60);
  line(mouseX,mouseY+35,mouseX,mouseY-35);
  fill(0); //punts negres Esquerra de la marieta respecte el cursor
  ellipse(mouseX-10,mouseY-18,2*width/125,height/75);
  ellipse(mouseX-18,mouseY,2*width/125,height/75);
  ellipse(mouseX-10,mouseY+18,2*width/125,height/75);
  //punts negres Dreta de la marieta respecte el cursor
  ellipse(mouseX+10,mouseY-18,2*width/125,height/75);
  ellipse(mouseX+18,mouseY,2*width/125,height/75);
  ellipse(mouseX+10,mouseY+18,2*width/125,height/75);
  
}



