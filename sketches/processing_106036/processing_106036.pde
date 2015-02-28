
// Thibault Bourgeois
// Tic Tac Toe
// 8/8/13

void setup () {
  size (300, 300);
  smooth();
  
  
  // Draw the board
  background (255);
  line (100, 0, 100, 300);
  line (200, 0, 200, 300);
  line (0, 100, 300, 100);
  line (0, 200, 300, 200);
}


// spots on the board

int a = 0;
int b = 0;
int c = 0;
int d = 0;
int e = 0;
int f = 0;
int g = 0;
int h = 0;
int i = 0;


int r = 0;
int s = 0;
int t = 0;
int u = 0;
int v = 0;
int w = 0;
int x = 0;
int y = 0;
int z = 0;

boolean xturn= false;

void draw () {

if (mousePressed){
      
      // ROUND =============== 

    if (!xturn){

      if (mouseX < 100 && mouseY < 100 && a == 0 && r == 0) {
            ellipse (50, 50, 30, 30);
            a = 1;
      } else if (mousePressed && mouseX < 200 && mouseX > 100 && mouseY < 100 && b == 0 && s == 0) {
            ellipse (150, 50, 30, 30);
            b = 1;
      } else if (mouseX > 200 && mouseY < 100 && c == 0 && t == 0) {
            ellipse (250, 50, 30, 30);
            c = 1;
      } else if (mouseX < 100 && mouseY > 100 && mouseY < 200 && d == 0 && u == 0) {
            ellipse (50, 150, 30, 30);
            d = 1;
      } else if (mouseX < 200 && mouseX > 100 && mouseY > 100 && mouseY < 200 && e == 0 && v ==                 0) {
            ellipse (150, 150, 30, 30);
            e = 1;
      } else if (mouseX > 200 && mouseY > 100 && mouseY < 200 && f == 0 && w == 0) {
            ellipse (250, 150, 30, 30);
            f = 1;
      } else if (mouseX < 100 && mouseY > 200 && g == 0 && x == 0) {
            ellipse (50, 250, 30, 30);
            g = 1;
      } else if (mouseX < 200 && mouseX > 100 && mouseY > 200 && h == 0 && y == 0) {
            ellipse (150, 250, 30, 30);
            h = 1;
      } else if (mouseX > 200 && mouseY > 200 && i == 0 && z == 0) {
            ellipse (250, 250, 30, 30);
            i = 1;
      }
  
      // CROSS =======================================

    } else { 


  
      if (mouseX < 100 && mouseY < 100 && a == 0 && r == 0 ) {
            line (25, 25, 75, 75);
            line (25, 75, 75, 25);
            r = 1;
      } else if (mouseX < 200 && mouseX > 100 && mouseY < 100 && b == 0 && s == 0) {
            line (125, 25, 175, 75);
            line (125, 75, 175, 25);
            s = 1;
      } else if (mouseX > 200 && mouseY < 100 && c == 0 && t == 0) {
            line (225, 25, 275, 75);
            line (225, 75, 275, 25);
            t = 1;
      } else if (mouseX < 100 && mouseY > 100 && mouseY < 200 && d == 0 && u == 0) {
            line (25, 125, 75, 75);
            line (25, 175, 75, 125);
            u = 1;
      } else if (mouseX < 200 && mouseX > 100 && mouseY > 100 && mouseY < 200 && e == 0 && v == 0) {
            line (125, 125, 175, 175);
            line (125, 175, 175, 125);
            v = 1;
      } else if (mouseX > 200 && mouseY > 100 && mouseY < 200 && f == 0 && w == 0) {
            line (225, 125, 275, 175);
            line (225, 175, 275, 125);
            w = 1;
      } else if (mouseX < 100 && mouseY > 200 && g == 0 && x == 0) {
            line (25, 225, 75, 275);
            line (25, 275, 75, 225);
            x = 1;
      } else if (mouseX < 200 && mouseX > 100 && mouseY > 200 && h == 0 && y == 0) {
            line (125, 225, 175, 275);
            line (125, 275, 175, 225);
            y = 1;
      } else if (mouseX > 200 && mouseY > 200 && i == 0 && z == 0) {
            line (225, 225, 275, 275);
            line (225, 275, 275, 225);
            z = 1;
      }
    } 


    // this needs to be placed somewhere else
    xturn = !xturn;
    
   
    println(xturn);

    }
  
}
