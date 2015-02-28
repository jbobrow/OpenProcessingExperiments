
//general
size(400, 600); 
smooth(); 
strokeWeight(2); 
background(255,255,255);


//body
fill(55,55,72);
beginShape();
vertex(100,170);
vertex(170,110);
vertex(350,110);
vertex(290,170);
vertex(100,170);
vertex(100,370);
vertex(290,370);
vertex(290,170);
vertex(350,110);
vertex(350,320);
vertex(290,370);
vertex(290,170);
vertex(100,170);
endShape();



//buttons
fill(0,255,0);
rect(190,200,20,20);
rect(190,240,20,20);
rect(150,240,20,20);
rect(230,240,20,20);
rect(190,280,20,20);
rect(150,280,20,20);
rect(230,280,20,20);
rect(190,320,20,20);

rect(192,202,16,16);
rect(192,242,16,16);
rect(152,242,16,16);
rect(232,242,16,16);
rect(192,282,16,16);
rect(152,282,16,16);
rect(232,282,16,16);
rect(192,322,16,16);

//face
fill(109,113,124);
beginShape();
vertex(150,50);
vertex(250,50);
vertex(250,150);
vertex(150,150);
vertex(150,50);
vertex(170,30);
vertex(270,30);
vertex(250,50);
vertex(270,30);
vertex(270,130);
vertex(250,150);
vertex(250,50);
vertex(150,50);
endShape();

//eyes
fill(0,0,255);
rect(170,70,20,20);
rect(172,72,16,16);
rect(210,70,20,20);
rect(212,72,16,16);

//mouth
fill(255,255,255);
rect(170,120,60,20);
line(170,130,230,130);
line(180,120,180,140);
line(190,120,190,140);
line(200,120,200,140);
line(210,120,210,140);
line(220,120,220,140);

//leg 1
fill(109,113,124);
rect(140,370,50,130);
line(140,430,190,430);
line(140,490,190,490);
beginShape();
vertex(190,370);
vertex(200,370);
vertex(200,420);
vertex(190,430);
vertex(190,370);
vertex(190,490);
vertex(200,480);
vertex(200,490);
vertex(190,500);
vertex(200,490);
vertex(200,370);
vertex(190,370);
endShape();

//leg 2
fill(109,113,124);
rect(210,370,50,130);
line(210,430,260,430);
line(210,490,260,490);
beginShape();
vertex(260,370);
vertex(270,370);
vertex(270,420);
vertex(260,430);
vertex(260,370);
vertex(260,490);
vertex(270,480);
vertex(270,490);
vertex(260,500);
vertex(270,490);
vertex(270,370);
vertex(260,370);
endShape();

//arm
fill(109,113,124);
beginShape();
vertex(310,190);
vertex(330,170);
vertex(350,170);
vertex(310,210);
vertex(350,170);
vertex(350,260);
vertex(330,290);
vertex(310,290);
vertex(310,190);
endShape();

rect(310,190,20,100);



