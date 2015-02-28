
size (500, 500);
background(160, 114, 27);
smooth();

fill(232, 232, 138);
rect(width*.4, height*.8, width*.2, height*.2);//neck
ellipse(width/2, height*.45, 380, 280); //head
beginShape();//chin
curveVertex(width*.18, height*.65);
curveVertex(width*.18, height*.65);
curveVertex(width*.35, height*.87);
curveVertex(width*.65, height*.87);
curveVertex(width*.82, height*.65);
curveVertex(width*.82, height*.65);
endShape();

//cheeks
arc (width*.72, height*.55, 200, 120, radians(-30), radians(65));//right
arc (width*.28, height*.55, 200, 120, radians(115), radians(210));//left

//mask
fill(83, 167, 99);
beginShape();
curveVertex(width*.18, height*.5);
curveVertex(width*.18, height*.5);
curveVertex(width*.3, height*.29);
curveVertex(width*.7, height*.29);
curveVertex(width*.82, height*.5);
curveVertex(width*.85, height*.58);//right cheek
curveVertex(width*.82, height*.64);
curveVertex(width*.78, height*.68);
curveVertex(width*.7, height*.8);
curveVertex(width*.63, height*.87);
curveVertex(width*.5, height*.89);//chin
curveVertex(width*.37, height*.87);
curveVertex(width*.3, height*.8);
curveVertex(width*.22, height*.68);
curveVertex(width*.18, height*.64);
curveVertex(width*.15, height*.58);//left cheek
curveVertex(width*.18, height*.5);
curveVertex(width*.18, height*.5);
endShape();

noFill();
float c=.64;
beginShape();//innerchin
curveVertex(width*.23, height*c);
curveVertex(width*.23, height*c);
curveVertex(width*.27, height*.68);
curveVertex(width*.38, height*.86);
curveVertex(width*.62, height*.86);
curveVertex(width*.73, height*.68);
curveVertex(width*.77, height*c);
curveVertex(width*.77, height*c);
endShape();

//eyeholes
fill(232, 232, 138);
beginShape();//right
curveVertex(width*.62, height*.37);
curveVertex(width*.62, height*.37);
curveVertex(width*.75, height*.39);
curveVertex(width*.78, height*.45);
curveVertex(width*.74, height*.53);
curveVertex(width*.6, height*.54);
curveVertex(width*.55, height*.5);
curveVertex(width*.53, height*.42);
curveVertex(width*.56, height*.38);
curveVertex(width*.62, height*.37);
curveVertex(width*.62, height*.37);
endShape();
beginShape();//left
curveVertex(width*(1-.62), height*.37);
curveVertex(width*(1-.62), height*.37);
curveVertex(width*(1-.75), height*.39);
curveVertex(width*(1-.78), height*.45);
curveVertex(width*(1-.74), height*.53);
curveVertex(width*(1-.6), height*.54);
curveVertex(width*(1-.55), height*.5);
curveVertex(width*(1-.53), height*.42);
curveVertex(width*(1-.56), height*.38);
curveVertex(width*(1-.62), height*.37);
curveVertex(width*(1-.62), height*.37);
endShape();

//eyes
//right
fill(44, 32, 11);//dark brown
arc(width*.64, height*.41, 130, 50, radians(51), radians(118));//bottom
fill(232, 232, 138);
noStroke();
arc(width*.73, height*.4, 100, 50, radians(70), radians(170));//right color fill
stroke(1);
arc(width*.73, height*.4, 100, 50, radians(72), radians(160));//right line
arc(width*.54, height*.4, 100, 60, radians(15), radians(65));//left
//left
fill(44, 32, 11);//dark brown
arc(width*.36, height*.41, 130, 50, radians(62), radians(129));//bottom
fill(232, 232, 138);
noStroke();
arc(width*.27, height*.4, 100, 50, radians(10), radians(95));//left color fill
stroke(1);
arc(width*.27, height*.4, 100, 50, radians(180-160), radians(180-72));//left line
arc(width*.46, height*.4, 100, 60, radians(115), radians(165));//right

