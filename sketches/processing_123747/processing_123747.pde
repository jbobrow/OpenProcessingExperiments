
void setup() {
  size(700, 700);
  background(200, 26, 80);

// Estrelas:
  for (int j =0; j<700; j=j+7) {
    float i= random (700);
    point (i, j);
  }
}

// Mudança do céu:

int a; 
int azul;
void draw() {
  azul= 255- mouseY/10;
  background(3, 130, azul);
 
  // Lua:
  
  a++;
  fill (random(180, 255), random(250, 255), random (200, 175));
  ellipse (a++%width, 60, 80, 80);


 // Estrelas:
  stroke(244, 230, 167);
  for (int j =0; j<700; j=j+7) {
    float i= random (700);
    point (i, j);
  }

  strokeWeight(2);
  stroke(200, 227, 170);
  point(random(0, 700), random(0, 700));
 
 // Chão:
  
  noStroke();
  fill(42, 100, 79);
  quad(0, 500, 700, 500, 700, 700, 0, 700);

 // Árvores:
 
  fill(21, 147, 51);
  ellipse(32, 450, 60, 90) ;
  fill(64, 40, 40);
  quad(30, 480, 35, 480, 35, 600, 35, 600);
  fill(21, 147, 51);
  ellipse(132, 450, 80, 120) ;
  fill(64, 40, 40);
  quad(130, 500, 135, 500, 135, 600, 135, 600);

// Edifício:

  fill(161, 162, 161);
  rect(365, 150, 250, 450);
  fill(85, 40, 31);
  rect(465, 500, 100, 100);

 // Janelas do edifício:
 
  fill(73, 77, 74);
  rect(375, 180, 230, 4);
  rect(375, 190, 230, 4);
  rect(375, 200, 230, 4);
  rect(375, 210, 230, 4);
  rect(375, 220, 230, 4);
  rect(375, 230, 230, 4);
  rect(375, 240, 230, 4);
  rect(375, 250, 230, 4);
  rect(375, 260, 230, 4);
  rect(375, 270, 230, 4);
  rect(375, 280, 230, 4);
  rect(375, 290, 230, 4);
  rect(375, 300, 230, 4);
  rect(375, 310, 230, 4);
  rect(375, 320, 230, 4);
  rect(375, 330, 230, 4);
  fill(216, 196, 192);
  rect(375, 350, 230, 50);
  rect(375, 430, 230, 50);
}
