
PImage kandinsky;

void setup() {

size (1090,755);
kandinsky = loadImage("data/kandinsky.jpg");
}

void draw() {
  
background(238,228,193);
//image(kandinsky, 0, 0);
//blendMode(BLEND);
noStroke();
fill(196,110,75);
ellipse(140,140,260,260);
for(int i=0;i<20;i++){
fill(196,110,75,100 - (i*5));
ellipse(140,140,260 + i*4,260 + i*4);
}
for(int i=0;i<20;i++){
fill(244,185,69, 100 - i*5);
ellipse(215,255,85 + i*4,85 + i*4);
}
fill(182,27,0);
ellipse(215,255,85,85);
fill(0);
ellipse(140,140,220,220);
fill(75,37,78);
ellipse(140,140,100,100);

for(int i=0;i<10;i++){
fill(173,111,255, 100 - i*10);
ellipse(110,535,100 + i*4,100 + i*4);
}
for(int i=0;i<20;i++){
fill(135,176,180, 100 - i*5);
ellipse(110,535,80 + i*4,80 + i*4);
}
fill(0);
ellipse(110,535,78,78);
fill(244,185,69);
ellipse(110,535,75,75);

for(int i=0;i<10;i++){
fill(244,185,69, 100 - i*10);
ellipse(425,659,75 + i*4,75 + i*4);
}
fill(237,198,157);
ellipse(425,659,75,75);
fill(72,132,160);
ellipse(423,657,60,60);

fill(139,117,156);
ellipse(815,580,60,60);

fill(221,181,70);
triangle(932,512,865,590,960,620);
//blendMode(MULTIPLY);
fill(169,176,132);
ellipse(945,635,105,105);
//blendMode(BLEND);
fill(130,41,33);
rect(988,663,40,40);
stroke(0);
strokeWeight(1);
line(1010,680,1040,680);
strokeWeight(2);
line(1010,685,1040,685);
noStroke();

stroke(0);
strokeWeight(1);
fill(255);
ellipse(545,225,75,75);
strokeWeight(5);
ellipse(545,225,50,50);

strokeWeight(1);
fill(244,185,69);
ellipse(540,150,20,20);

fill(144,165,168);
ellipse(600,65,30,30);

noFill();
ellipse(650,185,30,30);

fill(169,176,132);
ellipse(725,105,35,35);
stroke(255);
fill(72,132,160);
ellipse(725,105,28,28);
noStroke();
fill(244,185,69);
triangle(685,55,658,95,710,95);

stroke(0);
strokeWeight(3);
fill(244,185,69);
rect(900,40,15,15);

strokeWeight(1);
fill(244,185,69);
ellipse(970,135,50,50);
noStroke();
fill(113,183,209);
ellipse(970,135,40,40);

stroke(0);
strokeWeight(2);
fill(255);
ellipse(1050,155,40,40);

noStroke();
fill(186,88,49);
ellipse(975,200,50,50);
fill(182,166,166);
ellipse(973,199,45,45);

fill(186,88,49);
ellipse(855,160,65,65);
//blendMode(SCREEN);
fill(244,185,69);
ellipse(835,160,75,75);
//blendMode(BLEND);
stroke(0);
strokeWeight(3);
noFill();
ellipse(835,160,75,75);
//blendMode(MULTIPLY);
noStroke();
fill(212,144,155);
rect(760,165,65,50);
//blendMode(BLEND);

fill(255);
rect(1020,290,25,25);
rect(1045,315,25,25);
fill(198,91,85);
rect(1045,290,25,25);
fill(213,177,143);
rect(1020,315,25,25);
stroke(0);
strokeWeight(2);
line(1020,255,1020,390);
line(1045,255,1045,390);
line(1070,255,1070,390);
line(975,290,1090,290);
line(975,315,1090,315);
line(975,340,1090,340);

noStroke();
fill(0);
beginShape();
vertex(535,370);
vertex(645,215);
vertex(815,315);
vertex(645,225);
endShape(CLOSE);
fill(124,146,97);
beginShape();
vertex(535,370);
vertex(645,225);
vertex(815,315);
vertex(649,232);
endShape(CLOSE);

fill(0);
beginShape();
vertex(140,465);
vertex(145,460);
vertex(320,555);
vertex(310,565);
endShape(CLOSE);

stroke(0);
strokeWeight(1);
line(310,565,560,270);

fill(255);
arc(510,505,90,90,PI,TWO_PI);
arc(600,505,90,90,PI,TWO_PI);
arc(690,505,90,90,PI,TWO_PI);
arc(780,505,90,90,PI,TWO_PI);
stroke(153,164,148);
strokeWeight(3);
arc(510,505,86,86,PI,TWO_PI);
stroke(254,236,128);
arc(600,505,86,86,PI,TWO_PI);
stroke(195,69,11);
arc(690,505,86,86,PI,TWO_PI);

stroke(0);
strokeWeight(1);
line(755,0,755,135);
line(760,0,760,135);
line(740,25,775,25);
line(740,28,775,28);
line(740,120,775,120);
line(740,123,775,123);
line(740,126,775,126);
noFill();
arc(765,60,35,35,0+QUARTER_PI,PI*2-QUARTER_PI,OPEN);

line(285,690,480,560);
line(320,735,455,600);

line(650,475,650,755);
line(450,595,555,595);
line(450,620,555,620);

line(195,360,365,185);
line(365,185,670,455);

line(365,60,365,260);
line(320,70,460,133);
line(335,135,400,135);
line(340,150,410,150);

line(115,365,505,260);


line(740,580,915,580);
line(795,660,920,660);

line(550,65,740,185);
line(555,110,740,185);

line(565,275,680,220);
line(566,280,681,225);

bezier(450,220,455,155,520,55,575,40);
bezier(460,235,470,170,505,120,560,100);

strokeWeight(3);
stroke(180,51,56);
line(555,303,740,208);
strokeWeight(1);
stroke(0);
line(555,305,740,210);

line(650,295,772,192);
line(620,345,783,193);


strokeWeight(2);
line(650,10,475,670);
line(650,10,855,700);
line(360,505,930,505);

stroke(244,185,69);
line(683,308,773,240);
stroke(0);
line(683,306,773,238);

}



