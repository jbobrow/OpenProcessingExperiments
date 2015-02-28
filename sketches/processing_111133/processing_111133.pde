
import processing.pdf.*;

void setup() {size (640,480);
}
void draw() {
background (170,204,255);

fill(0,170,212); //mar
rect(-1,390,649,82);

fill(205,222,135); //grama
rect(-1,401,649,82);

fill(230);//calçada
beginShape();
vertex(-19, 456);
vertex(233, 452);
vertex(177, 472);
vertex(359,471);
vertex(644,479);
vertex(644,453);
vertex(466,453);
vertex(520,444);
vertex(511,418);
vertex(377,414);
vertex(441,429);
vertex(384,449);
vertex(268,456);
vertex(274,433);
vertex(-20,433);
endShape(CLOSE);


//prédio, de cima pra baixo
fill(255);
rect(153+mouseX*0.2,117,336,25);
rect(52-mouseY*-0.1,142,459,25);
rect(85-mouseY*-0.1,167,445,25);
rect(66+mouseX*0.2,190,445,25);
rect(188-mouseY*-0.1,211,336,25);
rect(152+mouseY*0.2,236,336,25);
rect(161+mouseX*0.1,260,405,25);
rect(135-mouseY*0.1,284,405,25);
rect(166-mouseX*0.1,309,316,25);
rect(155-mouseY*0.1,332,316,25);
rect(173,357,316,25);
rect(128,382,316,25);

quad(129,389,322,413,389,415,129,380);


{ //árvore
noFill();
beginShape();
vertex(43, 471);
vertex(33, 348);
vertex(66, 250);
endShape();

beginShape();
vertex(96, 298);
vertex(92, 253);
vertex(73, 240);
vertex(71, 258);
endShape(CLOSE);

beginShape();
vertex(96, 298);
vertex(92, 253);
vertex(73, 240);
vertex(71, 258);
endShape(CLOSE);

beginShape();
vertex(136, 269);
vertex(105, 226);
vertex(78, 239);
vertex(96, 242);
endShape(CLOSE);

beginShape();
vertex(75, 235);
vertex(101, 215);
vertex(87, 197);
vertex(68, 210);
endShape(CLOSE);

beginShape();
vertex(72, 238);
vertex(45, 199);
vertex(-3, 247);
vertex(31, 222);
endShape(CLOSE);

beginShape();
vertex(2, 285);
vertex(70, 240);
vertex(42, 232);
endShape(CLOSE);
}


fill(150);//pessoa1
beginShape();
vertex(530, 430);
vertex(534, 422);
vertex(530, 413);
vertex(536,410);
vertex(531,410);
vertex(529,406);
vertex(531,405);
vertex(529,400);
vertex(526,403);
vertex(527,406);
vertex(523,419);
vertex(527,411);
vertex(527,422);
vertex(528,431);
vertex(529,419);
vertex(531,422);
endShape(CLOSE);

fill(150);//pessoa2
beginShape();
vertex(543, 429);
vertex(543, 417);
vertex(545, 429);
vertex(546,421);
vertex(545,410);
vertex(550,418);
vertex(545,404);
vertex(546,401);
vertex(544,398);
vertex(541,403);
vertex(543,405);
vertex(539,418);
vertex(542,411);
endShape(CLOSE);


 { translate(540, 60); //árvore 2
scale(0.75);

noFill();
beginShape();
vertex(43, 471);
vertex(33, 348);
vertex(66, 250);
endShape();

beginShape();
vertex(96, 298);
vertex(92, 253);
vertex(73, 240);
vertex(71, 258);
endShape(CLOSE);

beginShape();
vertex(96, 298);
vertex(92, 253);
vertex(73, 240);
vertex(71, 258);
endShape(CLOSE);

beginShape();
vertex(136, 269);
vertex(105, 226);
vertex(78, 239);
vertex(96, 242);
endShape(CLOSE);

beginShape();
vertex(75, 235);
vertex(101, 215);
vertex(87, 197);
vertex(68, 210);
endShape(CLOSE);

beginShape();
vertex(72, 238);
vertex(45, 199);
vertex(-3, 247);
vertex(31, 222);
endShape(CLOSE);

beginShape();
vertex(2, 285);
vertex(70, 240);
vertex(42, 232);
endShape(CLOSE);
}}
