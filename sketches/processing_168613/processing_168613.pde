
void setup() {
  size(600, 600);
  background(0, 0, 0);
  
}

void draw () {
   
  //cabeza
  fill(205, 205, 205);
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
  fill(255,0,0);
  rect(235,310,15,15);
  
  //drch
  fill(0,0,0);
  rect(350, 275, 150, 50);
  fill(255,255,255);
  rect(350,275,35,35);
  fill(255,0,0);
  rect(350,275,15,15);
  
  //boca
  fill(0,0,0);
  rect (100, 400, 400, 75);
  
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


