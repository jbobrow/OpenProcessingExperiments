
//music
import ddf.minim.*;

import ddf.minim.analysis.*;
Minim minim;
AudioPlayer jingle;
FFT fftLin;
FFT fftLog;

//floats
float x;
float y;
float height4;
float height24;
float targetX, targetY;
float easing = 0.12;
float easing2 = 0.07;

void setup (){
frameRate(12);
  size (600,590);
  height4 = height/44;
  height24 = 3*height/2;
minim = new Minim(this);
jingle = minim.loadFile("Edge of a City.mp3",2048);
jingle.loop();
fftLog = new FFT (jingle.bufferSize(), jingle.sampleRate());
fftLog.logAverages(24,4);
ellipseMode(CENTER);
noCursor();
}

//star int
int radius=5;



void draw(){

  background(0);


//SQUare sTars
pushMatrix();
   fill(255,255,5,random(255));
  translate (random(300),random(300));
    
    if (mouseX>300){
 rect(random (80),random(180),random(2.5),random(3));
 rect(random (480),random(480),random(2.5),random(3));
 rect(random (380),380,random(5),random(4));
}
else{
   rect(random (80),random(130),random(6),random(8));
 rect(random (480),random(580),random(4),random(10));
 rect(random (380),380,random(6),random(7));
}
popMatrix();

// 
//stars

//stars
fill(247,247,0);
ellipseMode(RADIUS);

ellipse(150,500,mouseY/22,mouseY/22);

//ellipse(434,434,((mouseX-250)/5)+50,((mouseY-200)/5)+50);


/*ellipse(200,50,mouseX/5,mouseY/5);
ellipse(250,50,mouseX/5,mouseY/5);
ellipse(300,50,mouseX/5,mouseY/5);
ellipse(350,50,mouseX/5,mouseY/5);
ellipse(400,50,mouseX/5,mouseY/5);
ellipse(450,50,mouseX/5,mouseY/5);
//translate(mouseX,mouseY);
ellipse(500,50,mouseX/5,mouseY/5);
*/

//mouse track
line(mouseX-5,mouseY,mouseX+5,mouseY);
line(mouseX,mouseY-5,mouseX,mouseY+5);
println("x "+mouseX+" :y "+mouseY);


//sun
smooth();
 strokeWeight(3);
  stroke(255,68,0);
  fill(247,247,0);
  ellipse(480,79,radius,radius);
  radius=radius+mouseX/120;
  if (radius>50){
    radius=radius-(mouseX*2/mouseY);
  if (mousePressed == true){
    radius=radius*(mouseX/1800);
    triangle (480-mouseX/1600,79,490,79,485,88+radius);
     strokeWeight (400);

//  if (radius<60)   
  }
}

//sun face



//EQ star

fftLog.forward(jingle.mix);
  int w = int(width/fftLog.avgSize()+random(20));
  for(int i = 0; i < fftLog.avgSize(); i++)
  {
    fill(random(255),random(255),random(255));
    ellipse(335,250, height/40 - fftLog.getAvg(i)*3, height/40 - fftLog.getAvg(i)*3);
    //height - fftLog.getAvg(i)*3  
 }

//alien
//alien character left
pushMatrix();
translate (400-(mouseX+random(4)),400-mouseY);
fill(22,196,0,120);
stroke(random(22),196,random(-6));
ellipse (128,300,10,20);
fill(255);
ellipse (128,290,8,8);
fill(0);
noStroke();
ellipse (128,290,4,4);
if (mousePressed == false){
   fill(22,196,0);
   ellipse (128,290,8,8);
   stroke(1);
   strokeWeight(0);
   ellipse (128,290,8,3);
   }
//alien character right
strokeWeight(3);
stroke(random(22),196,random(-6));
fill(22,196,0,120);
ellipse (152,300,10,20);
fill(255);
ellipse (152,290,8,8);
fill(0);
noStroke();
ellipse (152,290,4,4);

if (mousePressed == true){
   fill(22,196,0);
   ellipse (152,290,8,8);
   stroke(1);
   strokeWeight(0);
   ellipse (152,290,8,3);
   }
//tentacles left
 noFill();
 stroke(22,196,0);
 strokeWeight(3);
bezier(116,326,110+random(10),352-random(10),94+random(20),376-random(10),102,358+random(20));
bezier(126,326,120+random(10),352-random(10),124+random(20),376-random(10),132,368+random(20));
//tentacles right
bezier(146,326,140+random(10),352-random(10),144+random(20),376-random(10),155,368+random(20));
bezier(156,326,160+random(10),352-random(10),154+random(20),376-random(10),176,360+random(20));

//dome
stroke(random(55),random(236),random(255));
strokeWeight(random(3));
fill(random(55),236,255,20);
ellipse(140,300,30,30);

//ship
fill(180);
stroke(100);
strokeWeight(2);
ellipse(140,320,50,15);
fill(random(55),random(236),random(255));
ellipse(108,320,8,8);
fill(random(155),random(236),random(55));
ellipse(129,320,10,10);
//ellipse(125,320,10,10);
fill(random(55),random(236),random(255));
ellipse(151,320,10,10);
fill(random(155),random(236),random(55));
ellipse(172,320,8,8);
popMatrix();

//mini aliens

pushMatrix();

//mini alien 1
translate (130-(mouseX*3),160-mouseY);

stroke(random(255),random(0),random(55),random(120));
fill(random(255),random(236),random(55),random(50));
ellipse(152,298,18,24);
strokeWeight(3);
stroke(random(22),196,random(-6));
fill(22,196,0,120);
ellipse (152,300,10,20);
fill(255);
ellipse (152,290,8,8);
fill(0);
noStroke();
ellipse (152,290,4,4);

if (mousePressed == true){
   fill(22,196,0);
   ellipse (152,290,8,8);
   stroke(1);
   strokeWeight(0);
   ellipse (152,290,8,3);
   }
fill(180);
stroke(55,236,255,random(220));
fill(180);
ellipse (152,320,18,8);
stroke(255,236,5,random(20));
triangle (161,324,161,328,170,326);
triangle (144,324,144,328,135,326);

//mini alien 2
translate (890-(mouseX*3),700-mouseY);
stroke(random(255),random(0),random(55),random(120));
fill(random(255),random(236),random(55),random(50));
ellipse(152,298,18,24);
strokeWeight(3);
stroke(random(22),196,random(-6));
fill(22,196,0,120);
ellipse (152,300,10,20);
fill(255);
ellipse (152,290,8,8);
fill(0);
noStroke();
ellipse (152,290,4,4);

if (mousePressed == true){
   fill(22,196,0);
   ellipse (152,290,8,8);
   stroke(1);
   strokeWeight(0);
   ellipse (152,290,8,3);
   }
fill(180);
stroke(55,236,255,random(220));
fill(180);
ellipse (152,320,18,8);
stroke(255,236,5,random(20));
triangle (161,324,161,328,170,326);
triangle (144,324,144,328,135,326);
popMatrix();

//mini alien 3
pushMatrix();
translate (890-(mouseX*3),700-mouseY);
stroke(random(255),random(0),random(55),random(120));
fill(random(255),random(236),random(55),random(50));
ellipse(152,298,18,24);
strokeWeight(3);
stroke(random(22),196,random(-6));
fill(22,196,0,120);
ellipse (152,300,10,20);
fill(255);
ellipse (152,290,8,8);
fill(0);
noStroke();
ellipse (152,290,4,4);

if (mousePressed == true){
   fill(22,196,0);
   ellipse (152,290,8,8);
   stroke(1);
   strokeWeight(0);
   ellipse (152,290,8,3);
   }
fill(180);
stroke(55,236,255,random(220));
fill(180);
ellipse (152,320,18,8);
stroke(255,236,5,random(20));
triangle (161,324,161,328,170,326);
triangle (144,324,144,328,135,326);

//mini alien4
translate (800-(mouseX*3),-180+(mouseY+mouseX/10));
stroke(random(255),random(0),random(55),random(120));
fill(random(255),random(236),random(55),random(50));
ellipse(152,298,18,24);
strokeWeight(3);
stroke(random(22),196,random(-6));
fill(22,196,0,120);
ellipse (152,300,10,20);
fill(255);
ellipse (152,290,8,8);
fill(0);
noStroke();
ellipse (152,290,4,4);

if (mousePressed == true){
   fill(22,196,0);
   ellipse (152,290,8,8);
   stroke(1);
   strokeWeight(0);
   ellipse (152,290,8,3);
   }
fill(180);
stroke(55,236,255,random(220));
fill(180);
ellipse (152,320,18,8);
stroke(255,236,5,random(20));
triangle (161,324,161,328,170,326);
triangle (144,324,144,328,135,326);


popMatrix();

//mini alien5
pushMatrix();
translate (780-(mouseX*3),-480+(mouseY+mouseX/12));
stroke(random(255),random(0),random(55),random(120));
fill(random(255),random(236),random(55),random(50));
ellipse(152,298,18,24);
strokeWeight(3);
stroke(random(22),196,random(-6));
fill(22,196,0,120);
ellipse (152,300,10,20);
fill(255);
ellipse (152,290,8,8);
fill(0);
noStroke();
ellipse (152,290,4,4);

if (mousePressed == true){
   fill(22,196,0);
   ellipse (152,290,8,8);
   stroke(1);
   strokeWeight(0);
   ellipse (152,290,8,3);
   }
fill(180);
stroke(55,236,255,random(220));
fill(180);
ellipse (152,320,18,8);
stroke(255,236,5,random(20));
triangle (161,324,161,328,170,326);
triangle (144,324,144,328,135,326);
popMatrix();


//mini alien6
pushMatrix();
translate (1000-(mouseX*3),-680+(mouseY+mouseX/16));
stroke(random(255),random(0),random(55),random(120));
fill(random(255),random(236),random(55),random(50));
ellipse(152,298,18,24);
strokeWeight(3);
stroke(random(22),196,random(-6));
fill(22,196,0,120);
ellipse (152,300,10,20);
fill(255);
ellipse (152,290,8,8);
fill(0);
noStroke();
ellipse (152,290,4,4);

if (mousePressed == true){
   fill(22,196,0);
   ellipse (152,290,8,8);
   stroke(1);
   strokeWeight(0);
   ellipse (152,290,8,3);
   }
fill(180);
stroke(55,236,255,random(220));
fill(180);
ellipse (152,320,18,8);
stroke(255,236,5,random(20));
triangle (161,324,161,328,170,326);
triangle (144,324,144,328,135,326);


popMatrix();
/*

/*
if (mousePressed = false){
  ellipse (150,320,30,9);
}
  */

noStroke();
fill (255,235,55,random(30));
translate(0,80);
ellipse(85,60, 800-(mouseX+mouseY/2)*1.2,800-(mouseX+mouseY/2)*1.2);
fill(47,167,110,100);
ellipse(85,60,mouseX/23,mouseX/23);
fill(247,247,0,random(20));
ellipse(85,60,800-(mouseX+mouseY/5)*1.2,800-(mouseX+mouseY/5)*1.2);

translate(210,220);
fill(247,247,0,100);
ellipse(205,160,mouseX/15,mouseX/15);
fill(247,247,0,180);
ellipse(205,160,mouseX/4,mouseX/4);
fill(247,10,10,random(100));

stroke(247,10,192,200);
strokeWeight(random(6));
ellipse(205,160,mouseX/(18+(mouseY/10)),mouseX/(18+(mouseY/10)));
noStroke();

//spaceship

 translate(-250,-340);


//scale(mouseX,mouseY);

//bubble trail
targetX = mouseX;
  float dx = mouseX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  targetY = mouseY;
  float dy = mouseY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }


