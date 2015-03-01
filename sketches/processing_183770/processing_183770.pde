
//alex's robot
size(500,480);
smooth();
strokeWeight(2);
background(255,178,77);
ellipseMode(RADIUS);

//neck parts

stroke(60);
line(266,257,266,162);
line(276,257,276,162);
line(286,257,286,162);

//antennae
strokeWeight(4);
stroke(60);
line(276,155,246,112);
line(276,155,306,56);
line(276,155,342,170);

//body
noStroke();
fill(23,0,232);
ellipse(264,377,33,33);
fill(32);
rect(219,257,90,120);
fill(23,218,232);
rect(219,274,90,6);

//head
fill(32);
ellipse(276,155,45,45);
fill(255);
ellipse(288,150,14,14);
fill(0);
ellipse(292,158,3,3);
fill(23,218,232);
ellipse(263,148,5,5);
ellipse(296,130,4,4);
ellipse(305,162,3,3);

