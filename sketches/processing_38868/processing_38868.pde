
/***********************
dynamic self portrait
Week 2, intro to processing with Matt Richard
Zach P. 9/13/11
***********************/

float monsterX;
float monsterY;
float browY;
float eyeSize;
float xTail = 0;
float incrTail = .5;

void setup(){
  size(800,800);
  smooth();
  background(0);
}

void draw(){
background(0);

//PORTRAIT

//face
noStroke();
fill(242,208,176);
rectMode(CENTER);
rect(400,400,400,400);
quad(200,600,350,740,450,740,600,600);
ellipse(200,450,80,130);
ellipse(600,450,80,130);
fill(185,150,120);
ellipse(200,450,40,80);
ellipse(600,450,40,80);
//hair
fill(85,50,25);
ellipse(400,200,400,240);
triangle(200,200,200,400,400,200);
triangle(600,200,600,400,520,200);
//brows
browY = 374 - constrain((500/dist(mouseX,mouseY,400,625)),0,20);
stroke(85,50,25);
strokeWeight(20);
line(440,380,500,browY);
line(360,380,300,browY);
line(500,browY,550,380);
line(300,browY,250,380);
//nose
strokeWeight(4);
strokeCap(ROUND);
stroke(185,150,120);
line(350,530,380,560);
line(380,560,420,560);
line(420,560,450,530);
//mouth
noStroke();
fill(255,0,0,100);
if ((mouseX >= 300) && (mouseX <= 500) && (mouseY >= 550) && (mouseY <= 650)) {
bezier(310,625,350,575,450,575,490,625);
}
else{
bezier(320,600,360,650,440,650,480,600);
}
/*see the bezier
strokeWeight(1);
stroke(0);
line(320,600,360,650);
line(440,650,480,600);
*/

//eyes
eyeSize = 40 + constrain((500/dist(mouseX,mouseY,400,625)),0,10);
stroke(0);
strokeWeight(2);
fill(255);
ellipse(306,420,100,eyeSize);
ellipse(494,420,100,eyeSize);
noStroke();
fill(100,100,30);
//moving eyes
noStroke();
fill(50,100,20,200);
ellipse ((map(mouseX,0,800,296,316)), (map(mouseY,0,800,410,430)), 30, 30);
ellipse ((map(mouseX,0,800,484,504)), (map(mouseY,0,800,410,430)), 30, 30);
fill(0);
ellipse ((map(mouseX,0,800,296,316)), (map(mouseY,0,800,410,430)), 15, 15);
ellipse ((map(mouseX,0,800,484,504)), (map(mouseY,0,800,410,430)), 15, 15);
fill(255,255,255,150);
ellipse ((map(mouseX,0,800,300,320)), (map(mouseY,0,800,405,425)), 7, 7);
ellipse ((map(mouseX,0,800,488,508)), (map(mouseY,0,800,405,425)), 7, 7);

//MONSTER

//tentacles

xTail += incrTail;
if (xTail > 20 || xTail < -20) {
incrTail *= -1;
}
 
  stroke (random(255),random(255),random(255), 75);
  strokeWeight (3);
  noFill ();
  beginShape();
  curveVertex (mouseX-60, mouseY-20);
  curveVertex (mouseX-40, mouseY);
  curveVertex (mouseX-xTail, mouseY+50);
  curveVertex (mouseX+20+xTail, mouseY+100);
  curveVertex (mouseX-30-xTail, mouseY+150);
  curveVertex (mouseX+20+xTail, mouseY+200);
  curveVertex (mouseX-40-xTail, mouseY+250);
  endShape();
  
    beginShape();
  curveVertex (mouseX-20, mouseY-20);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX+xTail, mouseY+50);
  curveVertex (mouseX+20-xTail*.5, mouseY+100);
  curveVertex (mouseX-40+xTail, mouseY+150);
  curveVertex (mouseX+10-xTail*.8, mouseY+200);
  curveVertex (mouseX-30+xTail, mouseY+250);
  endShape();
  
     beginShape();
  curveVertex (mouseX, mouseY-20);
  curveVertex (mouseX+30, mouseY);
  curveVertex (mouseX+20+xTail, mouseY+50);
  curveVertex (mouseX-10+xTail*.2, mouseY+100);
  curveVertex (mouseX-40-xTail, mouseY+150);
  curveVertex (mouseX+xTail*.8, mouseY+200);
  curveVertex (mouseX-20+xTail, mouseY+250);
  endShape();
  
      beginShape();
  curveVertex (mouseX, mouseY-20);
  curveVertex (mouseX-40, mouseY);
  curveVertex (mouseX-30-xTail, mouseY+50);
  curveVertex (mouseX-10-xTail*.2, mouseY+100);
  curveVertex (mouseX-10+xTail, mouseY+150);
  curveVertex (mouseX-xTail*.8, mouseY+200);
  curveVertex (mouseX-20+xTail, mouseY+250);
  endShape();
  
  //body
monsterX = (mouseX+random(-5,5));
monsterY = (mouseY+random(-5,5));

ellipseMode(CENTER);
fill(240,0,80);
ellipse(mouseX-2+random(-5,5),mouseY+3+random(-5,5),95,70);
fill(255,0,40,160);
ellipse(monsterX,monsterY,120,100);
fill(255,255,255,100);
ellipse(monsterX+10,monsterY-30,30,25);
ellipse(monsterX+35,monsterY-20,15,12);
}

