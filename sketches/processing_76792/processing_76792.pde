
int fons = 800;

void setup(){
size(600,600);
smooth();
}
void draw(){
background(fons);
noStroke();
fill(250,250,20);
triangle(500,450,400,450,450,300);
fill(250,150,20);
ellipse(400,250,300,300);
fill(200,200,200);
ellipse(450,350,250,100);
ellipse(450,320,100,100);
fill(0,50,50);
ellipse(450,320,80,80);
fill(200,200,200);
ellipse(450,350,200,60);
fill(100,225,100);
ellipse(200,300,300,400);
rect(100,425,25,100);
rect(275,425,25,100);
rect(290,100,10,100);
rect(100,100,10,100);
ellipse(295,100,25,25);
ellipse(105,100,25,25);
ellipse(106,525,50,75);
ellipse(112,525,50,75);
ellipse(118,525,50,75);
ellipse(294,525,50,75);
ellipse(288,525,50,75);
ellipse(282,525,50,75);
fill(255,255,255);
ellipse(200,250,100,150);
fill(0,0,0);
ellipse(200,275,75,100);
fill(255,255,255);
ellipse(180,280,15,40);
fill(255,0,0);
ellipse(405,375,20,mouseY/20);
fill(0,0,255);
ellipse(380,365,20,mouseX/20);
fill(255,0,0);
ellipse(355,355,20,mouseY/20);
fill(0,0,255);
ellipse(430,385,20,mouseX/20);
fill(0,0,255);
ellipse(470,385,20,mouseY/20);
fill(255,0,0);
ellipse(495,375,20,mouseX/20);
fill(0,0,255);
ellipse(520,365,20,mouseY/20);
fill(255,0,0);
ellipse(545,355,20,mouseX/20);
ellipse(200,380,100,100);
fill(200,0,50);
ellipse(200,380,40,40);
fill(100,225,100);
rect(100,325,150,50);
fill(255,0,100);
ellipse(120,350,45,20);
ellipse(280,350,45,20);
}
void mousePressed(){
  fons = 800;
}
void mouseReleased(){
  fons = 000;
 
}

