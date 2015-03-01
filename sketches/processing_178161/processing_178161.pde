
//import minim library
import ddf.minim.*;

//image
PImage music;
PImage music2;
PImage piano;

//audio
Minim minim;
AudioSample c_key;
AudioSample d_key;
AudioSample e_key;
AudioSample f_key;
AudioSample g_key;
AudioSample a_key;
AudioSample b_key;

//setup
void setup(){
  size(800,720);
  smooth();
  background(245,228,161);
  //font function don't work on my laptop
  //So I disable it
  //font = loadFont("SansSerif-48.vlw");
  //textFont(font); 
  
  //load image
  music = loadImage("music.png");
  music2 = loadImage("music2.png");
  piano = loadImage("piano.png");
  
  //load audio
  minim = new Minim(this);
  c_key = minim.loadSample("C4.wav");
  d_key = minim.loadSample("D4.wav");
  e_key = minim.loadSample("E4.wav");
  f_key = minim.loadSample("F4.wav");
  g_key = minim.loadSample("G4.wav");
  a_key = minim.loadSample("A4.wav");
  b_key = minim.loadSample("B4.wav");
  
}

void draw(){
  translate(100,-250);
//shadow
  noStroke();
  fill(155,148,148,75);
  ellipse(300,570,180,50);

//hair ball
  smooth();
  noStroke();
  fill(0);
  ellipse(230,340,75,70);
  ellipse(370,340,75,70);

//hair hand
  smooth();
  noStroke();
  fill(219,2,93);
  ellipse(370,340,75,8);
  ellipse(230,340,75,8);

//head
  smooth();
  fill(0);
  ellipse(300,400,200,150);

//face
  fill(255,236,219);
  ellipse(300,410,170,120);

//body
  smooth();
  stroke(0);
  strokeWeight(5);
  strokeJoin(ROUND);
  fill(162,8,8);
  quad(265,475,335,475,355,560,245,560);

//cloth botton
  smooth();
  stroke(0);
  strokeWeight(3);
  strokeCap(ROUND);
  line(300,475,310,495);
  line(310,495,325,510);

  smooth();
  stroke(0);
  strokeWeight(3);
  line(298,483,310,483);
  line(300,488,312,488);
  line(318,496,307,500);

//hand
//left
  smooth();
  stroke(0);
  strokeWeight(3);
  fill(255,236,219);
  ellipse(213,535,35,35);
//right
  smooth();
  stroke(0);
  strokeWeight(3);
  fill(255,236,219);
  ellipse(385,535,35,35);

//sleeve
//left
  smooth();
  stroke(0);
  strokeWeight(5);
  strokeJoin(ROUND);
  fill(162,8,8);
  quad(265,475,190,520,240,555,245,550);

//right
  smooth();
  stroke(0);
  strokeWeight(5);
  strokeJoin(ROUND);
  fill(162,8,8);
  quad(335,475,410,520,360,555,355,550);

//feet
//left
  smooth();
  noStroke();
  fill(0);
  ellipse(267,560,50,60);

  smooth();
  noStroke();
  fill(0);
  ellipse(333,560,50,60);

//mouth
  smooth();
  stroke(0);
  strokeWeight(4);
  noFill();
  arc(300,440,110,30,0,PI);

//eyes
  smooth();
  stroke(0);
  strokeWeight(5);
//left
  arc(257,407,35,35,PI,TWO_PI);
//right
  arc(344,407,35,35,PI,TWO_PI);
  
//face point 
  smooth();
  noStroke();
  fill(222,116,173);
  ellipse(240,430,15,15);
  ellipse(360,430,15,15);
  
//Keyboard
  fill(245,228,161);
  noStroke();
  rect(160,650,60,60);
 
  strokeWeight(1.5);
  stroke(0);
  fill(255);
  translate(10,40);
  rect(80,700,60,200);
  rect(140,700,60,200);
  rect(200,700,60,200);
  rect(260,700,60,200);
  rect(320,700,60,200);
  rect(380,700,60,200);
  rect(440,700,60,200);
  fill(0);
  textSize(25);
  text("C",100,890);
  text("D",160,890);
  text("E",220,890);
  text("F",280,890);
  text("G",340,890);
  text("A",400,890);
  text("B",460,890);

//Music images 
  image(music2,440,450);
  image(music,20,240);
  image(piano,20,580);
}
//keyPressed

void keyPressed(){
  if (key == 'a' || key == 'A' || key == '1') 
  {
     c_key.trigger();
     text("C",160,650);       
     line(190,630,205,620);
     line(190,640,205,640);
     line(190,650,205,660);
   }
  if (key == 's' || key == 'S' || key == '2')
  {
     d_key.trigger();
     text("D",160,650);
     line(190,630,205,620);
     line(190,640,205,640);
     line(190,650,205,660);
   }
   
  if (key == 'd' || key == 'D' || key == '3')
  {
     e_key.trigger();
     text("E",160,650);
     line(190,630,205,620);
     line(190,640,205,640);
     line(190,650,205,660);
   }
   
  if (key == 'f' || key == 'F' || key == '4')
  {
     f_key.trigger();
     text("F",160,650);
     line(190,630,205,620);
     line(190,640,205,640);
     line(190,650,205,660);
   }
   
  if (key == 'g' || key == 'G' || key == '5')
  {
     g_key.trigger();
     text("G",160,650);
     line(190,630,205,620);
     line(190,640,205,640);
     line(190,650,205,660);
   }
   
  if (key == 'h' || key == 'H' || key == '6')
  {
     a_key.trigger();
     text("A",160,650);
     line(190,630,205,620);
     line(190,640,205,640);
     line(190,650,205,660);
   }
  if (key == 'j' || key == 'J' || key == '7')
  {
     b_key.trigger();
     text("B",160,650);
     line(190,630,205,620);
     line(190,640,205,640);
     line(190,650,205,660);
   }
}



