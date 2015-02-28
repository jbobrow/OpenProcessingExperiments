

//Set up
size(600,600);
background(75);

//Draw Head

fill(150);
rect(220,80,160,160);
fill(0,0,255);
quad(320,80,280,80,290,40,310,40);
fill(200);
rect(240,210,120,30);
fill(0);
for (int xGrill=250; xGrill<350; xGrill+=22){
rect(xGrill,210,10,30);
}
fill(255,225,0);
ellipse(260,140,40,40);
ellipse(340,140,40,40);
fill(125);

//Draw Body
fill(150);
rect(210,240,180,240);
//Draw Arms
rect(150,240,60,60);
rect(390,240,60,60);
rect(150,300,50,120);
rect(400,300,50,120);
//Draw Crest
fill(120);
triangle(210,240,390,240,300,480);
fill(150);
ellipse(300,360,120,120);
fill(0,0,255);
ellipse(310,360,100,100);
fill(150);

//Draw Legs
rect(210,480,50,100);
rect(340,480,50,100);





