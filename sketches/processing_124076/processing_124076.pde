
void setup() {
  size(600, 700);
  // noStroke();
}

void draw() {


  color c1 = color(#064776); //azul
  color c2 = color(#FFE7A5); //beige
  color c3 = color(#9BE8D5); //ciano


  /* beginShape(POLYGON);
   fill(c3);
   vertex(0, 0);
   fill(c1);
   vertex(width, 0);
   fill(c1);
   vertex(width, height);
   fill(c2);
   vertex(0, height);
   endShape(CLOSE);
   */

//CEU

noStroke();
  fill(100);
  for (int i = 0; i<width; i+=3)
  {
    for (int j = 0; j<height; j+=3)
    {
      fill(155 +j/6, 200 +i/40, 210);
      rect(i, j, 20, 20);
    }
  }
  
  
  
  
  //TORRE
  noStroke();
  fill(#CEB9A4);
  rect(width/2 -30, height/2 -100, 60, 180);

  quad(width/2 -30, height/2 +60, width/2 +30, height/2 +60, width/2 +50, height/2 +180, width/2 -50, height/2 +180);

  quad(width/2 -40, height/2 -120, width/2 +40, height/2 -120, width/2 +30, height/2 -100, width/2 -30, height/2 -100);

  rect(width/2 -40, height/2 -180, 80, 60, 3);

  rect(width/2 -60, height/2 -170, 25, 50, 3);



  //NUVENS
  noStroke();
  fill(255, 255, 255, 60);
  ellipse(mouseX+50, 300, 200, 80);
  ellipse(mouseX, 380, 260, 120);
  ellipse(mouseX+170, 350, 200, 110);

  ellipse(-mouseX+350, 100, 130, 80);
  ellipse(-mouseX+400, 90, 120, 60);


  //ESTRELAS
  int totalPts = 150;
  float steps = totalPts+1;
  stroke(255, random(255), random(255));
  strokeWeight(2);
  float rand = 1000;
  for (int i=1; i<steps; i++) {
    point ((width/2)-10+random(-rand, rand), (height/steps)*i);
    rand+=random(-2, 2);
  }
  stroke(#FFFFFF);
  strokeWeight(2);
  for (int t=1; t<steps; t++) {
    point (width+random(-rand, rand), (height/steps)*t);
    rand+=random(-2, 2);
  }

  //ARBUSTOS
  fill(#547443);
  noStroke();
  for (int q=0; q<800; q=q+60) {
    ellipse(q, 520, 30, 30);
  }

  //JANELAS
  noStroke();
  fill(#504B42);
  rect(width/2 -30, height/2 +120, 8, 13, 2);
  rect(width/2 -5, height/2 +120, 8, 13, 2);
  rect(width/2 +20, height/2 +120, 8, 13, 2);

  rect(width/2 -60, height/2 -160, 7, 30, 2);
  rect(width/2 +33, height/2 -160, 7, 30, 2);


  //TELHADO
  noStroke();

  fill(#643C1B);
  triangle(width/2 -40, height/2 -180, width/2, height/2 -300, width/2 +40, height/2 -180);
  triangle(width/2 -60, height/2 -170, width/2 -48, height/2 -220, width/2 -35, height/2 -170);


  //RAPUNZEL
  
  fill(#DB94B5);
  noStroke();
  rect(334, 203, 4, 18);

  //CABELO DA RAPUNZEL
  fill(#FFFAD1);
  noStroke();
  bezier(335, 200, 400, 250, 320, 270, mouseX-30, mouseY-80);
  bezier(mouseX-30, mouseY-80, mouseX+20, mouseY-45, 400, mouseY-20, mouseX, mouseY);

  //GRAMADO
  fill(#A3FA7E);
  noStroke();
  rect(1, height/2 +180, width, height);

  fill(#82BC72);
  for (int s=0; s<1500; s=s+8) {
    rect(s, 530, 3, 250);
  }
}
