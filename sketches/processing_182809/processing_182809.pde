
//gluggastærð
size(800,600);

//bakrunnur (rgb)
background(155,205,128);

//himinn
fill(204,255,255);
rect(0,0,800,150);

//sol
noStroke();
fill(243,243,21);
arc(380,150,200,200,PI,PI*2, PIE);

//gangstett
stroke(0,0,0);
fill(211,211,211);
rect(0,280,800,250);

//N1kerra
stroke(255,255,255);
fill(255,0,0);
rect(300,250,200,150);

//hjól 1
stroke(0,0,0);
fill(0,0,0);
ellipse(400,400,75,75);

//felga
stroke(255,255,255);
fill(0,0,0);
ellipse(400,400,60,60);

//texti
fill(255, 255, 255);
textSize(50);
text("N1", 365, 335); 
fill(255, 255, 255);

//tenging
noStroke();
fill(0,0,0);
rect(265,372,35,10);

//felga
stroke(255,0,255);
fill(255,0,255);
ellipse(172,280,60,60);

//bíll
stroke(0,0,255);
fill(0,0,255);
rect(80,300,200,80,30,0,0,0);

//hjól 2
stroke(0,0,0);
fill(0,0,0);
ellipse(120,400,75,75);
//felga
stroke(255,255,255);
fill(0,0,0);
ellipse(120,400,60,60);

//hjól 3
stroke(0,0,0);
fill(0,0,0);
ellipse(240,400,75,75);

//felga
stroke(255,255,255);
fill(0,0,0);
ellipse(240,400,60,60);

//húdd
stroke(0,0,255);
fill(0,0,255);
rect(180,250,100,60);
