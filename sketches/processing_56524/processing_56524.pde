
float easing = 0.02;
float x=120;
float y=30;
float h = 30;
float eh = 5;
float angle=0.0;
float er=150;
float hy=100;
PImage img; 

void setup() {
size(720, 480);
smooth();
img = loadImage ("alpine.png");
background(255);
}

//body

int a = 40;

//int er = 150;
//int hy = 100;

//int bx = er - 30;
//int by = hy + 140;
//int hx = 120;

int hr = 140;

int ey = 100;
int e = 10;
int el = 90;

//int x = 120;
//int y = 30;
int w = 70;
int l = 140;



void draw () {
  background(img);
  //Image(img,0,0);
  //if((mouseX > x) && (mouseX < x+w) &&
  //   (mouseY > y) && (mouseY < y+l)) {
   er += random (-2, 2);
   hy += random (-1,1);
   
   h = 50 + sin(angle)*20;
   eh = 50 + sin (angle)*20;
   angle += 0.05;
  //   } //else {
        //er = 150;
        //hy = 100;}
//  if (mousePressed) {
//h = 30;
//eh = 5;
//} else {
//h = 0;
//eh = 0;
//}


  //right arm
  fill(0);                  //colour
  triangle(er+35,hy+75,er+45,hy+70,er+30,hy+55);
  triangle(er+50,hy+68,er+63,hy+47,er+60,hy+70);
  triangle(er+85,hy+70,er+63,hy+85,er+60,hy+73);
  noStroke();
  fill(100);                //colour
  ellipse(er+40,hy+100,a,a);
  noStroke();
  fill(150);                //colour
  ellipse(er+30,hy+110,a,a);
  //stroke(0);
  fill(50);                 //colour
  ellipse(er+20,hy+120,a,a);
  //noStroke();
  fill(200);                //colour
  ellipse(er+50,hy+80,a-10,a-10);
    //ellipse(170,220,40,40);
    //stroke(0);
    
//stroke(0);
fill(255);
  
  //left arm
  fill(150);                //colour
  ellipse(er-70,hy+150,a,a);
  //ellipse(70,230,40,40);
  fill(50);                //colour
  ellipse(er-80,hy+130,a,a);

fill(175);                //colour
strokeWeight(5);
stroke(50);
triangle(er-100,hy+100,er-60,hy+110,er-80,hy+130); //left shoulder
triangle(er+30,hy+80,er,hy+110,er+20,hy+130); //right shoulder
stroke(0);
fill(110);                //colour
triangle(er-50,hy+160,er-10,hy+160,er-30,hy+220); //bottom
stroke(30);
strokeWeight(1);
fill(255);                //colour
ellipse(er-30,hy+140,100,100);
stroke(0);
strokeWeight(5);
ellipse(er-30,hy+140,80,80);
strokeWeight(10);
stroke(80);
ellipse(er-30,hy+140,60,60);

//neck
smooth();
noFill();                //colour
strokeWeight (10);
stroke(150);
ellipse(er-30,hy+50,100,100);
strokeWeight(1);

//head
stroke(50);
strokeWeight(5);
fill(200);                 //colour
ellipse(er-30,hy,hr,hr-h);
noFill();                  //colour
strokeWeight(10);
stroke(255);
ellipse(er-30,hy,hr-40,hr-40-h);
//ellipse(120,100,60,60);
strokeWeight(1);
stroke(50);

fill(50);                  //colour
//rect(60,50,120,10);
//rect(50,60,140,10);

//eyes
rect(er-5,hy-35,10,70);
quad(er-20,hy-23,er+28,hy+20,er-26,hy-22,er+20,hy+25);
quad(er-27,hy+20,er+16,hy-30,er-20,hy+26,er+25,hy-25);
rect(er-34,hy-5,70,10);
ellipse(er-60,hy,e+20,e+20-eh);
ellipse(er,hy,e+30,e+30-eh);

fill(255);
noStroke();
ellipse(er,hy,e+10,e+10-eh);
ellipse(er-60,hy,e,e-eh);
//fill(237,29,47);
//ellipse(150,100,8.5,8.5)

//fill(101,188,70);
//ellipse(90,100,5,5); 
//ellipse(150,100,7,7); 
//rect(115,235,10,10);
}


