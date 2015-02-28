
void setup()  {
size(500,600);
}

void draw(){
background(255);
stroke(0);

line(155,190,90,340);  //left arm
line(315,190,390,340);  //right arm


fill(185,184,184);
ellipse(235,110,250,150);  //head

fill(0,90,0);
rect(150,170,170,400);  //body

fill(255);
line(155,140,315,140);  //horizontal
line(175,120,175,160);
line(195,120,195,160);
line(215,120,215,160);
line(235,120,235,160);
line(255,120,255,160);
line(275,120,275,160);
line(295,120,295,160);    //grin

fill(255);
ellipse(160,90,40,40);
ellipse(310,90,40,40);  //eyes
line(140,70,185,85);
line(285,85,330,70);  //eyebrows

fill(255,0,0);
ellipse(160,90,25,25);
ellipse(310,90,25,25);  //pupils

println("mijn monstertje, pas op! hij bijt");  //druk boodschap af
}
