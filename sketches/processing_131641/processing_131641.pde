
PFont myFont;

void setup() {
  size(500, 500);
  background(100, 100, 90);
  //texto:
  myFont= createFont ("ScriptS-48.vlw", 14);
  textFont(myFont);
  textAlign(CENTER, 700);


Estrelas:
  for (int j =0; j<700; j=j+7) {
    float i= random (700);
    point (i, j);
  }
}



int a;
int x;
int azul;
void draw() { // Mudança do céu
  azul= 250- mouseY/5;
  background(100, 100, azul++);

  x++; // Nuvens
  noStroke();
  fill (255);
  ellipse (x-500, 30, 110, 10);
  ellipse (x+175, 120, 89, 10);
  ellipse (x+150, 100, 150, 12);
  ellipse (x-100, 70, 130, 10);
  ellipse (x-175, 190, 100, 14);
  ellipse (x-120, 180, 90, 10);
  ellipse (x-400, 170, 70, 10);
  ellipse (x-450, 140, 80, 10);


  // Lua:

  a++;
  noStroke();
  fill (255, 251, 229);
  ellipse (a%width, 46, 55, 55);


Estrelas:
  stroke(244, 230, 167);
  for (int j =0; j<700; j=j+10) {
    float i= random (700);
    point (i, j);
  }

  strokeWeight(2);
  stroke(200, 227, 170);
  point(random(0, 700), random(0, 700));
  noStroke();



  fill(62, 46, 46);// galho:
rect(0, 450, 600, 20); 
  arc(30, 450, 40, 40, 0, PI+QUARTER_PI, OPEN);

  fill(214, 209, 209); //corpo
  ellipse (255, 290, 190, 280);
  fill(255);
  ellipse(255, 306, 100, 250);

  noStroke();
  fill(198, 198, 198); // cabeça
  ellipse (255, 220, 200, 150);

  fill(0); //olhos
  ellipse(255, 222, 20, 20);
  fill (255); 
  ellipse (210, 200, 100, 80);
  ellipse(300, 200, 100, 80);
  fill (random(50, 250), random(50, 100), random(50, 100));
  ellipse(200, 200, 50, 40);
  ellipse(310, 200, 50, 40);
  fill(0);
  ellipse(200, 200, 20, 15);
  ellipse(310, 200, 20, 15);


  //peito
  stroke(164, 170, 173);
  fill(255, 251, 229);
  arc(290, 300, 25, 20, 0, PI+QUARTER_PI, OPEN);
  arc(255, 302, 25, 20, 0, PI+QUARTER_PI, OPEN);
  arc(225, 300, 25, 20, 0, PI+QUARTER_PI, OPEN);

  arc(220, 320, 20, 20, 0, PI+QUARTER_PI, OPEN);
  arc(245, 320, 20, 20, 0, PI+QUARTER_PI, OPEN);
  arc(268, 320, 20, 20, 0, PI+QUARTER_PI, OPEN);
  arc(290, 320, 20, 20, 0, PI+QUARTER_PI, OPEN);

  arc(290, 340, 20, 20, 0, PI+QUARTER_PI, OPEN);
  arc(268, 340, 20, 20, 0, PI+QUARTER_PI, OPEN);
  arc(245, 340, 20, 20, 0, PI+QUARTER_PI, OPEN);
  arc(220, 340, 20, 20, 0, PI+QUARTER_PI, OPEN);


  arc(285, 360, 20, 20, 0, PI+QUARTER_PI, OPEN);
  arc(265, 360, 20, 20, 0, PI+QUARTER_PI, OPEN);
  arc(242, 360, 20, 20, 0, PI+QUARTER_PI, OPEN);
  arc(220, 360, 20, 20, 0, PI+QUARTER_PI, OPEN);

  arc(285, 380, 17, 17, 0, PI+QUARTER_PI, OPEN);
  arc(260, 380, 17, 17, 0, PI+QUARTER_PI, OPEN);
  arc(242, 380, 17, 17, 0, PI+QUARTER_PI, OPEN);
  arc(225, 380, 17, 17, 0, PI+QUARTER_PI, OPEN);

  arc(280, 400, 15, 15, 0, PI+QUARTER_PI, OPEN);
  arc(255, 400, 15, 15, 0, PI+QUARTER_PI, OPEN);
  arc(235, 400, 15, 15, 0, PI+QUARTER_PI, OPEN);



  arc(270, 420, 7, 7, 0, PI+QUARTER_PI, OPEN);
  arc(260, 425, 7, 7, 0, PI+QUARTER_PI, OPEN);
  arc(250, 420, 7, 7, 0, PI+QUARTER_PI, OPEN);
  arc(240, 420, 7, 7, 0, PI+QUARTER_PI, OPEN);

  
  fill(129, 124, 99); // pés
  stroke(129, 124, 0);
  line(230, 425, 230, 450);
  line (280, 425, 280, 450);
  

  //texto:
  fill(10, 1, 1);
  text("Luma Moraes- 2014", 400, 490);
}

