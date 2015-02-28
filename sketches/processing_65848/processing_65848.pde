
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int count=0;
Minim minim = new Minim(this);
AudioSample cricket;
AudioSample bird;
AudioSample hoot;
void setup(){
size(800,600);
smooth();
bird = minim.loadSample("bird2.wav");
cricket = minim.loadSample("cricket1.wav");
hoot = minim.loadSample("hoot.mp3");

// sc.playAudioClip(bird);
 //sc.playNote(60, 100, 2.0);
}
void draw(){
  if (mousePressed){
  functionClick();
  bird.stop();
  
}else{
  functionUp();
  cricket.stop();
  hoot.stop();
  count = 0;
}
}

void functionClick(){
  if(count==0){
  cricket.trigger();
  hoot.trigger();
  count=1;
  }
background(10,45,72);
strokeWeight(30);
stroke(144,125,63);
line(0,475,800,475);
fill(255);
strokeWeight(0);
ellipse(700,50,120,120);
ellipse(388,320,200,300);
stroke(98,74,8);
strokeWeight(15);
fill(255);
ellipse(320,170,140,140);
ellipse(455,170,140,140);
strokeWeight(0);

stroke(0);
fill(219,189,104);
//fill(229,200,120);
strokeWeight(10);
ellipse(320,170,90,90);
ellipse(455,170,90,90);
fill(28,23,10);
ellipse(320,170,50,50);
ellipse(455,170,50,50);
fill(255);
noStroke();
ellipse(310,150, 15, 15);
ellipse(450,150, 15, 15);

noFill();
stroke(198,168,62);
strokeWeight(10);
bezier(385,210,395,200,370,80,330,93);
bezier(395,210,385,200,400,80,450,93);
line(325,92,455,92);
noStroke();
fill(198,168,62);
triangle(357,95,415,95,395,220);
strokeWeight(15);
stroke(198,168,63);
strokeWeight(9);
noStroke();
fill(255,255,0);
triangle(390,200,410,230,370,230);
strokeWeight(9);
stroke(198,168,62);
line(350,98,420,98);

fill(255);
stroke(0);
strokeWeight(8);
bezier(300,240,260,280,170,400,385,470);
bezier(475,240,515,280,605,400,400,470);
line(385,470,400,470);
noStroke();

fill(255,255,0);
ellipse(340,450,40,40);
ellipse(450,450,40,40);
fill(229,195,125);
ellipse(390,275,12,35);
ellipse(440,275,12,35);
ellipse(470,275,12,35);
ellipse(340,275,12,35);
ellipse(310,275,12,35);
ellipse(390,325,12,35);
ellipse(415,300,12,35);
ellipse(365,300,12,35);
textSize(20);
text("HOOT",200,270);
fill(255,207,46);
textSize(30);
rotate(PI/5);
text("HOOT",220,60);
textSize(20);
rotate(PI/12);
text("HOOT",300,80);
}

void functionUp(){
  bird.trigger();
noStroke();  
background(255);
//background(183,223,255);
fill(255,255,0);
ellipse(775,40,140,140);
PImage img;
img = loadImage ("cartoon bird.jpg");
image (img,200,200);
stroke(144,125,63);
strokeWeight(30);
line(0,475,800,475);
fill(125,188,229);
text("Click to change to nighttime.",225,550);
fill(230,133,245);
textSize(20);
text("chirp",170,260);
fill(255,191,241);
textSize(30);
rotate(PI/5);
text("tweet",220,60);
textSize(20);
rotate(PI/12);
text("tweet",300,80);
}


