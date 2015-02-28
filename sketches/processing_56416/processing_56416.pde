
PFont abadi;
PShape antennae;

void setup () {
size (1000, 1000);
smooth();
background (200);
abadi = loadFont ("AbadiMT-CondensedExtraBold-48.vlw");
antennae = loadShape ("antennae.svg");
textFont(abadi);
  textSize(20);
}

void draw() {
  background (200);
int x=mouseX; //Head x-coordinate
int y=mouseY; //Head y-coordinate
int bodyHeight = 200; //Body Height

 
//Neck
stroke(0);
strokeWeight(20);
line(x-50,y-100,550,600);
  
//Head
fill(0);
stroke(1);
strokeWeight(8);
line(x-55,y-150,x-55,y-250);
line(x-10,y-130,x+70,y-200);
fill(200);
noStroke();
fill(255);
ellipse(x-50,y-100,100,100);
fill(200);
stroke(100);
strokeWeight(3);
rectMode(CENTER);
rect(x-55,y-80,40,20);

shape(antennae, x-95,y-300);
shape(antennae,x+30, y-240);
 
//Eye
noStroke();
fill(150);
quad(x-50,y-130,x-70,y-110,x-200,y-210,x-130,y-270);
fill(255);
stroke(160);
strokeWeight(15);
ellipse(x-220,y-300,180,180);
noStroke();
  float r = random(0,255);
  float b = random (0,255);
  fill(r,0,b);
ellipse(x-220,y-300,60,60);


//Arm
noStroke();
fill(10);
quad(610,610,620,620,750,510,740,500);
fill(100);
    triangle(750,510,790,525,820,460);
    triangle(740,500,720,460,780,420);
 

//Legs
fill(0);
rectMode(CORNER);
rect(500,700,10,100); //not lining up??
rect(570,700,10,100);
fill(100);
quad(510,800,500,800,450,820,510,820);
quad(570,800,580,800,630,820,570,820);


//Body
fill(255);
ellipse(550,650,250,bodyHeight);
fill(100);
stroke(150);
strokeWeight(3);
ellipse(600,600,50,bodyHeight/4);
ellipse(600,700,50,bodyHeight/4);
ellipse(630,650,50,bodyHeight/4);
fill(0,255,0);
triangle(500,650,570,600,570,700);
fill(0);
text ("START", 515, 655);

if (mousePressed) {
  fill (255,0,0);
  triangle (500,650,570,600,570,700);
  fill(0);
  text ("STOP",520,655);
}

}

