
int value = 205;
int valueR = 205;
int valueG = 205;
int valueB = 205;
void setup() {
  size(600, 600);
  background(0, 0, 0);
  
}

void draw () {
   
  //cabeza
  fill(valueR, valueG, valueB);
  rect(50, 50, 500, 500);
  
  //cejas
  //izq
  fill(255,255,255);
  triangle(100,225,250,225,250,175);
  
  //drch
  fill(255,255,255);
  triangle(350,225,500,225,350,175);
  
  //ojos
  //izq
  fill(0,0,0);
  rect(100, 275, 150, 50);
  fill(255,255,255);
  rect(215,290,35,35);
  fill(random(255),random(255),random(255));
  rect(215,290,mouseX/17,mouseX/17);
  
  //drch
  fill(0,0,0);
  rect(350, 275, 150, 50);
  fill(255,255,255);
  rect(350,275,35,35);
  fill(random(255),random(255),random(255));
  rect(350,275,mouseY/17,mouseY/17);
  
  //boca
  fill(0,0,0);
  rect (100, 400, 400, mouseY/4);
  
  //dientes
  noStroke();
  fill(255,255,255);
  rect (260, 400, 85, 75);
  fill(0,0,0);
  rect(300, 400, 5, 75);

  //nariz
  fill(180,180,180);
  rect(225,330,150,60);
  
  //burejos de nariz
  fill(150,150,150);
  rect(240,340,50,40);
  fill(150,150,150);
  rect(310,340,50,40);



}

void mousePressed() {
   valueR = 255;
   valueG = 130;
   valueB = 130;
}

void mouseReleased() {
 valueR = 205;
 valueG = 205;
 valueB = 205;
}


