
void setup(){
size(400,400);
smooth();
}

void draw(){
background(250);
noStroke();
fill(215,116,255);
ellipse(250,190,60,80);
ellipse(200,210,50,30);
ellipse(120,210,120,80);
fill(255); ellipse(260,180,30,30);
fill(0); 
ellipse(265,180,10,10);
stroke(170,60,214); strokeWeight(5); 
line(205,218,210,205); line(210,205,250,260);
line(185,218,170,210); line(170,210,150,260);
line(190,218,150,180); line(150,180,100,270);
fill(168,46,229);noStroke(); 
ellipse(250,260,14,8); ellipse(150,260,12,7); ellipse(100,270,17,10);

stroke(85,21,170); 
line(245,150,250,130); line(250,130,290,120);
line(240,150,245,113); line(245,113,270,95);
fill(255,21,119); noStroke();
ellipse(290,120,10,10); ellipse(270,95,20,20);
}

