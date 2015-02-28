
size(400,600);
background(255);

int pointeTriangle=80;
pointeTriangle=80;

int baseForme1=130;
baseForme1=130;
//création de formes simples
//TRIANGLE


//forme 1
noFill();
stroke(0);
strokeWeight(2);
line(80,50,80,105);
line(80,105,130,130);
line(80,105,30,130);


//forme2
fill(0);
translate(140,0);
line(80,50,80,105);
line(80,105,30,130);
line(30,130,80,50);

//forme3
fill(0);
translate(-140,140);
line(80,50,80,105);
line(130,130,30,130);
line(80,50,130,130);
line(130,130,30,130);
line(130,130,30,130);


//forme 4 
fill(0);
translate(140,0);
line(80,105,130,130);
line(30,130,80,50);
line(80,105,30,130);

//forme5
fill(0);
translate(-140,140);
line(80,105,130,130);
line(130,130,30,130);
line(130,130,30,130);
line(80,105,30,130);

//forme6
fill(0);
translate(140,0);
line(80,50,80,105);
line(80,50,130,130);
line(30,130,80,50);

//forme7
fill(0);
translate(-140,140);
line(80,50,80,105);
line(80,105,130,130);
line(30,130,80,50);

//forme8
fill(0);
translate(140,0);
line(80,105,130,130);
line(30,130,80,105);
line(30,130,80,50);
line(80,50,130,130);




