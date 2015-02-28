

import ddf.minim.*;

Minim minim;
AudioPlayer player;
//AudioInput in;
int r = 1;
int t = 1;
int start = 0;
int radius = 38;
int x;
int y;
 

void setup(){
  size(720, 486);
  minim = new Minim(this);
  player = minim.loadFile("01.mp3", 2048);
  player.play();
  smooth();
}
void draw(){
  int m = millis();
  rectMode(CENTER);
  background(0);
  float sound = player.left.get(1)*500+ 20;
  background(sound/2,sound/2,sound/2);

  translate(360, 243);
      
  switch(start) {
    
  case 1:                                 
  smooth();
     noFill();
     strokeWeight(1);
     stroke(255);
     for(int i = - width/8; i <= width/8; i += 80){
      ellipse( i,random(126), sound, sound);
      stroke(255,150);
      ellipse(i,0,sound+25,sound+25);
      stroke(255,80);
      ellipse(i,0,sound+50,sound+50);
      stroke(255,30);
      ellipse(i,0,sound+80,sound+80);
     } 
    strokeWeight(1.7);
    stroke(255);
    rect(width*0.6/sound,height*5/sound,sound*2,sound*0.1);
break;
  case 2: //
noFill();  
for (int deg = 0; deg < 360; deg += 10) {
float angle = radians(deg);
float x = 10 + (cos(angle) * radius);
float y = 10 + (sin(angle) * radius);
rotate(PI/sound);
stroke(sound,sound,sound);
strokeWeight(0.5);
ellipse(sound/x, sound/y, sound+random(1,300), sound+random(1,300));
}
noFill();
for (int deg = 0; deg < 360; deg += 10) {
float angle = radians(deg);
float x = 10 + (cos(angle) * radius);
float y = 10 + (sin(angle) * radius);
rotate(PI/sound);
stroke(#D7DED8,150);
strokeWeight(0.5);
ellipse(sound/x, sound/y, 300,sound+random(1,300));
}
break;
case 3:
noFill();
smooth();
for (int deg = 0; deg < 360; deg += 5) {
float angle = radians(deg);
float x = 5 + (cos(angle) * radius);
float y = 5 + (sin(angle) * radius);
stroke(255);
strokeWeight(0.5);
ellipse(sound/x, sound/y, 0.7, 0.7);
}
stroke(255,90);
rotate(TWO_PI/sound);
strokeWeight(1);
line(0,0,sound+10,sound+10);
strokeWeight(4);
line(0,0,sound+10,sound+10);

break;
  case 4:
for (int x = -360; x<=720 ; x += 1){
  fill(255,random(50,180));
  noStroke();
  rotate(TWO_PI*sound);
  rect(x+sound,random(-5,5),random(1,3),6);
}
    break;
  case 5:
noFill();
smooth();
  for (int deg = 0; deg < 360; deg += 10) {
  float angle = radians(deg);
  float x = 10 + (cos(angle) * radius);
  float y = 10 + (sin(angle) * radius);
  rotate(PI/sound);
  stroke(#D7DED8,150);
  strokeWeight(0.5);
  ellipse(sound/x, sound/y,10,sound+random(1,300));
  }
  stroke(255, 120);
  for (int i = 0; i < 5; i++) { 
  strokeWeight(i); 
  rotate(PI/sound); 
  strokeCap(PROJECT);
  line(25, 25, random(10,100), random(10,100));
   }
break;
  default:
   noFill();
smooth();
for (int deg = 0; deg < 360; deg += 5) {
float angle = radians(deg);
float x = 5 + (cos(angle) * radius);
float y = 5 + (sin(angle) * radius);
stroke(255);
strokeWeight(0.5);
rotate(TWO_PI/sound);
ellipse(sound/x, sound/y, 0.7, 0.7);
}
noFill();
for (int deg = 0; deg < 360; deg += 10) {
float angle = radians(deg);
float x = 10 + (cos(angle) * radius);
float y = 10 + (sin(angle) * radius);
rotate(PI/sound);
stroke(#D7DED8,150);
strokeWeight(0.5);
ellipse(sound/x, sound/y, 1,sound+random(1,1));
}
for (int y = 0; y<=720 ; y += random(10,1000)){
  fill(255,random(30,100));
  noStroke();
  rect(x,sound+random(10,40),random(1,3),10);
}

noFill();
smooth();
for (int deg = 0; deg < 360; deg += 5) {
float angle = radians(deg);
float x = 5 + (cos(angle) * radius);
float y = 5 + (sin(angle) * radius);
stroke(255,random(50,200));
strokeWeight(0.5);
ellipse(sound/x, sound/y, 0.7, 0.7);
}
stroke(255,90);
rotate(TWO_PI/sound);

noFill();
for (int deg = 0; deg < 360; deg += 10) {
float angle = radians(deg);
float x = 10 + (cos(angle) * radius);
float y = 10 + (sin(angle) * radius);
rotate(PI/sound);
stroke(#D7DED8,random(50,100));
strokeWeight(0.5);
ellipse(sound/x, sound/y, random(1,30),sound+random(1,30));
}
   
    break;
    case 6:
    noFill();
    strokeWeight(5);
    rect(sound,sound,sound*2,sound*2);
    ellipse(x,y,sound/2,sound/2);
    line(sound,sound*6/x,sound/2,sound/2);
    line(sound*6,sound,sound/2,sound/2);
    line(sound,sound*4/x,sound/2,sound/2);
    line(sound*4,sound,sound/2,sound/2);
    line(sound,sound*2/x,sound/2,sound/2);
    line(sound*2,sound,sound/2,sound/2);
    rotate(PI/sound);
  }
  frameRate(24);

}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
void keyPressed() {
  if (key == '1') {
    start = 1;
  }
  else if (key == '2') {
    start = 2;
  }
  else if (key == '3') {
    start = 3;
  }
  else if (key == '4') {
    start = 4;
  }
    else if (key == '5') {
    start = 5;
  }
  else if (key =='6'){
    start= 6;
  }
  else {
    start = 0;
  }
}

