
void setup() {
  size(705, 450);
  frameRate(2);
}
int skin = 150;
int dskin = 110;
int iris = 150;
int irisr = 50;
int irisg = 50;
int irisb = 50;

void draw() {

  //nested for loop makes skin/background
  for (int a=0; a < height; a += 15) {
	for (int b = 0; b < width; b += 15) {
   	fill(skin);
  	rect(b, a, 14, 14);
	}
  }
  
//top of eye
whites(615,90);
whites(585,90);
whites(540,90);
whites(495,90);
whites(450,90);
whites(405,90);
whites(360,90);
whites(315,90);
whites(270,90);
whites(225,90);
whites(180,90);
whites(135,90);
whites(90,90);
whites(45,90);

//bottom of eye
whites(360,360);
whites(330,360);
whites(300,360);

//right side of eye
whites(390,345);
whites(420,330);
whites(450,315);
whites(480,285);
whites(510,255);
whites(540,225);
whites(570,195);
whites(600,165);
whites(615,135);

//left side of eye
whites(270,345);
whites(240,330);
whites(210,315);
whites(180,285);
whites(150,255);
whites(120,225);
whites(90,195);
whites(60,165);
whites(45,135);

//inside of eye
whites(90,135);
whites(120,135);
whites(150,135);
whites(180,135);
whites(210,135);
whites(240,135);
whites(270,135);
whites(300,135);
whites(330,135);
whites(360,135);
whites(390,135);
whites(420,135);
whites(450,135);
whites(480,135);
whites(510,135);
whites(540,135);
whites(570,135);

whites(105,180);
whites(150,180);
whites(195,180);
whites(240,180);
whites(285,180);
whites(330,180);
whites(375,180);
whites(420,180);
whites(465,180);
whites(510,180);
whites(555,180);

whites(165,225);
whites(210,225);
whites(255,225);
whites(300,225);
whites(345,225);
whites(390,225);
whites(435,225);
whites(480,225);
whites(525,225);

whites(195,270);
whites(240,270);
whites(285,270);
whites(330,270);
whites(375,270);
whites(420,270);
whites(465,270);

whites(225,315);
whites(270,315);
whites(315,315);
whites(360,315);
whites(405,315);


//iris
iris(195,90);
iris(225,90);
iris(210,135);
iris(240,165);
iris(270,180);
iris(300,195);
iris(330,180);
iris(330,210);
iris(435,90);
iris(465,90);
iris(450,135);
iris(420,165);
iris(390,180);
iris(360,195);
iris(255,120);
iris(405,120);
iris(285,150);
iris(375,150);

//iris 1 sq random color
colorMode(RGB);
fill(random(irisr),random(irisg),random(irisb));
irisr(195,90);
fill(random(irisr),random(irisg),random(irisb));
irisr(225,105);
fill(random(irisr),random(irisg),random(irisb));
irisr(255,120);
fill(random(irisr),random(irisg),random(irisb));
irisr(210,150);
fill(random(irisr),random(irisg),random(irisb));
irisr(270,150);
fill(random(irisr),random(irisg),random(irisb));
irisr(240,180);
fill(random(irisr),random(irisg),random(irisb));
irisr(300,180);
fill(random(irisr),random(irisg),random(irisb));
irisr(285,210);
fill(random(irisr),random(irisg),random(irisb));
irisr(330,195);
fill(random(irisr),random(irisg),random(irisb));
irisr(330,240);
fill(random(irisr),random(irisg),random(irisb));
irisr(360,225);
fill(random(irisr),random(irisg),random(irisb));
irisr(435,90);
fill(random(irisr),random(irisg),random(irisb));
irisr(465,105);
fill(random(irisr),random(irisg),random(irisb));
irisr(420,120);
fill(random(irisr),random(irisg),random(irisb));
irisr(480,135);
fill(random(irisr),random(irisg),random(irisb));
irisr(450,150);
fill(random(irisr),random(irisg),random(irisb));
irisr(375,165);
fill(random(irisr),random(irisg),random(irisb));
irisr(405,180);
fill(random(irisr),random(irisg),random(irisb));
irisr(390,210);
fill(random(irisr),random(irisg),random(irisb));
irisr(435,195);

//pupil 2x2
pupil(270,90);
pupil(300,90);
pupil(330,90);
pupil(360,90);
pupil(390,90);
pupil(405,90);
pupil(285,120);
pupil(315,120);
pupil(330,120);
pupil(360,120);
pupil(390,120);
pupil(330,150);
pupil(345,150);

//pupil 1 sq or iris outline
pupil1(315,150);
pupil1(300,150);
pupil1(375,150);
pupil1(390,150);
pupil1(180,90);
pupil1(180,105);
pupil1(180,120);
pupil1(180,135);
pupil1(195,135);
pupil1(195,150);
pupil1(195,165);
pupil1(195,180);
pupil1(210,180);
pupil1(225,180);
pupil1(225,195);
pupil1(225,210);
pupil1(240,210);
pupil1(255,210);
pupil1(255,225);
pupil1(270,225);
pupil1(285,225);
pupil1(285,240);
pupil1(300,240);
pupil1(315,240);
pupil1(315,255);
pupil1(330,255);
pupil1(345,255);
pupil1(360,255);
pupil1(375,255);

pupil1(510,90);
pupil1(510,105);
pupil1(510,120);
pupil1(510,135);
pupil1(495,135);
pupil1(495,150);
pupil1(495,165);
pupil1(480,180);
pupil1(465,180);
pupil1(465,195);
pupil1(465,210);
pupil1(450,210);
pupil1(435,210);
pupil1(435,225);
pupil1(420,225);
pupil1(405,225);
pupil1(405,240);
pupil1(390,240);
pupil1(375,240);

//skin
//top
skin(45,75);
skin(60,75);
skin(75,75);
skin(90,75);
skin(105,75);
skin(120,75);
skin(135,75);
skin(150,75);
skin(165,75);
skin(180,75);
skin(195,75);
skin(210,75);
skin(225,75);
skin(240,75);
skin(255,75);
skin(270,75);
skin(285,75);
skin(300,75);
skin(315,75);
skin(330,75);
skin(345,75);
skin(360,75);
skin(375,75);
skin(390,75);
skin(405,75);
skin(420,75);
skin(435,75);
skin(450,75);
skin(465,75);
skin(480,75);
skin(495,75);
skin(510,75);
skin(525,75);
skin(540,75);
skin(555,75);
skin(570,75);
skin(585,75);
skin(600,75);
skin(615,75);
skin(630,75);
skin(645,75);

//left straight
skin(30,75);
skin(30,90);
skin(30,105);
skin(30,120);
skin(30,135);
skin(30,150);
skin(30,165);
skin(30,180);
//left curve
skin(45,180);
skin(45,195);
skin(45,210);
skin(60,210);
skin(75,210);
skin(75,225);
skin(75,240);
skin(90,240);
skin(105,240);
skin(105,255);
skin(105,270);
skin(120,270);
skin(135,270);
skin(150,270);
skin(150,285);
skin(150,300);
skin(165,300);
skin(165,315);
skin(165,330);
skin(180,330);
skin(195,330);
skin(195,345);
skin(195,360);
skin(210,360);
skin(225,360);
skin(225,375);
skin(240,375);
skin(255,375);
skin(255,390);
skin(270,390);
skin(285,390);

//right side
skin(660,75);
skin(660,90);
skin(660,105);
skin(660,120);
skin(660,135);
skin(660,150);
skin(660,165);
skin(660,180);

//right curve
skin(645,180);
skin(645,195);
skin(645,210);
skin(630,210);
skin(615,210);
skin(615,225);
skin(615,240);
skin(600,240);
skin(585,240);
skin(585,255);
skin(585,270);
skin(570,270);
skin(555,270);
skin(555,285);
skin(555,300);
skin(540,300);
skin(525,300);
skin(525,315);
skin(525,330);
skin(510,330);
skin(495,330);
skin(495,345);
skin(495,360);
skin(480,360);
skin(465,360);
skin(465,375);
skin(450,375);
skin(435,375);
skin(435,390);
skin(420,390);
skin(405,390);

//bottom
skin(285,405);
skin(300,405);
skin(315,405);
skin(330,405);
skin(345,405);
skin(360,405);
skin(375,405);
skin(390,405);
skin(405,405);

//upper lid left
skin(30,60);
skin(45,60);
skin(45,45);
skin(45,30);
skin(60,30);
skin(75,30);
skin(75,15);
skin(75,0);
skin(90,0);
skin(105,0);

//upper lid right
skin(660,60);
skin(645,60);
skin(645,45);
skin(645,30);
skin(630,30);
skin(615,30);
skin(615,15);
skin(615,0);
skin(600,0);
skin(585,0);

//eyelid
eyelid(45,30);
eyelid(90,30);
eyelid(135,30);
eyelid(180,30);
eyelid(225,30);
eyelid(270,30);
eyelid(315,30);
eyelid(360,30);
eyelid(405,30);
eyelid(450,30);
eyelid(495,30);
eyelid(540,30);
eyelid(555,30);
eyelid(600,30);
eyelid(75,0);
eyelid(120,0);
eyelid(165,0);
eyelid(210,0);
eyelid(255,0);
eyelid(300,0);
eyelid(345,0);
eyelid(390,0);
eyelid(435,0);
eyelid(480,0);
eyelid(525,0);
eyelid(570,0);

colorMode(HSB);
fill(0,0,255);
rect(330,90,14,14);
rect(330,105,14,14);
rect(345,105,14,14);

}
void skin (int x, int y){
 fill (dskin); 
 rect(x,y,14,14);
}
void eyelid (int x, int y){
fill(dskin);
  rect(x,y,14,14);
  rect(x+15,y,14,14);
  rect(x+30,y,14,14);
  rect(x,y+15,14,14);
  rect(x+15,y+15,14,14);
  rect(x+30,y+15,14,14);
  rect(x,y+30,14,14);
  rect(x+15,y+30,14,14);
  rect(x+30,y+30,14,14);
}
void whites(int x, int y){
colorMode(HSB);
 fill(0,0,255);
  rect(x,y,14,14);
  rect(x+15,y,14,14);
  rect(x+30,y,14,14);
  rect(x,y+15,14,14);
  rect(x+15,y+15,14,14);
  rect(x+30,y+15,14,14);
  rect(x,y+30,14,14);
  rect(x+15,y+30,14,14);
  rect(x+30,y+30,14,14);
 
}
void pupil (int x, int y){
  colorMode(HSB);
fill(0,0,0);
  rect(x,y,14,14);
  rect(x+15,y,14,14);
  rect(x,y+15,14,14);
  rect(x+15,y+15,14,14);
}

void pupil1(int x,int y){
colorMode(HSB);
fill(0,0,0);
  rect(x,y,14,14); 
}

void iris(int x, int y){
colorMode(HSB);
fill(iris);
  rect(x,y,14,14);
  rect(x+15,y,14,14);
  rect(x+30,y,14,14);
  rect(x,y+15,14,14);
  rect(x+15,y+15,14,14);
  rect(x+30,y+15,14,14);
  rect(x,y+30,14,14);
  rect(x+15,y+30,14,14);
  rect(x+30,y+30,14,14);
}

void irisr(int x,int y){
rect(x,y,14,14);
}

void keyPressed(){
if (key == '1') {
	iris = #03A0FF;
        irisr = 0;
        irisg = 0;
        irisb = 255;
        skin = #FFDCB7;
        dskin = #FFC386;        
}//press 1 for blue
if (key == '2') {
	iris = #00C16F;
        irisr = 0;
        irisg = 255;
        irisb = 0;
        skin = #FFDCB7;
        dskin = #FFC386;        
}//press 1 for green
if (key == '3') {
	iris = #986300;
        irisr = 50;
        irisg = 75;
        irisb = 0;
        skin = #FFDCB7;
        dskin = #FFC386;
}//press 1 for brown
}


