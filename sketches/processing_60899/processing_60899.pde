
void setup() {
  size(500,500);
  smooth();
  frameRate(30);


}
 
 
////////////////////////////////////////////////////////////////////////////////////


void draw() {

  
  background(0);

for(int i=0; i<width/100; i= i+1){
for(int j=0; j<height/100; j= j+1){
  fill(255,255,255);

float X = i*110;
float Y = j*110;



//WACKELNWUT
if(i%2==1) X=X+(random(0,2));
if(j%2==1) Y=Y+(random(0,4));



//STARTPOKEMON
//KÖRPER
  ellipse(X+25,Y+25,100,100);
  
//ROTE HAELFTE
  fill(255,0,0);
  arc(X+25,Y+25,100,100,radians(173),radians(367));

//AUGEN
  fill(255,255,255);
  bezier(X-4,Y-2,X-6,Y+16,X-6,Y+16,X+19,Y+11);
  bezier(X+34,Y+11,X+59,Y+16,X+59,Y+16,X+57,Y-2);
  line(X+34,Y+11,X+57,Y-2);
  line(X-4,Y-2,X+19,Y+11);
  strokeWeight(2);
  line(X+9,Y+8,X+9,Y+12);
  line(X+44,Y+8,X+44,Y+12);
  strokeWeight(1);


//MUND
  bezier(X-24,Y+31,X+25,Y+20,X+25,Y+20,X+75,Y+31);



//LEKTROBAL
    if(key == '1'){

//KÖRPER
  ellipse(X+25,Y+25,100,100);
  
//AUGEN
  bezier(X-6,Y+14,X+5,Y,X+5,Y,X+27,Y+13);
  bezier(X+28,Y+17,X+31,Y+12,X+31,Y+12,X+31,Y+3);
  bezier(X+43,Y+11,X+52,Y-4,X+52,Y-4,X+60,Y+5);
  strokeWeight(2);
  line(X+12,Y+20,X+12,Y+26);
  line(X+46,Y+16,X+46,Y+22);
  strokeWeight(1);
  
//ROTE HAELFTE
  fill(255,0,0);
  arc(X+25,Y+25,100,100,radians(-12),radians(175));

//TRENNLINIE
  fill(255,255,255);
  bezier(X-25,Y+28,X+9,Y+38,X+38,Y+36,X+73,Y+14);
  
//MUND
  bezier(X+7,Y+45,X+26,Y+56,X+35,Y+56,X+57,Y+35);
  line(X,Y+46,X+62,Y+34);
  line(X+25,Y+45,X+26,Y+52);
  line(X+35,Y+47,X+35,Y+50);
}



//ZURÜCKENTWICKELN
    if(key == '2'){

//KÖRPER
  ellipse(X+25,Y+25,100,100);
  
//ROTE HAELFTE
  fill(255,0,0);
  arc(X+25,Y+25,100,100,radians(173),radians(367));

//AUGEN
  fill(255,255,255);
  bezier(X-4,Y-2,X-6,Y+16,X-6,Y+16,X+19,Y+11);
  bezier(X+34,Y+11,X+59,Y+16,X+59,Y+16,X+57,Y-2);
  line(X+34,Y+11,X+57,Y-2);
  line(X-4,Y-2,X+19,Y+11);
  strokeWeight(2);
  line(X+9,Y+8,X+9,Y+12);
  line(X+44,Y+8,X+44,Y+12);
  strokeWeight(1);


//MUND
  bezier(X-24,Y+31,X+25,Y+20,X+25,Y+20,X+75,Y+31);
}



//POKEBALL
    if(key == ' '){
X = i*110;
Y = j*110;
//BALLFORM
  fill(255,255,255);
  ellipse(X+25,Y+25,105,105);
  
//ROTE FLÄCHE
  fill(255,0,0);
  arc(X+25,Y+25,105,105,radians(165),radians(340));
  fill(255,255,255);
  stroke(255,255,255);
  triangle(X-9,Y+34,X+9,Y+22,X+15,Y+34);
  stroke(0);

//TRENNLINIE
  fill(0);
  strokeWeight(6);
  line(X-25,Y+39,X+11,Y+20);
  line(X+45,Y+12,X+75,Y+10);
  strokeWeight(1);
  
//KREISE
  fill(0);
  ellipse(X+29,Y+20,40,40);
  fill(255,255,255);
  ellipse(X+29,Y+20,26,26);
  ellipse(X+29,Y+20,18,18);
}
  
  
    if (mouseButton == CENTER) {
  background(0);
  ellipse(mouseX,mouseY,105,105);
  fill(255,0,0);
  arc(mouseX,mouseY,105,105,radians(165),radians(340));
  stroke(255,255,255);
  fill(255,255,255);
  triangle(mouseX-37,mouseY+9,mouseX-14,mouseY-5,mouseX-9,mouseY+9);
  stroke(0);
  fill(0);
  strokeWeight(6);
  line(mouseX-50,mouseY+14,mouseX-13,mouseY-6);
  line(mouseX+20,mouseY-13,mouseX+48,mouseY-15);
  strokeWeight(1);
  ellipse(mouseX+4,mouseY-5,40,40);
  fill(255,255,255);
  ellipse(mouseX+4,mouseY-5,26,26);
  ellipse(mouseX+4,mouseY-5,18,18);
}

}}
}


