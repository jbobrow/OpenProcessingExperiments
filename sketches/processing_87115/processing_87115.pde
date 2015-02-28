
size(600, 600);
smooth(); 
background(56, 6, 36); //purple
fill(235, 227, 123); 
for (int y = 0; y <= height; y += 40) {
  for (int x = 0; x <= width; x += 40) {
    fill(30, 156, 104) ;
    ellipse(x, y, 80, 40);
  }
}
fill(255, 121, 139);
strokeWeight(2);
rect(350, 100, 80, 100); //hair
strokeWeight(5);
fill(235, 227, 123);
triangle(425, 10, 400, 100, 450, 100); //horn
strokeWeight(7);
fill(255, 121, 139);
strokeWeight(2);
rect(400, 75, 75, 25); //hairbangs
strokeJoin(BEVEL);
fill(255);
rect(400, 100, 150, 150); //head
rect(350, 50, 50, 50); //ear
fill(0); 
rect(475, 150, 25, 25); //eye
fill(255, 121, 139);
strokeWeight(2);
rect(75, 125, 75, 75); //tail
fill(255); 
beginShape();
vertex(250, 400);
vertex(150, 400);
vertex(150, 200);
vertex(400, 200);
vertex(400, 400);
vertex(300, 400);
vertex(300, 325); 
vertex(250, 325);
vertex(250, 400); 
endShape(); 
fill(235, 227, 123);
strokeWeight(5);
triangle(175, 400, 250, 400, 250, 350); //backfoot
fill(235, 227, 123);
strokeWeight(5);
triangle(325, 400, 400, 400, 400, 350); //frontfoot







