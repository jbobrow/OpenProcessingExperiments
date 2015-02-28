
//constantes céu
int Y_AXIS = 1;
int X_AXIS = 2;
int x;
color c1, c2;
 
//constantes nuvens
int num = 30;
int[] a = new int[num];
int[] b = new int[num];
 
 
void setup () {
  size (400, 600);
 
  //cores céu
  c1 = color(#0A1A48);
  c2 = color(#6CABED);
}
 
void draw() {
 
  //Céu
  setGradient(0, 0, width, height, c1, c2, Y_AXIS);
 
  //Nuvem
  
  if (mouseY>400) {
   
 for (int i = a.length-1; i > 0; i--) {
    a[i] = a[i-1];
    b[i] = b[i-1];
  }
  a[0] = mouseX;
  b[0] =mouseY;
  for (int i = 0; i < a.length; i++) {
    smooth();
    noStroke ();
    fill(i * 9);
    ellipse(a[i], b[i], 100, 40);
  }
  }
 
 
  //Gramado
  noStroke();
  fill (102, 111, 88);
  rect (0, 580, 400, 20);
 
  //Base edifício
  stroke (0);
  fill (255);
  quad (100, 580, 310, 580, 300, 495, 110, 495);
  //Porta vidro
  stroke (0);
  fill (106, 160, 147);
  quad (150, 580, 260, 580, 250, 500, 160, 500);
  //Muro
  fill (134, 133, 124);
  quad (0, 580, 400, 580, 500, 495, 0, 540);
  //prédio parte 1 ERROR
//  quad(mouseX/5+100, 50, mouseX/5+150, 50, 200, 300, 150, 300);
  //prédio estrutura
   if (mouseX<110) {
  fill (255);
  triangle (110, 495, 215, 495, 170, 100);
  triangle (215, 40, 260, 80, 240, 340);
  quad (205, 495, 300, 495, 215, 40, 160, 90);
   } else if (mouseY>110) {
     fill (255);
     triangle (205,495,300,495,240,100);
     triangle (215,40,160,90,160,350);
     quad (110,495,205,495,260,80,215,40);

   }
}
 
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis) {
 
  noFill();
 
  if (axis == Y_AXIS) {
    for (int i=y; i<=y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
}
