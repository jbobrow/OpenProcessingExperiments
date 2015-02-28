
size(200,200);

int x = 50;
int y = 50;

rect(50,50,80,40);
triangle(37,20,29,40,45,35);
triangle(55,25,50,60,70,40);


beginShape();
vertex(29,30);
vertex(30,70);
vertex(45,75);
vertex(70,40);
endShape(CLOSE);

ellipse(36,44,3,3);
ellipse(54,49,3,3);

rect(50,90,5,30);
rect(60,90,5,20);
rect(105,90,5,30);
rect(115,90,5,20);

line(130,50,160,70);
triangle(150,70,155,60,160,70);

smooth();
ellipse(70,75,18,18);
ellipse(93,62,18,18);
ellipse(112,77,18,18);
noSmooth();

