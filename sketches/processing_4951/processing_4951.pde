
size(320, 480);
background(#FCFABE);
//body part 1
smooth();
fill(#213051);
noStroke();
int x;
x = 60;
println(x);
quad(x, 190, x+40, 160, x+190, 160 ,x+159, 190);
//body part 2
fill(#485C99);
quad(x, 190, x, 360, x+159, 360, x+160, 190);
//body part 3
fill(#6D8AC3);
quad(x+159, 190, x+190, 160, x+190, 290, x+159, 360);
//LCD on body
fill(#CAD1D8);
quad(80, 210, 80, 275, 199, 275, 199, 210);
//white graph on the LCD
stroke(#F3F8FD);
strokeWeight(6);
strokeCap(SQUARE); 
beginShape();
vertex(83, 259);
vertex(97, 230);
vertex(105, 257);
vertex(130, 216);
vertex(153, 257);
vertex(163, 247);
vertex(173, 268);
vertex(196, 213);
endShape();
//left arm
fill(#3C5180);
noStroke();
bezier(18, 275, 14, 295, 22, 299, 35, 295);
quad(60, 210, 18, 275, 35, 295, 60, 260);
//right arm
quad(239, 210, 288, 275, 271, 295, 230,241 );
bezier(239, 210, 233, 207, 231, 207, 230, 241);
bezier(288, 275, 288, 277, 286, 295, 271, 295);
//left leg
beginShape();
beginShape();
int y= 100;
quad(y, 360, y, 413, y+27, 413,y+32, 360); 
bezier(y, 413, y+11, 430, y+17, 430, y+27, 413);
//right leg
y= y+59;
quad(y, 360, y+3, 413, y+30, 413,y+31, 360); 
bezier(y+3, 413, y+11, 430, y+17, 430, y+30, 413);

//robot's head
fill(#8182C7);
smooth();
noStroke();
int z=91;
quad(z, 181, z, 91, z+90, 91, z+90, 181);//front
fill(#ADB9DE);
quad(z, 91, z+25, 64,z+110, 64, z+90, 91);//top
fill(#485C99);
quad(z+110, 64, z+90, 91, z+90, 181, z+110, z+45);//side
//facial expression
stroke(0);
strokeWeight(9);
strokeCap(SQUARE);
smooth();
line(z+18, 109, z+18, 131);
z = z+52;
line(z+18, 109, z+18, 131);//eyes
stroke(#F9C5CE);
strokeCap(SQUARE);
smooth();
noFill();
bezier(104, 141, 104, 182, 166, 182, 166, 141); 
//balloon
stroke(#F9E25A);
beginShape();
vertex(269, 110);
bezierVertex(243, 150, 233, 150,268, 182); 
bezierVertex(310, 230, 308, 238, 273, 283);
endShape();
smooth();
noStroke();
fill(#A4DAD4);
triangle(253,120, 276, 120,269, 95);
ellipse(269, 45, 100, 110);
noStroke();
fill(255, 100);
beginShape();
bezier(290, 10, 310, 17, 320, 48, 275, 84);
bezier(290, 10, 300, 15, 310, 43, 275, 84);
endShape();





