
size(400,400);
smooth();


strokeJoin(ROUND);
line(143,140,143,176);
line(127,136,127,172);
//body
strokeJoin(ROUND);
beginShape();
vertex(125,120);
vertex(145,130);
vertex(145,170);
vertex(125,165);
endShape(CLOSE);
//balck part
beginShape();
vertex(120,120);
vertex(150,130);
vertex(150,160);
vertex(120,155);
endShape(CLOSE);
//arms
strokeJoin(ROUND);
line(150,150,157,162);
line(125,140,115,157);
//papper box head
beginShape();
vertex(93,140);
vertex(93,50);
vertex(130,40);
vertex(195,50);
vertex(195,140);
vertex(158,150);
endShape(CLOSE);
line(93,50,158,60);
line(158,60,195,50);
line(158,60,158,150);
//black eyes
ellipse(107,101,22,22);//left eye
ellipse(142,105,22,22);//right eye
//eye line

line(100,100,115,102);
line(135,104,150,106);


