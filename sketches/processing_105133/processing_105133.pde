
int i  = 0; 
PImage Pimage;
PImage pImage;

void setup() {


size(1000, 1000);
}
int a = 0;

void draw() {





  
background(49,255,236);
fill(255, 170, 231);
stroke(255,170,231);
arc(250, 250, 500, 500, PI, TWO_PI);
fill(49, 255, 236);
stroke(49,255,236);
arc(250, 250, 450, 450, PI, TWO_PI);
fill(255, 168, 100);
stroke(255,168,100);
arc(250, 250, 400, 400, PI, TWO_PI);
fill(127, 247, 12);
stroke(127,247,12);
arc(250, 250, 350, 350, PI, TWO_PI);
fill(49, 226, 255);
stroke(49,266,255);
arc(250, 250, 300, 300, PI, TWO_PI);
fill(49,255,236);
stroke(49,255,236);
arc(250, 250, 250, 250, PI, TWO_PI);

fill(127, 247, 12);
stroke(127, 247, 12);
rect(625, 650, 1000, 250);
fill(127, 247, 12);
stroke(127, 247, 12);
rect(625, 250, 1000, 250);
fill(127, 247, 12);
stroke(127, 247, 12);
rect(625, 500, 1000, 250);
fill(127, 247, 12);
stroke(127, 247, 12);
rect(0,500,100,250);
fill(127,247,12);
stroke(127,247,12);
rect(0,250,1000,250);
fill(127,247,12);
stroke(127,247,12);
rect(0,500,1000,250);
fill(127,247,12);
stroke(127,247,12);
rect(0,650,1000,250);
fill(127,247,12);
stroke(127,247,12);
rect(0,700,1000,250);


fill((random(250)),(random(250)),(random(250)));
noStroke();
arc(680,100,50,50,HALF_PI,PI+HALF_PI);
arc(690,85,50,50,PI,TWO_PI);
arc(710,85,50,50,PI,TWO_PI);
ellipse(720,100,50,50);
ellipse(690,100,50,50);

fill((random(250)),(random(250)),(random(250)));
noStroke();
arc(580,50,50,50,HALF_PI,PI+HALF_PI);
arc(590,35,50,50,PI,TWO_PI);
arc(610,35,50,50,PI,TWO_PI);
ellipse(620,50,50,50);
ellipse(590,50,50,50);

fill((random(250)),(random(250)),(random(250)));
noStroke();
arc(880,100,50,50,HALF_PI,PI+HALF_PI);
arc(890,85,50,50,PI,TWO_PI);
arc(910,85,50,50,PI,TWO_PI);
ellipse(920,100,50,50);
ellipse(890,100,50,50);

fill((random(250)),(random(250)),(random(250)));
noStroke();
arc(780,140,50,50,HALF_PI,PI+HALF_PI);
arc(790,125,50,50,PI,TWO_PI);
arc(810,125,50,50,PI,TWO_PI);
ellipse(820,140,50,50);
ellipse(790,140,50,50);


fill((random(250)),(random(250)),(random(250)));
noStroke();
arc(480,140,50,50,HALF_PI,PI+HALF_PI);
arc(490,125,50,50,PI,TWO_PI);
arc(510,125,50,50,PI,TWO_PI);
ellipse(520,140,50,50);
ellipse(490,140,50,50);


fill((random(250)),(random(250)),(random(250)));
noStroke();
arc(80,140,50,50,HALF_PI,PI+HALF_PI);
arc(90,125,50,50,PI,TWO_PI);
arc(110,125,50,50,PI,TWO_PI);
ellipse(120,140,50,50);
ellipse(90,140,50,50);

fill(255,255,0);
stroke(0);
arc(925,250,220,220,PI,TWO_PI);

fill(0);
ellipse(950,170,20,20);


fill(0);
stroke(255,255,0);
arc(915,200,70,70,0,180);

fill(255,255,0);
stroke(255,255,0);
arc(915,200,70,70,PI,TWO_PI);





fill(0);
ellipse(880,180,20,20);

fill(255,255,0);
stroke(0);
triangle(800,210,720,220,720,210);


fill(255,255,0);
stroke(0);
triangle(810,155,730,140,730,130);


fill(255,255,0);
stroke(0);
triangle(890,120,870,80,870,60);

Pimage = loadImage("Machinima.jpg");
Pimage.resize(200,200);
image(Pimage,500,500);


if(keyPressed){
  
fill(255,255,0);
noStroke();
arc(915,220,80,70,0,180);

fill(0);
arc(915,225,70,70,PI,TWO_PI);

pImage = loadImage("tumblr_m9vopaHP0L1ropj3qo1_500.png");
pImage.resize(200,200);
image(pImage,500,500);

  }
}











