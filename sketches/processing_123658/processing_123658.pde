
float x = 640;

 

void setup() {
  size(800,800); 
  stroke(255);     
  
  noLoop();
  
  x = 800;
}

void draw() { 
  background(118,224,184); 
 fill( 209,178,0);
 noStroke();
ellipse(x, height/10, 150, 150); 

noStroke();
fill(250,249,247);
ellipse(300,60,100,53);
ellipse(200,30,100,35);
ellipse(290,40,180,60);
ellipse(630,40,180,60);
ellipse(700,40,180,70);

noStroke();
fill(83,113,65);
rect(0,250,800,550);
stroke(0,0,0);
fill(185,140,122);
quad(30,30,200,30,200,300,30,300);
quad(100,120,300,50,300,320,100,320);
fill(19,67,14);
ellipse(600,50,170,140);
fill(185,140,122);
quad(300,50,600,50,600,320,300,320);
quad(300,25,310,25,310,320,300,320);
quad(450,60,650,60,650,320,450,320);
fill(118,104,75);
quad(325,75,435,75,435,310,325,310);
quad(335,85,425,85,425,305,335,305);
fill(158,180,179);
rect(405,200,5,30);

quad(470,150,630,150,630,300,470,300);
line(520,150,520,300);


line(580,150,580,300);
line(530,150,530,300);

line(570,150,570,300);
quad(100,150,250,150,250,300,100,300);
line(100,140,260,140);
line(260,140,260,310);

line(150,150,150,300);
line(150,150,150,300);

for (int i =150; i < 300; i = i+5) {
  
  line(100, i, 150, i);
}


line(100,270,150,270);
fill(67,56,34);
quad(60,125,300,50,300,60,60,135);
line(60,135,100,135);
fill(14,67,19,200);
ellipse(730,100,170,140);
fill(67,25,14,230);
rect(720,170,20,190);

  
 x = x - 3; 
  if (x < 0) { 
    x =800; 
  } 
} 

void mousePressed() {
  loop();
}