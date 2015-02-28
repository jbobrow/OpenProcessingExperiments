
{
background(120,180,100);
size(500,300);
}
//triangle(55, 75, 58, 20, 150, 50);
{
beginShape(TRIANGLES);
//triangle ONE
vertex(200, 50); //point one
vertex(100, 20); //point two
vertex(100, 75);  //point three
//triangle TWO +100
vertex(300, 150); //point one
vertex(200, 120); //point two
vertex(200, 175);  //point three
//triangle THREE +200
vertex(400, 250); //point one
vertex(300, 220); //point two
vertex(300, 275);  //point three
endShape();
line(100, 500, 100, 20);
line(200, 300, 200, 160);
line(300, 1000, 300, 250);
}
//triangle ONE
{
fill(250, 0, 250);
beginShape();
vertex(200, 50); 
vertex(100, 20); 
vertex(100, 75); 
vertex(100, 30);
endShape();
fill(250, 0, 250);
beginShape();
vertex(200, 50); 
vertex(100, 45); 
vertex(100, 55); 
endShape();
fill(250, 0, 250);
beginShape();
vertex(200, 50); 
vertex(100, 80); 
vertex(100, 70); 
endShape();
}
//triangle TWO
{
fill(250, 0, 0);
beginShape();
vertex(300, 150); 
vertex(200, 115); 
vertex(200, 125); 
endShape();
fill(250, 0, 0);
beginShape();
vertex(300, 150); 
vertex(200, 140); 
vertex(200, 150); 
endShape();
fill(250, 0, 0);
beginShape();
vertex(300, 150); 
vertex(200, 165); 
vertex(200, 175); 
endShape();
}
//triangle THREE
{
fill(0,150,150);
beginShape();
vertex(400, 250); 
vertex(300, 220); 
vertex(300, 230);  
endShape();
fill(0,150,150);
beginShape();
vertex(400, 250); 
vertex(300, 245); 
vertex(300, 255); 
endShape();
fill(0,150,150);
beginShape();
vertex(400, 250); 
vertex(300, 270); 
vertex(300, 280); 
endShape();
}
beginShape(TRIANGLES);
//triangle 4 +20
fill(250);
vertex(220, 70); //point one
vertex(120, 40); //point two
vertex(120, 95);  //point three
//triangle 5 +120
vertex(320, 170); //point one
vertex(220, 140); //point two
vertex(220, 195);  //point three
//triangle 6 +220
vertex(420, 270); //point one
vertex(320, 240); //point two
vertex(320, 295);  //point three
endShape();
line(120, 520, 120, 40);
//triangle 4
{
fill(0,150,100);
beginShape();
vertex(220, 70); 
vertex(120, 40); 
vertex(120, 95); 
vertex(120, 50);
endShape();
fill(0,150,100);
beginShape();
vertex(220, 70); 
vertex(120, 65); 
vertex(120, 75); 
endShape();
fill(0,150,100);
beginShape();
vertex(220, 70); 
vertex(120, 100); 
vertex(120, 90); 
endShape();
}
//triangle 5
{
fill(200, 100, 0);
beginShape();
vertex(320, 170); 
vertex(220, 135); 
vertex(220, 145); 
endShape();
fill(200, 100, 0);
beginShape();
vertex(320, 170); 
vertex(220, 160); 
vertex(220, 170); 
endShape();
fill(200, 100, 0);
beginShape();
vertex(320, 170); 
vertex(220, 185); 
vertex(220, 195); 
endShape();
}
line(220, 320, 220, 180);
//triangle 6
{
fill(255, 204, 0);
beginShape();
vertex(420, 270); 
vertex(320, 240); 
vertex(320, 250);  
endShape();
fill(255, 204, 0);
beginShape();
vertex(420, 270); 
vertex(320, 265); 
vertex(320, 275); 
endShape();
fill(255, 204, 0);
beginShape();
vertex(420, 270); 
vertex(320, 290); 
vertex(320, 300); 
endShape();
}
line(320, 1020, 320, 270);

