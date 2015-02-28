
int rDO=227;
int gDO=109;
int bDO=18;

int rMB=44;
int gMB=85;
int bMB=173;

int rLO=255;
int gLO=115;
int bLO=0;

int rDeO=242;
int gDeO=146;
int bDeO=0;

int rO=255;
int gO=173;
int bO=64;

int e100=100;
int e80=80;
int e70=70;
int e60=60;
int e50=50;
int e40=40;
int e30=30;
int e20=20;

void setup() {
  size (800,800);
  noStroke();
}

void draw() {
background (255);

//row1
//r1c1
fill(14,38,90); //dark blue
rect(0,0,100,100);
fill(44,85,173); //med. blue
ellipse(50,50,80,80);
fill(255,173,64); //orange
ellipse(50,50,100,100);

//r1c2
fill(242);
rect(100,0,100,100);
fill(198,224,255); //pale blue
ellipse(150,50,100,100);
fill(14,38,90); //dark blue
ellipse(120,20,40,40);
fill(14,38,90); //dark blue
ellipse(160,60,80,80);
fill(44,85,173); //med. blue
ellipse(160,60,50,50);
fill(255,173,64); // orange
triangle(100,40,140,100,100,100);

//r1c3
fill(242); //light grey
rect(200,0,100,100); 
fill(198,224,255); //pale blue
ellipse(250,50,100,100); 
fill(251,211,255); //pale pink
ellipse(250,50,70,70);
fill(255,254,188); //pale yellow
ellipse(250,50,40,40);

//r1c4
fill(242); //light grey
rect(300,0,100,100);
fill(251,211,255); //pale pink
ellipse(350,50,100,100);
fill(198,224,255); //pale blue
ellipse(350,50,50,50);
fill(255,254,188); //pale yellow
ellipse(350,50,20,20);

//r1c5
fill(242);
rect(400,0,100,100);
fill(198,224,255); //pale blue
ellipse(450,50,100,100);
fill(255,254,188); //pale yellow
ellipse(450,50,80,80);
fill(251,211,255); //pale pink
ellipse(450,50,40,40);

//r1c6
fill(242); //light grey
rect(500,0,100,100);
fill(251,211,255); //pale pink
ellipse(550,50,60,60);
fill(255,254,188); //pale yellow
ellipse(550,50,20,20);

//r1c7
fill(242); //light grey
rect(600,0,100,100);
fill(198,224,255); //pale blue
ellipse(650,50,80,80);
fill(255,254,188); //pale yellow
ellipse(650,50,50,50);
fill(251,211,255); //pale pink
ellipse(650,50,30,30);

//r1c8
fill(242); //light grey
rect(700,0,100,100);
fill(198,224,255); //pale blue
ellipse(750,50,100,100);
fill(14,38,90); //dark blue
beginShape();
vertex(700,70);
vertex(800,20);
vertex(800,100);
vertex(700,100);
endShape(CLOSE);
fill(255);
ellipse(720,80,20,20);

//row2
//r2c1
fill(14,38,90); //dark blue
rect(0,100,100,100);
fill(44,85,173); //med. blue
ellipse(50,150,80,80);
fill(255,173,64); //orange
triangle(40,100,100,100,100,200);

//r2c2
fill(255,173,64); //orange
rect(100,100,100,100);
fill(14,38,90); //dark blue
ellipse(180,120,40,40);

//r2c3
fill(242); //light grey
rect(200,100,100,100);
fill(255,254,188); //pale yellow
ellipse(250,150,100,100);
fill(251,211,255); //pale pink
ellipse(250,150,90,90);
fill(14,38,90); //dark blue
ellipse(240,160,80,80);
fill(44,85,173); //med. blue
ellipse(240,160,40,40);

//r2c4
fill(242); //light grey
rect(300,100,100,100);
fill(255,254,188); //pale yellow
ellipse(350,150,100,100);
fill(198,224,255); //pale blue
ellipse(350,150,80,80);
fill(251,211,255); //pale pink
ellipse(350,150,60,60);

//r2c5
fill(242); //light grey
rect(400,100,100,100);
fill(255,254,188); //pale yellow
ellipse(450,150,80,80);
fill(251,211,255); //pale pink
ellipse(450,150,60,60);

//r2c6
fill(242); //light grey
rect(500,100,100,100);
fill(198,224,255); //pale blue
ellipse(550,150,100,100);
fill(255,254,188); //pale yellow
ellipse(550,150,80,80);
fill(14,38,90); //dark blue
triangle(530,200,600,160,600,200);
fill(255);
ellipse(580,190,20,20);

//r2c7
fill(242); //light grey
rect(600,100,100,100);
fill(14,38,90); //dark blue
ellipse(650,150,100,100);

//r2c8
fill(14,38,90); //dark blue
rect(700,100,100,100);
fill(44,85,173); //med. blue
ellipse(750,150,100,100);
fill(255,173,64); //orange
ellipse(730,180,60,40);

//row3
//r3c1
fill(14,38,90); //dark blue
rect(0,200,100,100);
fill(44,85,173); //med. blue
ellipse(50,250,100,100);
fill(255,173,64); //orange
ellipse(30,270,60,60);

//r3c2
fill(14,38,90); //dark blue
rect(100,200,100,100);
fill(255,173,64); //orange
triangle(100,200,200,200,200,300);

//r3c3
fill(14,38,90); //dark blue
rect(200,200,100,100);
fill(44,85,173); //med. blue
ellipse(250,250,70,70);
fill(255,173,64); //orange
triangle(200,200,250,300,200,300);

//r3c4
fill(242); //light grey
rect(300,200,100,100);
fill(14,38,90); //dark blue
ellipse(350,250,100,100);
fill(44,85,173); //med. blue
ellipse(350,250,70,70);
fill(14,38,90); //dark blue
ellipse(330,270,60,60);

//r3c5
fill(242); //light grey
rect(400,200,100,100);
fill(251,211,255); //pale pink
ellipse(450,250,100,100);
fill(14,38,90); //dark blue
triangle(430,300,500,220,500,300);
fill(14,38,90); //dark blue
ellipse(430,270,60,60);
fill(44,85,173); //med. blue
ellipse(430,270,30,30);
fill(255);
ellipse(480,280,40,40);

//r3c6
fill(14,38,90); //dark blue
rect(500,200,100,100);
fill(44,85,173); //med. blue
ellipse(550,250,80,80);
fill(255);
triangle(500,200,530,200,500,220);
fill(255,173,64); //orange
triangle(500,300,600,220,600,300);

//r3c7
fill(255,173,64); //orange
rect(600,200,100,100);
fill(255,115,0); //light orange
ellipse(650,250,100,100);
fill(14,38,90); //dark blue
triangle(600,200,620,200,600,220);

//r3c8
fill(255,173,64); //orange
rect(700,200,100,100);
fill(255,115,0); //light orange
ellipse(750,250,100,100);

//row4
//r4c1
fill(14,38,90); //dark blue
rect(0,300,100,100);
fill(44,85,173); //med. blue
ellipse(50,350,100,100);
fill(255);
ellipse(20,380,40,40);

//r4c2
fill(14,38,90); //dark blue
rect(100,300,100,100);
fill(44,85,173); //med. blue
ellipse(150,350,100,100);
fill(14,38,90); //dark blue
ellipse(150,350,100,100);
fill(44,85,173); //med. blue
ellipse(150,350,50,50);

//r4c3
fill(242); //light grey
rect(200,300,100,100);
fill(14,38,90); //dark blue
ellipse(250,350,100,100);

//r4c4
fill(242); //light grey
rect(300,300,100,100);
fill(14,38,90); //dark blue
ellipse(350,350,100,100);

//r4c5
fill(242); //light grey
rect(400,300,100,100);
fill(255,173,64); //orange
beginShape();
vertex(400,400);
vertex(500,300);
vertex(500,360);
vertex(450,400);
endShape(CLOSE);
fill(14,38,90); //dark blue
ellipse(430,330,60,60);
fill(44,85,173); //med. blue
ellipse(430,330,40,40);
fill(14,38,90); //dark blue
triangle(450,400,500,360,500,400);

//r4c6
fill(255,173,64); //orange
rect(500,300,100,100);
fill(14,38,90); //dark blue
beginShape();
vertex(500,360);
vertex(600,340);
vertex(600,400);
vertex(500,400);
endShape(CLOSE);

//r4c7
fill(14,38,90); //dark blue
rect(600,300,100,100);
fill(44,85,173); //med. blue
ellipse(650,350,100,100);
fill(255,173,64); //orange
ellipse(630,330,60,60);

//r4c8
fill(14,38,90); //dark blue
rect(700,300,100,100);
fill(44,85,173); //med. blue
ellipse(750,350,100,100);
fill(255,173,64); //orange
ellipse(720,320,40,40);
fill(255,115,0); //light orange
ellipse(730,380,60,40);

//row5
//r5c1
fill(242); //light grey
rect(0,400,100,100);
fill(198,224,255); //pale blue
ellipse(50,450,100,100);
fill(255,254,188); //pale yellow
ellipse(50,450,60,60);
fill(14,38,90); //dark blue
ellipse(80,480,40,40);
fill(44,85,173); //med. blue
ellipse(80,480,20,20);
fill(14,38,90); //dark blue
triangle(0,400,100,400,100,470);

//r5c2
fill(242); //light grey
rect(100,400,100,100);
fill(14,38,90); //dark blue
ellipse(150,450,100,100);

//r5c3
fill(242); //light grey
rect(200,400,100,100);
fill(14,38,90); //dark blue
ellipse(250,450,100,100);

//r5c4
fill(242); //light grey
rect(300,400,100,100);
fill(14,38,90); //dark blue
ellipse(350,450,100,100);
fill(44,85,173); //med. blue
ellipse(350,450,70,70);

//r5c5
fill(255,173,64); //orange
rect(400,400,100,100);
fill(14,38,90); //dark blue
triangle(400,450,450,500,400,500);
fill(14,38,90); //dark blue
triangle(400,400,500,400,400,430);

//r5c6
fill(255,173,64); //orange
rect(500,400,100,100);
fill(255,115,0); //light orange
ellipse(550,450,100,100);

//r5c7
fill(255,173,64); //orange
rect(600,400,100,100);
fill(255,115,0); //light orange
ellipse(650,450,100,100);
fill(14,38,90); //dark blue
ellipse(690,410,20,20);
fill(44,85,173); //med. blue
ellipse(690,410,10,10);

//r5c8
fill(14,38,90); //dark blue
rect(700,400,100,100);
fill(44,85,173); //med. blue
ellipse(750,450,80,80);
fill(255,173,64); //orange
ellipse(720,480,40,40);

//row6
//r6c1
fill(242); //light grey
rect(0,500,100,100);
fill(14,38,90); //dark blue
ellipse(50,550,100,100);

//r6c2
fill(242); //light grey
rect(100,500,100,100);
fill(14,38,90); //dark blue
ellipse(150,550,100,100);

//r6c3
fill(242); //light grey
rect(200,500,100,100);
fill(14,38,90); //dark blue
ellipse(250,550,100,100);
fill(44,85,173); //med. blue
ellipse(260,550,80,80);
fill(14,38,90); //dark blue
ellipse(220,520,40,40);
fill(44,85,173); //med. blue
ellipse(220,520,20,20);

//r6c4
fill(242); //light grey
rect(300,500,100,100);
fill(14,38,90); //dark blue
ellipse(350,550,100,100);
fill(44,85,173); //med. blue
ellipse(350,550,70,70);
fill(255,173,64); //orange
ellipse(389,570,40,60);

//r6c5
fill(255,173,64); //orange
rect(400,500,100,100);
fill(14,38,90); //dark blue
ellipse(450,550,100,100);
fill(44,85,173); //med. blue
ellipse(450,550,50,50);

//r6c6
fill(255,173,64); //orange
rect(500,500,100,100);
fill(14,38,90); //dark blue
ellipse(540,560,80,80);
fill(44,85,173); //med. blue
ellipse(540,560,30,30);

//r6c7
fill(255,173,64); //orange
rect(600,500,100,100);

//r6c8
fill(255,173,64); //orange
rect(700,500,100,100);
fill(255,115,0); //light orange
ellipse(750,550,100,100);
fill(14,38,90); //dark blue
triangle(670,500,700,500,700,530);

//row7
//r7c1
fill(242); //light grey
rect(0,600,100,100);
fill(14,38,90); //dark blue
ellipse(50,650,100,100);

//r7c2
fill(242); //light grey
rect(100,600,100,100);
fill(255,254,188); //pale yellow
ellipse(150,650,100,100);
fill(14,38,90); //dark blue
ellipse(130,620,40,40);
fill(44,85,173); //med. blue
ellipse(130,620,10,10);
fill(14,38,90); //dark blue
ellipse(180,650,40,100);

//r7c3
fill(255,173,64); //orange
rect(200,600,100,100);
fill(255,115,0); //light orange
ellipse(220,620,40,40);
fill(242,146,0); //deep orange
ellipse(280,620,40,40);

//r7c4
fill(255,173,64); //orange
rect(300,600,100,100);
fill(255,115,0); //light orange
ellipse(350,650,100,100);
fill(14,38,90); //dark blue
triangle(350,600,400,600,600,630);

//r7c5
fill(14,38,90); //dark blue
rect(400,600,100,100);
fill(44,85,173); //med. blue
ellipse(450,650,80,80);
fill(255,173,64); //orange
ellipse(420,480,40,40);

//r7c6
fill(255,173,64); //orange
rect(500,600,100,100);
fill(255,115,0); //light orange
triangle(500,620,600,700,500,700);
fill(14,38,90); //dark blue
ellipse(580,640,80,80);

//r7c7
fill(14,38,90); //dark blue
rect(600,600,100,100);
fill(44,85,173); //med. blue
ellipse(650,650,100,100);

//r7c8
fill(14,38,90); //dark blue
rect(700,600,100,100);
fill(44,85,173); //med. blue
ellipse(750,650,100,100);
fill(255,173,64); //orange
ellipse(720,620,40,40);

//row8
//r8c1
fill(242); //light grey
rect(0,700,100,100);
fill(255,254,188); //pale yellow
ellipse(50,750,100,100);
fill(198,224,255); //pale blue
ellipse(50,750,80,80);
fill(251,211,255); //pale pink
ellipse(50,750,60,60);
fill(14,38,90); //dark blue
ellipse(20,720,40,40);

//r8c2
fill(242); //light grey
rect(100,700,100,100);
fill(251,211,255); //pale pink
ellipse(150,750,100,100);
fill(14,38,90); //dark blue
ellipse(170,730,60,60);
fill(44,85,173); //med. blue
ellipse(170,730,40,40);
fill(14,38,90); //dark blue
ellipse(150,770,60,60);

//r8c3
fill(14,38,90); //dark blue
rect(200,700,100,100);
fill(44,85,173); //med. blue
ellipse(250,750,100,100);
fill(255,173,64); //orange
ellipse(250,750,100,100);

//r8c4
fill(14,38,90); //dark blue
rect(300,700,100,100);
fill(44,85,173); //med. blue
ellipse(350,750,80,80);
fill(255,173,64); //orange
ellipse(350,750,100,100);

//r8c5
fill(14,38,90); //dark blue
rect(400,700,100,100);
fill(44,85,173); //med. blue
ellipse(450,750,80,80);
fill(255,173,64); //orange
ellipse(450,750,100,100);

//r8c6
fill(14,38,90); //dark blue
rect(500,700,100,100);
fill(44,85,173); //med. blue
ellipse(550,750,100,100);
fill(255,173,64); //orange
ellipse(510,770,20,40);
fill(255,115,0); //light orange
ellipse(570,730,60,60);

//r8c7
fill(14,38,90); //dark blue
rect(600,700,100,100);
fill(44,85,173); //med. blue
ellipse(650,750,100,100);
fill(255,173,64); //orange
ellipse(620,720,40,40);

//r8c8
fill(242); //light grey
rect(700,700,100,100);
fill(198,224,255); //pale blue
ellipse(750,750,100,100);
fill(255,254,188); //pale yellow
ellipse(750,750,60,60);
fill(14,38,90); //dark blue
triangle(710,700,800,700,800,720);
fill(14,38,90); //dark blue
triangle(700,750,720,800,700,800);

//makes ellipse diameters grow along y axis
e100=map(mouseY,0,height,100,80);
e80=map(mouseY,0,height,80,100);
e70=map(mouseY,0,height,70,90);
e60=map(mouseY,0,height,60,80);
e50=map(mouseY,0,height,50,70);
e40=map(mouseY,0,height,40,60);
e30=map(mouseY,0,height,30,50);
e20=map(mouseY,0,height,20,40);

//all dark orange ellipses
bDO=map(mouseX,0,width,0,255);
fill(rDO,gDO,bDO);

ellipseMode(CENTER);
ellipse(50,50,e60,e60);
ellipse(550,320,e50,e50);
ellipse(460,450,e60,e60);
ellipse(550,450,e60,e60);
ellipse(650,450,e80,e80);
ellipse(750,550,e80,e80);
ellipse(350,650,e80,e80);
ellipse(250,750,e60,e60);

//all medium blue ellipses
rMB=map(mouseX,0,width,0,255);
fill(rMB,gMB,bMB);

ellipseMode(CENTER);
ellipse(180,120,e20,e20);
ellipse(650,150,e50,e50);
ellipse(330,270,e20,e20);
ellipse(230,360,e30,e30);
ellipse(350,350,e70,e70);
ellipse(150,450,e30,e30);
ellipse(250,450,e70,e70);
ellipse(50,550,e50,e50);
ellipse(150,550,e40,e40);
ellipse(50,650,e50,e50);
ellipse(180,650,e20,e50);
ellipse(580,640,e30,e30);
ellipse(20,720,e20,e20);
ellipse(150,770,e30,e30);

//all light orange ellipses
bLO=map(mouseX,0,width,0,255);
fill(rLO,gLO,bLO);

ellipseMode(CENTER);
ellipse(130,160,e80,e80);
ellipse(770,180,e60,e40);
ellipse(70,280,e60,e40);
ellipse(120,280,40,40);
ellipse(680,380,e40,e40);
ellipse(770,430,e60,e60);
ellipse(310,590,e20,e20);
ellipse(420,580,e40,e40);
ellipse(570,530,e60,e60);
ellipse(650,550,e100,e100);
ellipse(230,670,e60,e60);
ellipse(470,630,e60,e60);
ellipse(770,630,e60,e60);
ellipse(350,750,e60,e60);
ellipse(450,750,e40,e40);
ellipse(680,680,e40,e40);

//all deep orange ellipses
bDe0=map(mouseX,0,width,0,255);
fill(rDeO,gDeO,bDeO);

ellipseMode(CENTER);
ellipse(620,250,e50,e50);
ellipse(740,270,e30,e30);
ellipse(770,370,e60,e60);
ellipse(580,780,e40,e40);

//all orange ellipses
bO=map(mouseX,0,width,0,255);
fill(rO,gO,bO);

ellipseMode(CENTER);
ellipse(90,310,e20,e20);
ellipse(120,320,e40,e40);
ellipse(380,450,e40,e40);
ellipse(290,590,e20,e20);
ellipse(680,620,e40,e40);

}

/* The artist who inspired my work was Chuck
Close. My main focus in replicating his style
was the grand scale of his pieces and how he
utilizes simple shapes and color with his grid
system to create a larger image from hundreds
of smaller ones. Trying to make this method work
for Processing was a bit tricky to figure out,but
by breaking down each square into a few shapes
and colors made it much less daunting. I decided 
to use his technique to create a monarch butterfly
instead of a portrait and much simpler shapes because
I was limited in terms of the organic shapes Close
is able to create using traditional media. In order
to use his technique, I had to standardize the shapes
I wanted to use. */


