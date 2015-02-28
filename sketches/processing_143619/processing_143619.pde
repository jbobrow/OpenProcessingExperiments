
void setup() {
  size(500,500);
}

void draw() { 
  background(255,255,255);
  noStroke();
  
  //cercle fons
  fill(160,190,255);
  ellipse(250, 250, 460, 460);
  fill(188,207,255);
  ellipse(250, 250, 450, 450);
  fill(219,229,255);
  ellipse(250, 250, 400, 400);
  
  //orelles
  fill(0);
  ellipse(mouseX-125, mouseY-125, 140, 140);
  fill(0);
  ellipse(mouseX+125, mouseY-125, 140, 140);
  
  //cara
  fill(0);
  ellipse(mouseX, mouseY, 265, 265);
  fill(255,223,183);
  ellipse(mouseX, mouseY, 250, 250);
  
  //celles
  noFill();
  stroke(0,0,0);
  strokeWeight(5);
  arc(mouseX-40, mouseY-80, 50, 40, PI, 2*PI, OPEN);
  arc(mouseX+40, mouseY-80, 50, 40, PI, 2*PI, OPEN);
  noStroke();
  fill(255,223,183);
  rect(mouseX, mouseY-70, 160, 30);
  
  //boca
  fill(0,0,0);
  ellipse(mouseX, mouseY+30, 160, 130);
  rectMode(CENTER);
  fill(255,223,183);
  rect(mouseX, mouseY-10, 160, 80);
  
  //ulls
  fill(0,0,0);
  ellipse(mouseX-40, mouseY-40, 67, 87);
  ellipse(mouseX+40, mouseY-40, 67, 87);
  fill(255,255,255);
  ellipse(mouseX-40, mouseY-40, 60, 80);
  ellipse(mouseX+40, mouseY-40, 60, 80);
  
  //nineta ulls
  fill(0,0,0);
  ellipse(mouseX-35, mouseY-20, 22, 32);
  ellipse(mouseX+35, mouseY-20, 22, 32);
  fill(mouseX,mouseY,127);
  ellipse(mouseX-35, mouseY-20, 20, 30);
  ellipse(mouseX+35, mouseY-20, 20, 30);
  fill(0,0,0);
  ellipse(mouseX-35, mouseY-20, 12, 22);
  ellipse(mouseX+35, mouseY-20, 12, 22);
  
  
  //nas
  ellipse(mouseX, mouseY+5, 30, 20);
  fill(255,255,255);
  ellipse(mouseX, mouseY+7, 10, 7);
  
  //serrell
  fill(0,0,0);
  triangle(mouseX-30, mouseY-125, mouseX, mouseY-110, mouseX+30, mouseY-125);
  
  //dents
  fill(255,255,255);
  rect(mouseX-15, mouseY+50, 25, 30);
  rect(mouseX+15, mouseY+50, 25, 30);
  
  
}