noFill();
stroke(55,236,255,random(120));
strokeWeight(random (3));
  ellipse(x, y+10, 5, 5);
stroke(55,236,255,random(80)); 
 ellipse(x+random(4), y+random(10), 4, 4);
 ellipse(x+random(10), y+random(10), 5, 5);
 ellipse(x, y+random(10), 6, 6);
 ellipse(x, y+random(20), 6, 6);
 ellipse(x, y+random(24), 3,3);
  
/*targetX = mouseX;
  float dx = mouseX - x;
  if(abs(dx) > 1) {
    x += dx * easing2;
  }
  
  targetY = mouseY;
  float dy = mouseY - y;
  if(abs(dy) > 1) {
    y += dy * easing2;
  }
fill(55,236,255,random(200));
 ellipse(x, y+random(20), 6, 6);
 ellipse(x, y+random(24), 3,3);*/

//flames
strokeWeight(0);
fill(247,91,0);
triangle(mouseX,mouseY+(random(22)),mouseX+8,mouseY+7.5,mouseX-8,mouseY+7.5);  
fill(247,247,0);
triangle(mouseX,mouseY+(random(18)),mouseX+4,mouseY+7.5,mouseX-4,mouseY+7.5);  


//spaceship forcefield
  if (mousePressed == true){
    fill(random(255),random(236),random(53),255);
    ellipse (mouseX,mouseY, 80,80);
     fill(random(55),random(236),random(153),200);
    ellipse (mouseX,mouseY, 280,280);
    fill(random(0),random(236),random(253),random(80));
    ellipse (mouseX,mouseY, 380,380);
  }
  
  fill(random(255),random(236),random(53),random(100));
  ellipse (mouseX,mouseY, 50,50);
  

 //planet