//eye wrinkles
noFill();
//right
beginShape();//upper left brow
curveVertex(width*.57, height*.44);
curveVertex(width*.57, height*.44);
curveVertex(width*.57, height*.42);
curveVertex(width*.54, height*.39);
curveVertex(width*.54, height*.36);
curveVertex(width*.54, height*.36);
endShape();
beginShape();//upper right brow
curveVertex(width*.58, height*.44);
curveVertex(width*.58, height*.44);
curveVertex(width*.58, height*.42);
curveVertex(width*.61, height*.39);
curveVertex(width*.62, height*.36);
curveVertex(width*.62, height*.36);
endShape();
arc(width*.74, height*.39, 100, 50, radians(95), radians(170));//right concentric
line(width*.64, height*.38, width*.66, height*.36);
line(width*.67, height*.37, width*.68, height*.36);
line(width*.68, height*.39, width*.72, height*.37);
arc(width*.73, height*.39, 40, 50, radians(15), radians(90));//right con up
line(width*.77, height*.43, width*.78, height*.41);
arc(width*.76, height*.4, 30, 45, radians(20), radians(77));
arc(width*.62, height*.45, 35, 37, radians(200), radians(300));//left hook
line(width*.57, height*.44, width*.57, height*.46);//bridge
beginShape();//under left
curveVertex(width*.59, height*.47);
curveVertex(width*.59, height*.47);
curveVertex(width*.6, height*.47);
curveVertex(width*.62, height*.49);
curveVertex(width*.65, height*.5);
curveVertex(width*.65, height*.5);
endShape();
arc(width*.64, height*.42, 115, 55, radians(34), radians(100));//bottom con
beginShape();//under right
curveVertex(width*.66, height*.48);
curveVertex(width*.66, height*.48);
curveVertex(width*.68, height*.48);
curveVertex(width*.71, height*.48);
curveVertex(width*.74, height*.5);
curveVertex(width*.74, height*.5);
endShape();
line(width*.73,height*.48, width*.77,height*.51);


noFill();
//left eye wrinkles
beginShape();//upper right brow
curveVertex(width*(1-.57), height*.44);
curveVertex(width*(1-.57), height*.44);
curveVertex(width*(1-.57), height*.42);
curveVertex(width*(1-.54), height*.39);
curveVertex(width*(1-.54), height*.36);
curveVertex(width*(1-.54), height*.36);
endShape();
beginShape();//upper left brow
curveVertex(width*(1-.58), height*.44);
curveVertex(width*(1-.58), height*.44);
curveVertex(width*(1-.58), height*.42);
curveVertex(width*(1-.61), height*.39);
curveVertex(width*(1-.62), height*.36);
curveVertex(width*(1-.62), height*.36);
endShape();
arc(width*(1-.74), height*.39, 100, 50, radians(10), radians(85));//leftconcentric
line(width*(1-.64), height*.38, width*(1-.66), height*.36);
line(width*(1-.67), height*.37, width*(1-.68), height*.36);
line(width*(1-.68), height*.39, width*(1-.72), height*.37);
arc(width*(1-.73), height*.39, 40, 50, radians(90), radians(180-15));//left con up
line(width*(1-.77), height*.43, width*(1-.78), height*.41);
arc(width*(1-.76), height*.4, 30, 45, radians(180-77), radians(180-20));
arc(width*(1-.62), height*.45, 35, 37, radians(180-300), radians(180-200));//right hook
line(width*(1-.57), height*.44, width*(1-.57), height*.46);//bridge
beginShape();//under right
curveVertex(width*(1-.59), height*.47);
curveVertex(width*(1-.59), height*.47);
curveVertex(width*(1-.6), height*.47);
curveVertex(width*(1-.62), height*.49);
curveVertex(width*(1-.65), height*.5);
curveVertex(width*(1-.65), height*.5);
endShape();
arc(width*(1-.64), height*.42, 115, 55, radians(180-100), radians(180-34));//bottom con
beginShape();//under left
curveVertex(width*(1-.66), height*.48);
curveVertex(width*(1-.66), height*.48);
curveVertex(width*(1-.68), height*.48);
curveVertex(width*(1-.71), height*.48);
curveVertex(width*(1-.74), height*.5);
curveVertex(width*(1-.74), height*.5);
endShape();
line(width*(1-.73),height*.48, width*(1-.77),height*.51);

//nose
fill(232, 232, 138);
beginShape();
curveVertex(width*.5, height*.565);
curveVertex(width*.5, height*.565);
curveVertex(width*.54, height*.56);
curveVertex(width*.54, height*.6);
curveVertex(width*.46, height*.6);
curveVertex(width*.46, height*.56);
curveVertex(width*.5, height*.565);
curveVertex(width*.5, height*.565);
endShape();
fill(44, 32, 11);//black
ellipse(width*.48, height*.58, 12, 8);//left
ellipse(width*.52, height*.58, 12, 8);//right

