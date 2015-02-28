
float rot = 0;
float blackr = 0;
float blackg = 0;
float blackb = 0;
float whiter = 206;
float whiteg = 200;
float whiteb = 200;
float Origin = 500;



//Screen
float diamOne;
float diamTwo;
float x;
float y;
float xLine;
float yLine;


void setup() {
size(500,500);
smooth();
}

void draw() {
  background(206,200,200);
  rot = rot + 0.05; // Rotation


pushMatrix();//reset (0,0) to...
translate(width/2,height/2);
rotate(rot*-1);
Origin = Origin -1;

blackEllipse(0.1,1000);
whiteEllipse(0.5,900);
blackEllipse(1,800);
whiteEllipse(2,750);
blackEllipse(4,700);
whiteEllipse(6,650);
blackEllipse(8,600);
whiteEllipse(10,550);
blackEllipse(20,500);
whiteEllipse(40,450);
blackEllipse(60,400);
whiteEllipse(80,350);
blackEllipse(100,300);
whiteEllipse(120,250);
blackEllipse(140,205);
whiteEllipse(160,155);
blackEllipse(185,115);
whiteEllipse(200,75);
blackEllipse(205,50);
whiteEllipse(210,37);
blackEllipse(215,25);
whiteEllipse(220,15);
blackEllipse(225,10);
if (mousePressed){
creature(); 
}
popMatrix();//reset to (0,0)



if (mousePressed) {
  blackr = 194;
  blackg = 19;
  blackb = 19;
  whiter = 206;
  whiteg = 204;
  whiteb = 204;
} else if (keyPressed){
  blackr = random(0,255);
  blackg = random(0,255);
  blackg = random(0,255);
  whiter = random(0,255);
  whiteg = random(0,255);
  whiteb = random(0,255);
} else {
  blackr = 0;
  blackg = 0;
  blackb = 0;
}

//Screen
 rectMode(CORNER);  
 fill(0);
  rect(0,0,width,height/10);
  rect(0,height * 0.9,width,height * 0.9); // Strips

  diamOne = random(10);
  diamTwo = random(40);
  x = random(width);
  y = random(height);
  xLine = random(width);
  yLine = random(height);
  
  noStroke();
  fill(200);
  ellipse(x,y,diamOne,diamTwo); // Spots
  ellipse(xLine,yLine,1,height); //lines
}




void blackEllipse(float y,float w) {
noStroke();
fill(blackr,blackg,blackb);
ellipse(100,y,w,w);
}

void whiteEllipse(float y,float w){
noStroke();
fill(whiter,whiteg,whiteb);
ellipse(100,y,w,w);
}
  
  

  

void creature(){

//head
fill(194,19,19,255);
stroke(0);
ellipse(Origin,Origin,96,96);
//eyes
fill(0);
stroke(0);//color
ellipse(Origin-16,Origin-16,8,32);
ellipse(Origin+16,Origin-16,8,32);
//left eyebrow
line(Origin-40,Origin-40,Origin-8,Origin-32);
line(Origin-48,Origin-48,Origin-8,Origin-32);
//right eyebrow
line(Origin+40,Origin-40,Origin+8,Origin-32);
line(Origin+48,Origin-48,Origin+8,Origin-32);
//mouth
line(Origin-40,Origin+32,Origin-32,Origin+16);
line(Origin-32,Origin+16,Origin-16,Origin+24);
line(Origin-16,Origin+24,Origin,Origin+12);
line(Origin,Origin+12,Origin+16,Origin+24);
line(Origin+16,Origin+24,Origin+32,Origin+16);
line(Origin+32,Origin+16,Origin+40,Origin+32);
}



