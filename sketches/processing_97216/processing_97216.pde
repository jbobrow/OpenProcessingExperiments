
size(400,400);
background(255,247,0);

int a=50;
int b=100;

strokeWeight(a-40);
line(a-40,b-90,a,b-50);
line(a-40,b+290,a,b+250);
line(a+340,b+290,a+300,b+250);
line(a+340,b-90,a+300,b-50);

strokeWeight(a-45);
fill(255,170,0);
stroke(b+155,0,0);
ellipseMode(RADIUS);
ellipse(a+25,b-25,a-10,a-10);

strokeWeight(a-30);
ellipse(a+25,b-25,a-30,a-30);

strokeWeight(a-45);
fill(0,255,255);
ellipse(a+25,b+225,a-10,a-10);

strokeWeight(a-30);
ellipse(a+25,b+225,a-30,a-30);

strokeWeight(a-45);
fill(0,255,27);
ellipse(a+275,b+225,a-10,a-10);

strokeWeight(a-30);
ellipse(a+275,b+225,a-30,a-30);

strokeWeight(a-45);
fill(255,126,247);
ellipse(a+275,b-25,a-10,a-10);

strokeWeight(a-30);
ellipse(a+275,b-25,a-30,a-30);


