
void setup() {
  size(500, 500);
  background(#FFFFFF);
 }


void draw() {
  

  background(#FFFFFF);
 

  
//Trois parties du haut
line(mouseX, mouseY-300, 300, 0);
line(300, 0, mouseX, mouseY-200);
line(mouseX, mouseY-200, 300, 100);
line(300, 100, mouseX, mouseY-100);
line(mouseX, mouseY-200, 200, 0);
line(200, 0, mouseX, mouseY-300);
line(mouseX, mouseY-200, 200, 100);
line(200, 100, mouseX, mouseY-100);
line(300, 0, mouseX+100, mouseY-200);
line(mouseX+100, mouseY-200, 300, 100);
line(200, 0, mouseX-100, mouseY-200);
line(mouseX-100, mouseY-200, 200, 100);

line(mouseX-200, mouseY-300, 100, 0);
line(100, 0, mouseX-200, mouseY-200);
line(mouseX-200, mouseY-200, 100, 100);
line(100, 100, mouseX-200, mouseY-100);
line(mouseX-200, mouseY-300, 0, 0);
line(0, 0, mouseX-200, mouseY-200);
line(mouseX-200, mouseY-200, 0, 100);
line(0, 100, mouseX-200, mouseY-100);
line(100, 0, mouseX-100, mouseY-200);
line(mouseX-100, mouseY-200, 100, 100);
line(0, 0, mouseX-300, mouseY-200);
line(mouseX-300, mouseY-200, 0, 100);

line(mouseX+200, mouseY-300, 500, 0);
line(500, 0, mouseX+200, mouseY-200);
line(mouseX+200, mouseY-200, 500, 100);
line(500, 100, mouseX+200, mouseY-100);
line(mouseX+200, mouseY-300, 400, 0);
line(400, 0, mouseX+200, mouseY-200);
line(mouseX+200, mouseY-200, 400, 100);
line(400, 100, mouseX+200, mouseY-100);
line(500, 0, mouseX+300, mouseY-200);
line(mouseX+300, mouseY-200, 500, 100);
line(400, 0, mouseX+100, mouseY-200);
line(mouseX+100, mouseY-200, 400, 100);

//Trois parties du milieu
line(mouseX, mouseY-100, 300, 200);
line(300, 200, mouseX, mouseY);
line(mouseX, mouseY, 300, 300);
line(300, 300, mouseX, mouseY+100);
line(mouseX, mouseY-100, 200, 200);
line(200, 200, mouseX, mouseY);
line(mouseX, mouseY, 200, 300);
line(200, 300, mouseX, mouseY+100);
line(300, 200, mouseX+100, mouseY);
line(mouseX+100, mouseY, 300, 300);
line(200, 200, mouseX-100, mouseY);
line(mouseX-100, mouseY, 200, 300);

line(mouseX-200, mouseY-100, 100, 200);
line(100, 200, mouseX-200, mouseY);
line(mouseX-200, mouseY, 100, 300);
line(100, 300, mouseX-200, mouseY+100);
line(mouseX-200, mouseY-100, 0, 200);
line(0, 200, mouseX-200, mouseY);
line(mouseX-200, mouseY, 0, 300);
line(0, 300, mouseX-200, mouseY+100);
line(100, 200, mouseX-100, mouseY);
line(mouseX-100, mouseY, 100, 300);
line(0, 200, mouseX-300, mouseY);
line(mouseX-300, mouseY, 0, 300);

line(mouseX+200, mouseY-100, 500, 200);
line(500, 200, mouseX+200, mouseY);
line(mouseX+200, mouseY, 500, 300);
line(500, 300, mouseX+200, mouseY+100);
line(mouseX+200, mouseY-100, 400, 200);
line(400, 200, mouseX+200, mouseY);
line(mouseX+200, mouseY, 400, 300);
line(400, 300, mouseX+200, mouseY+100);
line(500, 200, mouseX+300, mouseY);
line(mouseX+300, mouseY, 500, 300);
line(400, 200, mouseX+100, mouseY);
line(mouseX+100, mouseY, 400, 300);

// Trois parties du bas
line(mouseX, mouseY+100, 300, 400);
line(300, 400, mouseX, mouseY+200);
line(mouseX, mouseY+200, 300, 500);
line(300, 500, mouseX, mouseY+300);
line(mouseX, mouseY+100, 200, 400);
line(200, 400, mouseX, mouseY+200);
line(mouseX, mouseY+200, 200, 500);
line(200, 500, mouseX, mouseY+300);
line(300, 400, mouseX+100, mouseY+200);
line(mouseX+100, mouseY+200, 300, 500);
line(200, 400, mouseX-100, mouseY+200);
line(mouseX-100, mouseY+200, 200, 500);

line(mouseX-200, mouseY+100, 100, 400);
line(100, 400, mouseX-200, mouseY+200);
line(mouseX-200, mouseY+200, 100, 500);
line(100, 500, mouseX-200, mouseY+300);
line(mouseX-200, mouseY+100, 0, 400);
line(0, 400, mouseX-200, mouseY+200);
line(mouseX-200, mouseY+200, 0, 500);
line(0, 500, mouseX-200, mouseY+300);
line(100, 400, mouseX-100, mouseY+200);
line(mouseX-100, mouseY+200, 100, 500);
line(0, 400, mouseX-300, mouseY+200);
line(mouseX-300, mouseY+200, 0, 500);

line(mouseX+200, mouseY+100, 500, 400);
line(500, 400, mouseX+200, mouseY+200);
line(mouseX+200, mouseY+200, 500, 500);
line(500, 500, mouseX+200, mouseY+300);
line(mouseX+200, mouseY+100, 400, 400);
line(400, 400, mouseX+200, mouseY+200);
line(mouseX+200, mouseY+200, 400, 500);
line(400, 500, mouseX+200, mouseY+300);
line(500, 400, mouseX+300, mouseY+200);
line(mouseX+300, mouseY+200, 500, 500);
line(400, 400, mouseX+100, mouseY+200);
line(mouseX+100, mouseY+200, 400, 500);

//Angle bas droit
line(300, 300, mouseX+100, mouseY+100);
line(400, 300, mouseX+100, mouseY+100);
line(mouseX+100, mouseY+100, 400, 400);
line(mouseX+100, mouseY+100, 300, 400);

//Angle bas gauche
line(100, 300, mouseX-100, mouseY+100);
line(200, 300, mouseX-100, mouseY+100);
line(mouseX-100, mouseY+100, 200, 400);
line(mouseX-100, mouseY+100, 100, 400);

//Angle haut droit
line(300, 100, mouseX+100, mouseY-100);
line(400, 100, mouseX+100, mouseY-100);
line(mouseX+100, mouseY-100, 400, 200);
line(mouseX+100, mouseY-100, 300, 200);

//Angle haut gauche
line(100, 100, mouseX-100, mouseY-100);
line(200, 100, mouseX-100, mouseY-100);
line(mouseX-100, mouseY-100, 200, 200);
line(mouseX-100, mouseY-100, 100, 200);

//
if (mousePressed == true) {
//Verticales
line(100, 0, 100, 500);
line(200, 0, 200, 500);
line(300, 0, 300, 500);
line(400, 0, 400, 500);

//Horizontales
line(0, 100, 500, 100);
line(0, 200, 500, 200);
line(0, 300, 500, 300);
line(0, 400, 500, 400);

}
  
  
  
 if (keyPressed == true) {
   saveFrame();
   background(#FFFFFF);
   };

}



