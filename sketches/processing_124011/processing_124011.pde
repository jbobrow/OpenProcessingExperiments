
//Andressa S
//Coruja

boolean olho;
int x=0;
int y =0;
void setup () {
  size (400, 400);
  olho=false;
}
void draw () {
  scale(2);
  background (42, 10, 93);
// Ceu
for (int x = 30; x < 80; x = x+5) {
  for (int  = 0; y < 80; y = y+6) {
    point(x, y);
  }
}
  //Corpo
  fill(229, 201, 116);
  quad(79.8, 44.8, 115, 54.8, 96.5, 155.8, 58.8, 155);
  //Olhos
  fill (0);
  ellipse (110, 62, 5, 5);
  ellipse (94, 62, 5, 5);
  olho = mouseY <110 && mouseY >20;
  if (olho) {
    fill (255);
    ellipse (110, 62, 3, 3);
    ellipse (94, 62, 3, 3);
  }
    else{
    fill (0);
    ellipse (110, 62, 3, 3);
    ellipse (96, 62, 3, 3);
  }
 //Arvore
  fill (33, 26, 26);
  quad(0, 155, 200, 155, 200, 170, 0, 170);
  quad (150, 155, 200, 135, 200, 150, 152, 160);

  
  //Bico
  fill (255);
  triangle(100, 70, 106, 78, 100, 75);
  //Corpo
  fill(229, 201, 116);
  bezier (60, 155, 50, 110, 45, 80, 80, 45);
  bezier (80, 45, 90, 40, 110, 35, 115, 55);
  bezier (115, 55, 120, 60, 120, 70, 105, 75);
  bezier (105, 75, 115, 90, 110, 120, 95, 155);
  bezier (100, 75, 105, 60, 110, 40, 120, 32);
  bezier (100, 75, 115, 50, 95, 40, 90, 32);
  bezier (95, 75, 75, 70, 80, 55, 90, 50);
  bezier (85, 155, 90, 145, 91, 130, 92, 135); 
  fill (185, 159, 52);
  bezier (60, 170, 65, 184, 70, 186, 80, 170);
  bezier (55, 155, 60, 145, 65, 130, 60, 100); //asa
  bezier (60, 100, 65, 95, 73, 90, 70, 80);//asa
  arc(80, 140, 7, 7, 0, PI);
  arc(85, 145, 7, 7, 0, PI);
  arc(75, 130, 7, 7, 0, PI);
  arc(85, 132, 7, 7, 0, PI);
  arc(95, 140, 7, 7, 0, PI);
  arc(95, 130, 7, 7, 0, PI);
  bezier (80, 105, 84, 109, 89, 109, 105, 105);
  fill (255, 169, 39);
  bezier (74, 153, 75, 156, 76, 158, 74, 165);
  bezier (76, 153, 77, 156, 78, 158, 76, 165);
  bezier (90, 153, 91, 156, 92, 158, 90, 165);
  bezier (92, 153, 93, 156, 94, 158, 92, 165);
}

