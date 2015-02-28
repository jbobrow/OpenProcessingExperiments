
int red=70;
int green=35;
int blue=35;

void setup() {
size(700,800);
frameRate(40);
}

void draw() {
background(red,green,blue); // céu mudando de cor

if(blue<250)blue+=2;
if(green<150)green++;

noStroke();
fill(255,255,0);
ellipse(50,70,60,60); // sol

fill(0,255,0);
rect(0,700,800,100); // grama

fill(200,200,200);
rect(300,300,60,100); // parte cinza do predio
rect(290,400,80,100);
rect(280,500,100,200);


stroke(0); // linhas horizontais do predio
for(int z=300; z<700; z+=10) {
  if(z<400) {
    line(300,z,360,z);
  } else if(z<500) {
    line(290,z,370,z);
  } else {
    line(280,z,380,z);
  }
}

line(300,300,300,400);
line(360,300,360,400);
line(290,400,290,500);
line(370,400,370,500);
line(280,500,280,700);
line(380,500,380,700);

fill(0);
rect(320,640,20,60); // porta

fill(150,150,250);
ellipse(300,580,20,20); // janelas
ellipse(330,580,20,20);
ellipse(360,580,20,20);
ellipse(315,450,20,20);
ellipse(345,450,20,20);
ellipse(330,350,20,20);

noStroke();
fill(255,200);
ellipse(300,70,100,60); // nuvens
ellipse(350,90,100,60);

fill(0,0,255);
ellipse(550,750,100,60); // lagoa
ellipse(525,740,100,60);

fill (0,255,0);
ellipse(100,580,100,60);
ellipse(170,595,100,60);

fill(150,100,100);
rect(100,610,10,100);
rect(170,625,10,80);

}