if (mouseY>540){
  fill (173,120,5);
  ellipse (250,1065,700,460);
  }

if (mouseY>564){
  fill (173,109,5);
  ellipse (250,1050,600,470);
  }
  //planetdoor
 if (mouseY>564){
  fill (0);
  rect (220,579,60,16);
  }
 if (mouseY>564){
  fill (180);
  rect (220,588,60,4);
 }
 
 //main ship body 
   fill(247,10,10);
  triangle(mouseX,mouseY-26,mouseX+10,mouseY-15,mouseX-10,mouseY-15);  
  triangle(mouseX,mouseY+7,mouseX+10,mouseY-15,mouseX-10,mouseY-15);
  triangle(mouseX,mouseY-7,mouseX+8,mouseY+4,mouseX-8,mouseY+4);

//space opi  
  fill(55,236,255);
  ellipse(mouseX-0.25,mouseY-12,7,4);
    //ears
    ellipse(mouseX-2.75,mouseY-15.5,2,4);
     ellipse(mouseX+2.25,mouseY-15.5,2,4);
     
  //eyes   
  fill(0);
  ellipse(mouseX+1.8,mouseY-12.5,1,0.75);
  ellipse(mouseX-2.05,mouseY-12.5,1,0.75);

/*stroke(55,235,255);
strokeWeight(6);
noFill();
bezier(198,599,mouseY-140,mouseX-159,mouseX-120,mouseY-120,302,599);
*/ 

 }




