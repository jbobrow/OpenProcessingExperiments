
float posiciox=-150;
float posicioy=random(0,400);
float posiciox2=-450;
float posicioy2=random(0,400);

void setup(){
size(500,550);
noCursor();
}

void draw(){
fons();
movement();
person();
}
  
void fons(){  
background(200,255,255);
}

void movement(){
fill(255,255,255);
noStroke();
ellipse(posiciox,posicioy,200,100);
ellipse(posiciox-75,posicioy-50,100,75);
ellipse(posiciox,posicioy-50,75,50);
ellipse(posiciox+75,posicioy+50,100,75);
ellipse(posiciox-25,posicioy+50,75,50);
posiciox=posiciox+0.9;
posicioy=posicioy;
if(posiciox>650) {posiciox=-150;}

ellipse(posiciox2,posicioy2,200,100);
ellipse(posiciox2-75,posicioy2-50,100,75);
ellipse(posiciox2,posicioy2-50,75,50);
ellipse(posiciox2+75,posicioy2+50,100,75);
ellipse(posiciox2-25,posicioy2+50,75,50);
posiciox2=posiciox2+0.9;
posicioy2=posicioy2;
if(posiciox2>650) {posiciox2=-450;}
}

void person(){ 
//tub
noStroke();
fill(115,220,50);
rect(177,352,140,50);
rect(187,402,120,150);
fill(175,245,100);
rect(177,352,30,50);
rect(187,402,30,150);
fill(100,180,55);
rect(287,352,30,50);
rect(277,402,30,150);
fill(225,255,140);
rect(177,352,10,50);
rect(187,402,10,150);
fill(80,145,50);
rect(307,352,10,50);
rect(297,402,10,150);
noFill();
stroke(65,65,65);
strokeWeight(6);
rect(177,352,140,50);
rect(187,402,120,150);
textSize(25);
textAlign(CENTER);
fill(65,65,65);
text("Oppa",247,455);
text("Flappy",247,480);
text("Style",247,505);

//hombros
noStroke();
fill(255-mouseX/2,60,mouseY/2);
rect(mouseX-53,mouseY+46,100,60,35);

stroke(65,65,65);
strokeWeight(6);
noFill();
rect(mouseX-53,mouseY+46,100,70,35);

//cames
fill(40,40,40);
stroke(65,65,65);
strokeWeight(6);
rect(mouseX-28,mouseY+136,25,100);
rect(mouseX-3,mouseY+136,25,100);

//relleno panxa,ralla mig
noStroke();
rect(mouseX-28,mouseY+116,50,38);

fill(255-mouseX/2,60,mouseY/2);
rect(mouseX-28,mouseY+101,50,40);

stroke(65,65,65);
strokeWeight(6);
line(mouseX-28,mouseY+138,mouseX+22,mouseY+138);

fill(255,200,150);
ellipse(mouseX-41,mouseY+154,24,24);
ellipse(mouseX+35,mouseY+154,24,24);

//braços
fill(255-mouseX/2,60,mouseY/2);
rect(mouseX-53,mouseY+81,25,70);
rect(mouseX+22,mouseY+81,25,70);

noStroke();
rect(mouseX-50,mouseY+78,19,20);
rect(mouseX+25,mouseY+78,19,20);

//triangle
stroke(65,65,65);
strokeWeight(6);
fill(255,255,255);
triangle(mouseX-28,mouseY+46,mouseX+22,mouseY+46,mouseX-3,mouseY+101);
line(mouseX-3,mouseY+101,mouseX-3,mouseY+136);

//cap
noStroke();
fill(255,255,255);
ellipse(mouseX,mouseY-10,125,85);

fill(mouseY/2+25,255-mouseX/2-75,500-mouseX/2);
ellipse(mouseX,mouseY+11,125,85);

fill(mouseX/2+25,500-mouseY/2,mouseY/2);
ellipse(mouseX,mouseY-4,90,69);

noFill();
stroke(65,65,65);
strokeWeight(6);
ellipse(mouseX-3,mouseY,125,110);

//pajarita
strokeWeight(3);
fill(40,40,40);
triangle(mouseX-28,mouseY+49,mouseX-28,mouseY+69,mouseX-3,mouseY+59);
triangle(mouseX-3,mouseY+59,mouseX+22,mouseY+49,mouseX+22,mouseY+69);

//ull
strokeWeight(6);
fill(255,255,255);
rect(mouseX+4,mouseY-42,55,50,20,27,10,20);
ellipse(mouseX+42,mouseY-17,3,18);

//boca
fill(250,100,70);
rect(mouseX+4,mouseY+8,67,15,10);
rect(mouseX+4,mouseY+23,60,15,10);

//ala
noStroke();
fill(mouseY/2+25,255-mouseX/2-75,500-mouseX/2);
rect(mouseX-75,mouseY-14,55,35,10,30,30,30);

fill(mouseX/2+25,500-mouseY/2,mouseY/2);
rect(mouseX-75,mouseY-24,55,30,10,30,30,30);

noFill();
stroke(65,65,65);
strokeWeight(6);
rect(mouseX-75,mouseY-24,55,47,10,30,30,30);

//peus
fill(255,255,255);
rect(mouseX-3,mouseY+236,40,17,0,10,10,10);
rect(mouseX-28,mouseY+236,40,17,0,10,10,10);
}




