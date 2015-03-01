
size(400,550); //canvas size
fill(#191970,150); //Midnight Blue background color
rect(0,0,450,250); //Transparency rectangle
line(0,250,400,250); //Horizon Line
beginShape(); //starting biggest mountain shape
vertex(100,250);
vertex(200,150);
vertex(300,250);
endShape();
beginShape(); //left mountain
vertex(50,250);
vertex(100,150);
vertex(150,200);
vertex(100,250);
vertex(50,250);
endShape();
beginShape(); //right mountain
vertex(250,200);
vertex(300,100);
vertex(343,165);
vertex(300,250);
vertex(250,200);
endShape();
beginShape(); //Farther right mountain
vertex(300,250);
vertex(350,150);
vertex(400,250);
endShape();
fill(255);
ellipse(150,100,40,40); //Moon
fill(0,26,100); //Dark Blue river color
beginShape(); //River
strokeJoin(ROUND); //Round edges
vertex(150,550);
vertex(200,350);
vertex(170,250);
vertex(200,250);
vertex(250,350);
vertex(300,550);
endShape();
beginShape();//Left side of river; Grass layout
fill(#174038,200); //Masters Jacket (Green)
vertex(0,250);
vertex(170,250);
vertex(200,350);
vertex(150,550);
vertex(0,550);
endShape();
beginShape(); //Right side of river; Grass layout
vertex(200,250);
vertex(400,250);
vertex(400,550);
vertex(300,550);
vertex(250,350);
vertex(200,250);
endShape();