//cheek wrinkles
noFill();
beginShape();//nose to mouth right
curveVertex(width*.57, height*.57);
curveVertex(width*.57, height*.57);
curveVertex(width*.64, height*.66);
curveVertex(width*.64, height*.71);
curveVertex(width*.64, height*.71);
endShape();
beginShape();//right2
curveVertex(width*.64, height*.73);
curveVertex(width*.64, height*.73);
curveVertex(width*.66, height*.67);
curveVertex(width*.68, height*.65);
curveVertex(width*.68, height*.65);
endShape();
beginShape();//right3
curveVertex(width*.63, height*.84);
curveVertex(width*.63, height*.84);
curveVertex(width*.66, height*.8);
curveVertex(width*.7, height*.69);
curveVertex(width*.74, height*.65);
curveVertex(width*.74, height*.65);
endShape();
beginShape();//nose to mouth left
curveVertex(width*(1-.57), height*.57);
curveVertex(width*(1-.57), height*.57);
curveVertex(width*(1-.64), height*.66);
curveVertex(width*(1-.64), height*.71);
curveVertex(width*(1-.64), height*.71);
endShape();
beginShape();//left2
curveVertex(width*(1-.64), height*.73);
curveVertex(width*(1-.64), height*.73);
curveVertex(width*(1-.66), height*.67);
curveVertex(width*(1-.68), height*.65);
curveVertex(width*(1-.68), height*.65);
endShape();
beginShape();//left3
curveVertex(width*(1-.63), height*.84);
curveVertex(width*(1-.63), height*.84);
curveVertex(width*(1-.66), height*.8);
curveVertex(width*(1-.7), height*.69);
curveVertex(width*(1-.74), height*.65);
curveVertex(width*(1-.74), height*.65);
endShape();

//mouth hole
fill(232, 232, 138);
beginShape();
curveVertex(width*.5, height*.62);
curveVertex(width*.5, height*.62);
curveVertex(width*.55, height*.62);
curveVertex(width*.64, height*.67);
curveVertex(width*.59, height*.76);
curveVertex(width*.5, height*.78);//bottom
curveVertex(width*(1-.59), height*.76);
curveVertex(width*(1-.64), height*.67);
curveVertex(width*(1-.55), height*.62);
curveVertex(width*.5, height*.62);
curveVertex(width*.5, height*.62);
endShape();

//mouth
fill(188, 129, 162);
triangle(227, 315, 273, 315, 250, 335);//top lip center
arc(width*.55, height*.69, 190, 70, radians(200), radians(240));//left tp
arc(width*.45, height*.69, 190, 70, radians(300), radians(340));//right top
fill(44, 32, 11);//dark brown
beginShape();//color fill upper
vertex(230, 322);
vertex(250, 324);
vertex(270, 322);
vertex(250, 340);
endShape(CLOSE);
arc(width*.57, height*.695, 220, 60, radians(205), radians(240));//left top2
arc(width*.43, height*.695, 220, 60, radians(300), radians(335));//right top2
fill(188, 129, 162);
beginShape();//bottom outer
curveVertex(width*.63, height*.67);
curveVertex(width*.63, height*.67);
curveVertex(width*.57, height*.76);
curveVertex(width*.43, height*.76);
curveVertex(width*.37, height*.67);
curveVertex(width*.37, height*.67);
endShape();
fill(44, 32, 11);//dark brown
beginShape();//bottom inner
curveVertex(width*.63, height*.67);
curveVertex(width*.63, height*.67);
curveVertex(width*.57, height*.74);
curveVertex(width*.43, height*.74);
curveVertex(width*.37, height*.67);
curveVertex(width*.37, height*.67);
endShape();

//rollers
stroke(0);
strokeWeight(1);
int r=84;
fill(245,156,240);//pink
ellipse(width*.26, height*.16, r, r);//left1
fill(103,255,193);//blue
ellipse(width*.15, height*.29, r, r);//left2
fill(255,250,100);//yellow
ellipse(width*.09, height*.45, r, r);//left3
fill(103,255,193);//blue
ellipse(width*.74, height*.16, r, r);//right1
fill(255,250,100);//yellow
ellipse(width*.85, height*.29, r, r);//right2
fill(245,156,240);//pink
ellipse(width*.91, height*.45, r, r);//right3
fill(245,156,240);//pink
quad(width*.36, height*.05, width*.64, height*.05, width*.64, height*.2, width*.36, height*.2);//top2
fill(255,250,100);//yellow
quad(width*.35, height*.08, width*.65, height*.08, width*.65, height*.25, width*.35, height*.25);//top1

/*
for (int a=0; a<width; a=a+width/10) {
 line (a, 0, a, 500);
 }//vertical
 for (int b=0; b<height; b=b+50) {
 line (0, b, 500, b);
 }//horizontal
*/            
                
