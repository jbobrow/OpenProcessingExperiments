
size(250, 250);
smooth();
background(220,0);
noFill();

for (int i=30; i<100; i+=10){
stroke(28, 20, 19);
 bezier(0, i-130, 10, 30, 200, i, 220, i-40);
}

for (int i=50; i<100; i+=10){
stroke(28, 20, 19);
bezier(40, i-200, 10, 50, 100, i, 220, i-50);
}




fill(180, 20, 0);
smooth();
noStroke();
triangle(10, 240, 240, 240, 138, 60);

noFill();
triangle(8, 230, 230, 230, 130, 45);
triangle(6, 220, 220, 220, 128, 44);
triangle(20, 235, 234, 234, 140, 50);
triangle(30, 240, 240, 240, 150, 43);
//triangles in the middle of the red triangle

fill(255);
noStroke();
smooth();
//triangle( 130, 180, 60, 160, 140, 130); 
ellipse(130, 180, 80,80);


stroke(.5);
smooth();
ellipse(130, 180, 75, 75);
ellipse(130, 180, 60, 60);
ellipse(130, 180, 65, 65);
ellipse(130, 180, 50, 50);
ellipse(130, 180, 45, 45);
ellipse(130, 180, 40, 40);
ellipse(130, 180, 35, 35);
ellipse(130, 180, 30, 30);
ellipse(130, 180, 25, 25);