////////////////////////////////////////////////////////////////////////////////////


//INFOBILDSCHIRM

void keyPressed() {
  if(key == 'i'){
  
    rect(100,100,300,220);
    line(200,132,308,132);
    
  fill(0); 
PFont font;
font = loadFont("ArialMT-48.vlw"); 
textFont(font,20); 
text("CONTROLS",200,130);

textFont(font,10);
text("press (1) = evolve pokemon / release pokemon",105,150);
text("press (2) = cancel evolution / release pokemon",105,170);
text("press (SPACE) = throw pokeballs at all pokemon",105,190);
text("press (LEFT MOUSE) = pokemon uses thunderbolt",105,210);
text("press (RIFHT MOUSE) = pokemon uses thunder",105,230);
text("press (MIDDLE MOUSE) = throw a single pokeball",105,250);
text("hold (i) = info menu",105,270);
text("hint : if you catch a pokemon with a single pokeball it can",105,290);
text("         escape by using an attack",105,310);

    
  }}




//MAUSINTERAKTION

void mousePressed() { 
      
    if (mouseButton == RIGHT) {
  background(255,255,0);
  fill(0);
  ellipse(random(0,width),random(0,height),100,100);
  ellipse(random(0,width),random(0,height),100,100);
  ellipse(random(0,width),random(0,height),100,100);
  ellipse(random(0,width),random(0,height),100,100);
  ellipse(random(0,width),random(0,height),100,100);

}


   if (mouseButton == LEFT) {
  stroke(255,255,0);
  strokeWeight(random(1,10));
  float blitzstartx = random(-1,width);
  float blitzstarty = -1;
  float blitzstartx1 = random(-1,width);
  float blitzstarty2 = -1;
  float blitzstartx3 = random(-1,width);
  float blitzstarty4 = -1;
  float blitzstartx5 = random(-1,width);
  float blitzstarty6 = -1;
  float blitzstartx7 = random(-1,width);
  float blitzstarty8 = -1;
  float blitzstartx9 = random(-1,width);
  float blitzstarty10 = -1;
  float blitz3 = random(-1,width);
  float blitz4 = width/2;
  float blitz5 = random(-1,width);
  float blitz6 = width/2;
  float blitz7 = random(-1,width);
  float blitz8 = width/2;
  float blitz9 = random(-1,width);
  float blitz10 = width/2;
  float blitz11 = random(-1,width);
  float blitz12 = width/2;
  float blitz13 = random(-1,width);
  float blitz14 = width/2;


  line(blitzstartx,blitzstarty,blitz4,blitz5);
  line(blitz4,blitz5,random(-1,width),height+1);

  line(blitzstartx1,blitzstarty2,blitz5,blitz6);
  line(blitz5,blitz6,random(-1,width),height+1);

  line(blitzstartx3,blitzstarty4,blitz7,blitz8);
  line(blitz7,blitz8,random(-1,width),height+1);

  line(blitzstartx5,blitzstarty6,blitz9,blitz10);
  line(blitz9,blitz10,random(-1,width),height+1);

  line(blitzstartx7,blitzstarty8,blitz11,blitz12);
  line(blitz11,blitz12,random(-1,width),height+1);
  
  line(blitzstartx9,blitzstarty10,blitz13,blitz14);
  line(blitz13,blitz14,random(-1,width),height+1);
  
  
  stroke(0);
  strokeWeight(1);
  }
 
}


