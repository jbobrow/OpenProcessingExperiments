
void setup()
{
  
  frameRate(5);
size(1000,1000);
//himmel
background(0,161,196);

//sol
stroke(255,255,0);
fill(255,255,0);
ellipse(80,80,150,150);

}

int venstreBenX = 670;
int venstreBenY = 590;
int hoejreBenX = 690;
int hoejreBenY = 590;
int hovedX = 680;
int hovedY = 530;
int benSamlingX = 680;
int benSamlingY = 580;
int kropStartX = 680;
int kropStartY = 580;
int kropSlutX = 680;
int kropSlutY = 530;
int hoejreArmX = 690;
int hoejreArmY = 550;
int venstreArmX = 670;
int venstreArmY = 550;
int armeSamlingX = 680;
int armeSamlingY = 560;

void draw()
{
  // græs
stroke(0,255,0);
fill(0,255,0);
rect(0,480,1000,520);

// hus gavl 1
stroke(188,71,25);
fill(188,71,25);
rect(100,520,80,80);

//tag gavl
stroke(188,71,25);
fill(188,71,25);
triangle(100,520,180,520,140,470);

//huslænge 1
stroke(188,71,25);
fill(188,71,25);
quad(180,520,180,600,250,530,250,450);

// taglængde 1
stroke(0,0,0);
fill(0,0,0);
quad(140,470,210,400,250,450,180,520);

// huslænge 2
stroke(188,71,25);
fill(188,71,25);
quad(250,450,250,530,360,530,420,450);

// taglængde 2
stroke(0,0,0);
fill(0,0,0);
quad(210,400,250,450,420,450,470,400);

// huslænge 3
stroke(188,71,25);
fill(188,71,25);
quad(510,450,510,530,440,600,440,520);

// taglængde 3
stroke(0,0,0);
fill(0,0,0);
quad(470,400,510,450,440,520,400,470);

// hus gavl 1
stroke(188,71,25);
fill(188,71,25);
rect(360,520,80,80);

//tag gavl
stroke(188,71,25);
fill(188,71,25);
triangle(360,520,440,520,400,470);

// markeringer
stroke(0,0,0);
fill(0,0,0);
line(400,470,360,520);
line(360,520,360,600);
line(250,450,250,530);
line(180,520,180,600);
line(100,600,100,520);
line(100,520,140,470);
line(440,520,440,600);
line(510,530,510,450);



// dør
stroke(211,163,85);
fill(211,163,85);
rect(270,480,30,50);
stroke(201,144,85);
fill(201,144,85);
quad(272.5,482.5,297.5,482.5,297.5,530,272.5,530);
stroke(0,0,0);
fill(0,0,0);
line(272.5,482.5,272.5,530);
line(272.5,482.5,297.5,482.5);
line(297.5,482.5,297.5,530);
line(277.5,482.5,277.5,530);
line(282.5,482.5,282.5,530);
line(287.5,482.5,287.5,530);
line(292.5,482.5,292.5,530);

// venstre vindue
stroke(188,71,25);
fill(255,255,255);
rect(330,470,30,30);
stroke(255,255,255);
fill(255,255,255);
rect(335,475,20,20);
stroke(0,161,196);
fill(0,161,196);
rect(335,475,7.5,7.5);
stroke(0,161,196);
fill(0,161,196);
rect(348.5,475,7.5,7.5);
stroke(0,161,196);
fill(0,161,196);
rect(335,487.5,7.5,7.5);
stroke(0,161,196);
fill(0,161,196);
rect(348.5,487.5,7.5,7.5);

// skorsten
stroke(0,0,0);
fill(188,71,25);
quad(340,400,350,400,350,380,340,380);
quad(340,380,345,375,355,375,350,380);
quad(355,375,350,380,350,400,355,400);
// mand
stroke(0,0,0);
fill(0,0,0);
ellipse(hovedX,hovedY,20,20); // hoved

line(kropStartX,kropStartY,kropSlutX,kropSlutY);  // krop

line(benSamlingX,benSamlingY,hoejreBenX,hoejreBenY);  // højre ben
line(benSamlingX,benSamlingY,venstreBenX,venstreBenY);  // venstre ben

line(armeSamlingX,armeSamlingY,hoejreArmX,hoejreArmY);  // høre arm
line(armeSamlingX,armeSamlingY,venstreArmX,venstreArmY);  // venstre arm

venstreBenX += 20;
benSamlingX += 20;
hoejreBenX += 20;
hovedX += 20;
armeSamlingX += 20;
venstreArmX += 20;
hoejreArmX += 20;
kropStartX += 20;
kropSlutX += 20;

}
