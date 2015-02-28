

// Konkuk University  
// Department of Dynamic Media  
// SOS iDesign  
// Name:LEE Daeun 
// ID: 201420095 


import ddf.minim.*; 

Minim minim; 
AudioPlayer song; 

float a = 0.0;  
float b = 60;  
float c = 50;  
float speed = 0.05;  
float e = 0.06;  
float x, y;  
float dia = 30;

void setup() { 
  size(displayWidth, displayHeight); 
  smooth(); 
  background(#eeeeee);
  title();
  cursor(CROSS);
  mouseX=width/2;
  mouseY=height/2;
 
  
    minim = new Minim (this);
  // Load the audio file
  song = minim.loadFile ("11.mp3");
  song.play ();
  song.loop();
  
} 

void title() {  
  fill(255);  
  textAlign(CENTER);  
  text("Press 1 = dia 30, 2= 50 ... 8 = 170", width-87, height-40); 
  text("LEE Daeun, Interactive Drawing with mouse, Dynamic Media, 2014", width-230, height-20); 
} 

void draw() { 
  float c = 400+5*dist(mouseX, mouseY, pmouseX, pmouseY); 
  float q = mouseX + sin(a) * c; 
  float w = mouseY + cos(a) * c;
  float di = song.mix.level() * 250;
  float qq = map(di, 0, 200,0, 200);
  x += (q - x) * e; 
  y += (w - y) * e; 

  //fill(#eeeeee, 10); 
  noFill();
  //stroke(0,30);
  stroke(random(255), random(255), random(255), 60);
  ellipse( x, y, qq*5, qq*5); 
  a += 0.3;
} 
void keyPressed() {  
  if (key==' ')background(255); 

  if (key=='1') dia = 30;
  if (key=='2') dia = 50;
  if (key=='3') dia = 70;
  if (key=='4') dia = 90;
  if (key=='5') dia = 110;
  if (key=='6') dia = 130;
  if (key=='7') dia = 150;
  if (key=='8') dia = 170;
}  

void title() {   

  fill(255);
  textAlign(RIGHT);   
  text("LEE Daeun, interactive mouse, Dynamic Media, 2014", width-50, height-20);
}   

