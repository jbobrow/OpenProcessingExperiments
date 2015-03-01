
//gluggastærð
size(200,400); 

//bakgrunnur (rgb)
background(255,255,128); 

//lína (upphafshnit, endahnit)
line(0,0, 100,200);

//rauð lína
stroke(255,0,0);
line(5,200, 111,222);

//þykk lína (líka rauð..)
strokeWeight(4);
line(10,333, 200, 380);  

//sporyskja
stroke(128,255,0);
strokeWeight(1);
ellipse(150,60, 33,55);

//blár hringur
fill(0,0,188);
ellipse(150,150,44,44);

//þríhyrningur
triangle(150,222, 150,260, 190,244);

//bleikur ferhyrningur, án útlínu
fill(255,0,255);
noStroke();
rect(111,300, 30,50);

//svartur ferningur, svört útlína án "fill" litar
noFill();
stroke(0);  //þrjár tölur = RGB   ..  ein tala = svarthvítt
rect(161,300, 30,30);

