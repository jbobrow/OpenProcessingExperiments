
size(300,300);
background(200);
smooth();
triangle(132,80,130,50,140,80);
triangle(168,80,170,50,160,80);
println("ears");
fill(215,215,215);
beginShape();
vertex(120,150);
vertex(75,120);
vertex(mouseX,mouseY);
vertex(70,150);
vertex(50,200);
endShape(CLOSE);
fill(215,215,215);
beginShape();
vertex(180,150);
vertex(225,120);
vertex(250,160);
vertex(230,150);
vertex(250,200);
endShape(CLOSE);
fill(110,77,57);
ellipse(150,200,120,150);
println("belly");
ellipse(150,100,80,70);
println("head1");
fill(110,77,57,50);
ellipse(150,100,65,50);
println("head2");
fill(17,17,17);
ellipse(132,92,10,10);
ellipse(168,92,10,10);
println("eyes");
fill(83,71,55);
ellipse(150,100,10,30);
println("nose");
ellipse(150,200,90,120);
println("belly2");

