
size(300, 300);
background(190, 209, 245);
noStroke();
int a = -2;
int b = 1;
println(a + " " + b);
a = a + 3;
println(a);
b = b * b;
println(b);
float c = a + 1.2;
println(c);
float d = b * 2.3;
println(d);

float shapeWidth = (width / 6);
fill(0, 230);  //black square
rect((width / 2) - (shapeWidth * 2), (height / 2) - (shapeWidth * 2), (shapeWidth * 4),  (shapeWidth * 4));
fill(255);  //white square
rect((width / 2) - shapeWidth, (height / 2) - shapeWidth, (shapeWidth * 2),  (shapeWidth * 2));
fill(#F2E818);  //yellow arc
arc(width / 2, height / 2, (shapeWidth * 2),  (shapeWidth * 2), radians(-30), radians(100));
fill(#65D869);  //green arc
arc(width / 2, height / 2, (shapeWidth * 2),  (shapeWidth * 2), radians(85), radians(200));
fill(#F71500);  //red arc
arc(width / 2, height / 2, (shapeWidth * 2),  (shapeWidth * 2), radians(-160), radians(-20));
fill(#598FD1);
stroke(255);
strokeWeight(3);
ellipse(width / 2, height / 2, width / 6, height / 6);


