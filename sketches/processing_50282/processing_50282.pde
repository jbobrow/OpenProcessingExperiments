
size (800, 800);
background(255);
smooth();

strokeWeight( .11);

fill(0 , 0, 255, 1);

for (int y = 20; y <= height; y +=10){
  for (int x = 20; x <= width; x += 10){
    triangle (x, y, random(800),  random(800), random(800), random(800));
  }
}


fill(0, 0, 175, 75);

int begX = width/3 + 10; 
int begY = height/2 + 10;

beginShape();
vertex(begX, begY);
vertex(begX - 60, begY - 120);
vertex(begX - 78, begY - 102);
vertex(begX - 12,  begY + 30);
vertex(begX - 12,  begY + 120);
vertex(begX + 12,  begY + 120);
vertex(begX + 12,  begY + 30);
vertex(begX + 78, begY - 102);
vertex(begX + 60, begY - 120);
endShape(CLOSE);


beginShape();
vertex(begX + 50, begY);
vertex(begX + 50, begY + 125);
vertex(begX + 175, begY + 125);
vertex(begX + 175, begY);
endShape(CLOSE);

beginShape();
vertex(begX + 200, begY);
vertex(begX + 200, begY + 125);
vertex(begX + 325, begY + 125);
vertex(begX + 325, begY);
vertex(begX + 300, begY);
vertex(begX + 300, begY + 100);
vertex(begX + 225, begY + 100);
vertex(begX + 225, begY);
endShape(CLOSE);

fill(0, 0, 175, 200);
begX = width/3; 
begY = height/2;

beginShape();
vertex(begX, begY);
vertex(begX - 60, begY - 120);
vertex(begX - 78, begY - 102);
vertex(begX - 12,  begY + 30);
vertex(begX - 12,  begY + 120);
vertex(begX + 12,  begY + 120);
vertex(begX + 12,  begY + 30);
vertex(begX + 78, begY - 102);
vertex(begX + 60, begY - 120);
endShape(CLOSE);

beginShape();
vertex(begX + 50, begY);
vertex(begX + 50, begY + 125);
vertex(begX + 175, begY + 125);
vertex(begX + 175, begY);
endShape(CLOSE);

beginShape();
vertex(begX + 200, begY);
vertex(begX + 200, begY + 125);
vertex(begX + 325, begY + 125);
vertex(begX + 325, begY);
vertex(begX + 300, begY);
vertex(begX + 300, begY + 100);
vertex(begX + 225, begY + 100);
vertex(begX + 225, begY);
endShape(CLOSE);


fill (0, 0, 200, 200);

rect (begX + 112.5, begY + 35, 25/2, 65);

fill (0, 0, 100, 100);

rect (begX + 100, begY + 25, 25, 75);



