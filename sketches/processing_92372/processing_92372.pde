


PImage bg;
PImage text;
PImage eclaire;

float ouvert;
float fermer;
float x; 
float y;
float t;
float g;
float sx;  
int value = 0;
int timeStamp;
int interval; 


void setup() {
  size(400, 400); 
  frameRate(30);
  smooth(10);
  int d= height;
  
  bg=loadImage("chateau.jpg");
  text=loadImage ("texture.jpg");  
  eclaire= loadImage ("all.png");
  
  x = width/2;
  y = height/2;
  t = 125;
  g = 127;
  sx = 190;
  ouvert = 175;
  fermer = color(2);
  timeStamp= millis();
  interval = 2000;
  
}

void draw() { 

background(25);

if (random (400) < 25) {
  background(eclaire);
} else{ 
background(25) ; }


//vis
beginShape();
stroke(1);
strokeWeight(2);
fill(100);
rect(85, 300, 25, 25, 10);
rect(75,297, 15,30,10);
rect(290, 300, 25, 25, 10);
rect(307, 297, 15, 30, 10);
rect(80, 125, 25, 25, 10);
rect(300, 125, 25, 25, 10);
endShape();
  
// TETE  
  beginShape();
  stroke(1);
  strokeWeight(1);
  fill(47, 91, 51);
  curveVertex(60, 73);
  curveVertex(81, 73);
  curveVertex(90, 158);
  curveVertex(70, 168);
  curveVertex(68, 196);
  curveVertex(80, 238);
  curveVertex(87, 247);
  curveVertex(99, 253);
  curveVertex(102, 333);
  curveVertex(140, 356);
  curveVertex(139, 375);
  curveVertex(200, 387);
  curveVertex(259, 373);
  curveVertex(258, 373);
  curveVertex(258, 359);
  curveVertex(298, 339);
  curveVertex(295, 280);
  curveVertex(297, 260);
  curveVertex(316, 253);
  curveVertex(329, 210);
  curveVertex(328, 163);
  curveVertex(312, 157);
  curveVertex(315, 69);
  curveVertex(295, 73);
  endShape(CLOSE);

// tache
  fill(11, 102,20);
  stroke(1);
  ellipse(300, 125, 20, 20);
  ellipse(280, 120, 10, 10);
  ellipse(285, 130, 8, 8);
  ellipse(100, 125, 8, 8);
  ellipse(150, 111, 11,11);
  ellipse(275, 180, 11,11);
  ellipse(175, 111, 17,11);
  ellipse(134, 166, 17,11);
   ellipse(x+80, y+ 100, 17,11);
   ellipse(x-80, y+100, 12,9);
   fill(184,165,7);
   ellipse(300, 125, 10, 10);
  ellipse(280, 120, 5, 5);
  ellipse(285, 130, 4, 4);
  ellipse(100, 125, 4,4);
  ellipse(150, 111, 6,6);
  ellipse(275, 180, 6,6);
  ellipse(175, 111, 8,5);
  ellipse(134, 166, 8,8);
   ellipse(x+80, y+ 100, 8,8);
   ellipse(x-80, y+100, 6,4);
  
  
// cicatrice
beginShape();
noFill();
stroke(2);
strokeWeight(10);
curveVertex(95,  350);
curveVertex(91,  160);
curveVertex(310,  150);
curveVertex(450,  200);
stroke(109,32,32);
strokeWeight(4);
line(100, 140, 110, 155);
line(105, 142, 115, 153);
line(110, 140, 120, 155);
line(120, 134, 125, 144);
line(125, 146, 122, 152);
line(130, 134, 133, 152);
line(140, 134, 142, 152);
line(149, 134, 152, 152);
line(154, 134, 159, 152);
line(167, 134, 167, 152);
line(173, 134, 176, 152);
line(180, 134, 180, 152);
line(188, 134, 190, 152);
line(195, 134, 200, 152);
line(205, 134, 213, 152);
line(222, 134, 217, 152);
line(229, 134, 229, 152);
line(238, 134, 237, 152);
line(244, 134, 244, 152);
line(250, 134, 255, 152);
line(262, 134, 266, 152);
line(274, 140, 280, 160);
line(288, 140, 296, 160);
endShape();

// oeil
beginShape();
noStroke();
fill(2);
arc(150, 210, 100, 100, 0, HALF_PI+HALF_PI);  
fill(ouvert);
stroke(1);
arc(150, 210, 80, 80, 0, HALF_PI+HALF_PI);


fill(2);
arc(250, 210, 100, 100, 0, HALF_PI+HALF_PI);  
fill(ouvert);
arc(250, 210, 80, 80, 0, HALF_PI+HALF_PI);

if ( millis() > timeStamp + interval ) {
 timeStamp = millis() ;
 
fill(2);
arc(250, 210, 100, 100, 0, HALF_PI+HALF_PI);

}else {
  
fill(2);
arc(250, 210, 100, 100, 0, HALF_PI+HALF_PI);  
fill(ouvert);
arc(250, 210, 80, 80, 0, HALF_PI+HALF_PI);

}


if ( millis() > timeStamp + interval ) {
 timeStamp = millis() + 3000;
 
 fill(2);
arc(150, 210, 100, 100, 0, HALF_PI+HALF_PI);  
fill(ouvert);

}else {
  stroke(1);
arc(150, 210, 80, 80, 0, HALF_PI+HALF_PI);
}

  





//Les yeux qui bouge

fill(value);
  float x1 = map(mouseX,0.5,400,235,270);
   float y1 = map(mouseY,0.5,height,220,240);
  ellipse(x1,y1,20,20);
  ellipse(x1,y1,3,3);
 
  fill(value);
  float x2 = map(mouseX,0.5,450,130,165);
   float y2 = map(mouseY,0,height,220,240);
  ellipse(x2,y2,20,20);
  ellipse(x2,y2,3,3);




//bouche


beginShape();
fill(2);
stroke(4);
line( 150, 325, 250, 325);
arc(200, 325, 100, 100, PI, TWO_PI-PI/2);
arc(200, 325, 100, 100, TWO_PI-PI/2, TWO_PI);


noStroke();
fill(47, 91, 51);
quad(175,280, 175,275, 230, 275,230,280);



noFill();
noStroke();
strokeWeight(3);
curveVertex(100,  325);
curveVertex(170,  300);
curveVertex(215,  300);
curveVertex(250,  325);

endShape();


//Dent

beginShape();
    strokeWeight(3);
    stroke(0);
 fill(150);
quad(155, 328, 155, 310, 243, 310, 243, 328);
 for ( int i = 160; i < 245 ; i = i + 10) {
    line(i,310,i,325);
  }
  
  quad( 163, 300, 163, 280, 235, 280, 235, 300);
  for ( int i = 170; i < 240 ; i = i + 10) {
    line(i,280,i,300);
  }
  
  noStroke();
  fill(47, 91, 51);
quad(160,290, 160,270, 250, 270,250,290);
quad(140,335, 140,320, 275, 320,275,335);

fill(1);
ellipse(x - 20,y+ 70, 20, 10);
ellipse(x + 10,y+ 70, 20, 10);

endShape();

beginShape();
fill(2);
arc(200, 85, 255, 100, PI, TWO_PI-PI/2);
arc(200, 85, 255, 100, TWO_PI-PI/2, TWO_PI);

// cheveux
triangle(72,80, 90,80,80,125);
triangle(80,70, 100,70,90,119);
triangle(90,70, 110,70,100,115);
triangle(100,70, 120,70,110,135);
triangle(110,70, 130,70,120,111);
triangle(120,70, 140,70,130,118);
triangle(130,70, 150,70,140,125);
triangle(140,70, 160,70,150,120);
triangle(150,70, 170,70,160,140);
triangle(160,70, 180,70,170,110);
triangle(170,70, 190,70,180,109);
triangle(180,70, 200,70,190,144);
triangle(190,70, 210,70,200,146);
triangle(200,70, 220,70,210,123);
triangle(210,70, 230,70,220,100);
triangle(220,70, 240,70,230,145);
triangle(230,70, 250,70,240,123);
triangle(240,70, 260,70,250,120);
triangle(250,70, 270,70,260,115);
triangle(260,70, 280,70,270,100);
triangle(270,70, 290,70,280,150);
triangle(280,70, 300,70,290,123);
triangle(290,70, 310,70,300,107);
triangle(300,70, 320,70,310,123);
triangle(310,80, 328,80,318,111);
triangle(190,375, 200,375,195,360);

// sourcil

stroke(20);
strokeWeight(10);
line(100,sx, 190, 200);
line( 200,200, 300, 190);

quad(130, 375, 260, 375, 260, 400, 130, 400);

fill(255,0,0);
stroke(175);
triangle (t,400, g,393,t+5,400);
triangle (t+15,400, g+15,393,t+20,400);
triangle (t+30,400, g+30,393,t+35,400);
triangle (t+45,400, g+45,393,t+50,400);
triangle (t+60,400, g+60,393,t+65,400);
triangle (t+75,400, g+75,393,t+80,400);
triangle (t+90,400, g+90,393,t+95,400);
triangle (t+105,400, g+105,393,t+110,400);
triangle (t+120,400, g+120,393,t+125,400);
triangle (t+135,400, g+135,393,t+140,400);





    
}

void mouseClicked() {
  if (value == 0) {
    value = 200;
  } else {
    value = 0;
  }
  if (sx == 180){
    sx= 200;
  } else{
    sx=180;
  }
}








