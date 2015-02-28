
size (500, 300);
noStroke();

fill(255,255,255);
rect(0,0,500,300);

fill(255,0,0);
//straight red bars
rect(0,125,500,50);
rect(225,0,50,300);

//red streak
//top left 
beginShape();
vertex(0,0);
vertex(0,25);
vertex(115,110);
vertex(150,110);
endShape();
//bottom left
beginShape();
vertex(0,300);
vertex(35,300);
vertex(185,190);
vertex(150,190);
endShape();
//bottom right
beginShape();
vertex(500,300);
vertex(500, 278);
vertex( 380,190);
vertex( 350,190);
endShape();



//top right
beginShape();
vertex(500,0);
vertex(465, 0);
vertex( 315,110);
vertex( 345,110);

endShape();







//bluetriangels
//top left 
fill(0,0,255);
triangle(0,35, 0,110, 100,110);
triangle(55, 0, 210, 0, 210, 110);
//bottom left
triangle(0,190, 0,265, 110,190);
triangle(55, 300, 210, 300, 210, 190);
//top right
triangle(500,35, 500,110, 400,110);
triangle(445, 0, 290, 0, 290, 110);
//bottom right
triangle(500,265, 500,190, 400,190);
triangle(445, 300, 290, 300, 290, 190);
